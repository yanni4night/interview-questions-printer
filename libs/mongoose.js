/**
  * Copyright (C) 2014 yanni4night.com
  * mongoose.js
  *
  * changelog
  * 2014-08-07[12:49:11]:authorized
  *
  * @author yanni4night@gmail.com
  * @version 0.1.0
  * @since 0.1.0
  */
var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/viewtouch');

module.exports = mongoose;