<%-- 
    Document   : managerReport5
    Created on : 15/11/2020, 16:54:07
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ObjectsReports.CashierQuantity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerReportsDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">               
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ManagerReportsDB managerRDB = new ManagerReportsDB();
            ArrayList<CashierQuantity> clients = new ArrayList<>();
            String date1 = "";
            String date2 = "";
            if (request.getParameter("date1") != null) {
                date1 = request.getParameter("date1");
                date2 = request.getParameter("date2");
                clients = managerRDB.getReport7(date1, date2);
            }
            int cont = 1;
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 7 Manager</h2></center>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Intervalo de Tiempo</h3>
                <p>Ingresar el intervalo de tiempo para el reporte</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                    <div class="form-group">
                        Fecha Inicial*<input type="date" class="form-control" value="" name="date1" required=""/>
                        Fecha Final*<input type="date" class="form-control" value="" name="date2" required=""/>
                    </div>
                    <input class="btn  btn-outline-secondary btn-block" value="Validar" type="submit">
                </form>
            </div>
        </div>
    </div>
    <br>

    <%if (clients.size() > 0) {%>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Cajero</th>
                <th scope="col">Nombre</th>
                <th scope="col">DPI</th>
                <th scope="col">Direccion</th>
                <th scope="col">Genero</th>
                <th scope="col">Cantidad Transacciones</th>
            </tr>
        </thead>
        <tbody>
            <%for (CashierQuantity client : clients) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=client.getCode()%></td>              
                <td><%=client.getName()%></td>              
                <td><%=client.getDPI()%></td>             
                <td><%=client.getAddress()%></td>              
                <td><%=client.getGender()%></td>              
                <td><%=client.getQuantity()%></td>            
            </tr>            
            <%  cont++;
                }
            %>
        </tbody>
    </table>
    <form method="POST" action="../../saveClientNT">
        <input type="hidden" value="<%=date1%>" name="date1"/>        
        <input type="hidden" value="<%=date2%>" name="date2"/>        
        <input type="submit" value="Exportar"/>        
    </form>
    <%}%>
</body>
</html>
