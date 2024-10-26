/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.CustomerModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface Customer extends BaseImplements, Remote {

    public CustomerModel viewAllRecord(Object customerBean) throws RemoteException;

    Object createPatientDetailsRecord(Object object) throws RemoteException;

    Object updatePatientDetailsRecord(Object object) throws RemoteException;

    boolean deletePatientDetailsRecord(Object object) throws RemoteException;

    List<String> getAllergies() throws RemoteException;

    List<String> getHealthConditions() throws RemoteException;

    public int addAllergie(String allergie) throws RemoteException;

    public int addHealthCondition(String healthCondition) throws RemoteException;

    public CustomerModel loadCustomerMaintain() throws RemoteException;

    CustomerModel loadCustomerSearch(String option, String val) throws RemoteException;

    public CustomerModel loadCustomerSearch(String cdate) throws RemoteException;

    public boolean delRecord4(Integer id, String date) throws RemoteException;

    Object updatePatientDetailsRecord2(Object object) throws RemoteException;

    Object createRecordConsult(Object object) throws RemoteException;

    public boolean delRecord5(Integer id, String date) throws RemoteException;

    Object updatePatientDetailsRecord20(Object object) throws RemoteException;

    Object createRecordDischarge(Object object) throws RemoteException;

    public boolean delRecord3(Integer id, String date) throws RemoteException;

    Object updatePatientDetailsRecord1(Object object) throws RemoteException;

    Object createPatientDetailsRecord1(Object object) throws RemoteException;

     public boolean delRecord6 (String id,String date) throws RemoteException;
}
