/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.AppointmentDAO;
import com.vanuston.medeil.implementation.Appointment;
import com.vanuston.medeil.model.AppointmentModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public class AppointmentController extends UnicastRemoteObject implements Appointment {
    AppointmentDAO appointmentDAO =new AppointmentDAO();
    public AppointmentController() throws RemoteException {
         super();
     }
    @Override
    public Object createRecord(Object object) throws RemoteException {
        Object flag = false;
        try {
            AppointmentModel appointmentModel = (AppointmentModel) object;
            AppointmentDAO appointmentDao = new AppointmentDAO();
            flag =appointmentDao.createRecord(appointmentModel);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        return appointmentDAO.viewRecord(object);
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        Object flag = false;
        try {
            AppointmentModel appointmentModel = (AppointmentModel) object;
            AppointmentDAO appointmentDao = new AppointmentDAO();
            flag =appointmentDao.updateRecord(appointmentModel);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String selectQry(String query, int limit,String queryType) {
        return appointmentDAO.selectQry(query, limit, queryType);
    }

    @Override
    public int selectQrys(String query) {
        return appointmentDAO.selectQrys(query);

    }






    @Override
    public int insertQry(String query) {
        return appointmentDAO.insertQry(query);
    }

    @Override
    public void checkDoctorAvailability(String fromTime, String toTime, String dayOfWeek) throws RemoteException {

    }
}
