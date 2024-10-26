/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

/**
 *
 * @author Administrator
 */
import com.vanuston.medeil.model.PrescriptionModel1;
import java.rmi.RemoteException;
import java.util.ArrayList;

public interface Lab extends BaseImplements {
    ArrayList<PrescriptionModel1> viewAllRecord (Object drugBean) throws RemoteException;
    ArrayList<PrescriptionModel1> SearchRecord (Object drugBean) throws RemoteException;
}
