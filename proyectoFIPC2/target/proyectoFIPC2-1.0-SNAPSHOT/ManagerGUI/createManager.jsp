<%-- 
    Document   : createManager
    Created on : 16/11/2020, 20:48:57
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerDB"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerControl"%>
<%@page import="com.mycompany.proyectofipc2.Utils.TypeTurnDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css"> 
        <title>Crear Gerente</title>
    </head>
    <body>
        <%  ManagerControl managerC = new ManagerControl();
            String codeManager = "";
            if (request.getParameter("actu") != null) {
                if (true) {                    
                    String name = request.getParameter("name");
                    String DPI = request.getParameter("DPI");
                    String password = request.getParameter("passClient");
                    String address = request.getParameter("address");
                    String gender = request.getParameter("gender");
                    String nameTurn = request.getParameter("turn");
                    TypeTurnDB typeTurnDB = new TypeTurnDB();
                    String codeTurn = typeTurnDB.getTypeTurnCodeByName(nameTurn).getCode();                    
                    codeManager = String.valueOf(managerC.getLastCodeManager());
                    if (managerC.validateUpdateManager(codeManager, name, codeTurn, DPI, address, gender, password)) {
                        ManagerDB managerDB = new ManagerDB();
                        managerDB.insertNewManager(codeManager, name, codeTurn, DPI, address, gender, password);
        %>
                        <script>
                            alert("Se creo el gerente con codigo: <%=codeManager%>");
                        </script>
                    <%}else{%>
                        <script>
                            alert("Ha ocurrido un error vuelva a intentarlo");
                        </script>
<%                    }
                }
                
            }codeManager = String.valueOf(managerC.getLastCodeManager());%>
        <%@include file="../headerLog.jsp"%>
    <br><center><h1>Crear Gerente</h1></center><br><br>
    <div class="container backC-2 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Crear</h3>
                <p>Para crear el gerente llene el siguiente formulario</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del Gerente</h4>
                <p><%=codeManager%></p>                
            </div>
            <div class="col-md-9 register-right " >
                <form>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                Nombre*<input type="text" class="form-control" placeholder="Nombre *"  name="name" required/>
                            </div>
                            <div class="form-group">
                                DPI*<input type="text" class="form-control" placeholder="DPI *" maxlength="13"  name="DPI" required/>
                            </div>                                
                            <div class="form-group">
                                Contrasena*<input type="password" class="form-control" placeholder="Password *"  name="passClient" required/>
                            </div>
                            <div class="form-group">
                                <div class="maxl">
                                    <label class="radio inline">                                     
                                        <input type="radio" name="gender" value="Masculino" checked=""/>
                                        <span> Masculino </span> 
                                    </label>
                                    <label class="radio inline"> 
                                        <input type="radio" name="gender" value="Femenino" />
                                        <span> Femenino </span> 
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                Tipo de Turno
                                <select class="form-control" name="turn">                                
                                    <option >Matutino</option>
                                    <option >Vespertino</option>                                
                                </select>
                            </div>
                            <div class="form-group">
                                Direccion*<input type="text" class="form-control" placeholder="Direccion *" name="address" required/>
                            </div>                  
                            <input type="hidden" name="actu" value="Actualizar"/>
                            <center>
                                <input type="submit" class="btn  btn-outline-secondary btn-block"  value="Crear" required/>
                            </center>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="../lists/ListManagers.jsp"%>
</body>
</html>
