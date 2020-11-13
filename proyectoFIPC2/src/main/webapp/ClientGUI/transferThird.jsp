<%-- 
    Document   : transferThird
    Created on : 13/11/2020, 00:58:00
    Author     : user-ubunto
--%>

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
    <br><center><h1>EL BILLETON</h1></center>
    <center><h3>Transferencia a tercero</h3></center><br>
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
    <div class="container backC-1 formC-1">
        <center><h4>Cuenta</h4>
            <p>Informacion de la cuenta a asociar</p>
            <p>No. cuenta: <%//=codeA%></p>
            <p>Cliente : <%//=client%></p>
            <p>Intentos de Asociacion : <%//=num%></p>            
        </center>        
    </div>
        <br><br>
    <div class="container backC-2 formC-1">
        <center><h4>Cuenta de Debito</h4>
            <div>
                Cuentas Propias
                <select class="form-control col-md-3">                                
                    <option>Matutino</option>
                    <option>Vespertino</option>                                
                </select>
            </div>
            <h4>Monto</h4>
            <input type="number" class="form-control col-md-3" placeholder="Monto *" value="" name="ammount"/>
            <br><a class="btn  btn-outline-secondary btn-lg" href="">Enviar Monto</a>
        </center>        
    </div>
</body>
</html>
