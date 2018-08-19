// server.js

// set up ======================================================================
// get all the tools we need
var express  = require('express');
var session  = require('express-session');
var cookieParser = require('cookie-parser');
var bodyParser   = require('body-parser');
var morgan   = require('morgan');
var app      = express();
var port     = process.env.PORT || 8080;

var passport = require('passport');
var flash    = require('connect-flash');

var mysql = require('mysql');
var bcrypt = require('bcrypt-nodejs');
var dbconfig = require('./database');
var connection = mysql.createConnection(dbconfig.connection);
connection.query('USE ' + dbconfig.database);

console.log("connection: "+connection);

// configuration ===============================================================
// connect to our database

require('./config/passport')(passport); // pass passport for configuration


// set up our express application
app.use(morgan('dev')); // log every request to the console
app.use(cookieParser()); // read cookies (needed for auth)
/*app.use(bodyParser.urlencoded({
	extended: true
}));*/
app.use(bodyParser.json());

var path = require('path');
var formidable = require('formidable');
var fs = require('fs');
app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs'); // set up ejs for templating

// required for passport
app.use(session({
	secret: 'vidyapathaisalwaysrunning',
	resave: true,
	saveUninitialized: true
 } )); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

app.use(bodyParser({uploadDir:'/images'}));

// routes ======================================================================
require('./app/routes.js')(app, passport); // load our routes and pass in our app and fully configured passport

//controllers
var registrationController    = require('./controller/registration-controller');
var userController            = require('./controller/user-controller');
var agentController           = require('./controller/agent-controller');
var adminController           = require('./controller/admin-controller');

/* route to handle login and registration */
app.post('/upload', function(req, res){

    // create an incoming form object
    var form = new formidable.IncomingForm();

    // specify that we want to allow the user to upload multiple files in a single request
    form.multiples = true;

    // store all uploads in the /uploads directory
    form.uploadDir = path.join(__dirname, '/images');

    // every time a file has been uploaded successfully,
    // rename it to it's orignal name
    form.on('file', function(field, file) {
        fs.rename(file.path, path.join(form.uploadDir, file.name));
    });

    // log any errors that occur
    form.on('error', function(err) {
        console.log('An error has occured: \n' + err);
    });

    // once all the files have been uploaded, send a response to the client
    form.on('end', function() {
        res.end('success');
    });

    // parse the incoming request containing the form data
    form.parse(req);
    res.json({success:true});
});

app.post('/api/register',registrationController.register);

app.post('/api/login',   registrationController.login);

app.post('/api/update-device-info', (req, res) => {

    var device_id   = req.body.device_id;
    var device_info = req.body.device_info;
    var fcm_token   = req.body.fcm_token;
    var user_id     = req.body.user_id;

    var qry = "SELECT * FROM device_info where device_id ='"+device_id+"'";

    connection.query(qry, null, function(err, rows){
        var c=0;
        if (err)
            c=0;
        else  if (rows.length) {
            c = 1
        }
        console.log("update-device-info:   device_id:"+device_id +"  device_info:"+device_info+" fcm_token:"+fcm_token+"  user_id:"+user_id);
        if(c===0){
            var insertQuery = "INSERT INTO device_info (device_id,device_info,fcm_token,user_id) values (?,?,?,?)";
            connection.query(
                insertQuery,
                [
                    device_id,
                    device_info,
                    fcm_token,
                    user_id!==null?user_id:0
                ],
                function(err, rows) {
                    if (err) {
                        console.error(err);
                        res.json({
                            status: false,
                            message: 'there are some error with query'
                        })
                    } else {
                        res.json({
                            status: true,
                            message: 'device info added successfully'
                        })
                    }
                });
        }else{
            insertQuery = "update device_info set fcm_token =? where device_id=?";

            connection.query(
                insertQuery,
                [
                    fcm_token,
                    device_id
                ],
                function(err, rows) {
                    if (err) {
                        console.error(err);
                        res.json({
                            status: false,
                            message: 'there are some error with query'
                        })
                    } else {
                        res.json({
                            status: true,
                            message: 'device info added successfully'
                        })
                    }
                });
        }
    });
});

app.post('/api/add-news', (req, res) => {

    try {
        var title = req.body.title;
        var sub_title = req.body.sub_title;
        var news_type = req.body.news_type;
        var news_label = req.body.news_label;
        var source_name = req.body.source_name;
        var source_link = req.body.source_link;
        var description = req.body.description;
        var thumb_url = req.body.thumb_url;

        switch (news_type) {
            case 'IMAGE_TEXT':
                image_url = req.body.image_url;
                video_url = "";
                youtube_link = "";
                gallery1 = "";
                gallery2 = "";
                break;
            case 'VIDEO_TEXT':
                image_url = "";
                video_url = req.body.video_url;
                youtube_link = "";
                gallery1 = "";
                gallery2 = "";
                break;
            case 'YOUTUBE_TEXT':
                image_url = "";
                video_url = "";
                youtube_link = req.body.youtube_link;
                gallery1 = "";
                gallery2 = "";
                break;
            case 'IMAGE_GALLERY_TYPE1':
                image_url = "";
                video_url = "";
                youtube_link = "";
                gallery1 = req.body.gallery1;
                gallery2 = "";
                break;
            case 'IMAGE_GALLERY_TYPE2':
                image_url = "";
                video_url = "";
                youtube_link = "";
                gallery1 = "";
                gallery2 = req.body.gallery2;
                break;
        }
        var insertQuery = "INSERT INTO news (" +
            "title,sub_title,news_type,news_label,source_name,source_link,description,thumb_url," +
            "image_url,video_url,youtube_link,gallery1,gallery2) " +
            "values (?,?,?,?,?,?,?,?, ?,?,?,?,?)";
        connection.query(
            insertQuery,
            [
                title,
                sub_title,
                news_type,
                news_label,
                
                source_name,
                source_link,
                description,
                thumb_url,

                image_url,
                video_url,
                youtube_link,
                gallery1,
                gallery2
            ],
            function (err, rows) {
                if (err) {
                    console.error(err);
                    res.json({
                        status: false,
                        message: 'there are some error with query'
                    })
                } else {
                    res.json({
                        status: true,
                        message: 'News added successfully'
                    })
                }
            });
    }catch (e) {
        res.json({
            status: false,
            message: 'input field is missing'
        })
    }
});

app.get('/api/news', (req, res) => {
    console.log(req.body.name);

    console.log("news data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
    var today = new Date();

    connection.query("SELECT * FROM news  order by date desc",null, function(err, rows){
        if (err){
            console.error(err);
            res.json({
                status:false,
                message:'there are some error with query'
            });

        }else  if (rows.length) {
            var list = {};
            for (var i = 0;i < rows.length; i++) {
                var label = rows[i].news_label;
                var obj = {
                    title: rows[i].title,
                    sub_title: rows[i].sub_title,
                    news_type: rows[i].news_type,
                    news_label: rows[i].news_label,

                    source_name: rows[i].source_name,
                    source_link: rows[i].source_link,
                    description: rows[i].description,
                    thumb_url: rows[i].thumb_url,

                    image_url: rows[i].image_url,
                    video_url: rows[i].video_url,
                    youtube_link: rows[i].youtube_link,
                    gallery1: rows[i].gallery1,
                    gallery2: rows[i].gallery2,
                    date: rows[i].date
                };

                console.log("news data:==> " + label + "  ==> " + list);
                if (label.indexOf(",") > -1) {
                    for (var k = 0; k < label.split(",").length; k++) {
                        var news_label = label.split(",")[k];

                        news_label = news_label.trim().toLowerCase();
                        if (!Array.isArray( list[news_label] )) {
                            list[news_label]= [];
                        }

                        console.log("==> " + news_label + "  ==> " + list+"   "+obj+"   ->"+list[news_label]);
                        list[news_label].push(obj);

                    }
                }else{

                    label = label.trim().toLowerCase();
                    if (!Array.isArray( list[label] )) {
                        list[label]= [];
                    }

                    console.log("==> " + label + "  ==> " + list+"   "+obj+"   ->"+list[label]);
                    list[label].push(obj);
                }
            }

            var data = {
                status:true,
                list:list,
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
});

app.post('/api/manufactures', (req, res) => {
    console.log(req.body.name);

    console.log("manufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
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
});

app.post('/api/add-manufacture', (req, res) => {
    console.log(req.body.name);

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
});

app.post('/api/manufactures', (req, res) => {
    console.log(req.body.name);

    console.log("manufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
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
});

app.post('/api/search-manufactures', (req, res) => {
    console.log(req.body.name);

    var search = req.body.search;

    var qry = "SELECT * FROM manufactures where name like '%"+search+"%'";

    connection.query(qry, null, function(err, rows){
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
});

app.post('/api/add-vehicle', (req, res) => {

    var model_name      = req.body.model_name;
    var manufacture_id  = req.body.manufacture_id;
    var description     = req.body.description;

    var insertQuery = "INSERT INTO vehicles ( model_name, manufacture_id, description) values (?,?, ?)";
    connection.query(
        insertQuery,
        [model_name,manufacture_id, description],
        function(err, rows) {
            if (err) {
                console.error(err);
                res.json({
                    status:false,
                    message:'there are some error with query'
                })
            }else{
                res.json({
                    status:true,
                    vehicle:{
                        id:rows.insertId,
                        model_name:model_name,
                        manufacture_id:manufacture_id,
                        description:description,
                    },
                    message:'vehicle added sucessfully'
                })
            }
        });
});

app.post('/api/vehicles', (req, res) => {

    console.log("data: "+req );
    console.log(req.body.name);

    console.log("manufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
    var today = new Date();

    connection.query("SELECT * FROM vehicles ",null, function(err, rows){
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
                    model_name: rows[i].model_name,
                    manufacture_id: rows[i].manufacture_id,
                    description: rows[i].description,
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
                message:'vehicles list is empty'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
});

app.post('/api/vehicles-by-manufacture-id', (req, res) => {

    console.log("data: "+req );
    console.log(req.body.name);

    console.log("manufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
    var today = new Date();

    var id      = req.body.manufacture_id;
    connection.query("SELECT * FROM vehicles where manufacture_id = ? ", [id], function(err, rows){
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
                    model_name: rows[i].model_name,
                    manufacture_id: rows[i].manufacture_id,
                    description: rows[i].description,
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
                message:'vehicles list is empty'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
});

app.post('/api/search-vehicles', (req, res) => {

    console.log("data: "+req );
    console.log(req.body.name);

    console.log("manufactures data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
    var today = new Date();

    var id      = req.body.manufacture_id;
    var search  = req.body.search;

    var qry ="SELECT * FROM vehicles ";

    if(id!=null && id!=="" && search!=null && search!=="" ){
        qry = qry+" WHERE manufacture_id='"+id+"' AND  model_name LIKE '%"+search+"%' ";
    }else if(id!=null && id!=="" ){
        qry = qry+" WHERE manufacture_id='"+id+"'";

    }else if(search!=null && search!=="" ){
        qry = qry+" WHERE  model_name LIKE '%"+search+"%' ";

    }else{

    }

    connection.query(qry, null, function(err, rows){
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
                    model_name: rows[i].model_name,
                    manufacture_id: rows[i].manufacture_id,
                    description: rows[i].description,
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
                message:'vehicles list is empty'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
});

app.post('/api/add-showroom', (req, res) => {

    //var id      = req.body.id;
    var name    = req.body.name;
    var service_type     = req.body.service_type;
    var email     = req.body.email;
    var mobile     = req.body.mobile;
    var address     = req.body.address;
    var lattitude     = req.body.lattitude;
    var longitude     = req.body.longitude;
    var type     = req.body.type;
    var isVerified     = req.body.isVerified;
    var manufacture_id     = req.body.manufacture_id;
    var my_tag     = req.body.my_tag;

    var insertQuery = "INSERT INTO showrooms ( name, service_type, email,mobile," +
        "address,lattitude, longitude, " +
        "type, isVerified, manufacture_id) " +
        "values (?, ?, ?, ?, ?,?,?, ?,?,?)";
    connection.query(
        insertQuery,

        [name, service_type, email, mobile,
        address, lattitude, longitude,
        type, isVerified, manufacture_id ],

        function(err, rows) {
            if (err) {
                console.error(err);
                res.json({
                    status:false,
                    message:'there are some error with query'
                })
            }else{
                res.json({
                    status:true,
                    showroom:{
                        id:rows.insertId,
                        name:name,
                        service_type:service_type,
                        email:email,
                        mobile:mobile,
                        address:address,
                        lattitude:lattitude,
                        longitude:longitude,
                        type:type,
                        isVerified:isVerified,
                        manufacture_id:manufacture_id
                    },
                    message:'showrooms/service added sucessfully'
                })
            }
        });
});

app.post('/api/showrooms', (req, res) => {

    console.log("data: "+req );
    console.log(req.body.name);

    console.log("showrooms data: "+req.body +"   "+JSON.stringify(req.body)+"   ====> ");
    var today = new Date();

    var id      = req.body.manufacture_id;
    var search  = req.body.search;
    var service_type  = req.body.service_type;

    var qry ="SELECT * FROM showrooms ";

    if(id!=null && id!=="" && search!=null && search!=="" && service_type!=null && service_type!==""){
        qry = qry+" WHERE manufacture_id="+id+"" +
            " AND  name LIKE '%"+search+"%' " +
            "AND service_type='"+service_type+"'";

    }else if(id!=null && id!=="" && service_type!=null && service_type!==""  ){
        qry = qry+" WHERE manufacture_id="+id+" AND  service_type="+service_type+" ";

    }else if(id!=null && id!=="" && search!=null && search!==""  ){
        qry = qry+" WHERE manufacture_id="+id+" AND  name LIKE '%"+search+"%' ";

    }else if(service_type!=null && service_type!=="" && search!=null && search!==""  ){
        qry = qry+" WHERE service_type="+service_type+" AND  name LIKE '%"+search+"%' ";

    }else if(id!=null && id!=="" ){
        qry = qry+" WHERE manufacture_id="+id+"";

    }else if(search!=null && search!=="" ){
        qry = qry+" WHERE  name LIKE '%"+search+"%' ";

    }else if(service_type!=null && service_type!=="" ){
        qry = qry+" WHERE service_type="+service_type+"";

    }else{

    }

    connection.query(qry, null, function(err, rows){
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
                    id:rows[i].id,
                    name:rows[i].name,
                    service_type:rows[i].service_type,
                    email:rows[i].email,
                    mobile:rows[i].mobile,
                    address:rows[i].address,
                    lattitude:rows[i].lattitude,
                    longitude:rows[i].longitude,
                    type:rows[i].type,
                    isVerified:rows[i].isVerified,
                    manufacture_id:rows[i].manufacture_id
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
                message:'showroom list is empty'
            };
            //connection.end();
            res.end(JSON.stringify(data));
        }
    });
});

// launch ======================================================================
app.listen(port);
console.log('The magic happens on port ' + port);
