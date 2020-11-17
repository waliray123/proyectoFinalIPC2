<%-- 
    Document   : index
    Created on : 10/11/2020, 00:03:23
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.Utils.validateInsertions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        validateInsertions validate = new validateInsertions();
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">-->
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.min.css">         
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <title>Pagina Principal</title>
    </head>
    <body>
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">EL BILLETON</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="/proyectoFIPC2/index.jsp">Principal <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/proyectoFIPC2/login.jsp">Ingresar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/proyectoFIPC2/setData.jsp">Subir XML</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Pagina Principal</h2>
        <div class="container-fluid">
            <div class="backC-1 borderR">
                <center>
                    <h3 class="card-title">Ingresar</h3>
                    <p class="card-text">Ingresa a nuestro sistema</p>
                    <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/login.jsp" title="Ingresar" >Ingresar </a>
                </center>
            </div>
        </div>
    </center>
</body>
</html>
