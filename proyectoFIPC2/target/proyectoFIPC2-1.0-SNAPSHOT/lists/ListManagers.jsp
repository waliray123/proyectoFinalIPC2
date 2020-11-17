<%-- 
    Document   : ListManagers
    Created on : 16/11/2020, 22:19:14
    Author     : user-ubunto
--%>

<%@page import="com.mycompany.proyectofipc2.Objects.Manager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.proyectofipc2.ManagerControlers.ManagerDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
ManagerDB managerDB = new ManagerDB();
ArrayList<Manager> clients = managerDB.getAllManagers();
int cont = 1;
%>
<table class="table table-hover table-striped">
        <thead>
            <tr>
                <th scope="col">#</th>
                <th scope="col">Codigo Gerente</th>
                <th scope="col">Nombre</th>
                <th scope="col">DPI</th>
                <th scope="col">Codigo Turno</th>
                <th scope="col">Direccion</th>
                <th scope="col">Genero</th>
            </tr>
        </thead>
        <tbody>
            <%for (Manager client : clients) {%>                                
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
