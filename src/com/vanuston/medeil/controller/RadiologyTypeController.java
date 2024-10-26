/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.RadioloyTypeDAO;
import com.vanuston.medeil.implementation.RadiologyType;
//import com.vanuston.medeil.model.RadiologyTypeModel;
import com.vanuston.medeil.model.RadiologyTypesModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author prave
 */
public class RadiologyTypeController extends UnicastRemoteObject implements RadiologyType {
   
    public RadiologyTypeController() throws RemoteException {
    }

    @Override
    public Object createRecord(Object object) throws RemoteException {
       throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean create(Object object) throws RemoteException {
         RadioloyTypeDAO radiologyDAO= new RadioloyTypeDAO();
       return radiologyDAO.create(object);
         
    }

    @Override
    public boolean createRecords(List<RadiologyTypesModel> models) {
        RadioloyTypeDAO radiologyDAO= new RadioloyTypeDAO();

       return radiologyDAO.createRecords(models);
    }



}
