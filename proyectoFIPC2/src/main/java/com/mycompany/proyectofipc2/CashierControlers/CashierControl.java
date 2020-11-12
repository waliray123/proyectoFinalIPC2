/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.CashierControlers;

import com.mycompany.proyectofipc2.Objects.Cashier;

/**
 *
 * @author user-ubunto
 */
public class CashierControl {

    public CashierControl() {
        
    }
    
    
    public boolean validateInsertCashier(String code, String name, String codeTurn, String DPI, String address, String gender, String password){
        boolean isValid = false;
        if (code.isBlank() || name.isBlank() || codeTurn.isBlank() || DPI.isBlank() 
                || address.isBlank() || gender.isBlank()|| password.isBlank()) {
            isValid = false;
        }else{
            if (getCashierByCode(code) != null) {
                isValid = false;
            }else{
                isValid = true;
            }
        }
        return isValid;
    }
    
    public Cashier getCashierByCode(String code){
        CashierDB managerDB = new CashierDB();
        return managerDB.getCashierByCode(code);
    }
    
}
