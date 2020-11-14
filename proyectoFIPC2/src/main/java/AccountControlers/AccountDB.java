/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountControlers;

import com.mycompany.proyectofipc2.Objects.Account;
import com.mycompany.proyectofipc2.Objects.Client;
import com.mycompany.proyectofipc2.Objects.ClientAccount;
import com.mycompany.proyectofipc2.Utils.ConnectionDB;
import com.mycompany.proyectofipc2.Utils.EncryptPassword;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
    
    public void updateCreditByCode(String code, Double credit) {        
        try {
            ps = connection.prepareStatement("UPDATE ACCOUNT SET credit = ? WHERE code = ?;");   
            ps.setDouble(1, credit);
            ps.setString(2, code);            
            
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
    
    public ArrayList<Account> getAccountsByCodeClient(String codeClient) {
        ArrayList<Account> accounts = new ArrayList();
        try {
            ps = connection.prepareStatement("SELECT * FROM ACCOUNT WHERE CLIENT_code = ?");
            ps.setString(1, codeClient);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);
                String dateCreated = res.getString(2);
                Double credit = res.getDouble(3);
                String clientCode = res.getString(4);                
                Account accountR = new Account(code,dateCreated,credit,clientCode);
                accounts.add(accountR);
            }
            res.close();
        } catch (Exception e) {

        }
        return accounts;
    }
    
    public int getLastCodeAccount() {
        int code = 0;
        try {
            ps = connection.prepareStatement("SELECT code FROM ACCOUNT ORDER BY code DESC;");            
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                code = res.getInt(1)+1;                
            }
            res.close();
        } catch (Exception e) {

        }
        return code;
    }
    
    public ArrayList<ClientAccount> getAllRelationsByClient(String codeClient, boolean isAssociated){
        ArrayList<ClientAccount> clientsAccounts = new ArrayList();
        try {
            ps = connection.prepareStatement("SELECT * FROM CLIENT_ACCOUNT_ASSOCIATED WHERE CLIENT_code_associate = ? AND isAssociated = ?");
            ps.setString(1, codeClient);
            ps.setBoolean(2, isAssociated);
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);   
                String attempts = res.getString(2);
                Boolean isAssociated1 = res.getBoolean(3);
                Boolean isInviting = res.getBoolean(4);
                String codeAccount = res.getString(5);
                String codeClient1 = res.getString(6);                        
                ClientAccount clientAccount = new ClientAccount(code,attempts, isAssociated1,isInviting, codeAccount,codeClient1);
                clientsAccounts.add(clientAccount);
            }
            res.close();
        } catch (Exception e) {

        }
        return clientsAccounts;
    }
    
    public ArrayList<ClientAccount> getAllInvitations(String codeClient){
        ArrayList<ClientAccount> clientsAccounts = new ArrayList();
        try {
            ps = connection.prepareStatement("SELECT * FROM (CLIENT_ACCOUNT_ASSOCIATED AS CA, ACCOUNT AS A) WHERE CA.isInviting = 1 AND A.CLIENT_code =? AND CA.ACCOUNT_code = A.code AND CA.isAssociated = 0;");
            ps.setString(1, codeClient);            
            ResultSet res = ps.executeQuery();
            while(res.next()) {
                String code = res.getString(1);   
                String attempts = res.getString(2);
                Boolean isAssociated1 = res.getBoolean(3);
                Boolean isInviting = res.getBoolean(4);
                String codeAccount = res.getString(5);
                String codeClient1 = res.getString(6);                        
                ClientAccount clientAccount = new ClientAccount(code,attempts, isAssociated1,isInviting, codeAccount,codeClient1);
                clientsAccounts.add(clientAccount);
            }
            res.close();
        } catch (Exception e) {

        }
        return clientsAccounts;
    }
    
    public ClientAccount getRelationClientAccount(String codeClient, String codeAccount){
        ClientAccount clientAccount = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM CLIENT_ACCOUNT_ASSOCIATED WHERE ACCOUNT_code = ? AND CLIENT_code_associate = ?");
            ps.setString(1, codeAccount);
            ps.setString(2, codeClient);
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code = res.getString(1);   
                String attempts = res.getString(2);
                Boolean isAssociated1 = res.getBoolean(3);
                Boolean isInviting = res.getBoolean(4);
                String codeAccount1 = res.getString(5);
                String codeClient1 = res.getString(6);                        
                clientAccount = new ClientAccount(code,attempts, isAssociated1,isInviting, codeAccount1,codeClient1);                
            }
            res.close();
        } catch (Exception e) {

        }
        return clientAccount;
    }
    
    public ClientAccount getRelationClientAccountByCode(String code){
        ClientAccount clientAccount = null;
        try {
            ps = connection.prepareStatement("SELECT * FROM CLIENT_ACCOUNT_ASSOCIATED WHERE code = ?");
            ps.setString(1, code);
            ResultSet res = ps.executeQuery();
            if(res.next()) {
                String code1 = res.getString(1);   
                String attempts = res.getString(2);
                Boolean isAssociated1 = res.getBoolean(3);
                Boolean isInviting = res.getBoolean(4);
                String codeAccount1 = res.getString(5);
                String codeClient1 = res.getString(6);                        
                clientAccount = new ClientAccount(code1,attempts, isAssociated1,isInviting, codeAccount1,codeClient1);                
            }
            res.close();
        } catch (Exception e) {

        }
        return clientAccount;
    }
    
    public void insertNewClientAccount(String code, String attempts,boolean isAssociated,boolean isInviting, String accountCode,String clientCode) {        
        try {
            ps = connection.prepareStatement("INSERT INTO CLIENT_ACCOUNT_ASSOCIATED VALUES (?,?,?,?,?,?)");   
            ps.setString(1, code);
            ps.setString(2, attempts);
            ps.setBoolean(3, isAssociated);
            ps.setBoolean(4, isInviting);
            ps.setString(5, accountCode);
            ps.setString(6, clientCode);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void sendInvitation(String code, String attempts, boolean isInviting) {        
        try {
            ps = connection.prepareStatement("UPDATE CLIENT_ACCOUNT_ASSOCIATED SET attempts = ?, isInviting = ? WHERE code = ?;");   
            ps.setString(1, attempts);
            ps.setBoolean(2, isInviting);
            ps.setString(3, code);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void acceptInvitation(String code) {        
        try {
            ps = connection.prepareStatement("UPDATE CLIENT_ACCOUNT_ASSOCIATED SET isAssociated = ? WHERE code = ?;");               
            ps.setBoolean(1, true);
            ps.setString(2, code);
            
            ps.executeUpdate();//action done

        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public int getLastCodeClientAccount() {
        int code = 0;
        try {
            ps = connection.prepareStatement("SELECT code FROM CLIENT_ACCOUNT_ASSOCIATED ORDER BY code DESC;");            
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
