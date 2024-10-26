/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DicomDAO;
import com.vanuston.medeil.implementation.DicomImplementation;
import com.vanuston.medeil.model.DicomModel;
import java.io.File;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Vanitha
 */
public class DicomController extends UnicastRemoteObject implements DicomImplementation {

    public DicomController() throws RemoteException {
        super();

    }
    @Override
    public Object createRecord(Object dicomModel) {
      DicomDAO dicomDAO=new DicomDAO();
         throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
         DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.viewRecord(object);
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
    public Object selectQuery(String query){
       DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.selectQuery(query);
    }

    @Override
    public boolean createRecord(Object dicomModels, int type) throws RemoteException {
       DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.createRecord(dicomModels,type);
    }

    @Override
    public boolean updateQuery(String query) throws RemoteException {
        DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.updateQuery(query);

    }

    @Override
    public File[] selectDicomquery(String query, String type, int num) throws RemoteException {
       DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.selectDicomquery(query,type,num);
    }

    @Override
    public boolean updateRecord(Object dicomModels, int type) throws RemoteException {
        DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.updateRecord(dicomModels,type);
    }

    @Override
    public int selectIDQuery(String query, int type) throws RemoteException {
        DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.selectIDQuery(query,type);
    }

    @Override
    public boolean createStroreQuery(String query, int type, String sub_type) throws RemoteException {
          DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.createStroreQuery(query,type,sub_type);}

    @Override
    public ArrayList<DicomModel> viewAllRecord(Object dicomModel) throws RemoteException {
        DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.viewAllRecord(dicomModel);
    }

    @Override
    public ArrayList<DicomModel> viewRecords(Object dicomModel,String name) throws RemoteException {
       DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.viewRecords(dicomModel,name);
    }

    @Override
    public JasperPrint jasperPrint(int num,int typeNum, JasperReport jasperReport) throws RemoteException {
         DicomDAO dicomDAO=new DicomDAO();
        return dicomDAO.jasperPrint(num,typeNum,jasperReport);
    }

}
