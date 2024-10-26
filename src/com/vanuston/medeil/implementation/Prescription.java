/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.DrugSpecificationModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public interface Prescription extends BaseImplements, Remote {
    public Object viewAllRecord(String recId, String searchType) throws RemoteException;
    public int insertDrugSpecification(DrugSpecificationModel drugSpecificationModel) throws RemoteException;
    List<String> getSymptoms() throws RemoteException;
    public int addSymptom(String symptom,String user) throws RemoteException;
    Object createRecord1 (Object object) throws RemoteException;
    Object createRecord2 (Object object) throws RemoteException;//sabarish
    Object viewRecord1 (String name,String date) throws RemoteException;
    Object viewRecord2 (String name) throws RemoteException;
    Object viewRecord3 (String name) throws RemoteException;
    Object updateRecord1 (Object object) throws RemoteException;
    Object updateRecord2 (Object object) throws RemoteException;
    boolean deleteRecord1 (Object object) throws RemoteException;
     public Object viewfirstAllRecord(String recId) throws RemoteException;
}
