/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ObjectsReports;

/**
 *
 * @author user-ubunto
 */
public class CodeObject {
    private String code;
    private String quantity;

    public CodeObject(String code, String quantity) {
        this.code = code;
        this.quantity = quantity;
    }

    
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
    
    
}
