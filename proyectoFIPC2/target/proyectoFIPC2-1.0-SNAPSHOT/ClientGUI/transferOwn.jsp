<%-- 
    Document   : transferOwn
    Created on : 13/11/2020, 00:58:24
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.TransactionControlers.TransactionControl"%>
<%@page import="AccountControlers.AccountControl"%>
<%@page import="AccountControlers.AccountDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Transferencia Propia</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>        
        <%  AccountDB accountDB = new AccountDB();

            ArrayList<Account> accounts = accountDB.getAccountsByCodeClient(request.getSession().getAttribute("code").toString());
            Account account1 = null;            
            Account account2 = null;            
            String codeAccount1 = "";
            String codeAccount2 = "";           
            account1 = accountDB.getAccountByCode(codeAccount1);
            if (request.getParameter("validate1") != null) {
                    codeAccount1= request.getParameter("codeAccountW");
                    account1 = accountDB.getAccountByCode(codeAccount1);
            }
            if (request.getParameter("validate2") != null) {
                    codeAccount1= request.getParameter("codeAccountW");
                    codeAccount2= request.getParameter("codeAccountD");
                    account1 = accountDB.getAccountByCode(codeAccount1);                    
                    account2 = accountDB.getAccountByCode(codeAccount2);
                    if (codeAccount1.equals(codeAccount2)) {
                        account2 = null;%>
                        <script>
                        alert("No puedes ingresar la misma cuenta de deposito y retiro");
                    </script> 
                    <%}
            }
            if (request.getParameter("transferOwn") != null) {
                    codeAccount1= request.getParameter("codeAccountW");
                    codeAccount2= request.getParameter("codeAccountD");
                    Double amount= Double.parseDouble(request.getParameter("ammountA"));
                    Account accountW = accountDB.getAccountByCode(codeAccount1);                    
                    Account accountD = accountDB.getAccountByCode(codeAccount2); 
                    if (accountW.getCredit()>= amount) {
                        AccountControl accountC = new AccountControl();
                        accountC.clientTransfer(codeAccount1, codeAccount2, amount);
                        TransactionControl transactionC = new TransactionControl();
                        transactionC.setTransaction("CREDITO", "101", accountD.getCode(), String.valueOf(amount));
                        transactionC.setTransaction("DEBITO", "101", accountW.getCode(), String.valueOf(amount));
                    %>
                    <script>
                        alert("Deposito realizado");
                    </script> 
                    <%}else{%>
                    <script>
                        alert("No puedes retirar mas de lo que tienes");
                    </script>
                    <%
                    account1 = accountDB.getAccountByCode(codeAccount1);                    
                    account2 = accountDB.getAccountByCode(codeAccount2);
                    }
            }
        %>
    <br><center><h1>EL BILLETON</h1></center>
    <center><h3>Transferencia a Cuenta Propia</h3></center><br>
        <div class="container backC-2 formC-1">
            <div class="row">
                <div class="col-md-3 register-left">
                    <h3>Cuenta de Retiro</h3>
                    <p>Selecciona el codigo de la cuenta a la que se retirara el dinero</p>
                    <p class="text-danger">* Informacion Obligatoria</p>
                </div>
                
                <div class="col-md-6" >
                    <form>                        
                    <select name="codeAccountW" class="browser-default custom-select custom-select-lg mb-3" onClick="jsFunction()" id="selectOpt">
                        <%for (Account account : accounts) {
                                String codeAccount = account.getCode();
                        %>
                        <option value="<%=codeAccount%>"><%=codeAccount%></option>
                        <%}%>
                    </select>
                    <%if(account1 != null){%>
                    <p>No. Cuenta: <%=account1.getCode()%><p>
                    <p>Credito: <%=account1.getCredit()%><p>
                    <p>Fecha Creada: <%=account1.getDateCreated()%><p>
                    <%}%>                    
                    <input class="btn  btn-outline-secondary " name="validate1" type="submit" value="Validar Cuenta">
                    </form>
                </div>                
            </div>
        </div>
        <br><br>
        <%if(account1 != null){%>
        <div class="container backC-2 formC-1">
            <div class="row">
                <div class="col-md-3 register-left">
                    <h3>Cuenta de Deposito</h3>
                    <p>Selecciona el codigo de la cuenta a la que se depositara el dinero</p>
                    <p class="text-danger">* Informacion Obligatoria</p>
                </div>
                <div class="col-md-6" >
                    <form>                        
                    <select name="codeAccountD" class="browser-default custom-select custom-select-lg mb-3" onClick="jsFunction()" id="selectOpt">
                        <%for (Account account : accounts) {
                                String codeAccount = account.getCode();
                        %>
                        <option value="<%=codeAccount%>"><%=codeAccount%></option>
                        <%}%>
                    </select>
                    <%if(account2 != null){%>
                    <p>No. Cuenta: <%=account2.getCode()%><p>
                    <p>Credito: <%=account2.getCredit()%><p>
                    <p>Fecha Creada: <%=account2.getDateCreated()%><p>
                    <%}%>
                    <input type="hidden" value="<%=account1.getCode()%>" name="codeAccountW">
                    <input class="btn  btn-outline-secondary " name="validate2" type="submit" value="Validar Cuenta">
                    </form>
                </div>       
            </div>
        </div>
        <br>
        <%if(account2 != null){%>
        <div class="container backC-1 formC-1">
            <center><h3>Monto</h3>
                <form>
                <p>Ingrese el monto a depositar</p>
                <div class="col-md-6" >
                    <input type="number" step="0.01" class="form-control " placeholder="Monto *" required="" value="" name="ammountA"/>
                </div>
                <input type="hidden" value="<%=account1.getCode()%>" name="codeAccountW">
                <input type="hidden" value="<%=account2.getCode()%>" name="codeAccountD">
                <br><input class="btn  btn-outline-secondary" name="transferOwn" type="submit" value="Depositar">
                </form>
            </center>
        </div>
        <%}%>
        <%}%>
</body>
</html>
