<%-- 
    Document   : clientReport5
    Created on : 15/11/2020, 21:38:33
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ObjectsReports.ClientHistory"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientReportsDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Reporte 5 Cliente</title>
    </head>
    <body>
        <%
            ClientReportsDB clientRDB = new ClientReportsDB();
            ArrayList<ClientHistory> histories = new ArrayList<>();
            int cont = 1;
            histories = clientRDB.getReport5(request.getSession().getAttribute("code").toString());
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 5 Cliente</h2></center>
        <%if (histories.size() > 0) {%>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>                
                <th scope="col">Fecha</th>
                <th scope="col">Codigo Cuenta A Asociar</th>
                <th scope="col">Codigo Cliente al Que quiere asociar</th>
            </tr>
        </thead>
        <tbody>
            <%for (ClientHistory history : histories) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=history.getDateChange()%></td>
                <td><%=history.getCodeAccount()%></td>
                <td><%=history.getCodeClientR()%></td>
            </tr>            
            <%  cont++;
                }
            %>
        </tbody>
    </table>
    <form method="POST" action="../../saveClientHistory">
        <input type="submit" value="Exportar"/>        
    </form>
    <%}%>
    </body>
</html>
