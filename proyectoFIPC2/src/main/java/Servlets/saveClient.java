/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import com.mycompany.proyectofipc2.ClientControlers.ClientControl;
import com.mycompany.proyectofipc2.ClientControlers.ClientDB;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author user-ubunto
 */
@WebServlet(name = "saveClient", urlPatterns = {"/saveClient"})
public class saveClient extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "upload";

    private static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

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
            request.getRequestDispatcher("/ManagerGUI/ManagerPrincipal.jsp").forward(request, response);
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
        if (!ServletFileUpload.isMultipartContent(request)) {
            PrintWriter writer = response.getWriter();
            writer.println("Error: enctype=multipart/form-data");
            writer.flush();
            return;
        }
        String message = "";
        
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setFileSizeMax(MAX_FILE_SIZE);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        String uploadPath = getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0) {
                File storeFile = null;
                String code = "",name = "",DPI= "",birth= "",address= "",gender= "",password = "";
                File DPI_PDF = null;
                for (FileItem item : formItems) {
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        String filePath = uploadPath + File.separator + fileName;
                        storeFile = new File(filePath);
                        DPI_PDF = storeFile;
                        item.write(storeFile);                        
                    } else {
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        if (fieldName.equals("name")) {
                            name = fieldValue;
                        } else if (fieldName.equals("DPI")) {
                            DPI = fieldValue;
                        } else if (fieldName.equals("passClient")) {
                            password = fieldValue;
                        } else if (fieldName.equals("gender")) {
                            gender = fieldValue;
                        } else if (fieldName.equals("birth")) {
                            birth = fieldValue;
                        } else if (fieldName.equals("address")) {
                            address = fieldValue;
                        }
                    }
                }
                //Enviar a guardar
                ClientControl clientC = new ClientControl();
                ClientDB clientDB = new ClientDB();
                code = String.valueOf(clientC.getLastCodeClient());
                if (clientC.validateInsertClient(code, name, DPI, birth, address, gender, DPI_PDF, password)) {                    
                    clientDB.insertNewClient(code, name, DPI, birth, address, gender, DPI_PDF, password);
                    message = "Cliente guardado con exito, el codigo del cliente es: " + code;
                }else{
                    message = "Ha ocurrido un error, vuelva a ingresar los datos";
                }
            }
        } catch (Exception ex) {

        }                
        request.setAttribute("message", message);
        request.getRequestDispatcher("/ManagerGUI/registerClient.jsp").forward(request, response);
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
