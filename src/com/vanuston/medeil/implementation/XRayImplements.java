/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import java.rmi.Remote;

/**
 *
 * @author Vanitha
 */
public interface XRayImplements extends BaseImplements, Remote{
    public String selectQuery(String query,int limit,String queryType);
    public Object selectQueries(String query,int type,String queryType);
    public int selectQry(String query,int type,String queryType);

}
