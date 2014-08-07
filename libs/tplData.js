/**
 * Copyright (C) 2014 yanni4night.com
 * tplData.js
 *
 * changelog
 * 2014-08-07[17:26:02]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
var extend = require('extend');
module.exports = function() {
    if (arguments.length === 0) {
        return {};
    }
    var req = arguments[0];
    var args = Array.prototype.slice.call(arguments, 1);

    args.unshift({
        username: req.username,
        ip: req.ip,
        path: req.path
    });

    return extend.apply(null, args);
};