{%extends "parent.tpl"%}
{%block title%}VIEW TOUCH{%endblock%}
{%block content%}
  <div class="carousel margin10 nrm nlm" data-role="carousel" data-period="10000" data-controls="false" data-effect="slide">
    <div class="slide">
        <h1 class="padding10"><q>VIEW TOUCH</q></h1>
        <div class="padding10 subheader">
                Easy Question
        </div>

        <div class="padding10 subheader">
                Easy Test
        </div>
    </div>
 
    <div class="slide">
        <h1 class="padding10">How to use?</h1>
        <div class="padding10 subheader">
            Usage is quite simple,just:
            <ol class="padding10">
                <li class="subheader-secondary">1.<a href="/question/create">Create questions</a>;</li>
                <li class="subheader-secondary">2.<a href="/test/create">Create a test</a>;</li>
                <li class="subheader-secondary">3.<a href="/test/">Print your test</a>;</li>
            </ol>
        </div>
    </div>
 
    <a class="controls left"><i class="icon-arrow-left-3"></i></a>
    <a class="controls right"><i class="icon-arrow-right-3"></i></a>
</div>
{%endblock%}