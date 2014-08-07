/**
 * Copyright (C) 2014 yanni4night.com
 * question.js
 *
 * changelog
 * 2014-08-07[12:05:02]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
var express = require('express');
var router = express.Router();


var Question = require('../libs/MQuestion');
var Codes = require('../libs/Codes');

var tplData = require('../libs/tplData');

router.get('/', function(req, res) {

    Question.find({}, function(err, ques) {

        if (!err) {
            return res.json(ques);
        } else {
            return res.send(err);
        }
    });


});

router.get('/create', function(req, res) {
    return res.render('question/create', tplData(req));
});

router.get('/show/:id', function(req, res, next) {
    var id = req.param('id'),
        err;
    return Question.findById(id, function(err, ques) {
        if (err || !ques) {
            (err || (err = new Error('Question Not Found'))).status = 404;
            return next(err);
        } else {
            return res.render('question/show', tplData(req, {
                question: ques,
                _ques_show: true
            }));
        }
    });
});

router.get('/edit/:id', function(req, res, next) {
    var id = req.param('id');
    return Question.findById(id, function(err, ques) {
        if (err || !ques) {
            (err || (err = new Error('Question Not Found'))).status = 404;
            return next(err);
        } else {
            return res.render('question/create', tplData(req, {
                content: ques.content,
                name: ques.name,
                id: ques.id
            }));
        }
    });
});

router.get('/list', function(req, res) {
    return Question.find({}, function(err, ques) {
        if (!err && ques) {
            return res.render('question/list', tplData(req, {
                questions: ques
            }));
        } else {
            (err || (err = new Error('Question List Failed'))).status = 500;
            return next(err);
        }
    });


});
//ajax
router.post('/save', function(req, res) {

    var name = req.body.name;
    var content = req.body.content;
    var id = req.body.id;

    if (!name || !content) {
        return res.render('question/create', tplData(req, {
            content: content,
            name: name,
            id: id,
            errmsg: 'Parameter(s) required '
        }));
    }

    if (id) {
        return Question.findByIdAndUpdate(id, {
            name: name,
            content: content,
            author: req.username,
            date: new Date()
        }, function(err, ques) {
            if (err && !ques) {
                return res.render('question/create', tplData(req, {
                    content: content,
                    name: name,
                    id: id,
                    errmsg: err.message

                }));
            } else {
                return res.redirect('/question/show/' + ques.id);
            }
        });
    }

    var ques = new Question();
    ques.name = name;
    ques.content = content;
    ques.author = req.username;
    ques.date = new Date();

    return ques.save(function(err, ques) {
        if (err && !ques) {
            return res.render('question/create', tplData(req, {
                content: content,
                name: name,
                errmsg: err.message

            }));
        } else {
            return res.redirect('/question/show/' + ques.id);
        }
        //return res.json(err ? Codes.OPERATION_FAILED() : Codes.OPERATION_SUCCEED());
    });
});

module.exports = router;