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
    
    public void setDeposit(String codeAccount, Double ammount){
        Account account = getAccountByCode(codeAccount);
        Double creditToSet = account.getCredit() + ammount;
        AccountDB accountDB = new AccountDB();
        accountDB.updateCreditByCode(codeAccount, creditToSet);
    }
    
    public void setWithdraw(String codeAccount, Double ammount){
        Account account = getAccountByCode(codeAccount);
        Double creditToSet = account.getCredit() - ammount;
        AccountDB accountDB = new AccountDB();
        accountDB.updateCreditByCode(codeAccount, creditToSet);
    }
    
    public Account getAccountByCode(String code){
        AccountDB accountDB = new AccountDB();
        return accountDB.getAccountByCode(code);
    }
    
    public String getLastCodeAccount(){
        AccountDB accountDB = new AccountDB();
        String codeAccount = String.valueOf(accountDB.getLastCodeAccount());
        return codeAccount;
    }
}
