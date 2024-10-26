/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public interface Appointment extends BaseImplements, Remote {
public String selectQry(String query, int limit, String queryType) throws RemoteException;
 public int selectQrys(String query) throws RemoteException;
public int insertQry(String query) throws RemoteException;
public void checkDoctorAvailability(String fromTime, String toTime,String dayOfWeek) throws RemoteException;
}
