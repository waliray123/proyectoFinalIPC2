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
public class Manager {
    private String code;
    private String name;
    private String codeTurn;
    private String DPI;
    private String address;
    private String gender;
    private String password;
            
    public Manager(String code, String name, String codeTurn, String DPI, String address, String gender, String password) {
        this.code = code;
        this.name = name;
        this.codeTurn = codeTurn;
        this.DPI = DPI;
        this.address = address;
        this.gender = gender;
        this.password = password;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getCodeTurn() {
        return codeTurn;
    }

    public String getDPI() {
        return DPI;
    }

    public String getAddress() {
        return address;
    }

    public String getGender() {
        return gender;
    }

    public String getPassword() {
        return password;
    }
    
    
}