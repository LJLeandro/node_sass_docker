var http = require('http');
http.createServer(function(req,res) {
 res.writeHead(200, { 'Content-Type': 'text/plain; charset=utf-8' });
 res.end('Exemplo Node.js Mundo Docker!');
}).listen(8080);