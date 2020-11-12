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
public class TypeTurn {
    private String code;
    private String name;
    private String initHour;
    private String finalHour;

    public TypeTurn(String code, String name, String initHour, String finalHour) {
        this.code = code;
        this.name = name;
        this.initHour = initHour;
        this.finalHour = finalHour;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getInitHour() {
        return initHour;
    }

    public String getFinalHour() {
        return finalHour;
    }
    
    
    
}
