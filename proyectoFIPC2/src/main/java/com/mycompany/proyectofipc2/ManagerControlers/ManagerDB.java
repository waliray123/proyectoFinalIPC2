/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ManagerControlers;

import com.mycompany.proyectofipc2.Objects.Manager;
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
public class ManagerDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;               
    
    public ManagerDB() {
        createConnectionToDB();
    }
    
    private void createConnectionToDB(){
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public void insertNewManager(String code, String name, String codeTurn, String DPI, String address, String gender, String password){        
        try {
            EncryptPassword encrypt = new EncryptPassword();            
            password = encrypt.encrypt(password);
            ps = connection.prepareStatement("INSERT INTO MANAGER VALUES (?,?,?,?,?,?,?)");
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
    
    public void updateManager(String code, String name, String codeTurn, String DPI, String address, String gender, String password){  
        
        try {
            EncryptPassword encrypt = new EncryptPassword();            
            password = encrypt.encrypt(password);
            ps = connection.prepareStatement("UPDATE MANAGER SET name = ?, DPI = ?, address = ? , gender = ?, password = ? ,TYPETURN_code = ? WHERE code = ?");            
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
    
    public Manager getManagerByCode(String codeManager){
        Manager managerR = null;
        try {            
            ps = connection.prepareStatement("SELECT * FROM MANAGER WHERE code = ?");
            ps.setString(1, codeManager);
            ResultSet res = ps.executeQuery();            
            if(res.next()){
                String code = res.getString(1);                
                String name = res.getString(2);
                String DPI = res.getString(3);
                String address = res.getString(4);
                String gender = res.getString(5);
                String password = res.getString(6);
                String codeTurn = res.getString(7);        
                managerR = new Manager(code, name, codeTurn, DPI, address,gender,password);
            }         
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }        
        return managerR;
    }
    
    public void setNewHistorial(String codeManager, String dateChange, String description, String type){
        try {
            ps = connection.prepareStatement("INSERT INTO MANAGERHISTORY (MANAGER_code,dateChange,descriptionChange,typeChange)VALUES (?,?,?,?)");
            ps.setString(1, codeManager);
            ps.setString(2, dateChange);                        
            ps.setString(3, description);
            ps.setString(4, type);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public ArrayList<String> getLimits(){
        ArrayList<String> limits = new ArrayList<>();        
        try {            
            ps = connection.prepareStatement("SELECT * FROM LIMITS");
            ResultSet res = ps.executeQuery();            
            while(res.next()){
                String limitMoney = res.getString(3);  
                limits.add(limitMoney);
            }         
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }        
        if (limits.size() <= 0 ) {
            limits = null;
        }
        return limits;
    }
    
    public void setNewLimit(String code, String name, Double limitMoney){
        try {
            ps = connection.prepareStatement("INSERT INTO LIMITS VALUES (?,?,?)");
            ps.setString(1, code);
            ps.setString(2, name);                        
            ps.setDouble(3, limitMoney);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateLimit(Double limitMoney, String code){
        try {
            ps = connection.prepareStatement("UPDATE LIMITS SET limitMoney = ? WHERE code = ?");                     
            ps.setDouble(1, limitMoney);
            ps.setString(2, code);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public int getLastCodeManager() {
        int code = 0;
        try {
            ps = connection.prepareStatement("SELECT code,name FROM MANAGER ORDER BY code DESC;");            
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                code = res.getInt(1)+1;                
            }
            res.close();
        } catch (Exception e) {

        }
        return code;
    }
    
    public ArrayList<Manager> getAllManagers(){
        ArrayList<Manager> managers = new ArrayList<>();
        Manager managerR = null;
        try {            
            ps = connection.prepareStatement("SELECT * FROM MANAGER");
            ResultSet res = ps.executeQuery();            
            while(res.next()){
                String code = res.getString(1);                
                String name = res.getString(2);
                String DPI = res.getString(3);
                String address = res.getString(4);
                String gender = res.getString(5);
                String password = res.getString(6);
                String codeTurn = res.getString(7);        
                managerR = new Manager(code, name, codeTurn, DPI, address,gender,password);
                managers.add(managerR);
            }         
            res.close();
        } catch (Exception e) {
            System.out.println(e);
        }        
        return managers;
    }
}
