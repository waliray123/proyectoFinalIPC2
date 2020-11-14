/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.Utils;

import com.mycompany.proyectofipc2.Objects.Manager;
import com.mycompany.proyectofipc2.Objects.TypeTurn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author user-ubunto
 */
public class TypeTurnDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;               
    
    public TypeTurnDB() {
        createConnectionToDB();
    }
    
    private void createConnectionToDB(){
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public TypeTurn getTypeTurnCodeByName(String name){
        TypeTurn typeTurn = null;
        try {            
            ps = connection.prepareStatement("SELECT * FROM TYPETURN WHERE name = ?;");
            ps.setString(1, name);
            ResultSet res = ps.executeQuery();            
            if (res.next()){
                String code = res.getString(1);                
                String nameTurn = res.getString(2);
                String initHour = res.getString(3);
                String finalHour = res.getString(4);    
                typeTurn = new TypeTurn(code, nameTurn,initHour,finalHour);
            }         
            res.close();
        } catch (Exception e) {
            
        }
        return typeTurn;
    }
    
    public TypeTurn getTypeTurnNameByCode(String code){
        TypeTurn typeTurn = null;
        try {            
            ps = connection.prepareStatement("SELECT * FROM TYPETURN WHERE code = ?;");
            ps.setString(1, code);
            ResultSet res = ps.executeQuery();            
            if (res.next()){
                String code1 = res.getString(1);                
                String nameTurn = res.getString(2);
                String initHour = res.getString(3);
                String finalHour = res.getString(4);    
                typeTurn = new TypeTurn(code1, nameTurn,initHour,finalHour);
            }         
            res.close();
        } catch (Exception e) {
            
        }
        return typeTurn;
    }
    
    public void insertTypeTurn(String code, String name, String initTime,String finalTime){
        try {
            ps = connection.prepareStatement("INSERT INTO TYPETURN VALUES (?,?,?,?)");
            ps.setString(1, code);
            ps.setString(2, name);                        
            ps.setString(3, initTime);
            ps.setString(4, finalTime);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateTypeTurn(String code, String name, String initTime,String finalTime){
        try {
            ps = connection.prepareStatement("UPDATE TYPETURN SET name = ?, initHour = ?, finalHour = ? WHERE code = ?");            
            ps.setString(1, name);                        
            ps.setString(2, initTime);
            ps.setString(3, finalTime);
            ps.setString(4, code);
                        
            ps.executeUpdate();//action done
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
