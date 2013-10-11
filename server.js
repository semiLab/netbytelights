#!/usr/local/bin/node

sys     = require('util');
express = require('express');

serialPort = require("serialport").SerialPort;
var serial = new serialPort("/dev/ttyUSB0" , { baudrate : 9600 });

//app = express.createServer();


//server.listen(3000);


var express = require("express");
//app = express();
var app = express()
  , http = require('http')
  , server = http.createServer(app)
  , io = require('socket.io').listen(server);


app.configure(function(){
  app.use(express.static(__dirname + '/public'));
});

app.get('/', function(req, res, next){
  res.render('/public/index.html');
});
server.listen(8081);
console.log('Server running at http://localhost:8081/');

//var io  = require('socket.io').listen(app);
io.set('log level', 1);

io.sockets.on('connection', function(socket){
	socket.on('setcolor', function(data){
		console.log(data);
		var r = data.red >> 5;
		var g = data.green >> 5;
		var b = data.blue >> 5;
		for(var i=0;i<5;i++){
		var str = ""+i+r+g+b;
			//console.log(str);
			serial.write(str);
		}
	});
});

