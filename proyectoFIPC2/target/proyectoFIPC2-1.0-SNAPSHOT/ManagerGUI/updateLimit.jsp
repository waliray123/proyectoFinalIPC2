<%-- 
    Document   : updateLimit
    Created on : 14/11/2020, 17:42:09
    Author     : user-ubunto
--%>

<%@page import="java.util.ArrayList"%>
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
        if (request.getParameter("update1") != null) {
            Double limitN = Double.parseDouble(request.getParameter("limitM"));
            managerDB.updateLimit(limitN, "1");
        }
        if (request.getParameter("update2") != null) {
            Double limitN = Double.parseDouble(request.getParameter("limitM"));
            managerDB.updateLimit(limitN, "2");
        }
        ArrayList<String> limits = managerDB.getLimits();
        String limit1 = limits.get(0);
        String limit2 = limits.get(1);
        %>
        <br><center><h1>Actualizar Limite</h1></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Limite</h3>
                <p>Este es el limite actual utilizado en el reporte 2</p>
                <p>Para actualizar reescriba el limite y presione el boton</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                <div class="form-group">
                    Limite Actual*<input type="number" step="0.01" class="form-control" placeholder="Codigo *" value="<%=limit1%>" name="limitM"/>
                </div>
                <input class="btn  btn-outline-secondary btn-block"  type="submit" value="Actualizar" name="update1">
                </form>                
            </div>
        </div><br><br>
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Limite</h3>
                <p>Este es el limite actual utilizado en el reporte 3</p>
                <p>Para actualizar reescriba el limite y presione el boton</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                <div class="form-group">
                    Limite Actual*<input type="number" step="0.01" class="form-control" placeholder="Codigo *" value="<%=limit2%>" name="limitM"/>
                </div>
                <input class="btn  btn-outline-secondary btn-block"  type="submit" value="Actualizar" name="update2">
                </form>                
            </div>
        </div>
    </div>
    </body>
</html>
