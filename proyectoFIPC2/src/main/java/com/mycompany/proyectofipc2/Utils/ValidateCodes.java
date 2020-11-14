/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.Utils;

import com.mycompany.proyectofipc2.CashierControlers.CashierControl;
import com.mycompany.proyectofipc2.ClientControlers.ClientControl;
import com.mycompany.proyectofipc2.ManagerControlers.ManagerControl;

/**
 *
 * @author user-ubunto
 */
public class ValidateCodes {
            
    public boolean validateCode(String code){
        boolean isValidate = false;
        ClientControl clientC = new ClientControl();
        CashierControl cashierC = new CashierControl();
        ManagerControl managerC = new ManagerControl();        
        if (clientC.getClientByCode(code) == null) {
            if (cashierC.getCashierByCode(code) == null) {
                if (managerC.getManagerByCode(code) == null) {
                    isValidate = true;
                }
            }
        }
        return isValidate;
    }
    
}
