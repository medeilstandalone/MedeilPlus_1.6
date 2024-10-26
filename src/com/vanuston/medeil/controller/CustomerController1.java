/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.CustomerDAO1;
import com.vanuston.medeil.implementation.Customer1;
import com.vanuston.medeil.model.CustomerModel1;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class CustomerController1 extends UnicastRemoteObject implements Customer1 {

    public CustomerController1() throws RemoteException {
    }

 

  

    @Override
    public CustomerModel1 viewAllRecord(Object customerBeans) throws RemoteException {
        CustomerModel1 cusomterList = new CustomerModel1();
        try {
            CustomerDAO1 CustomerDAO1 = new CustomerDAO1();
            CustomerModel1 customerBean = (CustomerModel1) customerBeans;
            cusomterList = CustomerDAO1.viewAllRecord(customerBean);
        } catch (Exception e) {
        }
        return cusomterList;
    }

  
  @Override
    public CustomerModel1 loadCustomerSearch(String option, String val) throws RemoteException {
          CustomerDAO1 CustomerDAO1=new CustomerDAO1();
        return CustomerDAO1.loadCustomerSearch(option, val);
    }

    @Override
    public CustomerModel1 loadCustomerMaintain() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

   

    @Override
    public List<String> getAllergies() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<String> getHealthConditions() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int addAllergie(String allergie) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int addHealthCondition(String healthCondition) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object viewRecord(Object name) {
        CustomerDAO1 customerDAO = new CustomerDAO1();
        return customerDAO.viewRecord(name);
    }

    @Override
    public Object viewRecord1(Object name) {
        CustomerDAO1 customerDAO = new CustomerDAO1();
        return customerDAO.viewRecord1(name);
    }

    @Override
    public Object viewRecord2(Object name) {
        CustomerDAO1 customerDAO = new CustomerDAO1();
        return customerDAO.viewRecord2(name);
    }
     @Override
    public Object viewRecord3(Object name) {
        CustomerDAO1 customerDAO = new CustomerDAO1();
        return customerDAO.viewRecord3(name);
    }

    @Override
    public Object viewRecord5(Object name) throws RemoteException{
        CustomerDAO1 customerDAO = new CustomerDAO1();
        return customerDAO.viewRecord5(name);
    }

 
 

 


}
