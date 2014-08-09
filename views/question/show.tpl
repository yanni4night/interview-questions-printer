{%extends "parent.tpl"%}
{%block title%}Question{%endblock%}
{%block content%}

    <article class="margin20 nlm nrm padding20 ribbed-grayDarker fg-white">
    {{question.name}}

     {{question.tags}}

    {{question.content}}
    </article>

{%endblock%}