<%-- 
    Document   : updateLimit
    Created on : 14/11/2020, 17:42:09
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">  
        <title>Actualizar limite</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>
        <%
        ManagerDB managerDB = new ManagerDB();
        if (request.getParameter("update") != null) {
            Double limitN = Double.parseDouble(request.getParameter("limitM"));
            managerDB.updateLimit(limitN);
        }
        Double limitM = managerDB.getLimits();
        %>
        <br><center><h1>Actualizar Limite</h1></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Limite</h3>
                <p>Este es el limite actual utilizado en los reportes</p>
                <p>Para actualizar reescriba el limite y presione el boton</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                <div class="form-group">
                    Limite Actual*<input type="number" step="0.01" class="form-control" placeholder="Codigo *" value="<%=limitM%>" name="limitM"/>
                </div>
                <input class="btn  btn-outline-secondary btn-block"  type="submit" value="Actualizar" name="update">
                </form>                
            </div>
        </div>
    </div>
    </body>
</html>
