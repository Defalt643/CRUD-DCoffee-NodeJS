const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const cors = require('cors');
var mysql = require('mysql');
const { NULL } = require('mysql/lib/protocol/constants/types');

let server = express();

server.use(bodyParser.json()); // ให้ server(express) ใช้งานการ parse json
server.use(morgan('dev')); // ให้ server(express) ใช้งานการ morgam module
server.use(cors()); // ให้ server(express) ใช้งานการ cors module
server.use(bodyParser.urlencoded({ extended: true }))// แปลงข้อมูลที่ส่งมาจากฟอร์ม
server.use(express.static('html'));
server.use(express.static('image'));


server.set('views', __dirname + '/public');// ระบุต าแหน่งของไฟล์ html
server.engine('html', require('ejs').renderFile);

let user = {}

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'dcoffee',
    password: '',
});

con.connect((err) => {
    if (err) {
        console.log('Error connecting to Db');
        return;
    }
    console.log('Connection established');
    });

server.get('/logout', function (req, res){
    const id = user.data.id_employee
   con.query('INSERT INTO trn_logout (id_employee, datetime_logout) VALUES (?, NOW())', id, function (err){
        if (err) return err;
    })
    res.render(__dirname + "/public/login.html")
});

server.post('/login', function(req, res){
    user = {}
    let email = req.body.email;
    let password = req.body.password;
    con.query('SELECT * FROM mst_security WHERE user = ?', [email], function(err, data){
        if(err) {
            console.log("err");
            return err;
        }if(data[0]==null){
            return res.sendFile(__dirname+'/public/nonmember.html')
        }
        if(password != data[0].password){
            console.log("Incorrect password");
            return res.redirect('/incorrectPassword')
        }
        if(data[0] == null){
            console.log('Error');
            return res.redirect('/')
        }
        con.query('SELECT * FROM mst_employee WHERE id_employee = ?', [data[0].id_employee],function(err,data2){
            console.log(data2);
            user = {
                data : data2[0]
            }
            res.redirect('/main')
        })
    })
});

server.get('/main', function (req, res) {
    const id = user.data.id_employee
    var lastid;
    var dataList;
    con.query('SELECT * FROM trn_login',function(err,dataId){
        lastid=Object.values(JSON.parse(JSON.stringify(dataId))).length;
        console.log(lastid)
    });
    // con.query('SELECT * FROM mst_employee',function(err,dataList){
    //     console.log(dataList)
    // });
    con.query('INSERT INTO trn_login (id_employee, datetime_login) VALUES (?, NOW())', id, function(err){
        if (err) return err;
    })
    con.query('SELECT * FROM `mst_employee`', (err, rows) => {
        if (err) return err;
        res.render(__dirname + "/public/dashboard.html", {
            data: rows,
            name: user.data.name,
            surname: user.data.surname,
            position: user.data.position
        })
        console.log('ID Login' + user.data.id_employee + ' ' + user.data.name + ' ' + user.data.surname + ' ' + user.data.position)
        console.log('-------------------------')
        console.log(rows)
    })
    // res.render(__dirname + "/public/dashboard.html", {
    //     name: user.data.name,
    //     surname: user.data.surname,
    //     position: user.data.position,
    //     data:JSON.parse(JSON.stringify(dataList))
    // })
})
server.get('/delete/:userId', (req, res) => {
    const userId = req.params.userId;
    console.log('userId = '+userId);
    con.query("DELETE FROM `mst_employee` WHERE id_employee="+userId, (err, result) => {
        if (err) throw err;
        res.redirect('/main');
    });
});
server.post('/insert', function (req, res) {
    console.log("INSERT");
    var name = req.body.inputName;
    var surname=req.body.inputSurname;
    var position=req.body.inputPosition;
    var salary=req.body.inputSalary;
    var totalSale = req.body.inputTotalSale;
    console.log(name+" "+surname+" "+position+" "+salary+" "+totalSale)
    var emp = {name,surname,position,salary,totalSale    }
    con.query("INSERT INTO mst_employee (`id_employee`, `name`, `surname`, `position`, `salary`, `total_sale`) VALUES (?,?,?,?,?,?)",[NULL,name,surname,position,salary,totalSale],function(err){
        if (err) return err;
        res.redirect('/main');
    })
});
server.post('/update/:userId', function (req, res) {
    console.log("UPDATE");
    const userId=req.params.userId
    var name = req.body.updateName;
    var surname=req.body.updateSurname;
    var position=req.body.updatePosition;
    var salary=req.body.updateSalary;
    var totalSale = req.body.updateTotalSale;
    console.log(name+" "+surname+" "+position+" "+salary+" "+totalSale)
    var emp = {name,surname,position,salary,totalSale    }
    con.query("UPDATE mst_employee SET name="+name+",surname="+surname+",position="+position+",salary="+salary+",total_sale="+totalSale+" WHERE id_employee="+userId,function(err){
        if (err) return err;
        res.redirect('/main');
    })
});
server.get('/search', function (req, res) {
    console.log("SEARCH");
    var index= req.body.searchBox;
    console.log(index)
    if(index==""){
        res.redirect('/main');
    }if(typeof index ==='string'){
        con.query('SELECT * FROM mst_employee WHERE name='+index, (err, rows) => {
            if (err) return err;
            if(Object.values(JSON.parse(JSON.stringify(rows))).length>0){
                console.log(rows)
                res.render(__dirname + "/public/dashboard.html", {
                    data: rows,
                    name: user.data.name,
                    surname: user.data.surname,
                    position: user.data.position
                });
            }con.query('SELECT * FROM mst_employee WHERE surname='+index, (err, rows) => {
                if (err) return err;
                if(Object.values(JSON.parse(JSON.stringify(rows))).length>0){
                    console.log(rows)
                    res.render(__dirname + "/public/dashboard.html", {
                        data: rows,
                        name: user.data.name,
                        surname: user.data.surname,
                        position: user.data.position
                    });
                }
            });
            con.query('SELECT * FROM mst_employee WHERE position='+index, (err, rows) => {
                if (err) return err;
                if(Object.values(JSON.parse(JSON.stringify(rows))).length>0){
                    console.log(rows)
                    res.render(__dirname + "/public/dashboard.html", {
                        data: rows,
                        name: user.data.name,
                        surname: user.data.surname,
                        position: user.data.position
                    });
                }
            });

        })
    }if(typeof index ==="number"){
        con.query('SELECT * FROM mst_employee WHERE id_employee='+index, (err, rows) => {
            if (err) return err;
            if(Object.values(JSON.parse(JSON.stringify(rows))).length>0){
                console.log(rows)
                res.render(__dirname + "/public/dashboard.html", {
                    data: rows,
                    name: user.data.name,
                    surname: user.data.surname,
                    position: user.data.position
                });
            }con.query('SELECT * FROM mst_employee WHERE salary='+index, (err, rows) => {
                if (err) return err;
                if(Object.values(JSON.parse(JSON.stringify(rows))).length>0){
                    res.render(__dirname + "/public/dashboard.html", {
                        data: rows,
                        name: user.data.name,
                        surname: user.data.surname,
                        position: user.data.position
                    });
                }
            });
            con.query('SELECT * FROM mst_employee WHERE total_sale='+index, (err, rows) => {
                if (err) return err;
                
                    res.render(__dirname + "/public/dashboard.html", {
                        data: rows,
                        name: user.data.name,
                        surname: user.data.surname,
                        position: user.data.position
                    });
                
            });
        });
    }
});

server.get('/', function (req, res) {
    res.sendFile( __dirname+ "/public/" + "login.html");
});

server.get('/incorrectPassword',function(req,res){
    res.sendFile( __dirname+ "/public/" + "incorrectPassword.html");
})

server.listen(3000, function() {
    console.log('Server Listen at http://localhost:3000');
});
