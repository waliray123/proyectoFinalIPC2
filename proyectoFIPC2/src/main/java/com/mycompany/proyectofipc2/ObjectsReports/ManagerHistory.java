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
public class ManagerHistory implements Serializable{
    private String code;
    private String description;
    private String type;
    private String dateChange;
    private String managerCode;

    public ManagerHistory(String code, String description, String type, String dateChange, String managerCode) {
        this.code = code;
        this.description = description;
        this.type = type;
        this.dateChange = dateChange;
        this.managerCode = managerCode;
    }   
    
    public String getCode() {
        return code;
    }

    public String getDescription() {
        return description;
    }

    public String getType() {
        return type;
    }

    public String getDateChange() {
        return dateChange;
    }

    public String getManagerCode() {
        return managerCode;
    }
    
    
}
