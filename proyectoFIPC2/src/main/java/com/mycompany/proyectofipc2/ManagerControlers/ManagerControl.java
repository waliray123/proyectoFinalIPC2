/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ManagerControlers;

import com.mycompany.proyectofipc2.Objects.Manager;
import com.mycompany.proyectofipc2.Utils.DateHour;
import com.mycompany.proyectofipc2.Utils.ValidateCodes;

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
                ValidateCodes validateCode = new ValidateCodes();                
                if (validateCode.validateCode(code)) {
                    isValid = true;
                }                
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
    
    public int getLastCodeManager(){
        int codeClient = 0;
        ManagerDB clientDB = new ManagerDB();
        boolean isValidate = false;
        int countTimes = 0;
        ValidateCodes validateCode = new ValidateCodes();
        while(isValidate == false){
            if (countTimes == 0) {
                codeClient = clientDB.getLastCodeManager();
            }else{
                codeClient++;
            }            
            isValidate = validateCode.validateCode(String.valueOf(codeClient));   
            countTimes++;
        }        
        return codeClient;
    }  
}
