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
    private Boolean isInviting;
    private String codeAccount;
    private String codeClient;    

    public ClientAccount(String code,String attempts, Boolean isAssociated,Boolean isInviting, String codeAccount, String codeClient) {
        this.code = code;
        this.attempts = attempts;
        this.isAssociated = isAssociated;
        this.isInviting = isInviting;
        this.codeAccount = codeAccount;
        this.codeClient = codeClient;
    }

    public String getCode() {
        return code;
    }

    public Boolean getIsInviting() {
        return isInviting;
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
