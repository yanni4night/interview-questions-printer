{%extends "parent.tpl"%}


{%block title%}{%if test.id%}Update{%else%}Create{%endif%} test{%endblock%}

{%block link%}
<link rel="stylesheet" href="/stylesheets/jquery.tagsinput.css">
{%endblock%}
{%block script%}
<script src="/javascripts/jquery.tagsinput.js"></script>
<script src="/javascripts/tpl.js"></script>
<script src="/javascripts/popselect.js"></script>
<script>
    $('#tags').tagsInput();
    var sd = new SelectDialog({
         onSelect: function (a) {
             $('#questions-list .group-content').append($(a).clone(true));
         },
    })

    $('#btn-cq').click(function(e){
        sd.show();
    });

    function error(msg){
        $.Dialog({
            shadow: true,
            overlay: true,
            icon: '<span class="icon-rocket"></span>',
            title: 'Error',
            width: 500,
            padding: 10,
            content: msg||"Error"
        });
    }

    $('form').submit(function(e){
        e.preventDefault();
        var ids= Array.prototype.map.call($('.listview-outlook .group-content a'),function(a){return $(a).attr('data-id')});
        
        $(':hidden[name=questions]').val(ids.join(','));

        $.ajax({
            url:this.action,
            data:$(this).serialize(),
            type:this.method,
            dataType:'json'}).done(function(data){
            if(0==data.code){
                location.href= '/test/';
            }else{
                error(data.errmsg);
            }

        }).fail(function(jqXhr,err){
            error(err);
        });
    });

</script>
{%endblock%}

{%block content%}
<form action="/test/save" method="post" autocomplete="off" disableautocomplete>
    {%if errmsg%}
    <div class="margin10">
        <div class="notice marker-on-bottom bg-darkRed fg-white">
            <div class="">{{errmsg|safe}}</div>
        </div>
    </div>
    {%endif%}
    <fieldset>
        <legend>{%if test.id%}Update a test{%else%}Create a new test{%endif%}</legend>
        <label>Name</label>
        <div class="input-control text info-state" data-role="input-control">
            <input type="text" placeholder="type the title of the test" name="name" value="{{test.name|safe}}"/>
            <button class="btn-clear" tabindex="-1" type="button"></button>
        </div>
        <input type="hidden" name="id" value="{{test.id}}"/>
        <input type="hidden" name="questions" value="{{test.questions}}"/>

        <label>Tags</label>
        <div class="input-control text info-state" data-role="input-control">
            <input type="text" placeholder="" id="tags" name="tags" value="{{test.tags}}"/>
            <button class="btn-clear" tabindex="-1" type="button"></button>
        </div>
        <div id="questions-list" class="listview-outlook" data-role="listview" style="margin: 20px 0">
                <div class="list-group ">
                    <a href="" class="group-title">Questions</a>
                    <div class="group-content">
                    {%for q in questions%}
<a class="list" href="#" data-id="{{q.id}}">
    <div class="list-content">
        <span class="list-title">{{q.name}}</span>
        <span class="list-subtitle">{{q.author}}: {{q.date|date("Y-m-d")}}</span>
        <span class="list-remark">{{q.content}}</span>
    </div>
</a>
                    {%endfor%}
                    </div>
                </div>
            </div>

        <input type="submit" value="{%if test.id%}Update{%else%}Create{%endif%}"/>
        <input type="reset" value="Reset"/>
        <input type="button" id="btn-cq" value="Add question"/>
    </fieldset>
</form>
{%endblock%}