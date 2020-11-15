/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ObjectsReports;

import java.io.Serializable;
import java.sql.Blob;

/**
 *
 * @author user-ubunto
 */
public class ClientQuantity implements Serializable{
    public String code;
    public String name;
    public String DPI;
    public String birth;
    public String address;
    public String gender;
    public Blob DPI_PDF;
    public String password;
    public String quantity;
    public String codeS;

    public ClientQuantity(String code, String name, String DPI, String birth, String address, String gender) {
        this.code = code;
        this.name = name;
        this.DPI = DPI;
        this.birth = birth;
        this.address = address;
        this.gender = gender;
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

    public void setDPI_PDF(Blob DPI_PDF) {
        this.DPI_PDF = DPI_PDF;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getCodeS() {
        return codeS;
    }

    public void setCodeS(String codeS) {
        this.codeS = codeS;
    }
    
    
}
