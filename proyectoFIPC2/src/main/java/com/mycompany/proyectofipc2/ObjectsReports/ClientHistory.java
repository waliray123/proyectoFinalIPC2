/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ObjectsReports;

import java.io.Serializable;

/**
 *
 * @author user-ubunto
 */
public class ClientHistory implements Serializable{
    private String dateChange;
    private String codeAccount;
    private String codeClientR;
    private String codeClientS;

    public ClientHistory(String dateChange, String codeAccount, String codeClientR, String codeClientS) {
        this.dateChange = dateChange;
        this.codeAccount = codeAccount;
        this.codeClientR = codeClientR;
        this.codeClientS = codeClientS;
    }

    public String getDateChange() {
        return dateChange;
    }

    public String getCodeAccount() {
        return codeAccount;
    }

    public String getCodeClientR() {
        return codeClientR;
    }

    public String getCodeClientS() {
        return codeClientS;
    }
    
    
    
}
