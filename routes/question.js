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
var extend = require('extend');
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

router.post('/listAll', function(req, res) {
    Question.find({}, function(err, ques) {
        if (!err) {
            return res.json(ques);
        } else {
            return res.json(Codes.OPERATION_FAILED(err.message));
        }
    });
});

router.get('/create', function(req, res) {
    return res.render('question/create', tplData(req));
});

router.get('/search', function(req, res, next) {
    var key = req.param('key'),
        keys, reg;
    if (!key) {
        return res.redirect('/question/list');
    }

    keys = key.split(/\s+/g);
    reg = new RegExp(keys.map(function(key, idx) {
        return key.replace(/(\$|\?|\+|\*|\||\^|\(|\)|\[|\]|\{|\}|\.|\\)/mg, '\\$1')
    }).join('|'), 'img');

    Question.find({}).or([{
        name: reg
    }, {
        content: reg
    }, {
        tags: reg
    }]).exec(
        function(err, ques) {
            if (err) {
                (err || (err = new Error('Nothing found'))).status = 500;
                return next(err);
            }
            return res.render('question/list', tplData(req, {
                questions: ques,
                key: key
            }));
        }
    );


});

router.get('/show/:id', function(req, res, next) {
    var id = req.param('id'),
        err;
    return Question.findById(id, function(err, ques) {
        if (err || !ques) {
            (err || (err = new Error('Question Not Found'))).status = 404;
            return next(err);
        } else {

            !Array.isArray(ques.stars) && (ques.stars = []);
            if (ques.stars.length > 1) {
                ques.rate = Math.round(ques.stars.reduce(function(p, n) {
                    return p.value + n.value;
                }) / ques.stars.length);
            } else if (1 === ques.stars.length) {
                ques.rate = ques.stars[0].value;
            }

            return res.render('question/show', tplData(req, {
                question: ques,
                stared: ques.stars.some(function(star) {
                    return star.author = req.username;
                }),
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
                question: ques
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

    var name = (req.body.name || "").trim();
    var content = (req.body.content || "").trim();
    var tags = (req.body.tags || "").trim();
    var id = req.body.id;

    var update = {
        content: content,
        name: name,
        tags: tags,
        author: req.username,
        date: new Date()
    };
    var obj = extend({
        id: id
    }, update);

    if (!name || !content) {
        return res.render('question/create', tplData(req, {

            question: obj,
            errmsg: 'Parameter(s) required '
        }));
    }

    if (id) {
        return Question.findByIdAndUpdate(id, update, function(err, ques) {
            if (err && !ques) {
                return res.render('question/create', tplData(req, {
                    question: obj,
                    errmsg: err.message
                }));
            } else {
                return res.redirect('/question/show/' + ques.id);
            }
        });
    }

    var ques = new Question();

    extend(ques, update);

    return ques.save(function(err, ques) {
        if (err && !ques) {
            return res.render('question/create', tplData(req, {
                question: obj,
                errmsg: err.message

            }));
        } else {
            return res.redirect('/question/show/' + ques.id);
        }
        //return res.json(err ? Codes.OPERATION_FAILED() : Codes.OPERATION_SUCCEED());
    });
});


router.post('/star/:id', function(req, res) {
    var id = req.param('id');
    var value = +req.param('value');

    if (isNaN(value) || !isFinite(value) || value < 0 || value > 5) {
        return res.json(Codes.PARAMETER_WRONG());
    }

    return Question.findById(id, function(err, ques) {
        if (err || !ques) {
            return res.json(Codes.OPERATION_FAILED(err && err.message));;
        } else {
            !Array.isArray(ques.stars) && (ques.stars = []);
            if (!ques.stars.some(function(star) {
                return star.author === req.username;
            })) {
                ques.stars.push({
                    value: value,
                    author: req.username
                });

                return Question.findByIdAndUpdate(id, {
                    stars: ques.stars
                }, function(err, que) {
                    //ignore error
                    return res.json(Codes.OPERATION_SUCCEED());
                });
            }
            return res.json(Codes.OPERATION_FAILED('Dumplicated star'))
        }
    });
});

module.exports = router;