var faker = require('faker');
var mysql = require('mysql');

var mysql = require('mysql');

var secret = 'flow' // Find a better way to do this!!
 
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',  // your root username (leave as root)
  database : 'join_us',   // the name of your db (create this if you haven't already)
  password : secret   // your root user's password
});
// process.env.MYSQL_PW
// console.log(faker.internet.email());

// console.log(faker.name.findName());

// console.log(faker.date.past());

// console.log(faker.address.city());

// console.log(faker.company.suffixes());
// console.log(faker.company.companyName());

function generateAddress() {
    console.log(faker.address.streetAddress());
    console.log(faker.address.city());
    console.log(faker.address.state());
}

// generateAddress();
// generateAddress();
// generateAddress();


// var q = 'SELECT 1 + 1 AS solution'; 

// var q = 'SELECT CURDATE()'; 

// var q = 'SELECT CURTIME() AS time, CURDATE() AS date, NOW() as now';

// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results[0].time);
//     console.log(results[0].date);
//     console.log(results[0].now);
// });

// connection.end();


// 287. Selecting Using Node

// var q = 'SELECT COUNT(*)  AS Total FROM users';

// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);
// });

// connection.end();

// Inserting Using Node

// var q = 'INSERT INTO users (email) VALUES ("rusty_fly@gmail.com")';

// connection.query(q, function (error, results, fields) {
//     if (error) throw error;
//     console.log(results);
// });


// INSERTING DATA TAKE 2
// var person = {email: 'flow32@hotmail.com'};
// connection.query('INSERT INTO users SET ?', person, function(err, result) {
//     if (err) throw err;
//     console.log(result)
// });

// connection.end();

// INSERTING DATA TAKE 3

// var person = {email: faker.internet.email()};
// connection.query('INSERT INTO users SET ?', person, function(err, result) {
//     if (err) throw err;
//     console.log(result)
// });

// connection.end();

// Some MySQL/Node Magic

// var person = {
//     email: faker.internet.email(),
//     created_at: faker.date.past()
// };

// console.log(person);

// var end_result = connection.query('INSERT INTO users SET ?', person, function(err, result) {
//     if (err) throw err;
//     console.log(result)
// });

// console.log(end_result.sql);

// connection.end();

// Bulk Inserting 500 Users - Finally!

// var data = [
//     ['blah@gmail.com', '2017-05-01 03:51:37'],
//     ['ugh@gmail.com', '2017-05-01 03:51:37'],
//     ['meh@gmail.com', '2017-05-01 03:51:37']
// ];

// var q = 'INSERT INTO users (email, created_at) VALUES ?';

// connection.query(q, [data], function(err, result) {
//   console.log(err);
//   console.log(result);
// });

var data = [];

for(var i=0; i < 500; i++){
    data.push([
        faker.internet.email(),
        faker.date.past()
    ]);
}


// console.log(data);

var q = 'INSERT INTO users (email, created_at) VALUES ?';

connection.query(q, [data], function(err, result) {
  console.log(err);
  console.log(result);
});

connection.end();