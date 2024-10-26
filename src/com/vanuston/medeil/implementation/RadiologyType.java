/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

//import com.vanuston.medeil.model.RadiologyTypeModel;
import com.vanuston.medeil.model.RadiologyTypesModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author prave
 */
public interface RadiologyType extends BaseImplements, Remote {
    public boolean create(Object object) throws RemoteException ;
    public boolean createRecords(List<RadiologyTypesModel> models) throws RemoteException ;
}
