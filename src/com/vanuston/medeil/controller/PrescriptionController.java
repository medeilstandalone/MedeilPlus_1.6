/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.PrescriptionDAO;
import com.vanuston.medeil.implementation.Prescription;
import com.vanuston.medeil.model.DrugSpecificationModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public class PrescriptionController extends UnicastRemoteObject implements Prescription {

    public PrescriptionController() throws RemoteException {
        super();
    }    

    @Override
    public Object createRecord(Object object) throws RemoteException {
       System.out.println("createRecord");
        return new PrescriptionDAO().createRecord(object);


    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        return new PrescriptionDAO().viewRecord(object);
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        return new PrescriptionDAO().updateRecord(object);
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        return new PrescriptionDAO().deleteRecord(object);
    }

    @Override
    public Object viewAllRecord(String recId, String searchType) {
        return new PrescriptionDAO().viewAllRecord(recId, searchType);
    }
     @Override
    public Object viewfirstAllRecord(String recId) {
        return new PrescriptionDAO().viewfirstAllRecord(recId);
    }

    @Override
    public int insertDrugSpecification(DrugSpecificationModel drugSpecificationModel) throws RemoteException {
        return new PrescriptionDAO().insertDrugSpecification(drugSpecificationModel);
    }

    @Override
    public List<String> getSymptoms() {
        return new PrescriptionDAO().getSymptoms();
    }

    @Override
    public int addSymptom(String symptom,String user) throws RemoteException {
        return new PrescriptionDAO().addSymptom(symptom,user);
    }

    @Override
    public Object createRecord1(Object object) throws RemoteException {
       return new PrescriptionDAO().createRecord1(object);
    }

    @Override
    public Object viewRecord1( String name,String date) throws RemoteException {
         return new PrescriptionDAO().viewRecord1(name, date);
    }

    @Override
    public Object viewRecord2( String name) throws RemoteException {
         return new PrescriptionDAO().viewRecord2(name);
    }

      @Override
    public Object viewRecord3( String name) throws RemoteException {
         return new PrescriptionDAO().viewRecord3(name);
    }

    @Override
    public Object updateRecord1 (Object object) {
         return new PrescriptionDAO().updateRecord1(object);
    }

    @Override
    public Object updateRecord2 (Object object) {
         return new PrescriptionDAO().updateRecord2(object);
    }

    @Override
    public boolean deleteRecord1(Object object) throws RemoteException {
        return new PrescriptionDAO().deleteRecord1(object);
    }

    @Override
    public Object createRecord2(Object object) throws RemoteException {
        return new PrescriptionDAO().createRecord2(object);
    }
}
