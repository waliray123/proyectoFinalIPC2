<%-- 
    Document   : cashierReport1
    Created on : 14/11/2020, 22:47:01
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ObjectsReports.TransactionBalance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierReportsDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Reporte 1 Cajero</title>
    </head>
    <body>
        <%
            CashierReportsDB cashierRDB = new CashierReportsDB();
            ArrayList<TransactionBalance> transactionsB = cashierRDB.getReport1(request.getSession().getAttribute("code").toString());
            int cont = 1;
            String balanceTotal = "0.00";
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 1 Cajero</h2></center>
    <table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Transaccion</th>
                <th scope="col">Fecha</th>
                <th scope="col">Hora</th>
                <th scope="col">Tipo</th>
                <th scope="col">Codigo Cuenta</th>
                <th scope="col">Cantidad</th>
                <th scope="col">Balance</th>
            </tr>
        </thead>
        <tbody>
            <%for (TransactionBalance transaction : transactionsB) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=transaction.getCode()%></td>
                <td><%=transaction.getDateTransaction()%></td>
                <td><%=transaction.getHourTransaction()%></td>
                <td><%=transaction.getTypeTransaction()%></td>
                <td><%=transaction.getAccountCode()%></td>
                <td><%=transaction.getAmount()%></td>
                <td><%=transaction.getBalanceT()%></td>
            </tr>            
            <%  cont++;
                    balanceTotal = transaction.getBalanceT();
                }
            %>
            <tr>
                <th scope="row"></th>
                <td colspan="6">Total en caja</td>
                <td><%=balanceTotal%></td>
            </tr>
        </tbody>
    </table>
    <form method="GET" action="../../saveTransactionBalance">
        <input type="hidden" value="<%=balanceTotal%>" name="total"/>
        <input type="submit" value="Exportar"/>        
    </form>
</body>
</html>
