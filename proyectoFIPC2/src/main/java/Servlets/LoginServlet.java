/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.mycompany.proyectofipc2.CashierControlers.CashierDB;
import com.mycompany.proyectofipc2.ClientControlers.ClientDB;
import com.mycompany.proyectofipc2.ManagerControlers.ManagerDB;
import com.mycompany.proyectofipc2.Objects.Cashier;
import com.mycompany.proyectofipc2.Objects.Client;
import com.mycompany.proyectofipc2.Objects.Manager;
import com.mycompany.proyectofipc2.Utils.EncryptPassword;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user-ubunto
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {

    private String pathToRedirect;

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        } catch (IOException | ServletException e) {
            System.out.println("Login Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String code = request.getParameter("code");
            String pass = request.getParameter("pass");
            //Usuario usuario = usuarioModel.loginValidation(Integer.parseInt(id), pass);
            boolean isValid = validateUser(code, pass);
            if (isValid == true) {
                request.getSession().setAttribute("code", code);
                request.getSession().setAttribute("pathPrincipal", this.pathToRedirect);
                //request.getSession().setAttribute("profesion", usuario.getProfesion());
                response.sendRedirect(request.getContextPath() + this.pathToRedirect);
            } else {
                request.setAttribute("success", 0);
                request.getRequestDispatcher("/login.jsp").forward(request, response);
            }
        } catch (IOException | NumberFormatException e) {
            System.out.println("Login Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public boolean validateUser(String code, String pass) {
        boolean isCorrect = false;
        ManagerDB managerDB = new ManagerDB();
        ClientDB clientDB = new ClientDB();
        CashierDB cashierDB = new CashierDB();
        try {
            EncryptPassword encrypt = new EncryptPassword();
            Manager manager = managerDB.getManagerByCode(code);
            Client client = clientDB.getClientByCode(code);
            Cashier cashier = cashierDB.getCashierByCode(code);
            if (manager != null) {
                String passM = managerDB.getManagerByCode(code).getPassword();
                passM = encrypt.decrypt(passM);
                if (passM.equals(pass)) {
                    isCorrect = true;
                    this.pathToRedirect = "/ManagerGUI/ManagerPrincipal.jsp";
                }
            } else if (client != null) {
                String passM = clientDB.getClientByCode(code).getPassword();
                passM = encrypt.decrypt(passM);
                if (passM.equals(pass)) {
                    isCorrect = true;
                    this.pathToRedirect = "/ClientGUI/ClientPrincipal.jsp";
                }
            } else if (cashier != null) {
                String passM = cashierDB.getCashierByCode(code).getPassword();
                passM = encrypt.decrypt(passM);
                if (passM.equals(pass)) {
                    isCorrect = true;
                    this.pathToRedirect = "/CashierGUI/CashierPrincipal.jsp";
                }
            }
        } catch (Exception e) {

        }
        return isCorrect;
    }

}
