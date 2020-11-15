<%-- 
    Document   : invitation
    Created on : 13/11/2020, 00:57:05
    Author     : user-ubunto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.Objects.ClientAccount"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientControl"%>
<%@page import="AccountControlers.AccountControl"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Client"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Invitacion</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>  
        <%
            Account account = null;
            ClientControl clientC = new ClientControl();
            Client client = clientC.getClientByCode(request.getSession().getAttribute("code").toString());
            ClientAccount clientAccount = null;
            if (request.getParameter("codeA") != null) {
                AccountControl accountC = new AccountControl();
                account = accountC.getAccountByCode(request.getParameter("codeA"));
                if(account != null){
                ArrayList<Account> accountsClient = accountC.getAccountByCodeClient(client.getCode());
                boolean validateAccount = true;
                for (Account account1 : accountsClient) {
                    if (account1.getCode().equals(account.getCode())) {
                        validateAccount  = false;
                        break;
                    }
                }
                if (validateAccount) {                    
                        clientAccount = accountC.getInvitation(client.getCode(), account.getCode()); 
                        if (clientAccount.getIsInviting() == true) {
                                clientAccount = null;%>
                        <script>
                            alert("Ya estas invitando a esta cuenta");
                        </script>
                        <%}
                }else {%>
                    <script>
                        alert("No puedes enviar invitacion a cuentas de tu propiedad");
                    </script> 
                <%} 
                }else{%>
                    <script>
                        alert("El codigo de cuenta no existe");
                    </script>
                <%}
            }
            if (request.getParameter("accountCode") != null) {
                AccountControl accountC = new AccountControl();
                account = accountC.getAccountByCode(request.getParameter("accountCode"));
                if(account != null){
                    ClientAccount clientAccount2 = accountC.getInvitation(client.getCode(), account.getCode());
                    if (Integer.parseInt(clientAccount2.getAttempts()) >= 3) {%>
                        <script>
                            alert("Ya has exedido el numero de intentos de invitacion");
                        </script>
                    <%}else{
                    accountC.sendInvitation(clientAccount2.getCode(), clientAccount2.getAttempts());
                    clientC.sendInvitation(clientAccount2.getCode());
                    %>
                        <script>
                            alert("Invitacion enviada con exito");
                        </script>
                    <%}
                }
            }            
        %>
    <br><center><h1>EL BILLETON</h1></center>
    <center><h3>Invitacion a Asociar</h3></center><br>
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
    <%if (clientAccount != null) {%>                
    <div class="container backC-1 formC-1">
        <center><h4>Cuenta</h4>
            <p>Informacion de la cuenta a asociar</p>
            <p>No. cuenta: <%=account.getCode()%></p>
            <p>Cliente : <%=client.getName()%></p>
            <p>Intentos de Asociacion : <%=clientAccount.getAttempts()%></p> 
            <form>
            <input type="hidden" value="<%=account.getCode()%>" name="accountCode">            
            <br><input type="submit" class="btn  btn-outline-secondary btn-lg" value="Enviar Invitacion">
            </form>
        </center>        
    </div> 
    <%    }
    %>
</body>
</html>
