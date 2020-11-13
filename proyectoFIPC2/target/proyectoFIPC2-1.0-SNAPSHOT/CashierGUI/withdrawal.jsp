<%-- 
    Document   : withdrawal
    Created on : 13/11/2020, 00:38:46
    Author     : user-ubunto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Retiro</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%> 
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
                <div class="form-group">
                    Codigo Cuenta*<input type="text" class="form-control" placeholder="Codigo *" value="" name="codeA"/>
                </div>
                <a class="btn  btn-outline-secondary btn-block" >Validar</a>
            </div>
        </div>
    </div>
    <br><br>
    <div class="container backC-3 formC-1">
        <center><h4>Informacion del cliente</h4>            
            <p>Codigo:<%//=code%></p>
            <p>Nombre: <%//=name%></p>
            <p>Direccion: <%//=address%></p>
            <p>DPI:<%//=DPI%></p>
            <a class="btn  btn-outline-secondary btn-lg">Validar Cliente</a>
    </div>
    <br><br>
    <div class="container backC-1 formC-1">
        <center><h4>Monto</h4>
            <p>Ingrese el monto a Retirar</p>
            <div class="col-md-6" >
                <input type="number" class="form-control " placeholder="Monto *" value="" name="ammountA"/>
            </div>
            <br><a class="btn  btn-outline-secondary btn-lg" href="">Retirar</a>
        </center>        
    </div> 
</body>
</html>
