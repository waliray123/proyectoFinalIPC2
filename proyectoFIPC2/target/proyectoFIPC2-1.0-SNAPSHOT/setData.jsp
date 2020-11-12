
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/bootstrap.css">
        <link rel="stylesheet"  href="/proyectoFIPC2/css/customCSS.css">
        <title>Subir XML</title>
    </head>
    <script  type = "text/javascript" src="/proyectoFIPC2/js/includeJS.js" ></script>   
    <body class="text-center">
        <div w3-include-html="header.html"></div> 
        <br>
        <h2>Subir archivo XML</h2>        
        <form class="formC-1" METHOD="POST"enctype="multipart/form-data" action="/proyectoFIPC2/servletSetData">
            <label>Archivo XML </label>
            <input type="file" name="fileXML" accept=".xml" class="btn-light"><br><br>
            <label>Archivos DPI en PDF</label>
            <input type="file" name="fileDPI" accept=".pdf" class="btn-light" multiple><br><br>
            <input type="submit">            
        </form>        
    </body>
    
    <%if (request.getParameter("fileXML") != null) {%>
    <h1>Se subio el archivo</h1>
    <%    }
    %>
    <script>
        includeHTML();
    </script>
</html>
