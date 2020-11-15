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
public class TransactionBalance implements Serializable{
    
    private String code;
    private String dateTransaction;
    private String hourTransaction;
    private String typeTransaction;
    private String amount;
    private String cashierCode;
    private String accountCode;
    private String balanceT;

    public TransactionBalance(String code, String dateTransaction, String hourTransaction, String typeTransaction, String amount, String cashierCode, String accountCode, String balanceT) {
        this.code = code;
        this.dateTransaction = dateTransaction;
        this.hourTransaction = hourTransaction;
        this.typeTransaction = typeTransaction;
        this.amount = amount;
        this.cashierCode = cashierCode;
        this.accountCode = accountCode;
        this.balanceT = balanceT;
    }

    public void setBalanceT(String balanceT) {
        this.balanceT = balanceT;
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

    public String getBalanceT() {
        return balanceT;
    }
    
    
    
    
    
    
}
