<%-- 
    Document   : managerReport2
    Created on : 15/11/2020, 16:33:56
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ObjectsReports.ClientQuantity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerReportsDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">               
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Reporte Gerente 2</title>
    </head>
    <body>
        <%
            ManagerReportsDB managerRDB = new ManagerReportsDB();
            ArrayList<ClientQuantity> clients = new ArrayList<>();
            clients = managerRDB.getReport2();
            int cont = 1;
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 2 Manager</h2></center>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Cliente</th>
                <th scope="col">Nombre</th>
                <th scope="col">DPI</th>
                <th scope="col">Fecha Nacimiento</th>
                <th scope="col">Direccion</th>
                <th scope="col">Genero</th>
                <th scope="col">Cantidad Transaccion</th>
                <th scope="col">Codigo Transaccion</th>
            </tr>
        </thead>
        <tbody>
            <%for (ClientQuantity client : clients) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=client.getCode()%></td>              
                <td><%=client.getName()%></td>              
                <td><%=client.getDPI()%></td>              
                <td><%=client.getBirth()%></td>              
                <td><%=client.getAddress()%></td>              
                <td><%=client.getGender()%></td>              
                <td><%=client.getQuantity()%></td>              
                <td><%=client.getCodeS()%></td>              
            </tr>            
            <%  cont++;
                }
            %>
        </tbody>
    </table>
</body>
</html>
