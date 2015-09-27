[#ftl]
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Login into Raindrop">
    <meta name="author" content="Raindrop Solutions">

    <link rel="icon" href="/img/raindrop-logo.png">

    <title>[@spring.message "WELCOME"/]</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/raindrop.css" rel="stylesheet">
    <link href="/css/signin.css" rel="stylesheet">
    <link href="/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>

<body class="custom-body">


<div>
    <div id="content">
        <form class="login-form" name='loginForm' action="/login?${_csrf.parameterName}=${_csrf.token}" method="POST">
            <h1>[@spring.message "WELCOME"/]</h1>
        [#if error?? && error == true]
            <div class="error">[@spring.message "LOGINERROR" /]</div>
        [/#if]
        [#if msg?? && msg == true]
            <div class="msg">[@spring.message "LOGOUTMSG" /]</div>
        [/#if]
            <div>
                <input name="username" id="username" autocomplete="off" type="text" class="form-control" placeholder="[@spring.message "USER"/]"/>
            </div>
            <div>
                <input name="password" id="password" type="password" autocomplete="off" class="form-control" placeholder="[@spring.message "PASSWORD"/]"/>
            </div>
            <button id="btnLogin" class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            <div class="lost-pass">
                <a class="righta">Lost your password?</a>
            </div>
        </form>
    </div>

    <div class="custom-footer">
        <p><span class="copyright">Copyright &copy; &middot; <span class="green">Raindrop Solutions <span
                id="an-copyright"></span></span>&nbsp;&bull;&nbsp;<a>[@spring.message "APPTITLE"/]</a></p>
    </div>

</div>
<!-- JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="/js/jquery-2.1.4.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $('#an-copyright').text(new Date().getFullYear());
        $('#username').focus();
    });
</script>
