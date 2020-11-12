/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountControlers;

import com.mycompany.proyectofipc2.Objects.Account;
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
public class AccountDB {
    private Connection connection;
    private PreparedStatement ps; //for operations
    private ResultSet rs;

    public AccountDB() {
        createConnectionToDB();
    }

    private void createConnectionToDB() {
        ConnectionDB connect = new ConnectionDB();
        this.connection = connect.getConnection();
    }
    
    public void insertNewAccount(String code, String dateCreated, Double credit, String clientCode) {        
        try {
            ps = connection.prepareStatement("INSERT INTO ACCOUNT VALUES (?,?,?,?)");   
            ps.setString(1, code);
            ps.setString(2, dateCreated);
            ps.setDouble(3, credit);
            ps.setString(4, clientCode);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public Account getAccountByCode(String codeAccount) {
        Account accountR = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM ACCOUNT WHERE code = ?");
            ps.setString(1, codeAccount);
            ResultSet res = ps.executeQuery();
            if (res.next()) {
                String code = res.getString(1);
                String dateCreated = res.getString(2);
                Double credit = res.getDouble(3);
                String clientCode = res.getString(4);                
                accountR = new Account(code,dateCreated,credit,clientCode);
            }
            res.close();
        } catch (Exception e) {

        }
        return accountR;
    }
}
