/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.Objects;

/**
 *
 * @author user-ubunto
 */
public class Account {
     private String code;
    private String dateCreated;
    private Double credit;
    private String clientCode;

    public Account(String code, String dateCreated, Double credit, String clientCode) {
        this.code = code;
        this.dateCreated = dateCreated;
        this.credit = credit;
        this.clientCode = clientCode;
    }

    public String getCode() {
        return code;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public Double getCredit() {
        return credit;
    }

    public String getClientCode() {
        return clientCode;
    }
    
}
