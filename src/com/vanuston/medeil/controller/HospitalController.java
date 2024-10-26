/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.HospitalDAO;
import com.vanuston.medeil.implementation.Hospital;
import com.vanuston.medeil.model.HospitalModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;


/**
 *
 * @author Administrator
 */
public class HospitalController extends UnicastRemoteObject implements Hospital {

    public HospitalController() throws RemoteException {
        super();
    }

    @Override
    public Object createRecord(Object hospitalModels) {
        HospitalModel hospitalModel=(HospitalModel)hospitalModels;
        HospitalDAO hospitalDAO = new HospitalDAO();
        return hospitalDAO.createRecord(hospitalModel);
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        return new HospitalDAO().viewRecord("");
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
