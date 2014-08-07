<!DOCTYPE html>
<html>
  <head>
    <title>{%block title%}{%endblock%}</title>
    <link rel='stylesheet' href='/stylesheets/cssreset-min.css' />
    <link rel='stylesheet' href='/stylesheets/metro-bootstrap.css' />
    <link rel='stylesheet' href='/stylesheets/metro-bootstrap-responsive.css' />
    <link rel='stylesheet' href='/stylesheets/style.css' />
  </head>
  <body class="metro">
    {%include "nav.tpl"%}
    <div class="topwrapper">
        {%block content%}{%endblock%}
    </div>
  </body>
  <script src="/javascripts/jquery.min.js"></script>
  <script src="/javascripts/jquery.widget.min.js"></script>
  <script src="/javascripts/metro.min.js"></script>
</html>