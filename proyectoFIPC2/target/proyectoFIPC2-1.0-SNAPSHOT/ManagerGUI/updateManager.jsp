

<%@page import="com.mycompany.proyectofipc2.Objects.Manager"%>
<%@page import="com.mycompany.proyectofipc2.Utils.EncryptPassword"%>
<%@page import="com.mycompany.proyectofipc2.Utils.TypeTurnDB"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerControl"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerDB"%>
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
        <%
            Manager manager = null;
            String message = "";
            String codeManager = "";
            String gender = "";
            String fem = "checked";
            String mas = "checked";
            String name = "";
            String DPI = "";
            String password = "";
            String birth = "";
            String address = "";
            String codeTurn = "";
            String selectedTurn = "";
            String selectedTurn2 = "";
            if (request.getSession().getAttribute("code") != null) {
                codeManager = request.getSession().getAttribute("code").toString();
                ManagerControl managerC = new ManagerControl();
                manager = managerC.getManagerByCode(codeManager);
                if (manager == null) {
                    message = "El gerente no existe";
                } else {
                    EncryptPassword encrypt = new EncryptPassword();
                    codeManager = manager.getCode();
                    name = manager.getName();
                    DPI = manager.getDPI();
                    password = encrypt.decrypt(manager.getPassword());
                    address = manager.getAddress();
                    gender = manager.getGender();
                    codeTurn = manager.getCodeTurn();
                    message = "";
                }
            }
            if (gender.equalsIgnoreCase("Masculino")) {
                fem = "";
            } else if (gender.equalsIgnoreCase("Femenino")) {
                mas = "";
            }
            if (codeTurn.equalsIgnoreCase("") == false) {
                TypeTurnDB typeTurnDB = new TypeTurnDB();
                String nameTurn = typeTurnDB.getTypeTurnNameByCode(codeTurn).getName();
                if (nameTurn.equalsIgnoreCase("Matunino")) {
                    selectedTurn = "selected";
                } else if (nameTurn.equalsIgnoreCase("Vespertino")) {
                    selectedTurn2 = "selected";
                }
            }
            if (request.getParameter("actu") != null) {
                if (true) {
                    codeManager = request.getSession().getAttribute("code").toString();
                    name = request.getParameter("name");
                    DPI = request.getParameter("DPI");
                    password = request.getParameter("passClient");
                    address = request.getParameter("address");
                    gender = request.getParameter("gender");
                    String nameTurn = request.getParameter("turn");
                    TypeTurnDB typeTurnDB = new TypeTurnDB();
                    codeTurn = typeTurnDB.getTypeTurnCodeByName(nameTurn).getCode();
                    ManagerControl managerC = new ManagerControl();
                    if (managerC.validateUpdateManager(codeManager, name, codeTurn, DPI, address, gender, password)) {
                        ManagerDB managerDB = new ManagerDB();
                        managerDB.updateManager(codeManager, name, codeTurn, DPI, address, gender, password);
                        managerC.createHistorial(request.getSession().getAttribute("code").toString(), "SE MODIFICO EL PROPIO GERENTE", "GERENTE");
        %>
                        <script>
                            alert("Se actualizo el gerente con codigo: <%=codeManager%>");
                        </script>
                    <%}
                }
            }
        %>
    <br><center><h1>Actualizar Gerente</h1></center><br><br>
    <div class="container backC-2 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Actualizar</h3>
                <p>Actualizar la informacion del gerente</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del Gerente</h4>
                <p><%=codeManager%></p>                
            </div>
            <div class="col-md-9 register-right " >
                <form>
                <div class="row register-form">
                    <div class="col-md-6">
                        <div class="form-group">
                            Nombre*<input type="text" class="form-control" placeholder="Nombre *" value="<%=name%>" name="name"/>
                        </div>
                        <div class="form-group">
                            DPI*<input type="text" class="form-control" placeholder="DPI *" value="<%=DPI%>" name="DPI" maxlength="13"/>
                        </div>                                
                        <div class="form-group">
                            Contrasena*<input type="password" class="form-control" placeholder="Password *" value="<%=password%>" name="passClient"/>
                        </div>
                        <div class="form-group">
                            <div class="maxl" >
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
                            Tipo de Turno
                            <select class="form-control" name="turn">                                
                                <option <%=selectedTurn%>>Matutino</option>
                                <option <%=selectedTurn2%>>Vespertino</option>                                
                            </select>
                        </div>
                        <div class="form-group">
                            Direccion*<input type="text" class="form-control" placeholder="Direccion *" value="<%=address%>" name="address"/>
                        </div>                  
                        <input type="hidden" name="actu" value="Actualizar"/>
                        <center>
                            <input type="submit" class="btn  btn-outline-secondary btn-block"  value="Actualizar"/>
                        </center>
                    </div>
                </div>
                        </form>
            </div>
        </div>
    </div>
    </body>
</html>
