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
/*

module.exports.addManufacture= function(req, res){

    console.log("addManufacture data: "+req );

    var name     = req.body.manufacture_name;
    var insertQuery = "INSERT INTO manufactures ( name) values (?)";
    connection.query(
        insertQuery,
        [name
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
                    manufacture_data:{
                        id:rows.insertId,
                        name:name
                    },
                    message:'manufacture added sucessfully'
                })
            }
        });
};

module.exports.manufactures=function(req, res){

    console.log("manufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> "+req.body.name);
    var today = new Date();

   connection.query("SELECT * FROM manufactures",null, function(err, rows){
        if (err){
            console.error(err);
            res.json({
                status:false,
                message:'there are some error with query'
            });

        }else  if (rows.length) {
            var manufacture_list = [];

            for (var i = 0;i < rows.length; i++) {
                manufacture_list.push({
                    id: rows[i].id,
                    name: rows[i].name,
                });
            }

            var data = {
                status:true,
                list:manufacture_list,
                message:'success'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        } else {
            var data = {
                status:true,
                message:'manufacture list is empty'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
};

module.exports.searchManufactures=function(req, res){

    console.log("searchManufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> "+req.body.name);
    var today = new Date();

    //return;
    var search = req.body.search;
    connection.query("SELECT * FROM manufactures where name like %?%", [search], function(err, rows){
        if (err){
            console.error(err);
            res.json({
                status:false,
                message:'there are some error with query'
            });

        }else  if (rows.length) {
            var manufacture_list = [];

            for (var i = 0;i < rows.length; i++) {
                manufacture_list.push({
                    id: rows[i].id,
                    name: rows[i].name,
                });
            }

            var data = {
                status:true,
                list:manufacture_list,
                message:'success'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        } else {
            var data = {
                status:true,
                message:'manufacture list is empty'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
};
*/
