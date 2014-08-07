var express = require('express');
var router = express.Router();
var tplData = require('../libs/tplData');

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', tplData(req));
});

module.exports = router;
