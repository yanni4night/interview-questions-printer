{%extends "parent.tpl"%}
{%block title%}List Question{%endblock%}
{%block content%}
<div class="listview-outlook"  style="margin-top: 20px">
                <div class="list-group">
                    <a href="#" class="group-title">Today</a>
                    <div class="group-content" style="display: block;">
                        <!-- <a class="list marked" href="#">
                            <div class="list-content">
                                <span class="list-title">subscribe@metroui.net</span>
                                <span class="list-subtitle">MetroUI: News on 26/10/2013</span>
                                <span class="list-remark">Hello friend! Newest for Metro UI CSS</span>
                            </div>
                        </a> -->
                        {%for q in questions%}
                        <a class="list" target="_blank" href="/question/show/{{q.id}}">
                            <div class="list-content">
                                <span class="list-title">{{q.name}}</span>
                                <span class="list-subtitle">{{q.author}}: {{q.date|date('Y-m-d')}}</span>
                                <span class="list-remark">{{q.content|striptags|length(40) }}</span>
                            </div>
                        </a>
                        {%endfor%}
                    </div>
                </div>

       <!--          <div class="list-group collapsed">
           <a href="" class="group-title">Yesterday</a>
           <div class="group-content" style="display: none;">
               <a class="list" href="#">
                   <div class="list-content">
                       <span class="list-title"><span class="place-right icon-flag-2 fg-red smaller"></span>subscribe@metroui.net</span>
                       <span class="list-subtitle"><span class="place-right">1:51</span>MetroUI: News on 26/10/2013</span>
                       <span class="list-remark">Hello friend! Newest for Metro UI CSS</span>
                   </div>
               </a>
               <a class="list" href="#">
                   <div class="list-content">
                       <span class="list-title"><span class="place-right icon-flag-2 fg-green smaller"></span>subscribe@metroui.net</span>
                       <span class="list-subtitle"><span class="place-right">1:51</span>MetroUI: News on 26/10/2013</span>
                       <span class="list-remark">Hello friend! Newest for Metro UI CSS</span>
                   </div>
               </a>
               <a class="list" href="#">
                   <div class="list-content">
                       <span class="list-title">subscribe@metroui.net</span>
                       <span class="list-subtitle"><span class="place-right">1:51</span>MetroUI: News on 26/10/2013</span>
                       <span class="list-remark">Hello friend! Newest for Metro UI CSS</span>
                   </div>
               </a>
           </div>
       </div> -->
            </div>
{%endblock%}