
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>     
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <title>JSP Page</title>
    </head>
    <script  type = "text/javascript" src="/proyectoFIPC2/js/includeJS.js" ></script>    
    <body class="text-center">
        <div w3-include-html="header.html"></div> 
        <form class="form-login">
            <h1>Ingresar</h1>
            <label for="inputCode" class="sr-only">Code</label>
            <input type="input" class="form-control" placeholder="Codigo" required="" autofocus="">
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" required="">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
            <p class="mt-5 mb-3 text-muted">© 2020-2020</p>
        </form>
    </body>
    <script> 
        includeHTML();
    </script>
</html>
