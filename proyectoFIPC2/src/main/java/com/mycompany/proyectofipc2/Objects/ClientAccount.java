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
public class ClientAccount {
    private String code;
    private String attempts;
    private Boolean isAssociated;
    private String codeAccount;
    private String codeClient;    

    public ClientAccount(String code,String attempts, Boolean isAssociated, String codeAccount, String codeClient) {
        this.attempts = attempts;
        this.isAssociated = isAssociated;
        this.codeAccount = codeAccount;
        this.codeClient = codeClient;
    }

    public String getAttempts() {
        return attempts;
    }

    public Boolean getIsAssociated() {
        return isAssociated;
    }

    public String getCodeAccount() {
        return codeAccount;
    }

    public String getCodeClient() {
        return codeClient;
    }
    
    
}
