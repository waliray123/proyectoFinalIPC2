<%-- 
    Document   : updateClient
    Created on : 12/11/2020, 17:32:24
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerControl"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientDB"%>
<%@page import="com.mycompany.proyectofipc2.Utils.EncryptPassword"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientControl"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Client"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css"> 
        <title>Actualizar Client</title>
    </head>

    <body>
        <%@include file="../headerLog.jsp"%>
        <%
            Client client = null;
            String message = "";
            String codeClient = "";
            String gender = "";
            String fem = "checked";
            String mas = "checked";
            String name = "";
            String DPI = "";
            String password = "";
            String birth = "2020-01-01";
            String address = "";
            if (request.getParameter("codeC") != null) {
                ClientControl clientC = new ClientControl();
                client = clientC.getClientByCode(request.getParameter("codeC"));
                if (client == null) {
                    message = "El cliente no existe";
                } else {
                    EncryptPassword encrypt = new EncryptPassword();
                    codeClient = client.getCode();
                    name = client.getName();
                    DPI = client.getDPI();
                    password = encrypt.decrypt(client.getPassword());
                    birth = client.getBirth();
                    address = client.getAddress();
                    gender = client.getGender();
                    message = "";
                }
            }
            if (gender.equalsIgnoreCase("Masculino")) {
                fem = "";
            } else if (gender.equalsIgnoreCase("Femenino")) {
                mas = "";
            }
            if (request.getParameter("codeClient") != null) {
                codeClient = request.getParameter("codeClient");
                gender = request.getParameter("gender");                
                name = request.getParameter("name");
                DPI = request.getParameter("DPI");
                password = request.getParameter("passClient");
                birth = request.getParameter("birth");
                address = request.getParameter("address");
                ClientControl clientC = new ClientControl();
                Client client2 = null;
                client2 = clientC.getClientByCode(request.getParameter("codeClient"));
                if (client2 != null) {
                    if (codeClient.equalsIgnoreCase(client2.getCode())) {
                        if(clientC.validateUpdateClient(codeClient, name, DPI, birth, address, gender, password)){
                        ClientDB clientDB = new ClientDB();
                        clientDB.updateClient(codeClient, name, DPI, birth, address, gender, password);
                        ManagerControl managerC = new ManagerControl();
                        managerC.createHistorial(request.getSession().getAttribute("code").toString(), "SE MODIFICO EL CLIENTE, con codigo: " + codeClient, "CLIENTE");
                        %>
                        <script>
                            alert("Se actualizo el cliente con codigo: <%=codeClient%>");
                        </script>
                        <%}
                    }
                }
            }
        %>
    <br><center><h1>Actualizar Cliente</h1></center><br>
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
                        Codigo Cliente*<input type="text" class="form-control" placeholder="Codigo *" value="<%=codeClient%>" name="codeC" required/>
                    </div>
                    <input type="submit" class="btn  btn-outline-secondary btn-block" value="Validar">
                </form>
            </div>            
        </div>
    </div>
    <br><br>
    <%if (client != null) {%>
    <div class="container backC-3 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Actualizar</h3>
                <p>Actualizar la informacion del cliente</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del cliente</h4>
                <p><%=codeClient%></p>                
            </div>
            <div class="col-md-9 register-right " >
                <form>
                    <div class="row register-form">

                        <div class="col-md-6">
                            <div class="form-group">
                                Nombre*<input type="text" class="form-control" placeholder="Nombre *" value="<%=name%>" name="name" required/>
                            </div>
                            <div class="form-group">
                                DPI*<input type="text" class="form-control" placeholder="DPI *" value="<%=DPI%>" name="DPI" maxlength="13" required/>
                            </div>                                
                            <div class="form-group">
                                Contrasena*
                                <input type="password" class="form-control" placeholder="Password *" value="<%=password%>" name="passClient" required/>                            
                            </div>
                            <div class="form-group">
                                <div class="maxl">
                                    <label class="radio inline">                                     
                                        <input type="radio" name="gender" value="Masculino" <%=mas%>/>
                                        <span> Masculino </span> 
                                    </label>
                                    <label class="radio inline"> 
                                        <input type="radio" name="gender" value="Femenino" <%=fem%>/>
                                        <span> Femenino </span> 
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                Fecha de Nacimiento*<input type="date" class="form-control" value="<%=birth%>" name="birth" required/>
                            </div>
                            <div class="form-group">
                                Direccion*<input type="text" class="form-control" placeholder="Direccion *" value="<%=address%>" name="address" required/>
                            </div>
                            <input type="hidden" name="codeClient" value="<%=codeClient%>">
                            <center>
                                <input type="submit" class="btn  btn-outline-secondary btn-block"  value="Actualizar"/>
                            </center>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>                        
    <%}%>
</body>
</html>
