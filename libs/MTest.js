/**
 * Copyright (C) 2014 yanni4night.com
 * MTest.js
 *
 * changelog
 * 2014-08-09[02:22:36]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
var mongoose = require('./mongoose');

var Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

var testSchema = new Schema({
    tid: ObjectId,
    name: String,
    author: String,
    questions: String,
    date: Date,
    stars: String,
    tags: String
});

module.exports = mongoose.model('Test', testSchema);