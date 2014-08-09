<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>{{test.name}}</title>
        <style type="text/css"></style>
    </head>
    <body>
<pre>
{%for q in questions%}
{{q.content}}
{%endfor%}
</pre>
    </body>
</html>