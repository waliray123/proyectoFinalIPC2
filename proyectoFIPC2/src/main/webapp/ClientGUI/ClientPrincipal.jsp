<%-- 
    Document   : ClientPrincipal
    Created on : 11/11/2020, 21:56:32
    Author     : user-ubunto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <title>Principal Cliente</title>
    </head>
    <body>
            <%@include file="../headerLog.jsp"%>                
    <br><center><h1>EL BILLETON</h1></center><br>
    <h2>Acciones del Cliente</h2>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Invitacion de Asociacion</h3>
                                <p class="card-text">Envias la invitacion a otro usuario a asociar una cuenta bancaria de su pertenencia</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/invitation.jsp" title="Read more" ><img src="/proyectoFIPC2/images/solicitud.png" alt="x" width="25" height="25"/> Invitar </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-2 borderR">
                            <center>
                                <h3 class="card-title">Transferencia a Tercero</h3>
                                <p class="card-text">Envias un deposito a de una cuenta propia a alguna asociada</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/transferThird.jsp" title="Read more" ><img src="/proyectoFIPC2/images/transaccionT.png" alt="x" width="25" height="25"/> Transferir</a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                    <div class="card">
                        <div class="backC-1 borderR">
                            <center>
                                <h3 class="card-title">Transaccion a Cuenta Propia</h3>
                                <p class="card-text">Envias un deposito de una cuentra propia a otra propia</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/transferOwn.jsp" title="Read more" ><img src="/proyectoFIPC2/images/transaccion.png" alt="x" width="25" height="25"/> Transferir</a>
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
                                <h3 class="card-title">Validar Asociaciones</h3>
                                <p class="card-text">Validas las solicitudes de Asociacion a tus cuentas (aceptar/rechazar)</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/validateInvitation.jsp" title="Read more" ><img src="/proyectoFIPC2/images/aceptar.png" alt="x" width="25" height="25"/> Validar</a>
                            </center>
                        </div>
                    </div>
                </div>                
            </div>
        </div>
    </section>    
    <br>
    <br>
    <h2>Reportes Cliente</h2>
    <br>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-3 borderR">
                            <center>
                                <h3 class="card-title">Reporte 1</h3>
                                <p class="card-text">Las últimas 15 transacciones más grandes realizadas en el último año, por cuenta.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/Reports/clientReport1.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 2</h3>
                                <p class="card-text">Listado de todas las transacciones realizadas dentro de un intervalo de tiempo</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/Reports/clientReport2.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-3 borderR">
                            <center>
                                <h3 class="card-title">Reporte 3</h3>
                                <p class="card-text">La cuenta con más dinero y sus transacciones, desde una fecha estipulada</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/Reports/clientReport3.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3">
                    <div class="card">
                        <div class="backC-4 borderR">
                            <center>
                                <h3 class="card-title">Reporte 4</h3>
                                <p class="card-text">Historial con el listado de solicitud de asociación de cuenta recibidas con su estado.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/Reports/clientReport4.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
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
                                <p class="card-text">Historial con el listado de solicitud de asociación de cuenta realizadas con su estado.</p>
                                <a class="btn btn-light btn-outline-dark" href="/proyectoFIPC2/ClientGUI/Reports/clientReport5.jsp" title="Read more" ><img src="/proyectoFIPC2/images/reporte.png" alt="x" width="25" height="25"/> Crear </a>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
    </section>
    </body>
</html>
