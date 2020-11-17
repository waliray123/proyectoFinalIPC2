<%-- 
    Document   : ListClients
    Created on : 16/11/2020, 21:56:22
    Author     : user-ubunto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.Objects.Client"%>
<%@page import="com.mycompany.proyectofipc2.ClientControlers.ClientDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
ClientDB clientDB = new ClientDB();
ArrayList<Client> clients = clientDB.getAllClients();
int cont = 1;
%>
<table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Cliente</th>
                <th scope="col">Nombre</th>
                <th scope="col">DPI</th>
                <th scope="col">Fecha Nacimiento</th>
                <th scope="col">Direccion</th>
                <th scope="col">Genero</th>
            </tr>
        </thead>
        <tbody>
            <%for (Client client : clients) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=client.getCode()%></td>              
                <td><%=client.getName()%></td>              
                <td><%=client.getDPI()%></td>              
                <td><%=client.getBirth()%></td>              
                <td><%=client.getAddress()%></td>              
                <td><%=client.getGender()%></td>           
            </tr>            
            <%  cont++;
                }
            %>
        </tbody>        
    </table>
