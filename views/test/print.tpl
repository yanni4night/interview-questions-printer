 {%extends "parent.tpl"%}

{%block title%}{{test.name}}{%endblock%}

{%block nav%}{%endblock%}

{%block script%}
<script>
    $('.slider').slider({
        change:function (value,$slider) {
            $slider.next('.print-content').css('margin-bottom',2*value+'px');
        }
    });
</script>
{%endblock%}

{%block content%}
<button class="print" onclick="javascript:print();">Print</button>
<h3 class="text-center">{{test.name}}</h3>
<div class="print-content text-center">姓名____</div>
{%for e in questions%}
<div class="slider permanent-hint" data-role="slider" data-accuracy="1" data-show-hint="true" data-min="10" data-max="200" data-position="10"></div>
<div class="print-content" style="margin-bottom:20px">{{loop.index}}. {{e.content}}</div>
{%endfor%}

{%endblock%}