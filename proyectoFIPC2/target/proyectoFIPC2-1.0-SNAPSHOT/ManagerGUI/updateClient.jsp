<%-- 
    Document   : updateClient
    Created on : 12/11/2020, 17:32:24
    Author     : user-ubunto
--%>

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
        <%String gender = "";
            String fem = "checked";
            String mas = "checked";            
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
                <div class="form-group">
                    Codigo Cliente*<input type="text" class="form-control" placeholder="Codigo *" value="" name="codeC"/>
                </div>
                <a class="btn  btn-outline-secondary btn-block" >Validar</a>
            </div>
        </div>
    </div>
    <br><br>
    <div class="container backC-3 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Actualizar</h3>
                <p>Actualizar la informacion del cliente</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del cliente</h4>
                <p><%//=codeClient%></p>                
            </div>
            <div class="col-md-9 register-right " >
                <div class="row register-form">
                    <div class="col-md-6">
                        <div class="form-group">
                            Nombre*<input type="text" class="form-control" placeholder="Nombre *" value="<%//=name%>" name="name"/>
                        </div>
                        <div class="form-group">
                            DPI*<input type="text" class="form-control" placeholder="DPI *" value="<%//=DPI%>" name="DPI"/>
                        </div>                                
                        <div class="form-group">
                            Contrasena*<input type="password" class="form-control" placeholder="Password *" value="<%//=password%>" name="passClient"/>
                        </div>
                        <div class="form-group">
                            <div class="maxl" name="gender">
                                <label class="radio inline">                                     
                                    <input type="radio" name="gender" value="male" <%=mas%>/>
                                    <span> Masculino </span> 
                                </label>
                                <label class="radio inline"> 
                                    <input type="radio" name="gender" value="female" <%=fem%>/>
                                    <span> Femenino </span> 
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            Fecha de Nacimiento*<input type="date" class="form-control" value="" name="birth"/>
                        </div>
                        <div class="form-group">
                            Direccion*<input type="text" class="form-control" placeholder="Direccion *" value="" name="address"/>
                        </div>       
                        <center>
                            <input type="submit" class="btn  btn-outline-secondary btn-block"  value="Actualizar"/>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
