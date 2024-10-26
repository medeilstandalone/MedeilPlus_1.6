/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DrugDAO;
import com.vanuston.medeil.dao.LabDAO;
import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.implementation.Lab;
//import com.vanuston.medeil.model.DrugModel;
import com.vanuston.medeil.model.PrescriptionModel1;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Administrator
 */
public class LabController extends UnicastRemoteObject implements Lab {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
        public static Logger log = Logger.getLogger(LabController.class, "LabController");
	public LabController() throws RemoteException {
        super () ;
    }
    
    @Override
    public ArrayList<PrescriptionModel1> viewAllRecord(Object drugObject) {
        List<PrescriptionModel1> drugList = new ArrayList<PrescriptionModel1>();
        //Drug drugAll=null;
        try {
            LabDAO ddao = new LabDAO();
            PrescriptionModel1 drugBean = (PrescriptionModel1) drugObject;
            drugList = ddao.viewAllRecord(drugBean);
        } catch (Exception e) {
            log.debug("class : DrugController Method : viewAllRecord() Exception:"+e.getMessage());            
        }
        return (ArrayList<PrescriptionModel1>) drugList;
    }
	
	//Generic Search Method
    @Override
    public ArrayList<PrescriptionModel1> SearchRecord(Object drugObject) {
        List<PrescriptionModel1> drugList = new ArrayList<PrescriptionModel1>();
        try {
            LabDAO ddao = new LabDAO();
            PrescriptionModel1 drugBean = (PrescriptionModel1) drugObject;
            drugList = ddao.SearchRecord(drugBean);
        } catch (Exception e) {
            log.debug("class : DrugController Method : SearchRecord() Exception:"+e.getMessage());
        }
        return (ArrayList<PrescriptionModel1>) drugList;
    }

    @Override
    public Object createRecord(Object drugBean) {
        Object flag = false;
        try {
            PrescriptionModel1 ddao = new PrescriptionModel1();
            flag = ddao.createRecord(drugBean);
        } catch (Exception e) {
            log.debug("Method:createRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
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

 /*   @Override
    public Object updateRecord(Object drugBeans) {
        Object flag = false;
        try {
            DrugModel drugBean = (DrugModel) drugBeans;
            DrugDAO ddao = new DrugDAO();
            flag = ddao.updateRecord(drugBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object drugBeans) {
        try {
            Object drugBean = (DrugModel) drugBeans;
            DrugDAO ddao = new DrugDAO();
            drugBeans = ddao.viewRecord(drugBean);
        } catch (Exception e) {
            log.debug("Method:viewRecord Exception:"+e.getMessage());
        }
        return drugBeans;
    }

    @Override
    public boolean deleteRecord(Object drugBeans) {
        boolean flag = false;
        try {
            DrugDAO ddao = new DrugDAO();
            DrugModel drugBean = (DrugModel) drugBeans;
            flag = ddao.deleteRecord(drugBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
*/
  


}
