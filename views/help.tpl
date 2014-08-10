{%extends "parent.tpl"%}
{%block title%}Help{%endblock%}
{%block content%}
<div class="stepper diamond" data-steps="5" data-role="stepper"></div>

<div class="help-step help-step-1">
    <p class="subheader">You may need to <a href="/question/create">create</a> your own questions.</p>
    <p class="subheader">Note that only <q>content</q> of a question is displayed on a test paper,<q>name</q> or <q>tags</q> is just for searching or indexing.</p>
</div>
<div class="subheader help-step help-step-2" style="display:none;">
    <p class="subheader">On the <a href="/question/list">list</a> you can see all the questions created.</p>
</div>
<div class="subheader help-step help-step-3" style="display:none;">
    <p class="subheader">Next you have to <a href="/test/create">create</a> a test,and add some questions to it,then save it.</p>
</div>
<div class="subheader help-step help-step-4" style="display:none;">
     <p class="subheader">On the test show page,click the printing button.</p>
</div>
<div class="subheader help-step help-step-5" style="display:none;">
    Make a good margin of each question,then print the page.
</div>
<div class="text-right">
        <a href="#" class="prev" style="display:none">Prev</a>
        <a href="#" class="next">Next</a>
</div>
{%endblock%}

{%block script%}

<script>
var steps = 5;
    var $stepper = $('.stepper').stepper({
        onStep:function (step) {
            $('.help-step').hide();
            $('.help-step-'+step).show();

            if(1===step){
                $('a.next').show();
                $('a.prev').hide();
            }
            else if(5===step){
                $('a.prev').show();
                $('a.next').hide();
            }
            else{
                $('a.next,a.prev').show();
            }
        }
    });

    $('a.next').click(function(e){
        e.preventDefault();
        $stepper.stepper('next');
    });
    $('a.prev').click(function(e){
        e.preventDefault();
        $stepper.stepper('prior');
    });
</script>
{%endblock%}