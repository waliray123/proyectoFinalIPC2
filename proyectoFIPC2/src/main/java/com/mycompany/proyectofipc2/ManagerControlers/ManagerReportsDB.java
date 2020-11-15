/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ManagerControlers;

import com.mycompany.proyectofipc2.CashierControlers.CashierDB;
import com.mycompany.proyectofipc2.Objects.Cashier;
import com.mycompany.proyectofipc2.ObjectsReports.CashierQuantity;
import com.mycompany.proyectofipc2.ObjectsReports.ClientQuantity;
import com.mycompany.proyectofipc2.ObjectsReports.CodeObject;
import com.mycompany.proyectofipc2.ObjectsReports.ManagerHistory;
import com.mycompany.proyectofipc2.Utils.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author user-ubunto
 */
public class ManagerReportsDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;               
    
    public ManagerReportsDB() {
        createConnectionToDB();
    }
    
    private void createConnectionToDB(){
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public ArrayList<ClientQuantity> getReport2(){
        ManagerDB managerDB = new ManagerDB();
        ArrayList<String> limits  = managerDB.getLimits();
        ArrayList<ClientQuantity> clients = getClientsReports(limits.get(0));
        return clients;
    }
    
    public ArrayList<ClientQuantity> getReport3(){
        ManagerDB managerDB = new ManagerDB();
        ArrayList<String> limits  = managerDB.getLimits();
        Double limit = Double.parseDouble(limits.get(1));
        ArrayList<ClientQuantity> clients = getClientsReports2();
        ArrayList<ClientQuantity> clients2 = new ArrayList<>();
        for (ClientQuantity client : clients) {
            if (Double.parseDouble(client.getQuantity()) > limit) {
                clients2.add(client);
            }
        }
        return clients2;
    }
    
    public ArrayList<CashierQuantity> getReport7(){
        ArrayList<CashierQuantity> cashiersQ = new  ArrayList<>();
        ArrayList<CodeObject> codeCashiers = new ArrayList<>();
        CashierDB cashierDB = new CashierDB();
        for (CodeObject codeCashier : codeCashiers) {
            String codeCahier1 = codeCashier.getCode();
            Cashier cashier1 = cashierDB.getCashierByCode(codeCahier1);
            CashierQuantity cashierQ1 = new CashierQuantity(cashier1.getCode(),cashier1.getName(),cashier1.getCodeTurn(),cashier1.getDPI(),cashier1.getAddress(),cashier1.getGender(), cashier1.getPassword());
            cashierQ1.setQuantity(codeCashier.getQuantity());
            cashiersQ.add(cashierQ1);
        }
         return cashiersQ;
    }
    
    public ArrayList<ManagerHistory> getManagerHistoryByType(String codeManager, String type){
        ArrayList<ManagerHistory> managerH = new ArrayList<>();
        try {            
            ps = connection.prepareStatement("SELECT * FROM MANAGERHISTORY WHERE MANAGER_code = ? AND typeChange = ?;");
            ps.setString(1, codeManager);
            ps.setString(2, type);
            ResultSet res = ps.executeQuery();            
            if(res.next()){
                String code = res.getString(1);                
                String description = res.getString(2);
                String type1 = res.getString(3);
                String dateChange = res.getString(4);
                String managerCode = res.getString(5);     
                ManagerHistory managerH2 = new ManagerHistory(code,description,type1,dateChange,managerCode);
                managerH.add(managerH2);
            }         
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }        
        return managerH;
    }
    
    public ArrayList<ClientQuantity> getClientsReports(String limit) {
        ArrayList<ClientQuantity> clients = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT C.code,C.name,C.DPI,C.birth,C.address,C.gender,T.code,T.amount FROM (TRANSACTION AS T, ACCOUNT AS A, CLIENT AS C) WHERE T.ACCOUNT_code = A.code AND A.CLIENT_code = C.code AND T.amount > ? ORDER BY T.amount DESC ;");
            ps.setString(1, limit);
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code = res.getString(1);
                String name = res.getString(2);
                String DPI = res.getString(3);
                String birth = res.getString(4);
                String address = res.getString(5);
                String gender = res.getString(6);
                String codeS = res.getString(7);
                String total = res.getString(8);
                
                ClientQuantity clientR = new ClientQuantity(code, name, DPI, birth, address, gender);
                clientR.setQuantity(total);
                clientR.setCodeS(codeS);
                clients.add(clientR);
            }
            res.close();
        } catch (Exception e) {

        }
        return clients;
    }
    
    public ArrayList<ClientQuantity> getClientsReports2() {
        ArrayList<ClientQuantity> clients = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT C.code,C.name,C.DPI,C.birth,C.address,C.gender,SUM(T.amount) AS Total FROM (TRANSACTION AS T, ACCOUNT AS A, CLIENT AS C) WHERE T.ACCOUNT_code = A.code AND A.CLIENT_code = C.code GROUP BY C.code ORDER BY Total;");            
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code = res.getString(1);
                String name = res.getString(2);
                String DPI = res.getString(3);
                String birth = res.getString(4);
                String address = res.getString(5);
                String gender = res.getString(6);
                String total = res.getString(7);
                
                ClientQuantity clientR = new ClientQuantity(code, name, DPI, birth, address, gender);
                clientR.setQuantity(total);
                clients.add(clientR);
            }
            res.close();
        } catch (Exception e) {

        }
        return clients;
    }
    
    public ArrayList<ClientQuantity> getClientsReports3() {
        ArrayList<ClientQuantity> clients = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT C.code,C.name,C.DPI,C.birth,C.address,C.gender,A.code,A.credit FROM (ACCOUNT AS A, CLIENT AS C) WHERE A.CLIENT_code = C.code ORDER BY credit DESC LIMIT 10;");            
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code = res.getString(1);
                String name = res.getString(2);
                String DPI = res.getString(3);
                String birth = res.getString(4);
                String address = res.getString(5);
                String gender = res.getString(6);
                String codeS = res.getString(7);
                String total = res.getString(8);
                
                ClientQuantity clientR = new ClientQuantity(code, name, DPI, birth, address, gender);
                clientR.setQuantity(total);
                clientR.setCodeS(codeS);
                clients.add(clientR);
            }
            res.close();
        } catch (Exception e) {

        }
        return clients;
    }
    
    public ArrayList<CodeObject> getCodeCashierQuantity(String date1, String date2) {
        ArrayList<CodeObject> cashiersQ = new ArrayList<>();
        try {
            ps = connection.prepareStatement("SELECT CASHIER_code,COUNT(CASHIER_code) AS Q FROM TRANSACTION WHERE dateTransaction BETWEEN ? AND ? GROUP BY CASHIER_code ORDER BY Q DESC LIMIT 1;");            
            ps.setString(1, date1);
            ps.setString(2, date2);
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code = res.getString(1);
                String quantity = res.getString(2);
                
                CodeObject cashier = new CodeObject(code,quantity);
                cashiersQ.add(cashier);
            }
            res.close();
        } catch (Exception e) {

        }
        return cashiersQ;
    }
    
}
