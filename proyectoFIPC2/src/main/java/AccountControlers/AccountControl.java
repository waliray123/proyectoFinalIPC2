/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package AccountControlers;

import com.mycompany.proyectofipc2.Objects.Account;
import com.mycompany.proyectofipc2.Objects.ClientAccount;
import java.util.ArrayList;



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
    
    public void clientTransfer(String codeAccountW,String codeAccountD, Double ammount){
        AccountDB accountDB = new AccountDB();
        Account accountW = getAccountByCode(codeAccountW);
        Account accountD = getAccountByCode(codeAccountD);        
        Double creditToSetW = accountW.getCredit() - ammount;
        Double creditToSetD = accountD.getCredit() + ammount;        
        accountDB.updateCreditByCode(codeAccountW, creditToSetW);
        accountDB.updateCreditByCode(codeAccountD, creditToSetD);
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
    
    public ArrayList<Account> getAccountByCodeClient(String codeClient){
        AccountDB accountDB = new AccountDB();
        return accountDB.getAccountsByCodeClient(codeClient);
    }
    
    public ClientAccount getInvitation(String codeClient,String codeAccount){
        AccountDB accountDB = new AccountDB();
        ClientAccount clientAccount = accountDB.getRelationClientAccount(codeClient, codeAccount);
        if (clientAccount == null) {
            setNewInvitation(codeClient, codeAccount);
            clientAccount = getInvitation(codeClient,codeAccount);
        }        
        return clientAccount; 
    }
    
    public String getLastCodeClientAccount(){
        AccountDB accountDB = new AccountDB();
        String codeAccount  = "";
        try{
            codeAccount = String.valueOf(accountDB.getLastCodeClientAccount());
        }catch(Exception e){
            
        }        
        if (codeAccount.equals("")) {
            codeAccount = "0";
        }
        return codeAccount;
    }
    
    public void setNewInvitation(String codeClient, String codeAccount){
        AccountDB accountDB = new AccountDB();
        accountDB.insertNewClientAccount(getLastCodeClientAccount(), "0", false,false, codeAccount, codeClient);
    }
    
    public void sendInvitation(String codeClientAccount, String attempts){
        AccountDB accountDB = new AccountDB();
        int attemptsI = Integer.parseInt(attempts);
        attemptsI +=1;
        accountDB.sendInvitation(codeClientAccount, String.valueOf(attemptsI), true);
    }
    
    public void acceptInvitation(String codeClientAccount){
        AccountDB accountDB = new AccountDB();
        accountDB.acceptInvitation(codeClientAccount);
    }
    
    public void declineInvitation(String codeClientAccount, String attempts){
        AccountDB accountDB = new AccountDB();
        accountDB.sendInvitation(codeClientAccount, attempts,false);
    }
    
    public ArrayList<ClientAccount> getAllInvitationsByClient(String codeClient){
        AccountDB accountDB = new AccountDB();
        return accountDB.getAllInvitations(codeClient);
    }
    
    public ArrayList<ClientAccount> getAllAsoociationsByClient(String codeClient){
        AccountDB accountDB = new AccountDB();
        return accountDB.getAllRelationsByClient(codeClient, true);
    }
}
