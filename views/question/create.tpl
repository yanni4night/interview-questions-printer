{%extends "parent.tpl"%}


{%block title%}{%if id%}Update{%else%}Create{%endif%} Question{%endblock%}
{%block content%}
<form action="/question/save" method="post" autocomplete="off" disableautocomplete>
    {%if errmsg%}
    <div class="margin10">
        <div class="notice marker-on-bottom bg-darkRed fg-white">
            <div class="">{{errmsg|safe}}</div>
        </div>
    </div>
    {%endif%}
    <fieldset>
        <legend>{%if id%}Update{%else%}Create{%endif%} a new question</legend>
        <label>Name</label>
        <div class="input-control text info-state" data-role="input-control">
            <input type="text" placeholder="type the title of the question" name="name" value="{{name|safe}}"/>
            <button class="btn-clear" tabindex="-1" type="button"></button>
        </div>
        <input type="hidden" name="id" value="{{id}}"/>
        <label>Content</label>
        <!--  <div class="input-control password" data-role="input-control">
            <input type="password" placeholder="type the content" name="body" autofocus="">
            <button class="btn-reveal" tabindex="-1" type="button"></button>
        </div> -->
        <div class="input-control textarea info-state" data-role="input-control">
            <textarea name="content" class="body" placeholder="type the content of the question">{{content|safe}}</textarea>
        </div>
        <!-- <div class="input-control text" data-role="input-control">
            <input type="text">
            <button class="btn-search"></button>
        </div>
        <div class="input-control text warning-state" data-role="input-control">
            <input type="text" value="warning state">
        </div>
        <div class="input-control file" data-role="input-control">
            <input type="file" tabindex="-1" style="z-index: 0;"><input type="text" id="__input_file_wrapper__" readonly="" style="z-index: 1; cursor: default;">
            <button class="btn-file" type="button"></button>
        </div>
        <div class="input-control text error-state" data-role="input-control">
            <input type="text" value="error state">
        </div>
        <div class="input-control text info-state" data-role="input-control">
            <input type="text" value="info state">
        </div>
        <div class="input-control text success-state" data-role="input-control">
            <input type="text" value="info state">
        </div>
        <div class="input-control checkbox" data-role="input-control">
            <label class="inline-block">
                <input type="checkbox">
                <span class="check"></span>
                Check me out
            </label>
            <label class="inline-block">
                <input type="checkbox" checked="">
                <span class="check"></span>
                Check me out
            </label>
            <label class="inline-block">
                Check me out
                <input type="checkbox" disabled="">
                <span class="check"></span>
            </label>
            <label class="inline-block">
                Check me out
                <input type="checkbox" disabled="" checked="">
                <span class="check"></span>
            </label>
            <label class="inline-block">
                Intermediate
                <input type="checkbox" data-show="intermediate">
                <span class="check"></span>
            </label>
        </div>
        <div>
            <div class="clearfix">
                <div class="input-control radio inline-block" data-role="input-control">
                    <label class="inline-block">
                        <input type="radio" name="r1" checked="">
                        <span class="check"></span>
                        R1
                    </label>
                    <label class="inline-block">
                        <input type="radio" name="r1">
                        <span class="check"></span>
                        R1
                    </label>
                </div>
                <div class="input-control radio default-style inline-block" data-role="input-control">
                    <label class="inline-block">
                        <input type="radio" name="r2" checked="">
                        <span class="check"></span>
                        R1
                    </label>
                    <label class="inline-block">
                        <input type="radio" name="r2">
                        <span class="check"></span>
                        R2
                    </label>
                </div>
            </div>
            <div class="input-control switch" data-role="input-control">
                <label class="inline-block" style="margin-right: 20px">
                    Switch me
                    <input type="checkbox" checked="">
                    <span class="check"></span>
                </label>
                <label class="inline-block">
                    <input type="checkbox" disabled="">
                    <span class="check"></span>
                    Switch disabled
                </label>
            </div>
        </div> -->
        <input type="submit" value="{%if id%}Update{%else%}Create{%endif%}"/>
        <input type="reset" value="Reset"/>
        <!-- <input type="button" value="Button"> -->
    </fieldset>
</form>
{%endblock%}