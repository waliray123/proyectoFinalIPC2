<%-- 
    Document   : createAccount
    Created on : 12/11/2020, 17:11:31
    Author     : user-ubunto
--%>

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
    <br><center><h1>Crear Cuenta</h1></center><br>
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
                <p>Nombre: <%//=name%></p>
                <p>DPI: <%//=name%></p>
                <p>Direccion: <%//=name%></p>
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
    <div class="container backC-3 formC-1">
        <center><h4>Monto</h4>
            <p>Ingrese el monto con el que el cliente abrira su cuenta</p>
            <div class="col-md-6" >
            <input type="number" class="form-control " placeholder="Monto *" value="" name="ammountA"/>
            </div>
            <br><a class="btn  btn-outline-secondary" href="">Crear Cuenta</a>
        </center>        
    </div>
</body>
</html>
