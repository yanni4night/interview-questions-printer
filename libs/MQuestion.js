/**
 * Copyright (C) 2014 yanni4night.com
 * MQuestion.js
 *
 * changelog
 * 2014-08-07[12:49:58]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */

var mongoose = require('./mongoose');

var Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId,
    Mixed = Schema.Types.Mixed;

var questionSchema = new Schema({
    qid: ObjectId,
    name: String,
    author:String,
    content: String,
    date: Date,
    comments: Array,
    stars:Array
});

module.exports = mongoose.model('Question', questionSchema);