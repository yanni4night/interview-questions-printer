<!DOCTYPE html>
<html>
  <head>
    <title>{%block title%}{%endblock%}</title>
    <link rel='stylesheet' href='/stylesheets/cssreset-min.css' />
    <link rel='stylesheet' href='/stylesheets/metro-bootstrap.css' />
    <link rel='stylesheet' href='/stylesheets/metro-bootstrap-responsive.css' />
    <link rel='stylesheet' href='/stylesheets/style.css' />
    <script src="/javascripts/jquery.min.js"></script>
  <script src="/javascripts/jquery.widget.min.js"></script>
  <script src="/javascripts/metro.min.js"></script>
    {%block link%}{%endblock%}
  </head>
  <body class="metro">
    {%block nav%}{%include "nav.tpl"%}{%endblock%}
    <div class="topwrapper">
        {%block content%}{%endblock%}
    </div>
  </body>
  {%block script%}{%endblock%}
</html>