{%extends "parent.tpl"%}
{%block title%}{{test.name}}{%endblock%}


{%block script%}

<script>
     
        var stared = {{stared}};
        var action = $('.rating').rating({
            click: function(value, rating){
                if(stared)return;
                stared = true;
                rating.rate(value);
                $.post(action,{value:value})
                    .complete(function(){
                        
                    });
            }
        }).attr('data-xaction');
   
</script>
{%endblock%}



{%block content%}
    <h1>{{test.name}}</h1>
    <h5>Tags:{{test.tags}}</h5>
    {%for q in questions%}
    <article class="margin20 nlm nrm padding20 ribbed-grayDarker fg-white">    {{q.name}}
        
        {{q.content}}
    </article>
    {%endfor%}

    <div class="rating large active fg-dark" data-static="{{stared}}" data-score="{{question.rate|default(0)}}" data-stars="5" data-role="rating" data-show-score="true" data-score-hint="{%if stared%}You have stared,rating: {%else%}Rating: {%endif%}" data-xaction="/test/star/{{question.id}}">
    
    </div>

    <div id="disqus_thread"></div>
    <script type="text/javascript">
        var disqus_shortname = 'sogou-ufo'; // required: replace example with your forum shortname

        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>

{%endblock%}