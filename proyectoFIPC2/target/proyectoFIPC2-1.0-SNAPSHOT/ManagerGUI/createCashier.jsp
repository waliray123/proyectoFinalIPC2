<%-- 
    Document   : createCashier
    Created on : 16/11/2020, 20:22:17
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierDB"%>
<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierControl"%>
<%@page import="com.mycompany.proyectofipc2.Utils.TypeTurnDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css"> 
        <title>JSP Page</title>
    </head>
    <body>
        <%  CashierControl cashierC = new CashierControl();
            String codeCashier = String.valueOf(cashierC.getLastCodeCashier());
            if (request.getParameter("address") != null) {
                if (true) {
                    String name = request.getParameter("name");
                    String DPI = request.getParameter("DPI");
                    String password = request.getParameter("passClient");
                    String address = request.getParameter("address");
                    String gender = request.getParameter("gender");
                    String nameTurn = request.getParameter("turn");
                    TypeTurnDB typeTurnDB = new TypeTurnDB();
                    String codeTurn = typeTurnDB.getTypeTurnCodeByName(nameTurn).getCode();
                    if (cashierC.validateUpdateCashier(codeCashier, name, codeTurn, DPI, address, gender, password)) {
                        CashierDB cashierDB = new CashierDB();
                        cashierDB.insertNewCashier(codeCashier, name, codeTurn, DPI, address, gender, password);
        %>
                        <script>
                            alert("Se creo el cajero con codigo: <%=codeCashier%>");
                        </script>
                    <%}else{%>
                    <script>
                            alert("Ha ocurrido un error vuelva a intentarlo");
                    </script>
                    <%}
                }
            }
         %>
        <%@include file="../headerLog.jsp"%>
        <center><h1>Crear Cajero</h1></center><br>
        <div class="container backC-3 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Crear</h3>
                <p>Ingrese la informacion para crear al cajero</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del Cajero</h4>
                <p><%=codeCashier%></p>                
            </div>

            <div class="col-md-9 register-right " >
                <form>
                    <div class="row register-form">
                        <div class="col-md-6">
                            <div class="form-group">
                                Nombre*<input type="text" class="form-control" placeholder="Nombre *"  name="name" required/>
                            </div>
                            <div class="form-group">
                                DPI*<input type="text" class="form-control" placeholder="DPI *" name="DPI"  maxlength="13" required/>
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
                                        <input type="radio" name="gender" value="Femenino"/>
                                        <span> Femenino </span> 
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                Tipo de Turno
                                <select class="form-control" name="turn">                                
                                    <option value="Matutino">Matutino</option>
                                    <option value="Vespertino">Vespertino</option>                                
                                </select>
                            </div>
                            <div class="form-group">
                                Direccion*<input type="text" class="form-control" placeholder="Direccion *"  name="address" required/>
                            </div>       
                            <input type="hidden" name="codeCashier">
                            <center>                                
                                <input type="submit" class="btn  btn-outline-secondary btn-block"  value="Actualizar"/>
                            </center>
                        </div>
                    </div>
                </form>
            </div>                        
        </div>
    </div>
        <%@include file="../lists/ListCashiers.jsp"%>
    </body>
    
</html>
