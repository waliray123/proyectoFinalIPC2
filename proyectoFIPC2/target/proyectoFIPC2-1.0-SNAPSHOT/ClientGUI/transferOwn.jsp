<%-- 
    Document   : transferOwn
    Created on : 13/11/2020, 00:58:24
    Author     : user-ubunto
--%>

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
            String codeAccount1 = "";
            String codeAccount2 = "";
        %>
    <br><center><h1>EL BILLETON</h1></center>
    <center><h3>Transferencia a Cuenta Propia</h3></center><br>
    <form>
        <div class="container backC-2 formC-1">
            <div class="row">
                <div class="col-md-3 register-left">
                    <h3>Cuenta de Retiro</h3>
                    <p>Selecciona el codigo de la cuenta a la que se retirara el dinero</p>
                    <p class="text-danger">* Informacion Obligatoria</p>
                </div>
                <div class="col-md-6" >
                    <select name="codeAccountW" class="browser-default custom-select custom-select-lg mb-3" onChange="jsFunction()" id="selectOpt">
                        <%for (Account account : accounts) {
                                String codeAccount = account.getCode();
                        %>
                        <option value="<%=codeAccount%>"><%=codeAccount%></option>
                        <%}%>
                    </select>   
                    <script>
                        function jsFunction(){ 
                            var myselect = document.getElementById("selectOpt"); 
                            alert(myselect.options[myselect.selectedIndex].value); 
                        }
                    </script>
                    <%Account account1 = accountDB.getAccountByCode(codeAccount1);%>
                    <%if(account1 != null){%>
                    No. Cuenta: <%=account1.getCode()%>
                    Credito: <%=account1.getCredit()%>
                    Fecha Creada: <%=account1.getDateCreated()%>
                    <%}%>
                </div>
            </div>
        </div>
        <br><br>
        <div class="container backC-2 formC-1">
            <div class="row">
                <div class="col-md-3 register-left">
                    <h3>Cuenta de Deposito</h3>
                    <p>Selecciona el codigo de la cuenta a la que se depositara el dinero</p>
                    <p class="text-danger">* Informacion Obligatoria</p>
                </div>
                <div class="col-md-6" >
                    <select name="codeAccountD" class="browser-default custom-select custom-select-lg mb-3">
                        <%for (Account account : accounts) {
                                String codeAccount = account.getCode();
                        %>
                        <option><%=codeAccount%></option>
                        <%}%>
                    </select>                    
                </div>
            </div>
        </div>
        <br>
        <div class="container backC-1 formC-1">
            <center><h3>Monto</h3>
                <p>Ingrese el monto a depositar</p>
                <div class="col-md-6" >
                    <input type="number" step="0.01" class="form-control " placeholder="Monto *" required="" value="" name="ammountA"/>
                </div>
                <br><input class="btn  btn-outline-secondary" name="deposit" type="submit" value="Depositar">
            </center>
        </div>         
    </form>
</body>
</html>
