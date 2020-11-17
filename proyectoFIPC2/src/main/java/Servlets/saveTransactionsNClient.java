/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import AccountControlers.AccountDB;
import com.mycompany.proyectofipc2.CashierControlers.CashierReportsDB;
import com.mycompany.proyectofipc2.ClientControlers.ClientReportsDB;
import com.mycompany.proyectofipc2.Objects.Account;
import com.mycompany.proyectofipc2.ObjectsReports.TransactionBalance;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.HttpHeaders;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

/**
 *
 * @author user-ubunto
 */
@WebServlet(name = "saveTransactionsNClient", urlPatterns = {"/saveTransactionsNClient"})
public class saveTransactionsNClient extends HttpServlet {
    

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
            if (request.getSession().getAttribute("code") == null) {
                response.sendRedirect(request.getContextPath() + "/Login");
            }
            
            response.setContentType("application/pdf");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=Reporte.pdf");
            
            ClientReportsDB clientRDB = new ClientReportsDB();
            String codeAccount1 = request.getParameter("codeAccount");                
            ArrayList<TransactionBalance> transactionsB = clientRDB.getReport1(codeAccount1);
            
            File file = new File(request.getServletContext().getRealPath("/resources/transactionsNB.jrxml"));
            JasperReport jasperReports = JasperCompileManager.compileReport(file.getAbsolutePath());
            JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(transactionsB);
            
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("Nombre Reporte", "Reporte 1 Cliente segun la cuenta con codigo: " + codeAccount1);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReports, parameters, dataSource);
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

            response.getOutputStream().flush();
            response.getOutputStream().close();
        } catch (IOException | JRException e) {
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
            if (request.getSession().getAttribute("code") == null) {
                response.sendRedirect(request.getContextPath() + "/Login");
            }
            
            response.setContentType("application/pdf");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=Reporte.pdf");
            
            ClientReportsDB clientRDB = new ClientReportsDB(); 
            String codeAccount = request.getParameter("codeAccount");
            String date1 = request.getParameter("date1");
            String date2 = request.getParameter("date2");
            String credit = request.getParameter("credit");
            ArrayList<TransactionBalance> transactionsB = clientRDB.getReport2(request.getSession().getAttribute("code").toString(), codeAccount, date1, date2);
            
            
            
            File file = new File(request.getServletContext().getRealPath("/resources/transactionsNB.jrxml"));
            JasperReport jasperReports = JasperCompileManager.compileReport(file.getAbsolutePath());
            JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(transactionsB);
            
            Map<String, Object> parameters = new HashMap<>();
            parameters.put("Nombre Reporte", "Reporte 2 Cliente segun la cuenta con codigo: " + codeAccount + " con credito: "+ credit);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReports, parameters, dataSource);
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

            response.getOutputStream().flush();
            response.getOutputStream().close();
        } catch (IOException | JRException e) {
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

}
