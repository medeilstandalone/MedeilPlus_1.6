/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.mysql.jdbc.Connection;
import com.vanuston.medeil.implementation.RadiologyType;
//import com.vanuston.medeil.model.RadiologyTypeModel;
import com.vanuston.medeil.model.RadiologyTypesModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author prave
 */
public class RadioloyTypeDAO implements RadiologyType {

    static Logger log = Logger.getLogger(RadioloyTypeDAO.class, "com.vanuston.medeil.dao.RadioloyTypeDAO");

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
    public boolean create(Object object) throws RemoteException {
        boolean isCreate=false;
        try {
        
            RadiologyTypesModel model = (RadiologyTypesModel) object;
            String sql = "CALL pro_radiologytype(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
       java.sql.Connection con=     DBConnection.getConnection();
  java.sql.PreparedStatement pst= DBConnection.getConnection().prepareStatement(sql);
            // Set positional parameters (1-based index)
            cs.setString(1, model.getDoctorName());
            cs.setString(2, model.getPatientName());
            cs.setString(3, model.getRadiologySubtype());
            cs.setInt(4, model.getAge());
            cs.setString(5, model.getGender());
            cs.setString(6, model.getRadiologyType());
            cs.setString(7, model.getDiagnosis());
            cs.setInt(8, model.getRadiologyTypeNo());
            System.out.println("ggg");
            System.out.println("check");
            System.out.println(isCreate);
            // Convert java.util.Date to java.sql.Date
            java.sql.Date sqlDate = new java.sql.Date(model.getDate().getTime());
            cs.setDate(9, sqlDate);

            cs.setString(10, model.getMobileNo());
            cs.setString(11, model.getCustCode());
            System.out.println(model.getAmount());
            cs.setString(12, model.getAmount());

            cs.setInt(13, model.getStatus());

            cs.executeUpdate();
            System.out.println("ee");
            // Check the OUT parameter value

            if (cs.getInt(14) == 0) {
                System.out.println("trueeeeeeeeeeeeeee");
                isCreate = true;
            } else {
                isCreate = false;
            }


        } catch (Exception e) {
            log.debug("Class : RadiologyTypeDAO  Method : create() Exception : " + e.getMessage());
            System.out.println(e.getMessage());
        }

        return isCreate;


    }

    @Override
    public Object createRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
     @Override
    public boolean createRecords(List<RadiologyTypesModel> models) {
        boolean isCreated = true; // Assume all will be created until one fails
        java.sql.Connection conn = null;
        java.sql.CallableStatement cs = null;

        try {
            // Establish a database connection
            conn = DBConnection.getConnection();
            // Prepare the stored procedure call
            String sql = "{CALL pro_radiologytype(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}";
            cs = conn.prepareCall(sql);

            // Start a transaction
            conn.setAutoCommit(false);

            for (RadiologyTypesModel model : models) {
                // Set parameters for each record
               cs.setString(1, model.getDoctorName());
            cs.setString(2, model.getPatientName());
            cs.setString(3, model.getRadiologySubtype());
            cs.setInt(4, model.getAge());
            cs.setString(5, model.getGender());
            cs.setString(6, model.getRadiologyType());
            cs.setString(7, model.getDiagnosis());
            cs.setInt(8, model.getRadiologyTypeNo());

            // Convert java.util.Date to java.sql.Date
            java.sql.Date sqlDate = new java.sql.Date(model.getDate().getTime());
            cs.setDate(9, sqlDate);

            cs.setString(10, model.getMobileNo());
            cs.setString(11, model.getCustCode());
            System.out.println(model.getAmount());
            cs.setString(12, model.getAmount());

            cs.setInt(13, model.getStatus()); // Register output parameter for status flag
            cs.setString(14, model.getPaidStatus());
                // Execute the stored procedure
                cs.execute();

                // Check the output status flag
                int statusFlag = cs.getInt(15); // Get the output status flag
                if (statusFlag != 0) {
                    isCreated = false; // If any insert fails, set isCreated to false
                    break; // Exit the loop if one insert fails
                }
            }

            if (isCreated) {
                conn.commit(); // Commit if all records were successful
                System.out.println("All records saved successfully.");
            } else {
                conn.rollback(); // Roll back if any insert failed
                System.out.println("Failed to save some records, rolling back.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Exception occurred: " + e.getMessage());
            // Rollback in case of error
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        } 
        return isCreated;
    }
}

    


//


//
