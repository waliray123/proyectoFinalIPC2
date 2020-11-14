/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.Utils;

import com.mycompany.proyectofipc2.CashierControlers.CashierDB;
import com.mycompany.proyectofipc2.ManagerControlers.ManagerDB;


/**
 *
 * @author user-ubunto
 */
public class validateInsertions {

    public validateInsertions() {
        validateFirstInsertions();
    }            
    
    private void validateFirstInsertions(){
        TypeTurnDB typeTurnDB = new TypeTurnDB();
        CashierDB cashierDB = new CashierDB();
        ManagerDB managerDB = new ManagerDB();
        if (typeTurnDB.getTypeTurnNameByCode("1") == null) {
            typeTurnDB.insertTypeTurn("1", "Matutino","06:00:00","14:30:00");
            typeTurnDB.insertTypeTurn("2", "Vespertino","13:00:00","22:00:00");
            typeTurnDB.insertTypeTurn("3", "todo","00:00:00","23:59:59");
        }
        if (cashierDB.getCashierByCode("101") == null) {
            cashierDB.insertNewCashier("101", "Banca virtual", "3", "101","1","0","8cX7%%tedj4!yJm4");
        }
        if (managerDB.getLimits() == -1) {
            managerDB.setNewLimit("1", "limite1", 1000.00);
        }
    }
        
}
