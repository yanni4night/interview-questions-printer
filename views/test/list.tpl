{%extends "parent.tpl"%}
{%block title%}List Test{%endblock%}
{%block content%}
<div class="listview-outlook"  style="margin-top: 20px">
                <div class="list-group">
                    <a href="#" class="group-title">All the tests</a>
                    <div class="group-content" style="display: block;">
                        {%for q in tests%}
                        <a class="list" target="_blank" href="/test/show/{{q.id}}">
                            <div class="list-content">
                                <span class="list-title">{{q.name}}</span>
                                <span class="list-subtitle">{{q.author}}: {{q.date|date('Y-m-d')}}</span>
                                <span class="list-remark">{{q.tags}}</span>
                            </div>
                        </a>
                        {%endfor%}
                    </div>
                </div>
            </div>
{%endblock%}