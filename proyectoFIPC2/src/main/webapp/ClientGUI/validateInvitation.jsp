<%-- 
    Document   : validateInvitation
    Created on : 13/11/2020, 00:57:26
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.Objects.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="AccountControlers.AccountControl"%>
<%@page import="com.mycompany.proyectofipc2.Objects.ClientAccount"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Validar Invitacion</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%> 
        <%  AccountControl accountC = new AccountControl();
            ArrayList<ClientAccount> clientAccounts = null;
            clientAccounts = accountC.getAllInvitationsByClient(request.getSession().getAttribute("code").toString());
            ClientAccount clientAccountV = null;
            if (request.getParameter("codeClientAccount") != null) {
                String codeClientAccount = request.getParameter("codeClientAccount");
                for (ClientAccount clientAccount : clientAccounts) {
                    if (clientAccount.getCode().equals(codeClientAccount)) {
                        clientAccountV = clientAccount;
                        break;
                    }
                }
            }
            if (request.getParameter("clientAccountCode") != null) {
                String codeClientAccount = request.getParameter("clientAccountCode");
                ClientAccount clientAccountV2 = null;
                for (ClientAccount clientAccount : clientAccounts) {
                    if (clientAccount.getCode().equals(codeClientAccount)) {
                        clientAccountV2 = clientAccount;
                        break;
                    }
                }
                if (clientAccountV2 != null) {
                    String validate = request.getParameter("validateValue");
                    if (validate.equalsIgnoreCase("aceptar")) {
                        accountC.acceptInvitation(codeClientAccount);
                    } else if (validate.equalsIgnoreCase("declinar")) {
                        accountC.declineInvitation(codeClientAccount, clientAccountV2.getAttempts());
                    }
                }
            }
        %>
    <br><center><h1>EL BILLETON</h1></center>
    <center><h3>Invitacion a Asociar</h3></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Cuentas</h3>
                <p>Cuentas con invitacion de asociacion</p>
                <p class="text-info">Seleccione una y presione el boton para desplegar la informacion y validar</p>
            </div>
            <div class="col-md-6" >
                <form>
                    <div class="form-group">
                        <select name="codeClientAccount" class="browser-default custom-select custom-select-lg mb-3" onClick="jsFunction()" id="selectOpt">
                            <%for (ClientAccount clientAccount : clientAccounts) {
                                    String codeAccount = clientAccount.getCodeAccount();
                            %>
                            <option value="<%=clientAccount.getCode()%>"><%=codeAccount%></option>
                            <%}%>
                        </select>
                    </div>
                    <input class="btn  btn-outline-secondary btn-block" value="Ver informacion" type="submit">
                </form>
            </div>            
        </div>
    </div>
    <br><br>
    <%if (clientAccountV != null) {%>
    <div class="container backC-2 formC-1" >
        <center>
            <form>
                <div class="form-group">
                    <h3>Informacion</h3>
                    <div class="col-md-6 register-left">
                        <h5>No.Cuenta que se desea asociar</h5> <%=clientAccountV.getCodeAccount()%>
                        <h5>Cliente que desea asociar</h5> <%=clientAccountV.getCodeClient()%>
                    </div>
                </div>
                <div class="maxl">
                    <label class="radio inline">                                     
                        <input type="radio" name="validateValue" value="aceptar" checked="checked"/>
                        <span> Aceptar </span> 
                    </label>
                    <label class="radio inline"> 
                        <input type="radio" name="validateValue" value="declinar" />
                        <span> Declinar </span> 
                    </label>
                </div>
                <input type="hidden" value="<%=clientAccountV.getCode()%>" name="clientAccountCode">
                <input class="btn  btn-outline-secondary btn-lg" value="Ver informacion" type="submit">
            </form>
        </center>
    </div>
    <%}%>
</body>
</html>
