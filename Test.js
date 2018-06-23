const express = require('express');
const formidable = require('express-formidable');

var app = express();

app.use(formidable({
    encoding: 'utf-8',
    uploadDir: '/images',
    multiples: true, // req.files to be arrays of files
}));

app.post('/upload', (req, res) => {
    console.log("fields: "+req.fields.length);
    console.log("files: "+req.files.length);
    req.fields; // contains non-file fields
    req.files; // contains files
});
app.listen(8000);