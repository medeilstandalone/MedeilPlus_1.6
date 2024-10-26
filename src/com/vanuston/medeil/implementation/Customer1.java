/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.CustomerModel1;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface Customer1 extends Remote {

    public CustomerModel1 viewAllRecord(Object customerBean) throws RemoteException;
   //sabarish Object createPatientDetailsRecord (Object object) throws RemoteException;
    //sabarish Object updatePatientDetailsRecord (Object object) throws RemoteException;
    //sabarishboolean deletePatientDetailsRecord (Object object) throws RemoteException;
    List<String> getAllergies() throws RemoteException;
    List<String> getHealthConditions() throws RemoteException;
    public int addAllergie(String allergie) throws RemoteException;
    public int addHealthCondition(String healthCondition) throws RemoteException;
    CustomerModel1 loadCustomerSearch(String option,String val) throws RemoteException;
   public CustomerModel1 loadCustomerMaintain()throws RemoteException;
   Object viewRecord (Object object) throws RemoteException;//sabarish
    Object viewRecord1 (Object object) throws RemoteException;//sabarish
    Object viewRecord2 (Object object) throws RemoteException;//sabarish
    Object viewRecord3 (Object object) throws RemoteException;//sabarish
    Object viewRecord5 (Object object) throws RemoteException;//sabarish
   //sabarish Object viewRecord4 (Object object) throws RemoteException;//sabarish

    

    }
