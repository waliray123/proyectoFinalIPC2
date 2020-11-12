/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ClientControlers;

import com.mycompany.proyectofipc2.Objects.Client;
import java.io.File;

/**
 *
 * @author user-ubunto
 */
public class ClientControl {
    
    public boolean validateInsertClient(String code, String name, String DPI, String birth, String address, String gender,File DPI_PDF ,String password){
        boolean isValid = false;
        if (code.isBlank() || name.isBlank() || DPI.isBlank() || birth.isBlank()
                || address.isBlank() || gender.isBlank()|| password.isBlank() || DPI_PDF == null) {
            isValid = false;
        }else{
            if (getClientByCode(code) != null) {
                isValid = false;
            }else{
                isValid = true;
            }
        }
        return isValid;
    }
    
    public Client getClientByCode(String code){
        ClientDB clientDB = new ClientDB();
        return clientDB.getClientByCode(code);
    }
    
    
}