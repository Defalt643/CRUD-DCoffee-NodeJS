const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');
const cors = require('cors');
var mysql = require('mysql')

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

server.get('/logout', function (req, res) {
    //logout
    const id = user.data.id_employee
    con.query('INSERT INTO trn_logout (id_employee, datetime_logout) VALUES (?, NOW())', id, function (err) {
        if (err) return err;
    })
    res.render(__dirname + "/public/login.html")
});


server.post('/login', function (req, res) {
    user = {}
    let email = req.body.email;
    let password = req.body.password;
    console.log('check login ' + email + ' ' + password)
    con.query('SELECT * FROM mst_security WHERE user = ?', [email], function (err, data) {
        if (err) {
            return err;
        } if (data == null) {
            return res.sendFile(__dirname + '/public/nonmember.html')
        }
        if (data == null) {
            console.log('Error');
            return res.redirect('/')
        }
        con.query('SELECT * FROM `mst_employee` WHERE id_employee = ?', [data[0].id_employee], function (err, data2) {
            console.log(data2);
            user = {
                data: data2[0]
            }
            res.redirect('/main')

        })
    })
});

server.get('/main', function (req, res) {
    const id = user.data.id_employee
    //login in
    con.query('INSERT INTO trn_login (id_employee, detetime_login) VALUES (?, NOW())', id, function (err) {
        if (err) return err;
    })

    //data all to html
    con.query('SELECT * FROM `mst_employee`', (err, rows) => {
        if (err) return err;
        res.render(__dirname + "/public/main_menus.html", {
            data: rows,
            name: user.data.name,
            surname: user.data.surname,
            position: user.data.position
        })
        console.log('ID Login' + user.data.id_employee + ' ' + user.data.name + ' ' + user.data.surname + ' ' + user.data.position)
        console.log('-------------------------')
        for (var i = 0; i < rows.length; i++) {
            console.log('rows ' + rows[i].id_employee)
            console.log('rows ' + rows[i].name)
            console.log('rows ' + rows[i].surname)
            console.log('rows ' + rows[i].position)
            console.log('rows ' + rows[i].salary)
            console.log('rows ' + rows[i].total_sale)
            console.log('-------------------------')
        }
    })

})

// server.get('/delete/(:id)', function(req, res,next){
//     var user = { id: req.params.id_employee }
//     console.log('check id '+user);
//     con.query('DELETE FROM mst_employee WHERE id_employee = ' + req.params.id_employee, user, (err, result) => {
//         if (err) throw err;
//         // res.render(__dirname + "/public/main_menus.html", {
//         //     data: rows,
//         //     name: user.data.name,
//         //     surname: user.data.surname,
//         //     position: user.data.position
//         // })
//         res.redirect('/main_menus')
//     });
// });


server.get('/delete/:userId', (req, res) => {
    const userId = req.params.userId;
    console.log('userId = '+userId);
    let sql = `DELETE from mst_employee where id_employee = ${userId}`;
    let query = con.query(sql, (err, result) => {
        if (err) throw err;
        res.redirect('/main');
    });
});





server.get('/', function (req, res) {
    res.sendFile(__dirname + "/public/" + "login.html");
});

server.listen(3000, function () {
    console.log('Server Listen at http://localhost:3000');
});
