<%-- 
    Document   : Deposit
    Created on : 13/11/2020, 00:37:34
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.TransactionControlers.TransactionControl"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientControl"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Client"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Account"%>
<%@page import="AccountControlers.AccountControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Deposito</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>
        <%
            Account account = null;
            Client client = null;
            if (request.getParameter("codeA") != null) {
                AccountControl accountC = new AccountControl();
                account = accountC.getAccountByCode(request.getParameter("codeA"));
                if (account != null) {
                    ClientControl clientC = new ClientControl();
                    client = clientC.getClientByCode(account.getClientCode());
                }
            }
            if (request.getParameter("accountCode") != null) {
                AccountControl accountC = new AccountControl();
                account = accountC.getAccountByCode(request.getParameter("accountCode"));
                if (account != null) {
                    Double ammount = Double.parseDouble(request.getParameter("ammountA"));
                    accountC.setDeposit(account.getCode(), ammount);  
                    TransactionControl transactionC = new TransactionControl();
                    transactionC.setTransaction("CREDITO", request.getSession().getAttribute("code").toString(), account.getCode(), String.valueOf(ammount));
                    %>
                    <script>
                        alert("Se realizo el deposito con exito de: Q.<%=String.valueOf(ammount)%> a la cuenta No. <%=account.getCode()%>");
                    </script>  
                <%}                
            }            
        %>

    <br><center><h1>EL BILLETON</h1></center>
    <center><h3>Deposito</h3></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Cuenta</h3>
                <p>Ingresar el codigo de cuenta</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                    <div class="form-group">
                        Codigo Cuenta*<input type="text" class="form-control" placeholder="Codigo *" value="" name="codeA"/>
                    </div>
                    <input class="btn  btn-outline-secondary btn-block" value="Validar" type="submit">
                </form>
            </div>
        </div>
    </div>
    <br><br>
    <%if (account != null && client != null ) {%>
    <div class="container backC-3 formC-1">
        <center><h4>Informacion del cliente</h4>            
            <p>Codigo:<%=client.getCode()%></p>
            <p>Nombre: <%=client.getName()%></p>
            <p>Direccion: <%=client.getAddress()%></p>
            <p>DPI: <%=client.getDPI()%></p><br>

            <center><h4>Informacion de la cuenta</h4></center>         
            <p>Codigo:<%=account.getCode()%></p>
            <p>Credito: <%=account.getCredit()%></p>
    </div>
    <br><br>
    <div class="container backC-1 formC-1">
        <center><h4>Monto</h4>
            <form>
            <p>Ingrese el monto a depositar</p>
            <div class="col-md-6" >
                <input type="number" step="0.01" class="form-control " placeholder="Monto *" required="" value="" name="ammountA"/>
            </div>
            <input type="hidden" value="<%=account.getCode()%>" name="accountCode">
            <br><input class="btn  btn-outline-secondary" name="deposit" type="submit" value="Depositar">
            </form>
        </center>
    </div> 
    <%}%>


</body>
</html>
