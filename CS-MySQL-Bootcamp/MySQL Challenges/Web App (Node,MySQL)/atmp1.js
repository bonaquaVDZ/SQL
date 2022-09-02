var express = require('express');
var mysql = require('mysql');
var app = express();

app.set("view engine","ejs");

var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',     
  database : 'join_us'   
});


app.get("/", function(req, res){
  var q = 'SELECT COUNT(*) as count FROM users';
  connection.query(q, function (error, results) {
      if (error) throw error;
      var msg = "We have " + results[0].count + " users";
      res.send(msg);
    });
});


app.get("/", function(req, res){
  console.log("Someone requested us!");
  res.send("You've reached the Home Page");
});

app.get("/logout", function(req, res){
  console.log("Someone log out of the system");
  res.send("You're logged out.");
});

app.get("/login", function(req, res){
  console.log("Someone log in");
  res.send("Log in Page.");
});

app.get("/start", function(req, res){
  console.log("Someone opens starting page!");
  res.send("Starting Page: ");
});

app.get("/joke", function(req, res){
    var joke = "What do you call a dog that does magic tricks? A labracadabrador.";
    res.send(joke);
});

app.get("/htmlcss", function(req, res){
    var joke = "<strong>What do you call a dog that does magic tricks? </strong> <em>A labracadabrador.</em>";
    res.send(joke);
});

app.get("/random_num", function(req, res){
    var num = Math.floor((Math.random() * 10) + 1);
    res.send("Your lucky number is " + num);
});


// Adding HTML file
app.get("/testhtml", function(req, res){
  var q = 'SELECT COUNT(*) as count FROM users';
  connection.query(q, function (error, results) {
      if (error) throw error;
	  var count = results[0].count;
      // var msg = "We have " + results[0].count + " users";
      res.render("home", {count: count, color:'Green'});
    });
});


app.listen(3000, function (){
	console.log("App listening on port 3000!");
	console.log("Processing...");
	console.log("Server running on 3000");
});