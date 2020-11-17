<%-- 
    Document   : updateCashier
    Created on : 12/11/2020, 17:32:43
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerControl"%>
<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierDB"%>
<%@page import="com.mycompany.proyectofipc2.Utils.TypeTurnDB"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Cashier"%>
<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierControl"%>
<%@page import="com.mycompany.proyectofipc2.Utils.EncryptPassword"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css"> 
        <title>Actualizar Cajero</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>
        <%
            Cashier cashier = null;
            String message = "";
            String codeCashier = "";
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
            if (request.getParameter("codeC") != null) {
                CashierControl cashierC = new CashierControl();
                cashier = cashierC.getCashierByCode(request.getParameter("codeC"));
                if (cashier == null) {
                    message = "El cajero no existe";
                } else {
                    EncryptPassword encrypt = new EncryptPassword();
                    codeCashier = cashier.getCode();
                    name = cashier.getName();
                    DPI = cashier.getDPI();
                    password = encrypt.decrypt(cashier.getPassword());
                    address = cashier.getAddress();
                    gender = cashier.getGender();
                    codeTurn = cashier.getCodeTurn();
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
            if (request.getParameter("codeCashier") != null) {
                if (true) {
                    codeCashier = request.getParameter("codeCashier");;
                    name = request.getParameter("name");
                    DPI = request.getParameter("DPI");
                    password = request.getParameter("passClient");
                    address = request.getParameter("address");
                    gender = request.getParameter("gender");
                    String nameTurn = request.getParameter("turn");
                    TypeTurnDB typeTurnDB = new TypeTurnDB();
                    codeTurn = typeTurnDB.getTypeTurnCodeByName(nameTurn).getCode();
                    CashierControl cashierC = new CashierControl();
                    if (cashierC.validateUpdateCashier(codeCashier, name, codeTurn, DPI, address, gender, password)) {
                        CashierDB cashierDB = new CashierDB();
                        cashierDB.updateCashier(codeCashier, name, codeTurn, DPI, address, gender, password);
                        ManagerControl managerC = new ManagerControl();
                        managerC.createHistorial(request.getSession().getAttribute("code").toString(), "SE MODIFICO EL CAJERO, con codigo:" + codeCashier, "CAJERO");%>
                        <script>
                            alert("Se actualizo el cajero con codigo: <%=codeCashier%>");
                        </script>
                    <%}else{%>
                        <script>
                            alert("Ha ocurrido un error vuelva a intentarlo");
                        </script>
                    <%}
                }
            }
        %>
    <center><h1>Actualizar Cajero</h1></center><br>
    <div class="container backC-2 formC-1">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Cajero</h3>
                <p>Ingresar el codigo del Cajero</p>
                <p class="text-danger">* Informacion Obligatoria</p>
            </div>

            <div class="col-md-6" >
                <form>
                    <div class="form-group">
                        Codigo Cajero*<input type="text" class="form-control" placeholder="Codigo *" value="" name="codeC" required/>
                    </div>
                    <input class="btn  btn-outline-secondary btn-block" type="submit"/>
                </form>
                <%=message%>
            </div>

        </div>        
    </div>
    <br><br>
    <%if (cashier != null) {%>
    <div class="container backC-3 formC-2">
        <div class="row">
            <div class="col-md-3 register-left">
                <h3>Actualizar</h3>
                <p>Actualizar la informacion del cajero</p>
                <p class="text-danger">* Informacion Obligatoria</p>
                <h4>Codigo del Cajero</h4>
                <p><%=codeCashier%></p>                
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
                                Contrasena*<input type="password" class="form-control" placeholder="Password *" value="<%=password%>" name="passClient" required/>
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
                                Tipo de Turno
                                <select class="form-control" name="turn">                                
                                    <option <%=selectedTurn%>>Matutino</option>
                                    <option <%=selectedTurn2%>>Vespertino</option>                                
                                </select>
                            </div>
                            <div class="form-group">
                                Direccion*<input type="text" class="form-control" placeholder="Direccion *" value="<%=address%>" name="address" required/>
                            </div>       
                            <input type="hidden" name="codeCashier" value="<%=codeCashier%>">
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
