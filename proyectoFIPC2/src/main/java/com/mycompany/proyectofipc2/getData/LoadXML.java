/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyectofipc2.getData;

import AccountControlers.AccountControl;
import AccountControlers.AccountDB;
import com.mycompany.proyectofipc2.CashierControlers.CashierControl;
import com.mycompany.proyectofipc2.CashierControlers.CashierDB;
import com.mycompany.proyectofipc2.ClientControlers.ClientControl;
import com.mycompany.proyectofipc2.ClientControlers.ClientDB;
import com.mycompany.proyectofipc2.ManagerControlers.ManagerControl;
import com.mycompany.proyectofipc2.ManagerControlers.ManagerDB;
import com.mycompany.proyectofipc2.Objects.TypeTurn;
import com.mycompany.proyectofipc2.TransactionControlers.TransactionControl;
import com.mycompany.proyectofipc2.TransactionControlers.TransactionDB;
import com.mycompany.proyectofipc2.Utils.TypeTurnDB;
import java.io.File;
import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 *
 * @author user-ubunto
 */
public class LoadXML {

    public void readXML(String pathFile, String pathFolder) {
        try {
            File fileXML = new File(pathFile);
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = factory.newDocumentBuilder();

            Document document = documentBuilder.parse(fileXML);

            document.getDocumentElement().normalize();

            //Node lists from the XML file
            NodeList listManagers = document.getElementsByTagName("GERENTE");
            NodeList listCashiers = document.getElementsByTagName("CAJERO");
            NodeList listClients = document.getElementsByTagName("CLIENTE");
            NodeList listTransactions = document.getElementsByTagName("TRANSACCION");

            //inserts the nodes in order
            insertManagers(listManagers);
            insertCashiers(listCashiers);
            insertClients(listClients, pathFolder);
            insertTransactions(listTransactions);
            //client - accounts
            //transaction

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private void insertManagers(NodeList listManagers) {
        ManagerDB managerDB = new ManagerDB();
        ManagerControl managerControl = new ManagerControl();
        for (int i = 0; i < listManagers.getLength(); i++) {
            try {
                Node nodo = listManagers.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) nodo;
                    String code = element.getElementsByTagName("CODIGO").item(0).getTextContent();
                    String name = element.getElementsByTagName("NOMBRE").item(0).getTextContent();
                    String turn = element.getElementsByTagName("TURNO").item(0).getTextContent();
                    String DPI = element.getElementsByTagName("DPI").item(0).getTextContent();
                    String address = element.getElementsByTagName("DIRECCION").item(0).getTextContent();
                    String gender = element.getElementsByTagName("SEXO").item(0).getTextContent();
                    String password = element.getElementsByTagName("PASSWORD").item(0).getTextContent();
                    TypeTurnDB typeTurnDB = new TypeTurnDB();
                    TypeTurn turnToSet = typeTurnDB.getTypeTurnCodeByName(turn);
                    if (turnToSet != null) {
                        String codeTurn = turnToSet.getCode();
                        if (managerControl.validateInsertManager(code, name, turn, DPI, address, gender, password)) {
                            managerDB.insertNewManager(code, name, codeTurn, DPI, address, gender, password);
                        }
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    private void insertCashiers(NodeList listManagers) {
        CashierDB cashierDB = new CashierDB();
        CashierControl cashierControl = new CashierControl();
        for (int i = 0; i < listManagers.getLength(); i++) {
            try {
                Node nodo = listManagers.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) nodo;
                    String code = element.getElementsByTagName("CODIGO").item(0).getTextContent();
                    String name = element.getElementsByTagName("NOMBRE").item(0).getTextContent();
                    String turn = element.getElementsByTagName("TURNO").item(0).getTextContent();
                    String DPI = element.getElementsByTagName("DPI").item(0).getTextContent();
                    String address = element.getElementsByTagName("DIRECCION").item(0).getTextContent();
                    String gender = element.getElementsByTagName("SEXO").item(0).getTextContent();
                    String password = element.getElementsByTagName("PASSWORD").item(0).getTextContent();
                    TypeTurnDB typeTurnDB = new TypeTurnDB();
                    TypeTurn turnToSet = typeTurnDB.getTypeTurnCodeByName(turn);
                    if (turnToSet != null) {
                        String codeTurn = turnToSet.getCode();
                        if (cashierControl.validateInsertCashier(code, name, turn, DPI, address, gender, password)) {
                            cashierDB.insertNewCashier(code, name, codeTurn, DPI, address, gender, password);
                        }
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    private void insertClients(NodeList listClients, String pathFolder) {

        ClientDB clientDB = new ClientDB();
        ClientControl clientControl = new ClientControl();
        for (int i = 0; i < listClients.getLength(); i++) {
            try {
                Node nodo = listClients.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) nodo;
                    //String code, String name, String DPI, String birth, String address, String gender,File DPI_PDF1 ,String password
                    String code = element.getElementsByTagName("CODIGO").item(0).getTextContent();
                    String name = element.getElementsByTagName("NOMBRE").item(0).getTextContent();
                    String DPI = element.getElementsByTagName("DPI").item(0).getTextContent();
                    String birth = element.getElementsByTagName("BIRTH").item(0).getTextContent();
                    String address = element.getElementsByTagName("DIRECCION").item(0).getTextContent();
                    String gender = element.getElementsByTagName("SEXO").item(0).getTextContent();
                    String DPI_PDFPath = element.getElementsByTagName("DPI-PDF").item(0).getTextContent();
                    String password = element.getElementsByTagName("PASSWORD").item(0).getTextContent();

                    File DPI_PDF = new File(pathFolder + "" + DPI_PDFPath);

                    if (clientControl.validateInsertClient(code, name, DPI, birth, address, gender, DPI_PDF, password)) {
                        clientDB.insertNewClient(code, name, DPI, birth, address, gender, DPI_PDF, password);
                        NodeList listAccounts = element.getElementsByTagName("CUENTA");
                        insertAccountsClient(listAccounts,code);
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

    private void insertAccountsClient(NodeList listAccounts, String codeClient) {
        AccountDB accountDB = new AccountDB();
        AccountControl accountControl = new AccountControl();
        for (int i = 0; i < listAccounts.getLength(); i++) {
            try {
                Node nodo = listAccounts.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) nodo;
                    
                    String code = element.getElementsByTagName("CODIGO").item(0).getTextContent();
                    String dateCreated = element.getElementsByTagName("CREADA").item(0).getTextContent();
                    String creditStr = element.getElementsByTagName("CREDITO").item(0).getTextContent();
                    Double credit = Double.parseDouble(creditStr);
                    if (accountControl.validateAccount(code, dateCreated, credit, codeClient)) {
                        accountDB.insertNewAccount(code, dateCreated, credit, codeClient);
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }
    
    private void insertTransactions(NodeList listTransactions) {
        TransactionDB transactionDB = new TransactionDB();
        TransactionControl transactionControl = new TransactionControl();
        for (int i = 0; i < listTransactions.getLength(); i++) {
            try {
                Node nodo = listTransactions.item(i);
                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) nodo;
                    String code = element.getElementsByTagName("CODIGO").item(0).getTextContent();
                    String dateTransaction = element.getElementsByTagName("FECHA").item(0).getTextContent();
                    String hourTransaction = element.getElementsByTagName("HORA").item(0).getTextContent();
                    String type = element.getElementsByTagName("TIPO").item(0).getTextContent();                
                    String amount = element.getElementsByTagName("MONTO").item(0).getTextContent();                
                    String codeCashier = element.getElementsByTagName("CAJERO-ID").item(0).getTextContent();                
                    String codeAccount = element.getElementsByTagName("CUENTA-ID").item(0).getTextContent();
                    if (transactionControl.validateNewTransaction(code, dateTransaction, hourTransaction, dateTransaction, amount, code, amount)) {
                        transactionDB.insertNewTransaction(code, dateTransaction, hourTransaction, type, amount, codeCashier, codeAccount);
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
    }

}
