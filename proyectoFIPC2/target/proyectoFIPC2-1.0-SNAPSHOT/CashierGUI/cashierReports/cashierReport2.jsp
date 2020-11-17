<%-- 
    Document   : cashierReport2
    Created on : 14/11/2020, 22:44:57
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
        <title>Reporte 2 Cajero</title>
    </head>
    <body>
        <%
            CashierReportsDB cashierRDB = new CashierReportsDB();
            ArrayList<TransactionBalance> transactionsB = new ArrayList<>();
            int cont = 1;
            String balanceTotal = "0.00";
            String date1 = "";
            String date2 = "";
            if (request.getParameter("date1") != null) {
                date1 = request.getParameter("date1");
                date2 = request.getParameter("date2");
                transactionsB = cashierRDB.getReport2(request.getSession().getAttribute("code").toString(), date1, date2);
            }
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 2 Cajero</h2></center>
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
    <%if (transactionsB.size() > 0) {%>
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
    <form method="POST" action="../../saveTransactionBalance">
        <input type="hidden" value="<%=date1%>" name="date1"/>
        <input type="hidden" value="<%=date2%>" name="date2"/>
        <input type="hidden" value="<%=balanceTotal%>" name="total"/>
        <input type="submit" value="Exportar"/>        
    </form>
    <%}%>
</body>
</html>
