<%-- 
    Document   : CashierPrincipal
    Created on : 11/11/2020, 21:56:44
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.Objects.Cashier"%>
<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierControl"%>
<%@page import="com.mycompany.proyectofipc2.Utils.DateHour"%>
<%@page import="com.mycompany.proyectofipc2.Objects.TypeTurn"%>
<%@page import="com.mycompany.proyectofipc2.Utils.TypeTurnDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <title>Principal Cajero</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>    
        <%  CashierControl managerC = new CashierControl();
        Cashier cashier = managerC.getCashierByCode(request.getSession().getAttribute("code").toString());
        String codeTypeTurn = cashier.getCodeTurn();
        TypeTurnDB typeTurnDB = new TypeTurnDB();
        TypeTurn  typeTurn = typeTurnDB.getTypeTurnNameByCode(codeTypeTurn);
        DateHour dateHour = new DateHour();
        String isInHour = "";
        if (dateHour.validateIsInTime(typeTurn) == false) {
            isInHour = "disabled";
        }%>
    <br><center><h1>EL BILLETON</h1></center><br>
    <h2>Acciones del Cajero</h2>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Deposito</h3>
                                <p class="card-text">Un cliente deposita en su cuenta bancaria</p>
                                <a class="btn btn-light btn-outline-dark <%//=isInHour%>" href="/proyectoFIPC2/CashierGUI/Deposit.jsp" title="Read more" ><img src="/proyectoFIPC2/images/deposito.png" alt="x" width="25" height="25"/> Depositar </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-2 borderR">
                            <center>
                                <h3 class="card-title">Retiro</h3>
                                <p class="card-text">Un cliente retira de su cuenta bancaria</p>
                                <a class="btn btn-light btn-outline-dark <%=isInHour%>" href="/proyectoFIPC2/CashierGUI/withdrawal.jsp" title="Read more" ><img src="/proyectoFIPC2/images/retiro.png" alt="x" width="25" height="25"/> Retirar</a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>            
        </div>
    </section>    
    <br>
    <br>
    <h2>Reportes Cajero</h2>
    <br>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-3 borderR">
                            <center>
                                <h3 class="card-title">Reporte 1</h3>
                                <p class="card-text">Listado de depósitos y retiros realizados durante su turno</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/CashierGUI/cashierReports/cashierReport1.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 2</h3>
                                <p class="card-text">Listado de las transacciones realizadas por día en un intervalo de tiempo</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/CashierGUI/cashierReports/cashierReport2.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</body>
</html>
