<%-- 
    Document   : ListCashiers
    Created on : 16/11/2020, 22:16:19
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.Objects.Cashier"%>
<%@page import="com.mycompany.proyectofipc2.CashierControlers.CashierDB"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
CashierDB managerDB = new CashierDB();
ArrayList<Cashier> clients = managerDB.getAllCashiers();
int cont = 1;
%>
<table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Cajero</th>
                <th scope="col">Nombre</th>
                <th scope="col">DPI</th>
                <th scope="col">Codigo Turno</th>
                <th scope="col">Direccion</th>
                <th scope="col">Genero</th>
            </tr>
        </thead>
        <tbody>
            <%for (Cashier client : clients) {%>                                
            <tr>
                <th scope="row"><%=cont%></th>
                <td><%=client.getCode()%></td>              
                <td><%=client.getName()%></td>              
                <td><%=client.getDPI()%></td>             
                <td><%=client.getCodeTurn()%></td>             
                <td><%=client.getAddress()%></td>              
                <td><%=client.getGender()%></td>           
            </tr>            
            <%  cont++;
                }
            %>
        </tbody>        
    </table>
