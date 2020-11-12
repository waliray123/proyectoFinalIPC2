/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountControlers;

import com.mycompany.proyectofipc2.Objects.Account;



/**
 *
 * @author user-ubunto
 */
public class AccountControl {
   
    public boolean validateAccount(String code, String dateCreated, Double credit, String clientCode){
        boolean isValid = false;
        if (code.isBlank() || dateCreated.isBlank() || credit == null || clientCode.isBlank()) {
            isValid = false;
        }else{
            if (getAccountByCode(code) != null) {
                isValid = false;
            }else{
                isValid = true;
            }
        }
        return isValid;
    }
    
    public Account getAccountByCode(String code){
        AccountDB accountDB = new AccountDB();
        return accountDB.getAccountByCode(code);
    }
    
}
