/**
 * Copyright (C) 2014 yanni4night.com
 * Codes.js
 *
 * changelog
 * 2014-08-07[14:36:02]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
module.exports = {
    PARAMETER_REQUIRED: function() {
        return {
            code: -0x0810,
            msg: 'Lack of parameter(s)'
        };
    },
    PARAMETER_WRONG: function() {
        return {
            code: -0x0811,
            msg: 'Wrong parameter(s)'
        };
    },
    OPERATION_FAILED: function(msg) {
        return {
            code: -1,
            msg: msg || 'Operation failed'
        };
    },
    OPERATION_SUCCEED: function(msg) {
        return {
            code: 0,
            msg: msg || 'Operation succeed'
        };
    }
};