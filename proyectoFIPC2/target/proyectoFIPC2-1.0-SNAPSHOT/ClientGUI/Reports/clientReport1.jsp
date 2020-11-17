<%-- 
    Document   : clientReport1
    Created on : 15/11/2020, 18:40:54
    Author     : user-ubunto
--%>

<%@page import="AccountControlers.AccountDB"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Account"%>
<%@page import="com.mycompany.proyectofipc2.ObjectsReports.TransactionBalance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientReportsDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">              
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Reporte Cliente 1</title>
    </head>
    <body>
       <%
            AccountDB accountDB = new AccountDB();
            ArrayList<Account> accounts = accountDB.getAccountsByCodeClient(request.getSession().getAttribute("code").toString());
            Account account1 = null;
            ClientReportsDB clientRDB = new ClientReportsDB();
            ArrayList<TransactionBalance> transactionsB = new ArrayList<>();
            int cont = 1;
            String codeAccount1 = "";
            if (request.getParameter("codeAccount") != null) {
                codeAccount1 = request.getParameter("codeAccount");                
                transactionsB = clientRDB.getReport1(codeAccount1);
                account1 = accountDB.getAccountByCode(codeAccount1);
            }
        %>
        <%@include file="../../headerLog.jsp"%> 
    <br><center><h1>EL BILLETON</h1></center><br>
    <center><h2>Reporte 1 Cliente</h2></center>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Intervalo de Tiempo</h3>
                <p>Ingresar el intervalo de tiempo para el reporte</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                    <form>                        
                    <select name="codeAccount" class="browser-default custom-select custom-select-lg mb-3" id="selectOpt">
                        <%for (Account account : accounts) {
                                String codeAccount = account.getCode();
                        %>
                        <option value="<%=codeAccount%>"><%=codeAccount%></option>
                        <%}%>
                    </select>               
                    <input class="btn  btn-outline-secondary " name="validate1" type="submit" value="Validar Cuenta">
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
                }
            %>
        </tbody>
    </table>
    <form method="GET" action="../../saveTransactionsNClient">
        <input type="hidden" value="<%=codeAccount1%>" name="codeAccount"/>
        <input type="submit" value="Exportar"/>        
    </form>
    <%}%>
    </body>
</html>
