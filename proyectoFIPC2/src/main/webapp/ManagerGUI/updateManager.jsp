

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css"> 
        <title>Actualizar Gerente</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>
    <br><center><h1>Actualizar Gerente</h1></center><br><br>
    <div class="container backC-2 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Actualizar</h3>
                <p>Actualizar la informacion del gerente</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del Cajero</h4>
                <p><%//=codeCashier%></p>                
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
                                    <input type="radio" name="gender" value="male" <%//=mas%>/>
                                    <span> Masculino </span> 
                                </label>
                                <label class="radio inline"> 
                                    <input type="radio" name="gender" value="female" <%//=fem%>/>
                                    <span> Femenino </span> 
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            Tipo de Turno
                            <select class="form-control">                                
                                <option>Matutino</option>
                                <option>Vespertino</option>                                
                            </select>
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
