/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ManagerControlers;

import com.mycompany.proyectofipc2.Objects.Manager;
import com.mycompany.proyectofipc2.Utils.DateHour;

/**
 *
 * @author user-ubunto
 */
public class ManagerControl {

    public ManagerControl() {
        
    }            
    
    public boolean validateInsertManager(String code, String name, String codeTurn, String DPI, String address, String gender, String password){
        boolean isValid = false;
        if (code.isBlank() || name.isBlank() || codeTurn.isBlank() || DPI.isBlank() 
                || address.isBlank() || gender.isBlank()|| password.isBlank()) {
            isValid = false;
        }else{
            if (getManagerByCode(code) != null) {
                isValid = false;
            }else{
                isValid = true;
            }
        }
        return isValid;
    }
    
    public boolean validateUpdateManager(String code, String name, String codeTurn, String DPI, String address, String gender, String password){
        boolean isValid = false;
        if(code.isBlank() || name.isBlank() || codeTurn.isBlank() || DPI.isBlank() 
                || address.isBlank() || gender.isBlank()|| password.isBlank()) {
            isValid = false;
        }else{
            isValid = true;
        }
        return isValid;
    }
    
    public Manager getManagerByCode(String code){
        ManagerDB managerDB = new ManagerDB();
        return managerDB.getManagerByCode(code);
    }
    
    public void createHistorial(String codeManager, String description, String type){
        DateHour dateHour = new DateHour();
        String dateChange = dateHour.getDateToday();
        ManagerDB managerDB = new ManagerDB();
        managerDB.setNewHistorial(codeManager, dateChange, description, type);
    }
}
