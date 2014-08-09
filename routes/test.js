/**
 * Copyright (C) 2014 yanni4night.com
 * test.js
 *
 * changelog
 * 2014-08-09[02:27:37]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
var extend = require('extend');
var express = require('express');
var router = express.Router();


var Question = require('../libs/MQuestion');
var Test = require('../libs/MTest');
var Codes = require('../libs/Codes');
var tplData = require('../libs/tplData');

router.get('/', function(req, res, next) {
    return res.redirect('/test/list');
});

router.get('/list', function(req, res, next) {

    return Test.find({},function(err,tests){
        if(err){
            err.status = 404;
            return next(err)
        }else{
            return res.render('test/list',tplData(req,{tests:tests}));
        }
    });

});
//json
router.post('/save', function(req, res, next) {
    var name = (req.param('name') || "").trim();
    var tags = (req.param('tags') || "").trim();
    var id = (req.param('id') || "").trim();
    var questions = (req.param('questions') || "").trim();

    if (!name) {
        return res.json(Codes.PARAMETER_REQUIRED('"name"is required'));
    }

    var update = {
        name: name,
        tags: tags,
        date: new Date(),
        author: req.username,
        questions: questions
    };

    var obj = extend({
        id: id
    }, update);

    if (id) {
        //update
        return Test.findByIdAndUpdate(id, update, function(err, te) {
            if (!err) {
                return res.json({
                    code: 0,
                    test: te
                });
            } else {
                return res, json(Codes.OPERATION_FAILED(err.message));
            }
        });
    } else {
        //create
        var test = new Test();
        extend(test, update);
        return test.save(function(err, te) {
            if (!err) {
                return res.json({
                    code: 0,
                    test: te
                });
            } else {
                return res, json(Codes.OPERATION_FAILED(err.message));
            }
        });
    }

});

router.get('/create', function(req, res, next) {
    return res.render('test/create', tplData(req, {
        test: {}
    }));
});

router.get('/update/:id', function(req, res, next) {

});

router.get('/show/:id', function(req, res, next) {
    var id = req.param('id');
    return Test.findById(id,function(err,test){
        if(err){
            err.status = 404;
            return next(err);
        }else{
            var qids = (test.questions||"").split(',');
            //FIXME
            return Question.find({
               // _id: new RegExp(qids.replace(',','|'),'mg')
            },function(err,ques){
                return res.render('test/show',tplData(req,{
                    test:test,
                    _ques_test:true,
                    questions:(ques||[]).filter(function(q){
                        return ~qids.indexOf(q.id)
                    })
                }));
            })
        }
    });
});

module.exports = router;