/**
  * Copyright (C) 2014 yanni4night.com
  * tpl.js
  *
  * changelog
  * 2014-06-30[16:55:53]:authorized
  *
  * @author yanni4night@gmail.com
  * @version 0.1.0
  * @since 0.1.0
  */

     function resolver(tplStr) {
        var reg = /<%(.+?)%>/mg;
        var matches, lastMatches;
        var start = 0;
        var segs = [];
        var judge;
        var fnStr = 'with(__data){var _tpl="";';
        tplStr = tplStr.replace(/[\r\n]/mg, ''); //PRE elements not supported
        while (matches = reg.exec(tplStr)) {
            fnStr += '_tpl+="' + (tplStr.slice(start, matches.index)).replace(/"/mg, '\\"') + '";';
            start = matches[0].length + matches.index;
            lastMatches = matches;

            switch (true) {
                case /^\s*for\s+(\w+)\s+in\s+(.+)\s*$/.test(matches[1]):
                    fnStr += 'for(var _i=0,' + RegExp.$1 + ',loop;_i<' + RegExp.$2 + '.length;++_i){' + RegExp.$1 + '=' + RegExp.$2 + '[_i];loop={index:_i+1,index0:_i,first:(_i===0),last:(_i+1===' + RegExp.$2 + '.length)};'
                    break;
                case /^\s*(endfor|endif)\s*$/.test(matches[1]):
                    fnStr += "}";
                    break;
                case /^=(.+)$/.test(matches[1]):
                    fnStr += '_tpl+=' + RegExp.$1 + '||"";';
                    break;
                case /^\s*elif\s*(.+)$/.test(matches[1]):
                    fnStr += '}else if('+RegExp.$1+'){';
                    break;
                case /^\s*if\s*(.+)$/.test(matches[1]):
                    judge = RegExp.$1.replace(/\band\b/ig, '&&');
                    judge = judge.replace(/\bor\b/ig, '||');
                    fnStr += "if(" + judge + "){";
                    break;
                case /^\s*else\s*$/.test(matches[1]):
                    fnStr += '}else{';
                    break;
                case /^\s*set\s+(\w+)=(.+)$/.test(matches[1]):
                    fnStr += 'var ' + RegExp.$1 + '=' + RegExp.$2+';';
                    break;
                default:
                    console.error(matches[1]);
            }
        }
        fnStr += '_tpl+="' + (tplStr.slice(lastMatches.index + lastMatches[0].length)).replace(/"/mg, '\\"') + '";';
        fnStr += 'return _tpl;}';
        return new Function('__data', fnStr);
 }
