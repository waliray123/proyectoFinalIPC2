<%-- 
    Document   : transferThird
    Created on : 13/11/2020, 00:58:00
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.TransactionControlers.TransactionControl"%>
<%@page import="AccountControlers.AccountControl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="AccountControlers.AccountDB"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Account"%>
<%@page import="com.mycompany.proyectofipc2.Objects.ClientAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Transferencia a tercero</title>
    </head>
    <body>        
        <%@include file="../headerLog.jsp"%>  
         <%  AccountDB accountDB = new AccountDB();
            ArrayList<Account> accounts = accountDB.getAccountsByCodeClient(request.getSession().getAttribute("code").toString());            
            AccountControl accountC = new AccountControl();
            ArrayList<ClientAccount> clientAccounts = accountC.getAllAsoociationsByClient(request.getSession().getAttribute("code").toString());
            Account account1 = null;            
            Account account2 = null;            
            String codeAccount1 = "";
            String codeAccount2 = "";           
            account1 = accountDB.getAccountByCode(codeAccount1);
            if (request.getParameter("validate1") != null) {
                    codeAccount1= request.getParameter("codeClientAccount");
                    ClientAccount clientAccount1 = accountDB.getRelationClientAccountByCode(codeAccount1);
                    if (account1 != null) {
                        account1 = accountDB.getAccountByCode(clientAccount1.getCodeAccount());               
                    }                                 
            }
            if (request.getParameter("validate2") != null) {
                    codeAccount1= request.getParameter("codeClientAccount");
                    account1 = accountDB.getAccountByCode(codeAccount1);  
                    codeAccount2= request.getParameter("codeAccountW");                   
                    account2 = accountDB.getAccountByCode(codeAccount2);                    
            }
            if (request.getParameter("transferThird") != null) {
                    codeAccount1= request.getParameter("codeClientAccount");
                    codeAccount2= request.getParameter("codeAccountW");
                    Double amount= Double.parseDouble(request.getParameter("ammountA"));
                    Account accountW = accountDB.getAccountByCode(codeAccount2);                    
                    Account accountD = accountDB.getAccountByCode(codeAccount1);
                    if (accountW.getCredit()>= amount) {                        
                        accountC.clientTransfer(accountW.getCode(),accountD.getCode(), amount);
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
    <center><h3>Transferencia a tercero</h3></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Cuenta de Tercero</h3>
                <p>Seleccione el codigo de cuenta a depositar</p>
            </div>
            <div class="col-md-6" >
                <form>                        
                    <select name="codeClientAccount" class="browser-default custom-select custom-select-lg mb-3" onClick="jsFunction()" id="selectOpt">
                        <%for (ClientAccount clientAccount : clientAccounts) {
                                String codeAccount = clientAccount.getCodeAccount();
                        %>
                        <option value="<%=clientAccount.getCode()%>"><%=codeAccount%></option>
                        <%}%>
                    </select>          
                    <input class="btn  btn-outline-secondary " name="validate1" type="submit" value="Validar Cuenta">
                </form>
            </div>
        </div>
    </div>
    <%if(account1 != null){%>
        <div class="container backC-2 formC-1">
            <div class="row">
                <div class="col-md-3 register-left">
                    <h3>Cuenta de Retiro</h3>
                    <p>Selecciona el codigo de la cuenta a la que se depositara el dinero</p>
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
                    <%if(account2 != null){%>
                    <p>No. Cuenta: <%=account2.getCode()%><p>
                    <p>Credito: <%=account2.getCredit()%><p>
                    <p>Fecha Creada: <%=account2.getDateCreated()%><p>
                    <%}%>
                    <input type="hidden" value="<%=account1.getCode()%>" name="codeClientAccount">
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
                <input type="hidden" value="<%=account1.getCode()%>" name="codeClientAccount">
                <input type="hidden" value="<%=account2.getCode()%>" name="codeAccountW">
                <br><input class="btn  btn-outline-secondary" name="transferThird" type="submit" value="Depositar">
                </form>
            </center>
        </div>
        <%}%>
        <%}%>
</body>
</html>
