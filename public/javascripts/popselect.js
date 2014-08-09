/**
 * Copyright (C) 2014 yanni4night.com
 * popselect.js
 *
 * changelog
 * 2014-08-09[22:15:29]:authorized
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
(function(window) {
    var tpl = '<%for q in data%><a class="list" href="#" data-id="<%=q._id%>">\
    <div class="list-content">\
        <span class="list-title"><%=q.name%></span>\
        <span class="list-subtitle"><%=q.author%>: <%=q.date%></span>\
        <span class="list-remark"><%=q.content%></span>\
    </div>\
</a><%endfor%>';
    var func = resolver(tpl);

    function load(model, callback) {
        $.post('/' + model + '/listAll').done(function(arr) {
            callback(arr);
        }).fail(function() {
            callback(null);
        });
    }

    function show(model) {
        var self = this;
        $.Dialog({
            shadow: true,
            overlay: true,
            icon: '<span class="icon-search"></span>',
            title: 'Select ' + model + '(s)',
            width: 500,
            height: 300,
            padding: 10,
            content: 'Loading...',
            onShow: function($_dialog) {
                var $content = $_dialog.children('.content');
                $content.html('<div class="listview-outlook" style="height: 240px;overflow-y: scroll;"><div class="group-content"><div class="list-group"></div></div></div>');
                load(model, function(arr) {
                    $content.find('.list-group').html(func({
                        data: arr || []
                    }));
                });

                $content.delegate('a','click',function(e){
                    e.preventDefault();
                    self.opt.onSelect.call(self,this);
                });
            }
        })
    }


    window.SelectDialog = function(options) {
        var opt = this.opt = $.extend({
            onSelect: $.noop,
            model:'question'
        }, options || {});

        this.show=function(){
            show.call(this,opt.model)
        };

    };
})(window);