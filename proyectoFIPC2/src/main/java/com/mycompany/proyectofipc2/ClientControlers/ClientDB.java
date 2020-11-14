/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.ClientControlers;

import com.mycompany.proyectofipc2.Objects.Cashier;
import com.mycompany.proyectofipc2.Objects.Client;
import com.mycompany.proyectofipc2.Utils.ConnectionDB;
import com.mycompany.proyectofipc2.Utils.EncryptPassword;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author user-ubunto
 */
public class ClientDB {

    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;

    public ClientDB() {
        createConnectionToDB();
    }

    private void createConnectionToDB() {
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }

    public void insertNewClient(String code, String name, String DPI, String birth, String address, String gender,File DPI_PDF1 ,String password) {
        
        try {
            EncryptPassword encrypt = new EncryptPassword();
            password = encrypt.encrypt(password);
            ps = connection.prepareStatement("INSERT INTO CLIENT VALUES (?,?,?,?,?,?,?,?)");
            FileInputStream DPI_PDF2 = new FileInputStream(DPI_PDF1);            
            ps.setString(1, code);
            ps.setString(2, name);
            ps.setString(3, DPI);
            ps.setString(4, birth);
            ps.setString(5, address);
            ps.setString(6, gender);
            ps.setBinaryStream(7, DPI_PDF2);
            ps.setString(8, password);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateClient(String code, String name, String DPI, String birth, String address, String gender,String password) {
        
        try {
            EncryptPassword encrypt = new EncryptPassword();
            password = encrypt.encrypt(password);
            ps = connection.prepareStatement("UPDATE CLIENT SET name = ?, DPI = ?, birth = ?, address = ? , gender = ?, password = ? WHERE code = ?;");
            ps.setString(1, name);
            ps.setString(2, DPI);
            ps.setString(3, birth);
            ps.setString(4, address);
            ps.setString(5, gender);            
            ps.setString(6, password);
            ps.setString(7, code);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Client getClientByCode(String codeClient) {
        Client clientR = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM CLIENT WHERE code = ?");
            ps.setString(1, codeClient);
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code = res.getString(1);
                String name = res.getString(2);
                String DPI = res.getString(3);
                String birth = res.getString(4);
                String address = res.getString(5);
                String gender = res.getString(6);
                Blob DPI_PDF = res.getBlob(7);
                String password = res.getString(8);
                
                clientR = new Client(code, name, DPI, birth, address, gender, password);
                clientR.setDPI_PDF(DPI_PDF);
            }
            res.close();
        } catch (Exception e) {

        }
        return clientR;
    }

    public int getLastCodeClient() {
        int code = 0;
        try {
            ps = connection.prepareStatement("SELECT code,name FROM CLIENT ORDER BY code DESC;");            
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                code = res.getInt(1)+1;                
            }
            res.close();
        } catch (Exception e) {

        }
        return code;
    }
    
}
