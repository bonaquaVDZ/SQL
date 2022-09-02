var express = require('express');
var mysql = require('mysql');
var app = express();
var bodyParser = require("body-parser")

app.set("view engine","ejs");
app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static(__dirname + "/public"));

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',     
  database : 'join_us'   
});

// app.get("/", function(req, res){
//   var q = 'SELECT COUNT(*) as count FROM users';
//   connection.query(q, function (error, results) {
//       if (error) throw error;
//       var msg = "We have " + results[0].count + " users";
//       // res.send(msg);
//     });
// });

app.get("/", function(req, res){
  var q = 'SELECT COUNT(*) as count FROM users';
  connection.query(q, function (error, results) {
      if (error) throw error;
	  var count = results[0].count;
      // var msg = "We have " + results[0].count + " users";
      res.render("home", {count: count});
    });
});

// app.post('/register', function(req,res){
// 	var email = req.body.email;
//     console.log("POST REQUEST SEND TO /REGISTER email is " + req.body.email)
// });

app.post('/register', function(req,res){
	var person = {email: req.body.email};
	connection.query('INSERT INTO users SET ?', person, function(err, result) {
	console.log(err);
	console.log(result);
	res.redirect("/");
	});
});


// app.get("/joke", function(req, res){
// 	console.log("Someone requested joke page")
//     var joke = "What do you call a dog that does magic tricks? A labracadabrador.";
//     res.send(joke);
// });

// app.get("/random_num", function(req, res){
//     var num = Math.floor((Math.random() * 10) + 1); // Between 0 and 10
//     res.send("Your lucky number is " + num);
// });

// app.get("/random", function(req, res){
//     var num = Math.floor((Math.random()*10)); // Between 0 and 9
//     res.send("Your lucky number is " + num);
// });


app.listen(3000, function () {
  console.log('App listening on port 3000');
});