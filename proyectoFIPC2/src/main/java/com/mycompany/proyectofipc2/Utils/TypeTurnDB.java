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
    
}
