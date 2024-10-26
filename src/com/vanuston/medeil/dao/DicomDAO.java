/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.DicomImplementation;
import com.vanuston.medeil.model.CustomerModel;
import com.vanuston.medeil.model.DicomModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.io.File;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.xml.parsers.DocumentBuilderFactory;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;


/**
 *
 * @author Vanitha
 */
public class DicomDAO implements DicomImplementation {

    Logger log = Logger.getLogger(DoctorDAO.class, "DicomDAO");
    public ArrayList<DicomModel> dicomListBean = null;
    public String sql = "";
    public ResultSet rs = null;

    @Override
    public boolean createRecord(Object dicomModels, int type) {
        boolean isCreate = false;
        DicomModel dicomModel = (DicomModel) dicomModels;
        String sql = "";
        java.sql.CallableStatement cs = null;
        try {

            int i = 0;
            switch (type) {
                case 1:
                    sql = "CALL pro_xrayinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);

                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getRecommendation());
                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "save");

                    cs.registerOutParameter(++i, Types.INTEGER);


                    break;
                case 2:
                    sql = "CALL pro_ultrasoundinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);

                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getMeasurements());
                    cs.setString(++i, dicomModel.getRecommendation());
                    cs.setString(++i, dicomModel.getAdditionalNotes());
                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "save");

                    cs.registerOutParameter(++i, Types.INTEGER);

                    break;

                case 4:
                    sql = "CALL pro_echoinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);

                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getMeasurements());
                    cs.setString(++i, dicomModel.getRecommendation());
                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "save");

                    cs.registerOutParameter(++i, Types.INTEGER);

                    break;

                case 6:
                    sql = "CALL pro_mriinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);

                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getSequences());
                    cs.setString(++i, dicomModel.getRecommendation());

                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "save");

                    cs.registerOutParameter(++i, Types.INTEGER);
                    break;
            }

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
    public Object viewRecord(Object dicomModel) throws RemoteException {
        DicomModel dcmModel = (DicomModel) dicomModel;
        int passValue = dcmModel.getPassValue();
        Object dcmObject = null;

        try {

            switch (passValue) {

                case 2:
sql = "SELECT * FROM billing_main bm INNER JOIN billing_sub bs ON bm.billid = bs.billrefid where (bm.status=0 or  bs.status=0) and (bm.billid=" + dcmModel.getDicomId() + " and  bs.billrefid = " + dcmModel.getDicomId() + ")";

                   // sql = "SELECT bm.billid, bm.bill_date, bm.cust_code, bm.cust_name, bm.doctor_name,  bm.patienttypes, bm.status_paid, bs.categoryname, bs.sub_category FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid where bm.status=0 or  bs.status=0 and bm.billid=" + dcmModel.getDicomId() + " and  bs.billrefid = " + dcmModel.getDicomId() + "";
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("cust_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cust_name"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("categoryname"));
                        dcmModel.setDicomSubType(rs.getString("sub_category"));
                        dcmModel.setProcess("Processing");
                        dcmModel.setDicomDate(rs.getDate("bill_date"));
                        dcmModel.setDicomId(rs.getInt("billid"));
                        dcmModel.setPayment(rs.getString("status_paid"));
                        dcmModel.setPatientType(rs.getString("patienttypes"));


                    }
                    dcmObject = dcmModel;
                    break;
                case 3:

                    sql = "select * from xray_files where dicom_id=" + dcmModel.getId() + "";
                    System.out.println(sql);
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
//                    dcmModel.setDicomDate(rs.getDate("bill_date"));
                        dcmModel.setId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));
                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dcmModel.setFileName(rs.getString("file_name"));
                        dcmModel.setFileData(rs.getBytes("xray_file"));
                        dcmModel.setFinding(rs.getString("finding"));
                        dcmModel.setImpression(rs.getString("impression"));
                        dcmModel.setRecommendation(rs.getString("recommendation"));
                        dcmModel.setDicomId(rs.getInt("bill_id"));


                    }
                    break;
                case 4:


                    sql = "select * from ultrasound_files where dicom_id=" + dcmModel.getId() + "";
                    System.out.println(sql);
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
//                    dcmModel.setDicomDate(rs.getDate("bill_date"));
                        dcmModel.setId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));
                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dcmModel.setFileName(rs.getString("file_name"));
                        dcmModel.setFileData(rs.getBytes("ultrasound_file"));
                        dcmModel.setFinding(rs.getString("finding"));
                        dcmModel.setImpression(rs.getString("impression"));
                        dcmModel.setMeasurements(rs.getString("measurements"));
                        dcmModel.setRecommendation(rs.getString("recommendation"));
                        dcmModel.setAdditionalNotes(rs.getString("additionalnotes"));
                        dcmModel.setDicomId(rs.getInt("bill_id"));
                    }
                    break;
                case 5:

                    sql = "select * from echo_files where dicom_id=" + dcmModel.getId() + "";
                    System.out.println(sql);
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
                        dcmModel.setId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));
                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dcmModel.setFileName(rs.getString("file_name"));
                        dcmModel.setFileData(rs.getBytes("echo_filedata"));
                        dcmModel.setFinding(rs.getString("finding"));
                        dcmModel.setImpression(rs.getString("impression"));
                        dcmModel.setObservation(rs.getString("measurements"));
                        dcmModel.setRecommendation(rs.getString("recommendation"));

                        dcmModel.setDicomId(rs.getInt("bill_id"));
                    }
                    break;

                case 6:
                    sql = "select * from mri_files where dicom_id=" + dcmModel.getId() + "";
                    System.out.println(sql);
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
//                    dcmModel.setDicomDate(rs.getDate("bill_date"));
                        dcmModel.setId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));
                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dcmModel.setFileName(rs.getString("file_name"));
                        dcmModel.setFileData(rs.getBytes("mri_filedata"));
                        dcmModel.setFinding(rs.getString("finding"));
                        dcmModel.setImpression(rs.getString("impression"));
                        dcmModel.setSequences(rs.getString("sequence"));
                        dcmModel.setRecommendation(rs.getString("recommendation"));

                        dcmModel.setDicomId(rs.getInt("bill_id"));
                    }
                    break;


            }
        } catch (Exception e) {
            log.debug("Err in viewRecord of DicomDAO:" + e.getMessage());
            e.printStackTrace();
        }
        return dcmModel;
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
    public Object selectQuery(String query) {
        List<CustomerModel> customModel = new ArrayList<CustomerModel>();
        List<DicomModel> dcm = new ArrayList<DicomModel>();
        CustomerModel custom = new CustomerModel();
        DicomModel model = null;
        try {

            System.out.println("database...");
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            System.out.println("database execute...");

            while (rs.next()) {
                model = new DicomModel();
                System.out.println("database execute...process");
                model.setPatientId(rs.getInt("cust_id"));
                model.setPatientCode(rs.getString("cust_code"));
                model.setPatientName(rs.getString("cust_name"));
                model.setMobileNo(rs.getString("mobile_no"));
                model.setCustNameMobileNo(rs.getString("cusname_mobno"));
            }
            dcm.add(model);
            System.out.println("Success");
        } catch (Exception e) {
            String str = " DicomDAO class having method selectQuery" + e.getMessage();
            log.debug(str);
            e.printStackTrace();
        }
        return dcm;
    }

    @Override
    public Object createRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean updateQuery(String query) {
        boolean isCreate = false;

        try {
            int count = DBConnection.getStatement().executeUpdate(query);
            System.out.println("integer" + count);
            if (count > 0) {
                isCreate = true;
                System.out.println("created successfully");
            }

        } catch (Exception e) {
            String str = "DicomDAO class having method updateQuery: " + e.getMessage();
            log.debug(str);
            e.printStackTrace();
        }
        return isCreate;
    }

    @Override
    public File[] selectDicomquery(String query, String type, int num) throws RemoteException {
        List<String> customers = new ArrayList<String>();

        File[] files = null;
        try {

            rs = DBConnection.getStatement().executeQuery(query);
            int j = 0;
            while (rs.next()) {
                customers.add(rs.getString("dicom_file"));
                j++;
            }
            System.out.println(customers);
//            }
            System.out.println(customers + "-----------------");
            files = new File[customers.size()];
            for (int i = 0; i < customers.size(); i++) {
                files[i] = new File(customers.get(i));
            }
        } catch (Exception ex) {
            String ss = "Class : DicomDAO   Method  : selectDicomquery     Exception :" + ex.getMessage();
            log.debug(ss);
            System.out.println("query not properly");
        }
        return files;
    }

    @Override
    public boolean updateRecord(Object dicomModels, int type) throws RemoteException {
        boolean isCreate = false;
        DicomModel dicomModel = (DicomModel) dicomModels;
//        String sql = "";

        java.sql.CallableStatement cs = null;
        try {

            int i = 0;
            switch (type) {
                case 1:

                    sql = "CALL pro_xrayinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);
                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getRecommendation());
                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "update");

                    cs.registerOutParameter(++i, Types.INTEGER);
                    break;

                case 2:
                    sql = "CALL pro_ultrasoundinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);
                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getMeasurements());
                    cs.setString(++i, dicomModel.getRecommendation());
                    cs.setString(++i, dicomModel.getAdditionalNotes());
                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "update");

                    cs.registerOutParameter(++i, Types.INTEGER);
                    break;

                case 4:
                    sql = "CALL pro_echoinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);
                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getMeasurements());
                    cs.setString(++i, dicomModel.getRecommendation());

                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "update");

                    cs.registerOutParameter(++i, Types.INTEGER);
                    break;

                case 6:
                    sql = "CALL pro_mriinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    cs = DBConnection.getConnection().prepareCall(sql);
                    cs.setInt(++i, dicomModel.getId());
                    cs.setInt(++i, dicomModel.getDicomId());
                    cs.setString(++i, dicomModel.getType());
                    cs.setString(++i, dicomModel.getDicomSubType());
                    cs.setString(++i, dicomModel.getDoctorName());
                    cs.setInt(++i, dicomModel.getPatientId());
                    cs.setString(++i, dicomModel.getPatientCode());
                    cs.setString(++i, dicomModel.getPatientName());
                    cs.setString(++i, dicomModel.getMobileNo());
                    cs.setString(++i, dicomModel.getCustNameMobileNo());
                    cs.setString(++i, dicomModel.getDicomFile());
                    cs.setString(++i, dicomModel.getFileName());
                    cs.setBytes(++i, dicomModel.getFileData());
                    cs.setDate(++i, dicomModel.getCurrentDate());
                    cs.setString(++i, dicomModel.getPayment());

                    cs.setDate(++i, dicomModel.getDicomDate());
                    cs.setString(++i, dicomModel.getFinding());
                    cs.setString(++i, dicomModel.getImpression());
                    cs.setString(++i, dicomModel.getSequences());
                    cs.setString(++i, dicomModel.getRecommendation());

                    cs.setString(++i, dicomModel.getPatientType());
                    cs.setString(++i, "update");

                    cs.registerOutParameter(++i, Types.INTEGER);
                    break;




            }

            cs.executeUpdate();
            int sf = cs.getInt("status_flag");
            if (sf == 2) {
                isCreate = true;
            }
            System.out.println("data save successfully");
        } catch (Exception e) {
            log.debug("Err in updateRecord of DicomDAO:" + e.getMessage());
            e.printStackTrace();
        }


        return isCreate;
    }

    @Override
    public int selectIDQuery(String query, int type) throws RemoteException {
        int id = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                id = rs.getInt("dicom_id");
            }
        } catch (Exception ex) {
            String ss = "Class : DicomDAO   Method  : selectIDQuery  Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return id;
    }

    @Override
    public boolean createStroreQuery(String sub_type, int type, String type_Name) throws RemoteException {
        boolean isCreate = false;
//        String sql = "";
        try {
            sql = "CALL pro_check_subname(?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            int i = 0;
            cs.setInt(++i, type);
            cs.setString(++i, type_Name);
            System.out.println(type);
            cs.setString(++i, sub_type);
            System.out.println(sub_type);
            cs.registerOutParameter(++i, Types.INTEGER);
            System.out.println(type_Name);
            int num = cs.executeUpdate();
            System.out.println(num);
            int sf = cs.getInt("status_flag");
            System.out.println(sf);
            if (sf == 1) {
                isCreate = true;
            }
        } catch (Exception ex) {
            String ss = "Class : DicomDAO   Method  : createStroreQuery  Exception :" + ex.getMessage();
            log.debug(ss);
            ex.printStackTrace();
        }
        return isCreate;
    }

    @Override
    public ArrayList<DicomModel> viewAllRecord(Object dicomModel) throws RemoteException {
        dicomListBean = new ArrayList<DicomModel>();
        DicomModel model = (DicomModel) dicomModel;
        int passValue = model.getPassValue();
        DicomModel dcmModel = null;
        try {
            switch (passValue) {
                case 1:
//                sql = "SELECT bm.billid, bm.bill_date, bm.cust_code, bm.cust_name, bm.doctor_name,  bm.patienttypes, bm.status_paid, bs.categoryname, bs.sub_category FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid where bm.status=0 or  bs.status=0 order by bm.bill_date desc";
                    sql = "SELECT * FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid where (bm.status=0 or  bs.status=0) and bs.categoryname='" + model.getType() + "' order by bm.billid desc limit 0,20";
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("cust_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cust_name"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("categoryname"));
                        dcmModel.setDicomSubType(rs.getString("sub_category"));
                        dcmModel.setProcess("New Form");
                        dcmModel.setDicomDate(rs.getDate("bill_date"));
                        dcmModel.setDicomId(rs.getInt("billid"));
                        dcmModel.setPayment(rs.getString("status_paid"));
                        dcmModel.setPatientType(rs.getString("patienttypes"));
                        dicomListBean.add(dcmModel);

                    }
                    break;

                case 2:
                    sql = "SELECT bm.billid, bm.bill_date, bm.cust_code, bm.cust_name, bm.doctor_name,  bm.patienttypes, bm.status_paid, bs.categoryname, bs.sub_category FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid where bm.status=0 or  bs.status=0 and bm.billid=" + dcmModel.getDicomId() + " and  bs.billrefid = " + dcmModel.getDicomId() + "";
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("cust_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cust_name"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("categoryname"));
                        dcmModel.setDicomSubType(rs.getString("sub_category"));
                        dcmModel.setProcess("New Form");
                        dcmModel.setDicomDate(rs.getDate("bill_date"));
                        dcmModel.setDicomId(rs.getInt("billid"));
                        dcmModel.setPayment(rs.getString("status_paid"));
                        dcmModel.setPatientType(rs.getString("patienttypes"));
                        dicomListBean.add(dcmModel);

                    }
                    break;


                case 10:
                    sql = "select DISTINCT dicom_id,patient_code,doctor_name,cusname_mobno,patient_type,type,subType,dicom_date,payment from " + model.getProcess() + " where status_code = 1 order by dicom_id desc limit 0,20";
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
                        dcmModel.setDicomDate(rs.getDate("dicom_date"));
                        dcmModel.setDicomId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));

                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dicomListBean.add(dcmModel);

                    }
                    break;

                case 11:
                    sql = "select DISTINCT dicom_id,patient_code,doctor_name,cusname_mobno,patient_type,type,subType,dicom_date,payment from " + model.getProcess() + " where status_code = 1 and doctor_name LIKE '%" + model.getDoctorName() + "%' order by dicom_id desc limit 0,20";
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
                        dcmModel.setDicomDate(rs.getDate("dicom_date"));
                        dcmModel.setDicomId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));

                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dicomListBean.add(dcmModel);

                    }
                    break;

                case 12:
                    sql = "select * from " + model.getProcess() + " where status_code = 1 and (cusname_mobno LIKE '%" + model.getCustNameMobileNo() + "%' and doctor_name  LIKE '%" + model.getDoctorName() + "%' ) or cusname_mobno LIKE '%" + model.getCustNameMobileNo() + "%' order by dicom_id desc limit 0,20";
                    rs = DBConnection.getStatement().executeQuery(sql);
                    while (rs.next()) {
                        dcmModel = new DicomModel();
                        dcmModel.setPatientCode(rs.getString("patient_code"));
                        dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                        dcmModel.setDoctorName(rs.getString("doctor_name"));
                        dcmModel.setType(rs.getString("type"));
                        dcmModel.setDicomSubType(rs.getString("subType"));
                        dcmModel.setProcess("Completed");
                        dcmModel.setDicomDate(rs.getDate("dicom_date"));
                        dcmModel.setDicomId(rs.getInt("dicom_id"));
                        dcmModel.setPayment(rs.getString("payment"));

                        dcmModel.setPatientType(rs.getString("patient_type"));
                        dicomListBean.add(dcmModel);

                    }
                    break;


            }

        } catch (Exception e) {
            log.debug("Err in viewAllRecord of DicomDAO:" + e.getMessage());
            e.printStackTrace();
        }

        return dicomListBean;
    }

    @Override
    public ArrayList<DicomModel> viewRecords(Object dicomModel, String name) throws RemoteException {
        dicomListBean = new ArrayList<DicomModel>();
        DicomModel dcmModel = (DicomModel) dicomModel;
        int passValue = dcmModel.getPassValue();
        try {
            if (passValue == 13) {
//                sql = "SELECT bm.billid, bm.bill_date, bm.cust_code, bm.cust_name, bm.doctor_name,  bm.patienttypes, bm.status_paid, bs.categoryname, bs.sub_category FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid where bm.status=0 or  bs.status=0 and bm.cust_code like %'"+name+"'% or bm.cust_name like %'"+name+"'% or bm.doctor_name like %'"+name+"'%";
                sql = "SELECT * FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid WHERE (bm.status = 0 OR bs.status = 0) AND (bm.cust_code LIKE '%" + name + "%' OR bm.cust_name LIKE '%" + name + "%' OR bm.doctor_name LIKE '%" + name + "%') and bs.categoryname='" + dcmModel.getType() + "'";

                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    dcmModel = new DicomModel();
                    dcmModel.setPatientCode(rs.getString("cust_code"));
                    dcmModel.setCustNameMobileNo(rs.getString("cust_name"));
                    dcmModel.setDoctorName(rs.getString("doctor_name"));
                    dcmModel.setType(rs.getString("categoryname"));
                    dcmModel.setDicomSubType(rs.getString("sub_category"));
                    dcmModel.setProcess("New Form");
                    dcmModel.setDicomDate(rs.getDate("bill_date"));
                    dcmModel.setDicomId(rs.getInt("billid"));
                    dcmModel.setPayment(rs.getString("status_paid"));
                    dcmModel.setPatientType(rs.getString("patienttypes"));
                    dicomListBean.add(dcmModel);

                }
            } else if (passValue == 1) {
//                sql = "SELECT bm.billid, bm.bill_date, bm.cust_code, bm.cust_name, bm.doctor_name,  bm.patienttypes, bm.status_paid, bs.categoryname, bs.sub_category FROM billing_main bm JOIN billing_sub bs ON bm.billid = bs.billrefid where bm.status=0 or  bs.status=0 and bm.cust_code like %'"+name+"'% or bm.cust_name like %'"+name+"'% or bm.doctor_name like %'"+name+"'%";
                sql = "SELECT * FROM " + dcmModel.getProcess() + " WHERE status_code = 1 AND (patient_code LIKE '%" + name + "%' OR cusname_mobno LIKE '%" + name + "%' OR doctor_name LIKE '%" + name + "%') order by dicom_id desc";

                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    dcmModel = new DicomModel();
                    dcmModel.setPatientCode(rs.getString("patient_code"));
                    dcmModel.setCustNameMobileNo(rs.getString("cusname_mobno"));
                    dcmModel.setDoctorName(rs.getString("doctor_name"));
                    dcmModel.setType(rs.getString("type"));
                    dcmModel.setDicomSubType(rs.getString("subType"));
                    dcmModel.setProcess("Completed");
                    dcmModel.setDicomDate(rs.getDate("dicom_date"));
                    dcmModel.setDicomId(rs.getInt("dicom_id"));
                    dcmModel.setPayment(rs.getString("payment"));
                    dcmModel.setPatientType(rs.getString("patient_type"));
                    dicomListBean.add(dcmModel);

                }


            }
        } catch (Exception e) {
            log.debug("Err in viewRecords of DicomDAO:" + e.getMessage());
            e.printStackTrace();
        }



        return dicomListBean;
    }

    @Override
    public JasperPrint jasperPrint(int dicomId, int typeNum, JasperReport jasperReport) throws RemoteException {
        JasperPrint jasperPrint = null;
        try {

            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("dicom_id", dicomId);
            jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());

        } catch (Exception ex) {
            // System.out.println("Class : SalesDAO Method : jasperPrint     Exception :"+ ex);
            String ss = " Class : DicomDAO Method : jasperPrint     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return jasperPrint;
    }
}
