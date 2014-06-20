var port = 80,
    io = require('socket.io').listen(port),
    logger  = io.log,
    util = require('util');

io.configure('production', function() {

    logger.info('socket.io configured for production');

    io.enable('browser client minification');  // send minified client
    io.enable('browser client etag');          // apply etag caching logic based on version number
    io.enable('browser client gzip');          // gzip the file
    io.set('log level', 1);                    // reduce logging

    io.set('transports', [
        'websocket',
        'flashsocket',
        'htmlfile',
        'xhr-polling',
        'jsonp-polling'
    ]);
});

io.configure('development', function() {

    logger.info('socket.io configured for development');
    
    io.set('transports', ['websocket']);
});

logger.info(util.format('socket.io listening on port %d', port));

io.sockets.on('connection', function (socket) {

    socket.emit('test', { hello: 'world' });
    
    socket.on('test event', function (data) {
        logger.debug(data);
    });
});