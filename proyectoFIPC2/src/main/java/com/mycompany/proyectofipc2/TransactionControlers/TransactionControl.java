/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.TransactionControlers;

import com.mycompany.proyectofipc2.Objects.Transaction;
import com.mycompany.proyectofipc2.Utils.DateHour;

/**
 *
 * @author user-ubunto
 */
public class TransactionControl {
    
    public boolean validateNewTransaction(String code, String dateTransaction, String hourTransaction, String typeTransaction, String amount, String cashierCode, String accountCode){
        boolean isValid = false;
        if (code.isBlank() || dateTransaction.isBlank() || hourTransaction == null || typeTransaction.isBlank()
                || amount.isBlank() || cashierCode.isBlank() || accountCode.isBlank()) {
            isValid = false;
        }else{
            if (getTransactionByCode(code) != null) {
                isValid = false;
            }else{
                isValid = true;
            }
        }
        return isValid;
    }
    
    public Transaction getTransactionByCode(String code){
        TransactionDB transaction = new TransactionDB();
        return transaction.getTransactionByCode(code);
    }
    
    public void setTransaction(String type,String codeCashier, String codeAccount, String amount){
        DateHour dateHour = new DateHour();
        String dateTransaction = dateHour.getDateToday();
        String hourTransaction = dateHour.getTime();
        TransactionDB transaction = new TransactionDB();
        transaction.insertTransactionWithoutCode(dateTransaction, hourTransaction, type, amount, codeCashier, codeAccount);
    }
}
