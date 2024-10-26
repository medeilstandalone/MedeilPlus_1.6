/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.XRayDAO;
import com.vanuston.medeil.implementation.XRayImplements;
import java.rmi.RemoteException;

/**
 *
 * @author Vanitha
 */
public class XRayController implements XRayImplements{

    @Override
    public String selectQuery(String query, int limit, String queryType) {
        XRayDAO xrayDao = new XRayDAO();
        return xrayDao.selectQuery(query, limit, queryType);
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
    public Object selectQueries(String query, int type, String queryType) {
        XRayDAO xrayDao = new XRayDAO();
        return xrayDao.selectQuery(query,type,queryType);
    }

    @Override
    public int selectQry(String query, int type, String queryType) {
        XRayDAO xrayDao = new XRayDAO();
        return xrayDao.selectQry(query,type,queryType);
    }

}
