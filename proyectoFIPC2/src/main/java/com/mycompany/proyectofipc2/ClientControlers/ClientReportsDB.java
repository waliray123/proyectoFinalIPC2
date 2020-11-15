/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ClientControlers;

import com.mycompany.proyectofipc2.Objects.Account;
import com.mycompany.proyectofipc2.ObjectsReports.ClientHistory;
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
public class ClientReportsDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;               
    
    public ClientReportsDB() {
        createConnectionToDB();
    }
    
    private void createConnectionToDB(){
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
        
    public ArrayList<TransactionBalance> getReport1(String codeAccount) {
        ArrayList<TransactionBalance> transactions = new ArrayList<>();
        DateHour dateH = new DateHour();
        String dayToday = dateH.getDateToday();
        try {
            ps = connection.prepareStatement("SELECT * FROM (TRANSACTION) WHERE ACCOUNT_code = ? AND dateTransaction BETWEEN '2020-01-01' AND ? ORDER BY amount DESC LIMIT 15;");
            ps.setString(1, codeAccount);
            ps.setString(2, dayToday);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);
                String dateTransaction = res.getString(2);
                String hourTransaction = res.getString(3);
                String type = res.getString(4);                
                String amount = res.getString(5);                
                String codeCashier1 = res.getString(6);                
                String codeAccount1 = res.getString(7);                
                TransactionBalance transactionB = new TransactionBalance(code, dateTransaction, hourTransaction, type, amount, codeCashier1, codeAccount1,"");
                transactions.add(transactionB);
            }
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return transactions;
    }
    
    
    
    public ArrayList<TransactionBalance> getTransactionsByDate(String codeAccount, String date1, String date2) {
        ArrayList<TransactionBalance> transactions = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT * FROM TRANSACTION WHERE ACCOUNT_code = ? AND dateTransaction BETWEEN ? AND ?");
            ps.setString(1, codeAccount);
            ps.setString(2, date1);
            ps.setString(2, date2);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);
                String dateTransaction = res.getString(2);
                String hourTransaction = res.getString(3);
                String type = res.getString(4);                
                String amount = res.getString(5);                
                String codeCashier1 = res.getString(6);                
                String codeAccount1 = res.getString(7);                
                TransactionBalance transactionB = new TransactionBalance(code, dateTransaction, hourTransaction, type, amount, codeCashier1, codeAccount1,"");
                transactions.add(transactionB);
            }
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return transactions;
    }
    
    public Account getAccountBiggerByCodeClient(String clientCode) {
        Account accountR = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM ACCOUNT WHERE CLIENT_code = ? ORDER BY credit DESC LIMIT 1;");
            ps.setString(1, clientCode);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                String code = res.getString(1);
                String dateCreated = res.getString(2);
                Double credit = res.getDouble(3);
                String clientCode1 = res.getString(4);                
                accountR = new Account(code,dateCreated,credit,clientCode1);
            }
            res.close();
        } catch (Exception e) {

        }
        return accountR;
    }
    
    public ArrayList<ClientHistory> getReport4(String clientCode){
        ArrayList<ClientHistory> clientsHistory = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT * FROM CLIENTHISTORY WHERE CLIENT_codeR = ?");
            ps.setString(1, clientCode);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                String dateChange = res.getString(2);
                String codeAccount = res.getString(3);
                String codeClientR = res.getString(4);
                String codeClientS = res.getString(5);
                ClientHistory clientH = new ClientHistory(dateChange,codeAccount, codeClientR,codeClientS);
                clientsHistory.add(clientH);
            }
            res.close();
        } catch (Exception e) {

        }
        return clientsHistory;
    }
    
    public ArrayList<ClientHistory> getReport5(String clientCode){
        ArrayList<ClientHistory> clientsHistory = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT * FROM CLIENTHISTORY WHERE CLIENT_codeS = ?");
            ps.setString(1, clientCode);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                String dateChange = res.getString(2);
                String codeAccount = res.getString(3);
                String codeClientR = res.getString(4);
                String codeClientS = res.getString(5);
                ClientHistory clientH = new ClientHistory(dateChange,codeAccount, codeClientR,codeClientS);
                clientsHistory.add(clientH);
            }
            res.close();
        } catch (Exception e) {

        }
        return clientsHistory;
    }    
    
    public ArrayList<TransactionBalance> getReport2(String codeClient,String codeAccount, String date1, String date2){
        ArrayList<TransactionBalance> transactionsB = getTransactionsByCodeClient(codeClient,codeAccount,date1,date2);
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
    
    public ArrayList<TransactionBalance> getTransactionsByCodeClient(String codeClient, String codeAccount,String date1, String date2) {
        ArrayList<TransactionBalance> transactions = new ArrayList<>();
        DateHour dateH = new DateHour();
        String dayToday = dateH.getDateToday();
        try {
            ps = connection.prepareStatement("    SELECT T.code,T.dateTransaction,T.hourTransaction,T.typeTransaction,T.amount,T.CASHIER_code,T.ACCOUNT_code FROM (TRANSACTION AS T, ACCOUNT AS A, CLIENT AS C) WHERE T.ACCOUNT_code = A.code AND A.CLIENT_code = C.code AND C.code=? AND A.code = ? AND dateTransaction BETWEEN ? AND ? ORDER BY T.amount DESC ; ");
            ps.setString(1, codeClient);
            ps.setString(2, codeAccount);
            ps.setString(3, date1);
            ps.setString(4, date2);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);
                String dateTransaction = res.getString(2);
                String hourTransaction = res.getString(3);
                String type = res.getString(4);                
                String amount = res.getString(5);                
                String codeCashier1 = res.getString(6);                
                String codeAccount1 = res.getString(7);                
                TransactionBalance transactionB = new TransactionBalance(code, dateTransaction, hourTransaction, type, amount, codeCashier1, codeAccount1,"");
                transactions.add(transactionB);
            }
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return transactions;
    }
    
}
