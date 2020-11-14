<%-- 
    Document   : createAccount
    Created on : 12/11/2020, 17:11:31
    Author     : user-ubunto
--%>

<%@page import="AccountControlers.AccountDB"%>
<%@page import="com.mycompany.proyectofipc2.Utils.DateHour"%>
<%@page import="AccountControlers.AccountControl"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Client"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>        
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">  
        <title>Crear Cuenta</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>
        <%String codeClient = "";
        String message = "";
        String message2 = "";
        Client client = null;
        String codeAccount = "";
        AccountControl accountC = new AccountControl();
        if (request.getParameter("codeC")  != null) {
            ClientControl clientC = new ClientControl();
            client = clientC.getClientByCode(request.getParameter("codeC"));
            if (client == null) {
                message = "El cliente no existe";
            }else{
                codeClient = client.getCode();
                codeAccount = accountC.getLastCodeAccount();
                message = "";
            }
        }
        if (request.getParameter("codeClient")  != null) {
           ClientControl clientC = new ClientControl();
            client = clientC.getClientByCode(request.getParameter("codeClient"));
            if (client == null) {
                message = "El cliente no existe";
            }else{
                codeClient = client.getCode();
                if (request.getParameter("ammountA").isBlank() == false) {
                    DateHour dateHour = new DateHour();
                    String code = accountC.getLastCodeAccount();
                    codeAccount = code;
                    String dateCreated = dateHour.getDateToday();
                    Double credit = Double.parseDouble(request.getParameter("ammountA"));
                    if (accountC.validateAccount(code, dateCreated, credit, client.getCode())) {
                        AccountDB accountDB = new AccountDB();
                        accountDB.insertNewAccount(code, dateCreated, credit, client.getCode());%>
                        <script>
                            alert("Se creo la cuenta con codigo: <%=code%>");
                        </script>
                    <%    codeAccount = accountC.getLastCodeAccount();                    
                    }                    
                }else{
                    String code = accountC.getLastCodeAccount();
                    codeAccount = code;
                    message2 = "Debe ingresar un numero en el monto";
                }
                
            }
        }
    %>
    <br><center><h1>Crear Cuenta</h1></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Cliente</h3>
                <p>Ingresar el codigo del cliente</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>
            <div class="col-md-6" >
                <form>
                <div class="form-group">
                    Codigo Cliente*<input type="text" class="form-control" placeholder="Codigo *" value="<%=codeClient%>" name="codeC"/>
                </div>
                <input class="btn  btn-outline-secondary btn-block"  type="submit" value="Validar">
                </form>
                <%=message%>
                <%if (client != null) {%>
                    <p>Nombre: <%=client.getName()%></p>
                    <p>DPI: <%=client.getDPI()%></p>
                    <p>Direccion: <%=client.getAddress()%></p>      
                <%  }
                %>
                
            </div>
            <div class="col-md-3" >
                <div class="form-group">
                    <h3>Cliente Nuevo</h3>
                    <a class="btn  btn-outline-secondary btn-block" href="/proyectoFIPC2/ManagerGUI/registerClient.jsp"><img src="/proyectoFIPC2/images/cuenta.png" alt="x" width="25" height="25"/>  Registrar</a>
                </div>
            </div>
        </div>
    </div>
    <br><br>
    <%if (client != null) {%>
    <div class="container backC-3 formC-1">
        <center><h3>Cuenta</h3>
            <h5>Codigo Cuenta: <%=codeAccount%></h5>
            <p>Ingrese el monto con el que el cliente abrira su cuenta</p> 
            <form>
            <div class="col-md-6" >
            <input type="number" class="form-control " placeholder="Monto *" value="" name="ammountA"/>
            <input type="hidden" value="<%=codeClient%>" name="codeClient"/>
            </div>
            <br><input type="submit" class="btn  btn-outline-secondary" value="Crear Cuenta" >
            </form>
            <%=message2%>
        </center>        
    </div>
    <%}%>
</body>
</html>
