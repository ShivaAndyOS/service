// config/passport.js

// load all the things we need
var LocalStrategy   = require('passport-local').Strategy;

// load up the user model
var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');
var dbconfig = require('../database');
var connection = mysql.createConnection(dbconfig.connection);

connection.query('USE ' + dbconfig.database);

// expose this function to our app using module.exports

module.exports.register=function(req, res){

    console.log("reg data: "+req );
    var today = new Date();

    var name   = req.body.name;
    var email  = req.body.email;
    var mobile = req.body.mobile;
    var password = req.body.password;

    connection.query("SELECT * FROM user WHERE email = ? OR  mobile = ?",[email, mobile], function(err, rows) {
        if (err){
            console.error(err);
            //err.print();
            res.json({
                status:false,
                message:'there are some error with query'
            });

        }else  if (rows.length) {
            //return done(null, false, req.flash('signupMessage', 'That username is already taken.'));

            res.json({
                status:false,
                user_id:rows.insertId,
                message:'user already exists'
            })
        } else {
            // if there is no user with that username
            // create the user
            var newUserMysql = {
                //username: username,
                password: bcrypt.hashSync(password, null, null)  // use the generateHash function in our user model
            };

            var insertQuery = "INSERT INTO user ( name, email, mobile, password ) values (?,?,?,?)";
            connection.query(
                insertQuery,
                            [name,
                                email,
                                mobile,
                                newUserMysql.password
                            ],
                function(err, rows) {
                if (err) {
                    console.error(err);
                    res.json({
                        status:false,
                        message:'there are some error with query'
                    })
                }else{
                    newUserMysql.id = rows.insertId;
                    res.json({
                        status:true,
                        user_id:rows.insertId,
                        message:'user registered sucessfully'
                    })
                }
            });
        }
    });
};

module.exports.login=function(req, res){

    console.log("reg data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> "+req.body.name);
    var today = new Date();

    //return;
    var username = req.body.username;
    var password = req.body.password;
    //connection.query("SELECT username FROM users WHERE username = ? and password=?",[username, password], function(err, rows) {
    connection.query("SELECT * FROM user WHERE email = ? OR mobile = ?",[username, username], function(err, rows){
        if (err){
            console.error(err);
            res.json({
                status:false,
                message:'there are some error with query'
            });

        }else  if (rows.length) {

            if (!bcrypt.compareSync(password, rows[0].password)){
                var data = {
                    status:false,
                    message:'invalid creditials'
                };
                //connection.end();
                res.end(JSON.stringify(data));
                return
            }

            /*var objs = [];
            for (var i = 0;i < rows.length; i++) {
                objs.push({
                    username: rows[i].username
                });
            }
            console.log("rows=>"+ objs  );*/

            var data = {
                status:true,
                user:{
                    "id":rows[0].id,
                    "name":rows[0].name,
                    "email":rows[0].email,
                    "mobile":rows[0].mobile
                },
                message:'success'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        } else {
            var data = {
                status:false,
                message:'invalid creditials'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
};