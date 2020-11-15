/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.CashierControlers;

import com.mycompany.proyectofipc2.Objects.Transaction;
import com.mycompany.proyectofipc2.ObjectsReports.TransactionBalance;
import com.mycompany.proyectofipc2.Utils.ConnectionDB;
import com.mycompany.proyectofipc2.Utils.DateHour;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author user-ubunto
 */
public class CashierReportsDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;               
    
    public CashierReportsDB() {
        createConnectionToDB();
    }
    
    private void createConnectionToDB(){
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public ArrayList<TransactionBalance> getReport1(String codeCashier){
        ArrayList<TransactionBalance> transactionsB = getTransactionsByCodeCashier(codeCashier);
        Double balance = 0.00;
        for (TransactionBalance transaction : transactionsB) {
            Double amount = Double.parseDouble(transaction.getAmount());
            if (transaction.getTypeTransaction().equals("CREDITO")) {
                balance += amount;
            }else if (transaction.getTypeTransaction().equals("DEBITO")) {
                balance -= amount;
            }
            transaction.setBalanceT(String.valueOf(balance));
        }
        return transactionsB;
    }
    
    public ArrayList<TransactionBalance> getReport2(String codeCashier, String date1 ,String date2){
        ArrayList<TransactionBalance> transactionsB = getTransactionsByCodeCashierAndDate(codeCashier,date1,date2);
        Double balance = 0.00;
        for (TransactionBalance transaction : transactionsB) {
            Double amount = Double.parseDouble(transaction.getAmount());
            if (transaction.getTypeTransaction().equals("CREDITO")) {
                balance += amount;
            }else if (transaction.getTypeTransaction().equals("DEBITO")) {
                balance -= amount;
            }
            transaction.setBalanceT(String.valueOf(balance));
        }
        return transactionsB;
    }
    
    //SELECT * FROM TRANSACTION WHERE CASHIER_code = ? AND dateTransaction BETWEEN ? AND ?
    //SELECT * FROM TRANSACTION WHERE CASHIER_code = ? AND dateTransaction = ?
    public ArrayList<TransactionBalance> getTransactionsByCodeCashier(String codeCashier) {
        ArrayList<TransactionBalance> transactions = new ArrayList<>();
        DateHour dateH = new DateHour();
        String dayToday = dateH.getDateToday();
        try {
            ps = connection.prepareStatement("SELECT * FROM TRANSACTION WHERE CASHIER_code = ? AND dateTransaction = ?");
            ps.setString(1, codeCashier);
            ps.setString(2, dayToday);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);
                String dateTransaction = res.getString(2);
                String hourTransaction = res.getString(3);
                String type = res.getString(4);                
                String amount = res.getString(5);                
                String codeCashier1 = res.getString(6);                
                String codeAccount = res.getString(7);                
                TransactionBalance transactionB = new TransactionBalance(code, dateTransaction, hourTransaction, type, amount, codeCashier1, codeAccount,"");
                transactions.add(transactionB);
            }
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return transactions;
    }
    
    public ArrayList<TransactionBalance> getTransactionsByCodeCashierAndDate(String codeCashier, String date1, String date2) {
        ArrayList<TransactionBalance> transactions = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT * FROM TRANSACTION WHERE CASHIER_code = ? AND dateTransaction BETWEEN ? AND ?");
            ps.setString(1, codeCashier);
            ps.setString(2, date1);
            ps.setString(3, date2);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);
                String dateTransaction = res.getString(2);
                String hourTransaction = res.getString(3);
                String type = res.getString(4);                
                String amount = res.getString(5);                
                String codeCashier1 = res.getString(6);                
                String codeAccount = res.getString(7);                
                TransactionBalance transactionB = new TransactionBalance(code, dateTransaction, hourTransaction, type, amount, codeCashier1, codeAccount,"");
                transactions.add(transactionB);
            }
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return transactions;
    }
}
