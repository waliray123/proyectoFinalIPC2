<%-- 
    Document   : managerReport1
    Created on : 15/11/2020, 16:22:28
    Author     : user-ubunto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.ObjectsReports.ManagerHistory"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerReportsDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">               
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Reporte 1 Manager</title>
    </head>
    <body>
        <%
            ManagerReportsDB managerRDB = new ManagerReportsDB();
            ArrayList<ManagerHistory> managerHistory =new ArrayList<>();
            int cont = 1;
            if (request.getParameter("nameEntity") != null) {
                String nameEntity = request.getParameter("nameEntity");
                managerHistory = managerRDB.getManagerHistoryByType(request.getSession().getAttribute("code").toString(), nameEntity);
            }
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 1 Manager</h2></center>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Tipo de Entidad</h3>
                <p>Ingrese el tipo de entidad para el reporte</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                    <div class="form-group">
                        <select name="nameEntity" class="browser-default custom-select custom-select-lg mb-3" id="selectOpt">                        
                        <option value="CAJERO">CAJERO</option>
                        <option value="CLIENTE">CLIENTE</option>
                        <option value="GERENTE">GERENTE</option>
                    </select>
                    </div>
                    <input class="btn  btn-outline-secondary btn-block" value="Validar" type="submit">
                </form>
            </div>
        </div>
    </div>
    <br>
    <%if (managerHistory.size() > 0) {%>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Cambio</th>
                <th scope="col">Descripcion</th>
                <th scope="col">Tipo</th>
                <th scope="col">Fecha</th>
            </tr>
        </thead>
        <tbody>
            <%for (ManagerHistory managerHistory1 : managerHistory) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=managerHistory1.getCode()%></td>
                <td><%=managerHistory1.getDescription()%></td>
                <td><%=managerHistory1.getType()%></td>
                <td><%=managerHistory1.getDateChange()%></td>                
            </tr>            
            <%  cont++;
                }
            %>
        </tbody>
    </table>
    <%}%>
    </body>
</html>
