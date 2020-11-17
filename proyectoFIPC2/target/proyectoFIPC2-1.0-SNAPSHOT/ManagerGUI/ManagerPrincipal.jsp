<%-- 
    Document   : ManagerPrincipal
    Created on : 11/11/2020, 21:47:15
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.Utils.TypeTurnDB"%>
<%@page import="com.mycompany.proyectofipc2.Objects.TypeTurn"%>
<%@page import="com.mycompany.proyectofipc2.Utils.DateHour"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Manager"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerControl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">        
        <title>Principal Gerente</title>
    </head>
    <body>
        <%@include file="../headerLog.jsp"%>        
        <%  ManagerControl managerC = new ManagerControl();
            Manager manager = managerC.getManagerByCode(request.getSession().getAttribute("code").toString());
            String codeTypeTurn = manager.getCodeTurn();
            TypeTurnDB typeTurnDB = new TypeTurnDB();
            TypeTurn typeTurn = typeTurnDB.getTypeTurnNameByCode(codeTypeTurn);
            DateHour dateHour = new DateHour();
            String isInHour = "";
            if (dateHour.validateIsInTime(typeTurn) == false) {
                isInHour = "disabled";
            }%>        
    <br><center><h1>EL BILLETON</h1></center><br>
    <h2>Acciones del Gerente</h2>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Crear Cuenta</h3>
                                <p class="card-text">Crear una cuenta que le pertecera a un cliente</p>
                                <a class="btn btn-light btn-outline-dark <%=isInHour%>" href="/proyectoFIPC2/ManagerGUI/createAccount.jsp" title="Read more" ><img src="/proyectoFIPC2/images/registro.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-2 borderR">
                            <center>
                                <h3 class="card-title">Registrar Cliente</h3>
                                <p class="card-text">Registrar a un cliente en el sistema</p>
                                <a class="btn btn-light btn-outline-dark <%//=isInHour%>" href="/proyectoFIPC2/ManagerGUI/registerClient.jsp" title="Read more" ><img src="/proyectoFIPC2/images/cuenta.png" alt="x" width="25" height="25"/> Registrar</a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Actualizar Cliente</h3>
                                <p class="card-text">Actualizar la informacion de algun cliente registrado</p>
                                <a class="btn btn-light btn-outline-dark <%=isInHour%>" href="/proyectoFIPC2/ManagerGUI/updateClient.jsp" title="Read more" ><img src="/proyectoFIPC2/images/actualizar.png" alt="x" width="25" height="25"/> Actualizar</a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-2 borderR">
                            <center>
                                <h3 class="card-title">Actualizar Cajero</h3>
                                <p class="card-text">Actualizar la infomacion de algun cajero registrado</p>
                                <a class="btn btn-light btn-outline-dark <%=isInHour%>" href="/proyectoFIPC2/ManagerGUI/updateCashier.jsp" title="Read more" ><img src="/proyectoFIPC2/images/actualizar.png" alt="x" width="25" height="25"/> Actualizar</a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Actualizar Propio Gerente</h3>
                                <p class="card-text">Actualizar su informacion</p>
                                <a class="btn btn-light btn-outline-dark <%=isInHour%>" href="/proyectoFIPC2/ManagerGUI/updateManager.jsp" title="Read more" ><img src="/proyectoFIPC2/images/actualizar.png" alt="x" width="25" height="25"/> Actualizar</a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-2 borderR">
                            <center>
                                <h3 class="card-title">Actualizar Limite</h3>
                                <p class="card-text">Actualizar el limite utilizado en los reportes</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/updateLimit.jsp" title="Read more" ><img src="/proyectoFIPC2/images/actualizar.png" alt="x" width="25" height="25"/> Actualizar</a>
                            </center>
                        </div>
                    </div>
                </div>                                            
            </div>
            <br>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Registrar Cajero</h3>
                                <p class="card-text">Regitrar a un cajero en el sistema</p>
                                <a class="btn btn-light btn-outline-dark <%//=isInHour%>" href="/proyectoFIPC2/ManagerGUI/createCashier.jsp" title="Read more" ><img src="/proyectoFIPC2/images/registro.png" alt="x" width="25" height="25"/> Actualizar</a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-2 borderR">
                            <center>
                                <h3 class="card-title">Registrar Gerente</h3>
                                <p class="card-text">Regitrar a un Gerente en el sistema</p>
                                <a class="btn btn-light btn-outline-dark <%//=isInHour%>" href="/proyectoFIPC2/ManagerGUI/createManager.jsp" title="Read more" ><img src="/proyectoFIPC2/images/registro.png" alt="x" width="25" height="25"/> Actualizar</a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>    
    <br>
    <br>
    <h2>Reportes Gerente</h2>
    <br>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-3 borderR">
                            <center>
                                <h3 class="card-title">Reporte 1</h3>
                                <p class="card-text">Historial de cambios realizados en la información de una entidad en específico</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport1.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 2</h3>
                                <p class="card-text">Clientes con transacciones monetarias mayores a un límite establecido.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport2.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-3 borderR">
                            <center>
                                <h3 class="card-title">Reporte 3</h3>
                                <p class="card-text">Clientes con transacciones monetarias sumadas mayores a un límite establecido.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport3.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 4</h3>
                                <p class="card-text">Los 10 clientes con más dinero en sus cuentas.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport4.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 5</h3>
                                <p class="card-text">Clientes que no han realizado transacciones dentro de un intervalo de tiempo</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport5.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-3 borderR">
                            <center>
                                <h3 class="card-title">Reporte 6</h3>
                                <p class="card-text">Historial de transacciones por cliente</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport6.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 7</h3>
                                <p class="card-text">Cajero que más transacciones ha realizado en un intervalo de tiempo.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ManagerGUI/Reports/managerReport7.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</body>
</html>
