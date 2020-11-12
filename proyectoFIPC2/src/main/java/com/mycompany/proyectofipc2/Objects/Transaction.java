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
public class Transaction {
    
    private String code;
    private String dateTransaction;
    private String hourTransaction;
    private String typeTransaction;
    private String amount;
    private String cashierCode;
    private String accountCode;

    public Transaction(String code, String dateTransaction, String hourTransaction, String typeTransaction, String amount, String cashierCode, String accountCode) {
        this.code = code;
        this.dateTransaction = dateTransaction;
        this.hourTransaction = hourTransaction;
        this.typeTransaction = typeTransaction;
        this.amount = amount;
        this.cashierCode = cashierCode;
        this.accountCode = accountCode;
    }

    public String getCode() {
        return code;
    }

    public String getDateTransaction() {
        return dateTransaction;
    }

    public String getHourTransaction() {
        return hourTransaction;
    }

    public String getTypeTransaction() {
        return typeTransaction;
    }

    public String getAmount() {
        return amount;
    }

    public String getCashierCode() {
        return cashierCode;
    }

    public String getAccountCode() {
        return accountCode;
    }
    
    
    
    
    
    
    
}
