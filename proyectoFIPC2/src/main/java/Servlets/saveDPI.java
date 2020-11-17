/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.mycompany.proyectofipc2.ClientControlers.ClientDB;
import com.mycompany.proyectofipc2.ManagerControlers.ManagerReportsDB;
import com.mycompany.proyectofipc2.Objects.Client;
import com.mycompany.proyectofipc2.ObjectsReports.ManagerHistory;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "saveDPI", urlPatterns = {"/saveDPI"})
public class saveDPI extends HttpServlet {

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
        System.out.println("LLegue ahoeaf");
        System.out.println("LLegue ahoeaf");
        try {
            if (request.getSession().getAttribute("code") == null) {
                response.sendRedirect(request.getContextPath() + "/Login");
            }

            response.setContentType("application/pdf");
            response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=DPI.pdf");

            ClientDB clientDB = new ClientDB();
            String codeClient = request.getParameter("codeClient");
            Client client = clientDB.getClientByCode(codeClient);
            Blob DPI_PDF = client.getDPI_PDF();

            InputStream in = DPI_PDF.getBinaryStream();

            File file1 = File.createTempFile("something-", ".binary", new File("."));;
            OutputStream out = new FileOutputStream(file1);
            byte[] buff = new byte[4096];  // how much of the blob to read/write at a time
            int len = 0;

            while ((len = in.read(buff)) != -1) {
                out.write(buff, 0, len);
            }
            in.close();          
            FileInputStream fileStream = new FileInputStream(file1);
//
//            byte[] buffer = new byte[1024];

//            int data = 0;
//            data = in.read();
//            while (data != -1) {
//                response.getWriter().write(data);
//                data = in.read();
//            }
            int data = 0;
            data = fileStream.read();
            while (data != -1) {
                response.getWriter().write(data);
                data = fileStream.read();
            }

            fileStream.close();

            
            response.getOutputStream().flush();
            response.getOutputStream().close();
            response.getWriter().close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException ex) {
            Logger.getLogger(saveDPI.class.getName()).log(Level.SEVERE, null, ex);
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
