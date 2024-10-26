/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;


import com.vanuston.medeil.implementation.XRayImplements;
//import com.vanuston.medeil.model.CustomerModel;
import com.vanuston.medeil.model.*;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Vanitha
 */
public class XRayDAO implements XRayImplements {

    static final Logger log = Logger.getLogger(XRayDAO.class, "XRayDAO");

    @Override
    public Object createRecord(Object object) {
        boolean isCreate = false;
        XRayModel xRayModel = (XRayModel) object;
        try {

            int i = 0;
            String sql = "CALL pro_dicominfo_dao(?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setInt(++i, xRayModel.getxRayId());
            cs.setInt(++i, xRayModel.getTypeId());
            cs.setString(++i, xRayModel.getType());
            cs.setString(++i, xRayModel.getSubType());
            cs.setInt(++i, xRayModel.getPatientId());
//           cs.setInt
//
//            cs.setString(++i, "save");
//            cs.setDate(++i, xRayModel.getDicomDate());
//            cs.registerOutParameter(++i, Types.INTEGER);

            cs.executeUpdate();
            int sf = cs.getInt("status_flag");
            if (sf == 1) {
                isCreate = true;
            }
            System.out.println("data save successfully");
        } catch (Exception e) {
            log.debug("Err in createRecord of DicomDAO:" + e.getMessage());
            e.printStackTrace();
        }


        return isCreate;
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
    public String selectQuery(String query, int limit, String queryType) {
        String returnString = "";
        Session sn = DBConnection.getSessionFactory().openSession();
        Query qry;
        try {

            qry = sn.createQuery(query);

            if (limit > 0) {
                qry.setMaxResults(limit);
            }
            List list = qry.list();
            if (list.size() > 0) {
                returnString = "" + list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:XRayDAO selectQry() Exception:" + e.getMessage());
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return returnString;
    }

    @Override
    public Object selectQueries(String query, int type, String queryType) {
        List<CustomerModel> customModel = new ArrayList<CustomerModel>();
        List<XRayModel> xRay = new ArrayList<XRayModel>();
        CustomerModel custom = new CustomerModel();
        XRayModel model = null;
        try {
            if (type == 1) {
                System.out.println("database...");
                ResultSet rs = DBConnection.getStatement().executeQuery(query);
                System.out.println("database execute...");

                while (rs.next()) {
                    model = new XRayModel();
                    System.out.println("database execute...process");
                    model.setPatientId(rs.getInt("cust_id"));
                    model.setPatientCode(rs.getString("cust_code"));
//                    model.setPatientName(rs.getString("cust_name"));
                    model.setPatientName(rs.getString("cusname_mobno"));
                }
                xRay.add(model);
                System.out.println("Success");

            } else if (type == 2) {
                System.out.println("database...");
                ResultSet rs = DBConnection.getStatement().executeQuery(query);
                System.out.println("database execute...");
                if (queryType.equals("id")) {
                    while (rs.next()) {
                        model = new XRayModel();
                        System.out.println("database execute...process");
                        model.setPatientId(rs.getInt("cust_id"));
//                    model.setPatientCode(rs.getString("cust_code"));
//                    model.setPatientName(rs.getString("cust_name"));
//                    model.setPatientName(rs.getString("cusname_mobno"));
                    }
                } else if (queryType.equals("name")) {
                    while (rs.next()) {
                        model = new XRayModel();
                        System.out.println("database execute...process");
//                        model.setPatientId(rs.getInt("cust_id"));
//                    model.setPatientCode(rs.getString("cust_code"));
                        model.setPatientName(rs.getString("cust_name"));
//                    model.setPatientName(rs.getString("cusname_mobno"));
                    }
                } else if (queryType.equals("code")) {
                    while (rs.next()) {
                        model = new XRayModel();
                        System.out.println("database execute...process");
//                        model.setPatientId(rs.getInt("cust_id"));
                        model.setPatientCode(rs.getString("cust_code"));
//                    model.setPatientName(rs.getString("cust_name"));
//                    model.setPatientName(rs.getString("cusname_mobno"));
                    }
                }
                xRay.add(model);
                System.out.println("Success");

            }
        } catch (Exception e) {
            String str = " DicomDAO class having method selectQuery" + e.getMessage();
            log.debug(str);
            e.printStackTrace();
        }

        return xRay;
    }

    @Override
    public int selectQry(String query, int type, String queryType) {
    int count = 0;
    try {
        if (type == 1) {
            System.out.println("database...");

             ResultSet rs = DBConnection.getStatement().executeQuery(query);
            if (rs.next()) {
                count = rs.getInt(1); // Get the count result
            }
        }
    } catch (Exception e) {
        String str = "DicomDAO class having method selectQuery: " + e.getMessage();
        log.debug(str);
        e.printStackTrace();
    }
    return count;
}
}
