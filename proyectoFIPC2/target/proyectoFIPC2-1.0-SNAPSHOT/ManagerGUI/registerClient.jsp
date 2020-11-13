
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Registrar Cliente</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>
    <br><br><center><h1>Registrar Cliente</h1></center><br><br>
    <div class="container backC-2 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Registro</h3>
                <p>Ingresar la informacion del cliente</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del cliente</h4>
                <p><%//=codeClient%></p>
                <p>Es el posible codigo del cliente</p>
            </div>
            <div class="col-md-9 register-right " >
                <div class="row register-form">
                    <div class="col-md-6">
                        <div class="form-group">
                           Nombre*<input type="text" class="form-control" placeholder="Nombre *" value="" name="name"/>
                        </div>
                        <div class="form-group">
                            DPI*<input type="text" class="form-control" placeholder="DPI *" value="" name="DPI"/>
                        </div>                                
                        <div class="form-group">
                            Contrasena*<input type="password" class="form-control" placeholder="Password *" value="" name="passClient"/>
                        </div>
                        <div class="form-group">
                            <div class="maxl" name="gender">
                                <label class="radio inline"> 
                                    <input type="radio" name="gender" value="male" checked>
                                    <span> Masculino </span> 
                                </label>
                                <label class="radio inline"> 
                                    <input type="radio" name="gender" value="female">
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
                        <div class="form-group">
                            DPI en PDF*<input type="file" class="form-control" accept=".pdf" value="" name="DPI_PDF"/>
                        </div>         
                        <center>
                            <input type="submit" class="btn  btn-outline-secondary btn-block"  value="Register"/>
                        </center>
                    </div>
                </div>
            </div>
        </div>

    </div>  
</body>
</html>
