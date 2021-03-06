/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.CashierControlers;

import com.mycompany.proyectofipc2.Objects.Cashier;
import com.mycompany.proyectofipc2.Utils.ConnectionDB;
import com.mycompany.proyectofipc2.Utils.EncryptPassword;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author user-ubunto
 */
public class CashierDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;               
    
    public CashierDB() {
        createConnectionToDB();
    }
    
    private void createConnectionToDB(){
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public void insertNewCashier(String code, String name, String codeTurn, String DPI, String address, String gender, String password){  
        
        try {
            EncryptPassword encrypt = new EncryptPassword();            
            password = encrypt.encrypt(password);
            ps = connection.prepareStatement("INSERT INTO CASHIER VALUES (?,?,?,?,?,?,?)");
            ps.setString(1, code);
            ps.setString(2, name);                        
            ps.setString(3, DPI);
            ps.setString(4, address);
            ps.setString(5, gender);
            ps.setString(6, password);
            ps.setString(7, codeTurn);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateCashier(String code, String name, String codeTurn, String DPI, String address, String gender, String password){  
        
        try {
            EncryptPassword encrypt = new EncryptPassword();            
            password = encrypt.encrypt(password);
            ps = connection.prepareStatement("UPDATE CASHIER SET name = ?, DPI = ?, address = ? , gender = ?, password = ? ,TYPETURN_code = ? WHERE code = ?");            
            ps.setString(1, name);                        
            ps.setString(2, DPI);
            ps.setString(3, address);
            ps.setString(4, gender);
            ps.setString(5, password);
            ps.setString(6, codeTurn);
            ps.setString(7, code);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public Cashier getCashierByCode(String codeCashier){
        Cashier cashierR = null;
        try {            
            ps = connection.prepareStatement("SELECT * FROM CASHIER WHERE code = ?");
            ps.setString(1, codeCashier);
            ResultSet res = ps.executeQuery();            
            if(res.next()){
                String code = res.getString(1);                
                String name = res.getString(2);
                String DPI = res.getString(3);
                String address = res.getString(4);
                String gender = res.getString(5);
                String password = res.getString(6);
                String codeTurn = res.getString(7);        
                cashierR = new Cashier(code, name, codeTurn, DPI, address,gender,password);
            }
            res.close();
        } catch (Exception e) {
            
        }        
        return cashierR;
    }
    
    public int getLastCodeCashier() {
        int code = 0;
        try {
            ps = connection.prepareStatement("SELECT code,name FROM CASHIER ORDER BY code DESC;");            
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                code = res.getInt(1)+1;                
            }
            res.close();
        } catch (Exception e) {

        }
        return code;
    }
    
    public ArrayList<Cashier> getAllCashiers(){
        ArrayList<Cashier> cashiers = new ArrayList<>();
        Cashier cashierR = null;
        try {            
            ps = connection.prepareStatement("SELECT * FROM CASHIER");
            ResultSet res = ps.executeQuery();            
            while(res.next()){
                String code = res.getString(1);                
                String name = res.getString(2);
                String DPI = res.getString(3);
                String address = res.getString(4);
                String gender = res.getString(5);
                String password = res.getString(6);
                String codeTurn = res.getString(7);        
                cashierR = new Cashier(code, name, codeTurn, DPI, address,gender,password);
                cashiers.add(cashierR);
            }
            res.close();
        } catch (Exception e) {
            
        }        
        return cashiers;
    }
}
