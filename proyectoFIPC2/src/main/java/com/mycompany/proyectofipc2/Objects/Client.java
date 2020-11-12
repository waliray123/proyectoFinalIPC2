/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.Objects;

import java.sql.Blob;

/**
 *
 * @author user-ubunto
 */
public class Client {
    public String code;
    public String name;
    public String DPI;
    public String birth;
    public String address;
    public String gender;
    public Blob DPI_PDF;
    public String password;

    public Client(String code, String name, String DPI, String birth, String address, String gender, String password) {
        this.code = code;
        this.name = name;
        this.DPI = DPI;
        this.birth = birth;
        this.address = address;
        this.gender = gender;
        this.password = password;
    }

    public void setDPI_PDF(Blob DPI_PDF) {
        this.DPI_PDF = DPI_PDF;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getDPI() {
        return DPI;
    }

    public String getBirth() {
        return birth;
    }

    public String getAddress() {
        return address;
    }

    public String getGender() {
        return gender;
    }

    public Blob getDPI_PDF() {
        return DPI_PDF;
    }

    public String getPassword() {
        return password;
    }
    
    
    
}
