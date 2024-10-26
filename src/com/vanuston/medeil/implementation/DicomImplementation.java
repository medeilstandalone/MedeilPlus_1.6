/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.DicomModel;
import java.io.File;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.ArrayList;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Vanitha
 */
public interface DicomImplementation extends BaseImplements, Remote {

    public Object selectQuery(String query) throws RemoteException;

    public int selectIDQuery(String query, int type) throws RemoteException;

    public boolean createRecord(Object dicomModels, int type) throws RemoteException;

    public boolean createStroreQuery(String query, int type, String sub_type) throws RemoteException;

    public boolean updateQuery(String query) throws RemoteException;

    public File[] selectDicomquery(String query, String type, int num) throws RemoteException;

    public boolean updateRecord(Object dicomModels, int type) throws RemoteException;

    public ArrayList<DicomModel> viewAllRecord (Object dicomModel) throws RemoteException;

    public ArrayList<DicomModel> viewRecords (Object dicomModel,String name) throws RemoteException;
    
    JasperPrint jasperPrint(int num,int typeNum, JasperReport jasperReport) throws RemoteException;



}
