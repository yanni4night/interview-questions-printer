var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res) {
  res.send('respond with a resource');
});

router.get('/info', function(req, res) {
  res.send('respond with a info');
});

module.exports = router;
