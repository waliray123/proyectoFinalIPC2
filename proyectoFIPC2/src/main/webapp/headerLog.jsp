

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    if (session.getAttribute("code") == null) {
        response.sendRedirect("../Login");
    } else {
%> 
<%String code = session.getAttribute("code").toString();%>
<%String pathPrincipal = session.getAttribute("pathPrincipal").toString();%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">EL BILLETON</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/proyectoFIPC2/<%=pathPrincipal%>">Principal</a>
            </li>
        </ul>
        <span class="navbar-text">
            Codigo: <%=code%>
        </span>
        <ul>
        <a class="btn btn-outline-success my-2 my-sm-0" href="${pageContext.request.contextPath}/Logout">Cerrar Sesion</a>
        </ul>
    </div>    
</nav>
<%}%>



