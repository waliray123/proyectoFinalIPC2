/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.TransactionControlers;

import com.mycompany.proyectofipc2.Objects.Transaction;
import com.mycompany.proyectofipc2.Utils.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author user-ubunto
 */
public class TransactionDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;

    public TransactionDB() {
        createConnectionToDB();
    }

    private void createConnectionToDB() {
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public void insertNewTransaction(String code, String dateTransaction, String hourTransaction, String type, String amount, String codeCashier, String codeAccount) {       
        try {
            ps = connection.prepareStatement("INSERT INTO TRANSACTION VALUES (?,?,?,?,?,?,?)");   
            ps.setString(1, code);
            ps.setString(2, dateTransaction);
            ps.setString(3, hourTransaction);
            ps.setString(4, type);
            ps.setString(5, amount);
            ps.setString(6, codeCashier);
            ps.setString(7, codeAccount);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void insertTransactionWithoutCode(String dateTransaction, String hourTransaction, String type, String amount, String codeCashier, String codeAccount) {       
        try {
            ps = connection.prepareStatement("INSERT INTO TRANSACTION (dateTransaction,hourTransaction,typeTransaction,amount,CASHIER_code,ACCOUNT_code)VALUES (?,?,?,?,?,?)");               
            ps.setString(1, dateTransaction);
            ps.setString(2, hourTransaction);
            ps.setString(3, type);
            ps.setString(4, amount);
            ps.setString(5, codeCashier);
            ps.setString(6, codeAccount);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public Transaction getTransactionByCode(String codeTransaction) {
        Transaction transaction = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM TRANSACTION WHERE code = ?");
            ps.setString(1, codeTransaction);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                String code = res.getString(1);
                String dateTransaction = res.getString(2);
                String hourTransaction = res.getString(3);
                String type = res.getString(4);                
                String amount = res.getString(5);                
                String codeCashier = res.getString(6);                
                String codeAccount = res.getString(7);                
                transaction = new Transaction(code, dateTransaction, hourTransaction, type, amount, codeCashier, codeAccount);
            }
            res.close();
        } catch (Exception e) {

        }
        return transaction;
    }
}
