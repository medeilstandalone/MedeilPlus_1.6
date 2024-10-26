/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.DailyCashBookModel;
import com.vanuston.medeil.model.VitalScienceModel;
import com.vanuston.medeil.model.DischargeModel;
import com.vanuston.medeil.model.ServiceModel;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Value;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;
import javax.xml.parsers.DocumentBuilderFactory;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Administrator
 */
public class CommonDAO implements CommonImplements {

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    static Logger log = Logger.getLogger(CommonDAO.class, "com.vanuston.medeil.DAO.CommonDAO");
    public static String dTime = "";

    @Override
    public String getAutoIncrement(String date, String name) {
        String autoVal = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_getAutoIncrement('" + DateUtils.changeFormatDate(date) + "','" + name + "');");
            while (rs.next()) {
                autoVal = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getAutoIncrement Exception:" + ex.getMessage() + " Form Name :" + name;
            log.debug(ss);
        }
        return autoVal;
    }

    //padmini
    @Override
    public List<String> getBloodgroup(String name) throws RemoteException {

        List<String> bloodgroup = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(bloodgroup) from bloodgrpmaster where status=0");
            } else {
            rs = DBConnection.getStatement().executeQuery("select distinct(bloodgroup) from bloodgrpmaster where bloodgroup like '" + name + "%'  and status=0");
            }
            int i = 0;
            while (rs.next()) {
                bloodgroup.add(rs.getString("bloodgroup"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getBloodgroup     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return bloodgroup;
    }

    @Override
    public List<String> getSmoking(String name) throws RemoteException {
        List<String> smoking = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(historystatus) from customerhistory where status=0");
            } else {
            rs = DBConnection.getStatement().executeQuery("select distinct(historystatus) from customerhistory where historystatus like '" + name + "%' and status=0");
            }
            int i = 0;
            while (rs.next()) {
                smoking.add(rs.getString("historystatus"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getSmoking     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return smoking;

    }

    @Override
    public List<String> customerName(String name) {
        // System.out.println("customerName  "+name);
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("customerName "+name);
            ResultSet rs = null;
            if (name.equals("")) {
               // rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
        // org  // rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_flag_id!=1");
           rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name,mobile_no,cust_code from cust_information where cust_flag_id!=1");
            } else {
               rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name,mobile_no,cust_code from cust_information where cusname_mobno like'%" + name + "%' or cust_code LIKE '%" + name + "%' and cust_flag_id!=1 ");
                //rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_name like'" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'" + name + "%' and cust_flag_id!=1");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }
 @Override
    public List<String> prctcustomerName1(String name) {
        // System.out.println("customerName  "+name);
       System.out.println("Edit2");
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("customerName "+name);
            ResultSet rs = null;
            if (name.equals("")) {
rs = DBConnection.getStatement().executeQuery(
             "SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE app_status = 0" );
  // System.out.println("SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE app_status = 0");
      // rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
            rs = DBConnection.getStatement().executeQuery("select patient_name as cust_name from medp_appointment_mt where app_status=0");
            } else {
              //  rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name from cust_information where cusname_mobno like'%" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'%" + name + "%' and cust_flag_id!=1");
 rs = DBConnection.getStatement().executeQuery(
               "SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE (patient_name LIKE '%" + name + "%' OR cust_code LIKE '%" + name + "%') AND app_status = 0"
            );

 //"SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE patient_name LIKE '%" + name + "%' OR cust_code LIKE '%" + name + "%' AND app_status = 0"



 System.out.println("SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE (patient_name LIKE '%" + name + "%' OR cust_code LIKE '%" + name + "%') AND app_status = 0");
            //old// rs = DBConnection.getStatement().executeQuery("select patient_name as cust_name from medp_appointment_mt where patient_name like'" + name + "%' and app_status=0");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }
     System.out.println(customers);
        System.out.println("customers");
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;

    }


















//    @Override
//public List<String> prctcustomerName1(String name) {
//    System.out.println("Antony");
//   List<String> customers = new ArrayList<String>();
//
//    try {
//        ResultSet rs = null;
//        if (name.equals("")) {
//            rs = DBConnection.getStatement().executeQuery(
//                "SELECT patient_name AS cust_name, cust_code FROM medp_appointment_mt WHERE app_status = 0"
//            );
//        } else {
//            rs = DBConnection.getStatement().executeQuery(
//                "SELECT patient_name AS cust_name, cust_code FROM medp_appointment_mt WHERE patient_name LIKE '%" + name + "%' OR cust_code LIKE '%" + name + "%' AND app_status = 0"
//            );
//        }
// System.out.println("Antony1");
//        while (rs.next()) {
//            customers.add(rs.getString("cust_name"));
//        }
//
//    } catch (Exception ex) {
//        String ss = "Class: CommonDAO, Method: prctcustomerName1, Exception: " + ex.getMessage();
//        log.debug(ss);
//    }
//    return customers;
//}
//
//
//
//











//    @Override
//    public List<String> prctcustomerName1(String name) {
//        // System.out.println("customerName  "+name);
//       System.out.println("Antony");
//        List<String> customers = new ArrayList<String>();
//
//        try {
//            // System.out.println("customerName "+name);
//            ResultSet rs = null;
//            if (name.equals("")) {
//
//      // rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
//
//                rs = DBConnection.getStatement().executeQuery("select patient_name as cust_name,cust_code from medp_appointment_mt where app_status=1");
//            } else {
//              //  rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name from cust_information where cusname_mobno like'%" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'%" + name + "%' and cust_flag_id!=1");
//
//             rs = DBConnection.getStatement().executeQuery("select patient_name as cust_name,cust_code from medp_appointment_mt where patient_name like'%" + name + "%' or cust_code Like '%" + name + "%' and app_status=1");
//            }
//            int i = 0;
//            while (rs.next()) {
//                customers.add(rs.getString("cust_name"));
//                i++;
//            }
//
//        } catch (Exception ex) {
//            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
//            log.debug(ss);
//        }
//        return customers;
//    }
//
//














//     @Override
//    public List<String> prctcustomerName(String name) {
//        // System.out.println("customerName  "+name);
//        List<String> customers = new ArrayList<String>();
//
//        try {
//            // System.out.println("customerName "+name);
//            ResultSet rs = null;
//            if (name.equals("")) {
//                rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',age,' - ',mobile_no) as cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
//            } else {
//                rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',age,' - ',mobile_no) as cust_name from cust_information where cust_name like'" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'" + name + "%' and cust_flag_id!=1");
//            }
//            int i = 0;
//            while (rs.next()) {
//                customers.add(rs.getString("cust_name"));
//                i++;
//            }
//
//        } catch (Exception ex) {
//            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
//            log.debug(ss);
//        }
//        return customers;
//    }
//
 @Override
    public List<String> prctcustomerName(String name) {
        // System.out.println("customerName  "+name);
         System.out.println("Edit4");
        List<String> customers = new ArrayList<String>();
    System.out.println("Eeeeeeeeeeeee");
        try {
            // System.out.println("customerName "+name);
            ResultSet rs = null;
            if (name.equals("")) {

      // rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
          rs = DBConnection.getStatement().executeQuery( "SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE app_status = 0" );
                //old rs = DBConnection.getStatement().executeQuery("select patient_name as cust_name from medp_appointment_mt where app_status=0");
            } else {
              //  rs = DBConnection.getStatement().executeQuery("select cusname_mobno as cust_name from cust_information where cusname_mobno like'%" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'%" + name + "%' and cust_flag_id!=1");
      rs = DBConnection.getStatement().executeQuery( "SELECT patient_name as cust_name , cust_code FROM medp_appointment_mt WHERE (patient_name LIKE '%" + name + "%' OR cust_code LIKE '%" + name + "%') AND app_status = 0"
            );
            //old  rs = DBConnection.getStatement().executeQuery("select patient_name as cust_name from medp_appointment_mt where patient_name like'%" + name + "%' and app_status=0");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }


    @Override
    public List<String> customerName21(String name) {
        // System.out.println("customerName21 DAO:  "+name);
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("customerName "+name);
            ResultSet rs = null;
            if (name.equals("")) {
                System.out.println("customerName21 DAO if:  " + name);

                //rs = DBConnection.getStatement().executeQuery("select labtestreportid from lab_report_main where status!=2 union all select labautoid from lab_report_main where status!=2");
                rs = DBConnection.getStatement().executeQuery("select labautoid from lab_report_main where status!=2");
            } else {
                System.out.println("customerName21 DA else:  " + name);
                //rs = DBConnection.getStatement().executeQuery("select labtestreportid from lab_report_main where labautoid like'" + name + "%' and status!=2 union all select labautoid from lab_report_main where status!=2 and labautoid like'" + name + "%' ");
                rs = DBConnection.getStatement().executeQuery("select labautoid from lab_report_main where status!=2 and labautoid like'" + name + "%' ");
            }
            int i = 0;
            while (rs.next()) {
                //customers.add(rs.getString("labtestreportid"));
                customers.add(rs.getString("labautoid"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName21     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName10(String name) {
        List<String> customers = new ArrayList<String>();
        // System.out.println("CommonDao customerName2: "+name);
        try {
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name.equals("")) {

                rs = DBConnection.getStatement().executeQuery("select custid, cust_code, cust_name from medicalhistory where status <2 and date ='" + date2 + "'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from medicalhistory where status <2 and date ='" + date2 + "'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName10     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName6(String name) {
        // System.out.println("customerName6  "+name);
        List<String> customers = new ArrayList<String>();

        try {
            System.out.println("customerName " + name);
            ResultSet rs = null;
            if (name.equals("")) {
                //  System.out.println("customerName6  ifffff");


               rs = DBConnection.getStatement().executeQuery(" select cusname_mobno as cust_name,mobile_no,cust_code from cust_information where cust_flag_id!=1");
              //old  rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_flag_id!=1 ");
            } else {
               rs = DBConnection.getStatement().executeQuery(" select cusname_mobno as cust_name,mobile_no,cust_code from cust_information where cusname_mobno like'%" + name + "%' or cust_code LIKE '%" + name + "%' and cust_flag_id!=1 ");
             //old   rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_name like'%" + name + "%' and cust_flag_id!=1 ");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                // customers.add(rs.getString("cust_code"));
                // System.out.println(rs.getString("cust_name")+" / "+rs.getString("cust_code"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName6     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName11(String name) {
        // System.out.println("customerName6  "+name);
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("customerName "+name);
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
            } else {
                rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_name like'%" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'" + name + "%' and cust_flag_id!=1");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                // customers.add(rs.getString("cust_code"));
                // System.out.println(rs.getString("cust_name")+" / "+rs.getString("cust_code"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName11     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName4(String name) {
        // System.out.println("  "+name);
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("customerName4"+name);
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_flag_id!=1 union all select cust_code from cust_information where cust_flag_id!=1");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_name like'" + name + "%' and cust_flag_id!=1 union all select cust_code from cust_information where cust_code like'%" + name + "%' and cust_flag_id!=1");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName4     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }



    




    @Override
    public List<String> customerName1(String name) {
        System.out.println("customerName1 DAO: " + name);
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name.equals("")) {

                rs = DBConnection.getStatement().executeQuery("select custid,cust_code,cust_name from med_vitalsign_mt where status <2 and InfoDate ='" + date2 + "'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_vitalsign_mt where status <2 and InfoDate ='" + date2 + "'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName1     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName0701(String name, String name1) {
        // System.out.println("customerName1 DAO: "+name+" : "+name1);
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name.equals("")) {

                rs = DBConnection.getStatement().executeQuery("select custid,cust_code,cust_name from med_vitalsign_mt where status <2 and InfoDate ='" + date2 + "' and cust_name like '" + name1 + "%'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_vitalsign_mt where status <2 and InfoDate ='" + date2 + "' and cust_name like '" + name1 + "%'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName0701     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName20(String name) {
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name.equals("")) {

                rs = DBConnection.getStatement().executeQuery("select custid,cust_code,cust_name from dischargesummary where status <2 and Infodate ='" + date2 + "'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from dischargesummary where status <2 and Infodate ='" + date2 + "'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName20     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName0703(String name, String name1) {
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("inside customerName0703"+name1+name);
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name1.equals("")) {
// System.out.println("inside customerName0703 inside ifff");
                rs = DBConnection.getStatement().executeQuery("select cust_name from dischargesummary where status <2 and Infodate ='" + date2 + "' ");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from dischargesummary where status <2 and Infodate ='" + date2 + "' and cust_name like '" + name1 + "%'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName0703     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName2(String name) {
        List<String> customers = new ArrayList<String>();
        // System.out.println("CommonDao customerName2: "+name);
        try {
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name.equals("")) {

                rs = DBConnection.getStatement().executeQuery("select custid, cust_code, cust_name from med_consultantnote_mt where status <2 and Infodate ='" + date2 + "'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_consultantnote_mt where status <2 and Infodate ='" + date2 + "'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName2     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName0702(String name, String name1) {
        List<String> customers = new ArrayList<String>();
        // System.out.println("CommonDao customerName0702: "+name);
        try {
            ResultSet rs = null;
            String sDate1 = name;
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(sDate1);
            String date2 = sdf.format(date1);
            if (name.equals("")) {

                rs = DBConnection.getStatement().executeQuery("select custid, cust_code, cust_name from med_consultantnote_mt where status <2 and Infodate ='" + date2 + "' and cust_name like '" + name1 + "%'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_consultantnote_mt where status <2 and Infodate ='" + date2 + "' and cust_name like '" + name1 + "%'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName0702     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public String getCustomerBalance(String customer) {
        double bal = 0.00;
        String retVal = "";
        if (!customer.trim().equals("") || customer != null) {
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_custos('individual_list','" + customer.trim() + "');");
                while (rs.next()) {
                    bal = rs.getDouble("outstanding");
                }
            } catch (Exception ex) {
                String ss = "Class : CommonDAO  Method  : getCustomerBalance Exception:" + ex.getMessage();
                log.debug(ss);
            }
        }
        retVal = Value.Round(bal);
        return retVal;
    }

    @Override
    public String getCustomerCode(String name) {
        String custName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_code from cust_information where concat(cust_name,' - ',mobile_no) ='" + name + "'");
            while (rs.next()) {
                custName = rs.getString("cust_code");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getCustomerCode  Exception :" + ex.getMessage() + " For Patient: " + name;
            log.debug(ss);
        }
        return custName;
    }

    @Override
    public String getShopTinNo() {
        String TinNO = null;
        String query = "SELECT tin_no FROM shop_information";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                TinNO = rs.getString("tin_no");
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getShopTinNo Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return TinNO;
    }

    @Override
    public List<String> getDistributors(String name) {
        List<String> distributors = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name like'" + name + "%' and dist_flag_id = '0'");
            }
            while (rs.next()) {
                distributors.add(rs.getString("dist_name"));
            }

        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getDistributors" + e.getMessage();
            log.debug(ss);
        }
        return distributors;

    }

    @Override
    public List<String> getChequeNumbers(String type) {
        List<String> chequeList = new ArrayList<String>();

        try {
            chequeList.add("-- Select --");
            String sql = "select chq_no from cheque_transaction where chq_flag_id=0 and paid_flag_id=0 and particulars='" + type + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chequeList.add(rs.getString("chq_no"));
            }
        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getChequeNumbers" + e.getMessage();
            log.debug(ss);
        }
        return chequeList;
    }

    @Override
    public List<String> getAccountNumbers() {
        List<String> accountNumbersList = new ArrayList<String>();

        try {
            String sql = "select acc_number from bank_details where bd_flag_id=0";
            accountNumbersList.add("-- Select --");
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                accountNumbersList.add(rs.getString("acc_number"));
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getAccountNumbers()  = " + e.getMessage();
            log.debug(msg);
        }
        return accountNumbersList;
    }

    @Override
    public double getCreditAmount(String name, String type) {
        double amount = 0.00;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM credit_note where issued_against='" + type.trim() + "' and name='" + name.trim() + "'  and cre_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getCreditAmount()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public double getDebitAmount(String name, String type) {
        double amount = 0.00;
        name = name.trim();
        type = type.trim();
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM debit_note where issued_against='" + type + "' and name='" + name + "'  and dn_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDebitAmount()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public double getBillAmount(String sql) {
        double amount = 0.00;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getBillAmount   = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;

    }

    @Override
    public String getAccountNoBankName(String acccountNo) {

        String bankName = "";
        try {
            String sql = "select concat(bank_name,', ',branch ) as ban from bank_details   where acc_number='" + acccountNo + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                bankName = rs.getString("ban");
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getAccountNoBankName()  = " + e.getMessage();
            log.debug(msg);

        }
        return bankName;
    }

    @Override
    public String getAccountBalance(String accountno) {

        String closingBalance = "0.00";

        try {
            String sql = "select closing_balance from bank_book where  account_no='" + accountno + "'  and bank_flag_id!=2 order by bank_id desc limit 0,1";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                closingBalance = Value.Round(rs.getDouble("closing_balance"));
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getAccountBalance()  = " + e.getMessage();
            log.debug(msg);

        }
        return closingBalance;

    }

    @Override
    public List<String> getListItems(String getTextFieldValue, String getTherapeuticValue, String listType) {
        List<String> v = new ArrayList<String>();
        try {
            ResultSet rs = null;
            getTextFieldValue = getTextFieldValue.trim();
            if (listType.equals("DRU") || listType.equals("")) {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from drugtable");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select * from drugtable where itemname like'" + getTextFieldValue + "%'");
                }
                while (rs.next()) {
                    // v.addElement(rs.getString("itemname"));
                    v.add(rs.getString("itemname"));
                }
                v.add("Others");
            } else if (listType.equals("THE") || listType == "THE") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(therapeutic_class) from therapeutics order by therapeutic_class");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(therapeutic_class) from therapeutics where therapeutic_class like'" + getTextFieldValue + "%' order by therapeutic_class");
                }
                while (rs.next()) {
                    v.add(rs.getString("therapeutic_class").trim());
                }
                v.add("Others");
            } else if (listType.equals("STH") || listType == "STH") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(subtherapeutic_subclass) from therapeutics where therapeutic_class='" + getTherapeuticValue + "' order by subtherapeutic_subclass ");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(subtherapeutic_subclass) from therapeutics where therapeutic_class='" + getTherapeuticValue + "' and subtherapeutic_subclass like'" + getTextFieldValue + "%' order by subtherapeutic_subclass");

                }
                while (rs.next()) {
                    v.add(rs.getString("subtherapeutic_subclass").trim());
                }
                //v.add("Others");
            } else if (listType.equals("FOR") || listType == "FOR") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(formulation) from formulations order by formulation");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(formulation) from formulations where formulation like'" + getTextFieldValue + "%' order by formulation");
                }
                while (rs.next()) {
                    v.add(rs.getString("formulation").trim());
                }
                v.add("Others");
            } else if (listType.equals("TEST") || listType == "TEST") {
                int diacode = 0;
               
                if (getTherapeuticValue != "") {
                    rs = DBConnection.getStatement().executeQuery("select catagoryid FROM labreportcategory where catagoryname='" + getTherapeuticValue + "'");
                    while (rs.next()) {
                       diacode = rs.getInt("catagoryid");
                         
                    }
                }
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                   rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and catagoryid='" + diacode + "' order by reportname asc");
                   
                } else {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and reportname like '" + getTextFieldValue + "%' and catagoryid='" + diacode + "' order by reportname asc");
                    
                }
                while (rs.next()) {
                    v.add(rs.getString("lab_testname"));
                }
                v.add("Others");
            } else if (listType.equals("DIG") || listType == "DIG") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct catagoryname FROM labreportcategory d where catagoryname!='" + " " + "' and  catagoryname is not null order by catagoryname asc");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct catagoryname FROM labreportcategory d where catagoryname!='" + " " + "' and  catagoryname is not null  and catagoryname like '" + getTextFieldValue + "%' order by catagoryname asc");
                }
                while (rs.next()) {
                    v.add(rs.getString("catagoryname"));
                }
                v.add("Others");
            } else if (listType.equals("MFR") || listType == "MFR") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct company_name FROM medeil_plus.drugtable d where company_name!='" + " " + "' and  company_name is not null order by company_name asc");
                } else {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct company_name FROM medeil_plus.drugtable d where company_name!='" + " " + "' and  company_name is not null and company_name like '" + getTextFieldValue + "%' order by company_name asc");
                }
                while (rs.next()) {
                    v.add(rs.getString("company_name"));
                }
                v.add("Others");
            } else if (listType.equals("TEE") || listType == "TEE") {
                int diacode = 0;
                if (getTherapeuticValue != "") {
                    rs = DBConnection.getStatement().executeQuery("select catagoryid FROM labreportcategory where catagoryname='" + getTherapeuticValue + "'");
                    while (rs.next()) {
                        diacode = rs.getInt("catagoryid");
                    }
                }
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and catagoryid='" + diacode + "' order by reportname asc");
                } else {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and reportname like '" + getTextFieldValue + "%' order by reportname asc");
                }
                while (rs.next()) {
                    v.add(rs.getString("reportname"));
                }
                v.add("Others");
            }else if (listType.equals("SEE") || listType == "SEE") {
                 java.sql.PreparedStatement ps;
                if (getTextFieldValue.equals("")) {

                    ps = DBConnection.getConnection().prepareStatement("Select sub_category from billing_subcategory where category = ?");
                   System.out.println(getTherapeuticValue);
                    ps.setString(1, getTherapeuticValue);
                    rs = ps.executeQuery();
                } else {

                    ps = DBConnection.getConnection().prepareStatement("Select sub_category from billing_subcategory where category = ? and sub_category like ?");
                    ps.setString(1, getTherapeuticValue);
                    ps.setString(2, getTextFieldValue + "%");
                    rs = ps.executeQuery();
                }
//
                while (rs.next()) {
                    v.add(rs.getString("sub_category"));
                }
                v.add("Add new...");
            } else if (listType.equals("VAT") || listType == "VAT") {
                String sql = "SELECT * FROM vat_master  order by vat_val";
                v.add("---Select---");
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    v.add(rs.getString("vat_val"));
                }
            } else if (listType.equals("invoiceno") || listType == "invoiceno") {
                if (getTextFieldValue != null) {
                    if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                        rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                    } else {
                        rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks where invoice_no like '" + getTextFieldValue + "%'");
                    }
                    while (rs.next()) {
                        v.add(rs.getString("invoice_no"));
                    }
                } else {
                    getTextFieldValue = "";
                }
            } else if (listType.equals("purinvoiceno") || listType == "purinvoiceno") {
                if (getTextFieldValue != null) {
                    if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                        rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from purchase_invoice"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                    } else {
                        rs = DBConnection.getStatement().executeQuery("select distinct (p.invoice_no) from purchase_invoice p,stock_statement s,dist_information d where p.invoice_no like'" + getTextFieldValue + "%'");
                    }
                    while (rs.next()) {
                        v.add(rs.getString("invoice_no"));
                    }
                }
            } else if (listType.equals("itemandbatch") || listType == "itemandbatch") {

                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from purchase_invoice"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select p.item_name,s.item_name,p.dist_name,s.batch_no from purchase_invoice p,stock_statement s where p.invoice_no like '" + getTextFieldValue + "%' and p.batch_no=s.batch_no");
                }
                while (rs.next()) {
                    v.add(rs.getString("item_name"));
                }
            } else if (listType.equals("InvoiceDamage") || listType == "InvoiceDamage") {

                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks where invoice_no like '" + getTextFieldValue + "%'");
                }
                while (rs.next()) {
                    v.add(rs.getString("invoice_no"));
                }
            } else if (listType.equals("DISTRI") || listType == "DISTRI") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id=0");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id=0 and dist_name like'" + getTextFieldValue + "%'");
                }
                while (rs.next()) {
                    // v.addElement(rs.getString("itemname"));
                    v.add(rs.getString("dist_name"));
                }
            }else if (listType.equals("RADIOLOGYTYPE") || listType == "RADIOLOGYTYPE") {

                if (getTextFieldValue.equals("") || getTextFieldValue == "") {

                    // rs = DBConnection.getStatement().executeQuery("select category from radiology_category_type where category like'" + 0 + "%'");

                    rs = DBConnection.getStatement().executeQuery("select category from radiology_category_type");
                } else {


                    rs = DBConnection.getStatement().executeQuery("select category from radiology_category_type where category like'" + getTextFieldValue + "%'");
                }

                while (rs.next()) {

                    // v.addElement(rs.getString("itemname"));
                    v.add(rs.getString("category"));
                }
                v.add("Add new");
            }

        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getListItems  =" + ex.getMessage();
            log.debug(msg);

        }
        return v;
    }

    @Override
    public String getPrivileges(String modname, String uname) {
        String query = "select " + modname + " from user_info where user_name='" + uname + "'";

        String priv = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                priv = rs.getString(modname);
            }
        } catch (Exception ex) {
            String ss = "Method : getPrivileges     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }

        return priv;
    }

    @Override
    public String getUserType(String uname) {
        String utype = "";
        if (uname.equals("MedeilAdmin")) {
            utype = "Admin";
        } else {
            String query = "select user_type from user_info where user_name='" + uname + "'";
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery(query);
                while (rs.next()) {
                    utype = rs.getString("user_type");
                }
            } catch (Exception ex) {
                String ss = "Method : getUserType     Exception :" + ex.getMessage() + " Query :" + query;
                log.debug(ss);
            }
        }
        return utype;
    }

    @Override
    public boolean getUserLog(String formName, String actionName) {
        boolean userLog = false;
        try {
            DBConnection.getStatement().executeUpdate("CALL pro_userlog('" + formName + "','" + actionName + "');");
            userLog = true;
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getUserLog Exception:" + ex.getMessage() + " Form Name :" + formName;
            log.debug(ss);
        }
        return userLog;
    }

    @Override
    public String getMasterAutoIncrement(String formName) {
        String autoVal = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_mastersautoincrement('" + formName + "');");
            while (rs.next()) {
                autoVal = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getMasterAutoIncrement Exception:" + ex.getMessage() + " Form Name :" + formName;
            log.debug(ss);
        }
        return autoVal;
    }

    /*@Override
    public String getMasterAutoIncrement1(String formName) {
    String autoVal = null;
    try {
    ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_mastersautoincrement('" + formName + "');");
    while (rs.next()) {
    autoVal = rs.getString(1);
    }
    } catch (Exception ex) {
    String ss = "Class : CommonDAO  Method  : getMasterAutoIncrement1 Exception:" + ex.getMessage() + " Form Name :" + formName;
    log.debug(ss);
    }
    return autoVal;
    } */
    @Override
    public int getAddFormulation(String ms) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from formulations where formulation='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                DBConnection.getStatement().executeUpdate("insert into formulations(formulation) values('" + ms + "')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public int getAddTherapeutic(String ms) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from therapeutics where therapeutic_class='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                DBConnection.getStatement().executeUpdate("insert into therapeutics values('" + ms + "','')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public int getAddVAT(String ms) {
        int a = 0;
        try {

            ResultSet rs = DBConnection.getStatement().executeQuery("select * from vat_master where vat_val='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //VAT = txtVAT.rawText;
                DBConnection.getStatement().executeUpdate("insert into vat_master(vat_val) values('" + ms + "')");
                a = 0;
            }
        } catch (SQLException ex) {
        }
        return a;
    }

    @Override
    public Object createRecord(Object dailyCashBookModels) {
        boolean isCreate = false;
        DailyCashBookModel dailyCashBookModel = (DailyCashBookModel) dailyCashBookModels;
        try {
            int i = 0;
            String sql = "CAll pro_updatedaybook (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setDate(++i, Date.valueOf(dailyCashBookModel.getDate()));
            cs.setDouble(++i, dailyCashBookModel.getOpenCashBalance());
            cs.setDouble(++i, dailyCashBookModel.getCloseCashBalance());
            cs.setDouble(++i, dailyCashBookModel.getDebitSales());
            cs.setDouble(++i, dailyCashBookModel.getDebitReceipts());
            cs.setDouble(++i, dailyCashBookModel.getCashIntroduced());
            cs.setDouble(++i, dailyCashBookModel.getCashWithdrawal());
            cs.setDouble(++i, dailyCashBookModel.getCreditPayments());
            cs.setDouble(++i, dailyCashBookModel.getCreditMaintain());
            cs.setString(++i, "Employee Salary");
            cs.setString(++i, dailyCashBookModel.getExpenses2());
            cs.setString(++i, dailyCashBookModel.getExpenses3());
            cs.setString(++i, dailyCashBookModel.getExpenses4());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses1());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses2());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses3());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses4());
            cs.setDouble(++i, dailyCashBookModel.getTotalDebit());
            cs.setDouble(++i, dailyCashBookModel.getTotalCredit());
            cs.registerOutParameter(++i, Types.INTEGER);
            cs.executeUpdate();

            if (cs.getInt("flag") == 1) {
                isCreate = true;
            }
        } catch (Exception e) {
            isCreate = false;
            log.debug("Err in createRecord in CommonDAO :" + e);
        }
        return isCreate;
    }

    @Override
    public Object viewCashBook(Object dailyCashBookModels) {
        DailyCashBookModel dailyCashBookModel = (DailyCashBookModel) dailyCashBookModels;
        String bookdate = dailyCashBookModel.getDate();
        try {
            ResultSet rs = null;
            if (bookdate == null ? "" != null : !bookdate.equals("")) {
                String sql2 = "call pro_dailycashbook('" + bookdate + "',@flag)";
                rs = DBConnection.getStatement().executeQuery(sql2);
            }
            dailyCashBookModel = new DailyCashBookModel();
            while (rs.next()) {
                dailyCashBookModel.setOpenCashBalance(rs.getDouble("opening_balance"));
                dailyCashBookModel.setCloseCashBalance(rs.getDouble("closing_balance"));
                dailyCashBookModel.setDebitSales(rs.getDouble("smcash1"));
                dailyCashBookModel.setDebitReceipts(rs.getDouble("receipt1"));
                dailyCashBookModel.setCreditPayments(rs.getDouble("payment1"));
                dailyCashBookModel.setCashIntroduced(rs.getDouble("cashintroduced"));
                dailyCashBookModel.setCashWithdrawal(rs.getDouble("cashwithdrawal"));
                dailyCashBookModel.setCreditMaintain(rs.getDouble("shopmcost1"));
                dailyCashBookModel.setExpenses1(rs.getString("expenses1"));
                dailyCashBookModel.setExpenses2(rs.getString("expenses2"));
                dailyCashBookModel.setExpenses3(rs.getString("expenses3"));
                dailyCashBookModel.setExpenses4(rs.getString("expenses4"));
                dailyCashBookModel.setOtherExpenses1(rs.getDouble("other_expenses1"));
                dailyCashBookModel.setOtherExpenses2(rs.getDouble("other_expenses2"));
                dailyCashBookModel.setOtherExpenses3(rs.getDouble("other_expenses3"));
                dailyCashBookModel.setOtherExpenses4(rs.getDouble("other_expenses4"));
                dailyCashBookModel.setTotalDebit(rs.getDouble("total_debit"));
                dailyCashBookModel.setTotalCredit(rs.getDouble("total_credit"));

            }
        } catch (Exception e) {
            log.debug("Err in viewRecord() in CommonDAO:" + e.getMessage());
        }
        return dailyCashBookModel;
    }

    @Override
    public VitalScienceModel viewRecord3(String name, String date) {
        VitalScienceModel vitalModel = new VitalScienceModel();
        try {
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2 = sdf.format(date1);
            String sql = "select * from med_vitalsign_mt where status <2 and cust_name= '" + name + "' and InfoDate= '" + date2 + "'order by cust_name";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
                vitalModel.setPid(rs.getInt("custid"));
                vitalModel.setCustomerCode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
                vitalModel.setDate(rs.getString("InfoDate"));
                vitalModel.setpWeight(rs.getDouble("weigth"));
                vitalModel.setpHeight(rs.getDouble("height"));
                vitalModel.setpBmi(rs.getDouble("bmi"));
                vitalModel.setpRemarks1(rs.getString("remark1"));
                vitalModel.setpBloodSugar(rs.getString("blood_sugar"));
                vitalModel.setpBloodPressure(rs.getString("bp_systolic"));
                vitalModel.setpTemp(rs.getString("temperature"));
                vitalModel.setpHeartRate(rs.getString("heart_rate"));
                vitalModel.setpUrineSugar(rs.getString("urine_sugar"));
                vitalModel.setpRemarks2(rs.getString("remark2"));
                vitalModel.setRRmin(rs.getString("rr"));
                vitalModel.setvRBS(rs.getString("rbs"));
                vitalModel.setWaistcircum(rs.getString("waist_circum"));
                vitalModel.setBPDias(rs.getString("bp_diastolic"));
            }
        } catch (Exception e) {
            log.debug("Class : CommonDAO  Method : viewRecord3() Exception : " + e.getMessage());
        }
        return vitalModel;
    }

    @Override
    public VitalScienceModel viewRecord4(String name, String date) {
        VitalScienceModel vitalModel = new VitalScienceModel();
        try {

            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2 = sdf.format(date1);
            String sql = "select * from med_consultantnote_mt where status <2 and cust_name= '" + name + "' and Infodate= '" + date2 + "'order by cust_name";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {

                vitalModel.setPid(rs.getInt("custid"));
                vitalModel.setCustomerCode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
                vitalModel.setDate(rs.getString("Infodate"));
                vitalModel.setSymptom(rs.getString("symptoms"));
                vitalModel.setAssessment(rs.getString("assessment"));
                vitalModel.setObservation(rs.getString("observation"));
                vitalModel.setPlan(rs.getString("plan"));

            }
        } catch (Exception e) {
            log.debug("Class : CommonDAO  Method : viewRecord4() Exception : " + e.getMessage());
        }
        return vitalModel;
    }

    @Override
    public DischargeModel viewRecord10(String name, String date) {
        DischargeModel vitalModel = new DischargeModel();
        try {
            System.out.println("Discharge View");
            java.util.Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2= sdf.format(date1);
            String sql = "select * from dischargesummary where status <2 and cust_name= '" + name + "' and Infodate= '" + date2 + "'order by cust_name";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
                vitalModel.setDate(rs.getString("Infodate"));
                System.out.println("Date :"+(rs.getString("Infodate")));
                vitalModel.setCustcode(rs.getString("cust_code"));
                System.out.println("Custcode :"+(rs.getString("cust_code")));
                vitalModel.setPatientName(rs.getString("cust_name"));
                System.out.println("Name :"+(rs.getString("cust_name")));
                vitalModel.setAge(rs.getString("cust_age"));
                System.out.println("Age :"+(rs.getString("cust_age")));
                vitalModel.setGender(rs.getString("cust_gender"));
                vitalModel.setMobileno(rs.getString("cust_mobile"));
                vitalModel.setAddate(rs.getString("Admission_Date"));
                vitalModel.setDisdate(rs.getString("Discharge_Date"));
                vitalModel.setDistype(rs.getString("DischargeType"));
                vitalModel.setDoctorName(rs.getString("doctor_name"));
                vitalModel.setDiagnosis(rs.getString("Diagnosis"));
                vitalModel.setDrnote(rs.getString("DoctorNote"));
                vitalModel.setConsnote(rs.getString("Consulation"));
                vitalModel.setPatadvice(rs.getString("PatientAdvice"));
                vitalModel.setPrevcomplaints(rs.getString("PreviousComplaints"));
                vitalModel.setFamilyhis(rs.getString("FamilyHistory"));
                vitalModel.setInvestigation(rs.getString("Investigation"));
                vitalModel.setDisadvice(rs.getString("DischargeAdvice"));
                vitalModel.setFollowup(rs.getString("FollowUP"));
                vitalModel.setMedication(rs.getString("Medication"));
                vitalModel.setNotes(rs.getString("Notes"));
                vitalModel.setPreparedby(rs.getString("PreparedBy"));
                vitalModel.setDep(rs.getString("Department"));
                vitalModel.setSymptoms(rs.getString("Symptoms"));
                vitalModel.setGenallergy(rs.getString("GeneralAllergy"));
                vitalModel.setDrugallergy(rs.getString("DrugAllergy"));
              //  System.out.println("Drugallergy :"+(rs.getString("DrugAllergy")));
                vitalModel.setSurgeon(rs.getString("surgeon_name"));
             //   System.out.println("Surgeon :"+(rs.getString("surgeon_name")));

            }
        } catch (Exception e) {
            log.debug("Class : CommonDAO  Method : viewRecord10() Exception : " + e.getMessage());
        }
        return vitalModel;
    }

    @Override
    public List<String> State(String country, String name) {
        List<String> stateList = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("") || name == null) {
                rs = DBConnection.getStatement().executeQuery("select distinct(state) from state where country= '" + country + "' order by state");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(state) from state where country='" + country + "' and state like '" + name + "%' order by state");
            }
            while (rs.next()) {
                stateList.add(rs.getString("state"));
            }



        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : State()   = " + ex.getMessage();
            log.debug(msg);
        }
        return stateList;
    }

    @Override
    public List<String> Country(String name) {
        List<String> countries = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(country) from state");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(country) from state where country like '" + name + "%'");
            }
            while (rs.next()) {
                countries.add(rs.getString("country"));
            }
        } catch (Exception e) {
        }
        return countries;
    }

    @Override
    public boolean updateLog(String moduleInfo, String logInfo) {
        boolean isSave = false;
        try {
            String sql = "CALL pro_userlog('" + moduleInfo + "','" + logInfo + "')";

            if (DBConnection.getStatement().executeUpdate(sql) > 0) {
                isSave = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            isSave = false;
        }
        return isSave;
    }

    @Override
    public List<String> Distributors(String name) {
        List<String> distributors = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name like'" + name + "%' and dist_flag_id = '0'");
            }
            while (rs.next()) {
                distributors.add(rs.getString("dist_name"));
            }

        } catch (Exception e) {
        }
        return distributors;

    }

    @Override
    public List<String> getEmployers(String empName) {
        List<String> employers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (empName.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select emp_name from employee_information where emp_name like'" + empName + "%' and emp_flag_id = '0'");
            }
            while (rs.next()) {
                employers.add(rs.getString("emp_name"));
            }

        } catch (Exception e) {
        }
        return employers;

    }

    @Override
    public boolean selectState(String country, String state) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select distinct(state) from state where country = '" + country + "' and state ='" + state + "'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;

        }
        return isSelect;
    }

    @Override
    public boolean selectCountry(String country) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select distinct(country) from state where country = '" + country + "'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;

        }
        return isSelect;
    }

    @Override
    public boolean selectEmployee(String employee) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select emp_name from employee_information where emp_name ='" + employee + "' and emp_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }

        } catch (Exception e) {
            isSelect = false;

        }
        return isSelect;
    }

    @Override
    public String getEmpSalId(String dbtable, String frontChar) {
        String empSalId = frontChar, idString;
        String zerofill[] = {"", "000000", "00000", "0000", "000", "00", "0"};
        int id;
        String sql = "select max(sal_id) as sal_id from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                empSalId = rs.getString("sal_id");
            }
            if (empSalId.equals("") || empSalId == null) {
                empSalId = "ESA0000001";
            } else {
                id = Integer.parseInt(empSalId.substring(frontChar.length()));
                idString = "" + id;
                id = id + 1;
                empSalId = frontChar + zerofill[idString.length()] + id;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return empSalId;

    }

    @Override
    public String getDoctorId() {
        String code = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from doctors_information");
            while (rs.next()) {
                code = rs.getString("doctor_id");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return code;
    }

    @Override
    public String getDocCodeValue(String name) {
        String autoIncreId = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_autoincre('" + name + "');");
            while (rs.next()) {
                autoIncreId = rs.getString("aid");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return autoIncreId;
    }

    @Override
    public List<String> DoctorCode(String name) {
        List<String> v = new ArrayList<String>();


        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from doctors_information");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from doctors_information where doctor_code like '" + name + "%' or doctor_code like '%" + name + "' or doctor_code like '%" + name + "%' and doc_flag_id= 0");
            }
            while (rs.next()) {
                if (rs.getInt("doc_flag_id") == 0) {
                    v.add(rs.getString("doctor_code"));
                }
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : DoctorCode()   = " + ex.getMessage();
            log.debug(msg);
        }
        return v;
    }

    @Override
    public String getDocId(String dbtable, String frontChar) {
        String code = frontChar, idString;
        String zerofill[] = {"", "000000", "00000", "0000", "000", "00", "0"};
        int id;
        String sql = "select * from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                code = rs.getString("doctor_id");
            }
            if (code.equals("") || code == null) {
                code = "DOC0000001";
            } else {
                id = Integer.parseInt(code.substring(frontChar.length()));
                id = id + 1;
                idString = "" + id;
                code = frontChar + zerofill[idString.length()] + id;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return code;
    }

    @Override
    public String getDocCommisionNo(String dbtable, String frontChar) {
        String code = "", idString;
        String zerofill[] = {"", "000000", "00000", "0000", "000", "00", "0"};
        int id;
        String sql = "select * from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                code = rs.getString("dch_id");
            }
            if (code.equals("") || code == null) {
                code = "DCH0000001";
            } else {
                id = Integer.parseInt(code.substring(frontChar.length()));
                id = id + 1;
                idString = String.valueOf(id);
                code = frontChar + zerofill[idString.length()] + id;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return code;
    }

    @Override
    public String getAutoIncrement(String name) {
        String autoVal = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_autoincre('" + name + "');");
            while (rs.next()) {
                autoVal = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getAutoIncrement Exception:" + ex.getMessage() + " Form Name :" + name;
            log.debug(ss);
        }
        return autoVal;
    }

    @Override
    public List<String> Specialist(String name) {
        List<String> v = new ArrayList<String>();
        List<String> s = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(specialist) from doctor_specialist");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(specialist) from doctor_specialist where specialist like '" + name + "%'");
            }
            while (rs.next()) {
                v.add(rs.getString("specialist"));
            }
            s = v;
            for (int i = 0; i < v.size(); i++) {
                s.set(i, "" + v.get(i));
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : Specialist()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    @Override
    public String getDocCommCode(String name) {
        String DocCommCode = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select doctor_id from doctors_information where doctor_name = '" + name + "'");
            while (rs.next()) {
                DocCommCode = rs.getString("doctor_id");
            }
        } catch (Exception e) {
            // System.out.print("Err in getDoccommCode(name) in CommonDAO:" + e);
        }
        return DocCommCode;
    }

    @Override
    public List<String> getDoctorName(String name) {
        List<String> v = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.trim().length() == 0) {
                rs = DBConnection.getStatement().executeQuery("select doctor_name from doctors_information where doc_flag_id=0");
            } else {
                rs = DBConnection.getStatement().executeQuery("select doctor_name from doctors_information where doc_flag_id=0 and doctor_name like'" + name + "%'");
            }
            while (rs.next()) {
                v.add(rs.getString("doctor_name"));
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDoctorName()  = " + ex.getMessage();
            log.debug(msg);
        }
        return v;
    }
    //getCompare() By Saravanakumar

    @Override
    public List<String> getDoctorName1(String name) {
        List<String> v = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.trim().length() == 0) {
                rs = DBConnection.getStatement().executeQuery("select doctor_name from doctors_information where doc_flag_id=0");
            } else {
                rs = DBConnection.getStatement().executeQuery("select doctor_name from doctors_information where doc_flag_id=0 and doctor_name like'" + name + "%'");
            }
            while (rs.next()) {
                v.add(rs.getString("doctor_name"));
                //v.add(rs.getString("doctor_id"));
                // System.out.println(rs.getString("doctor_name")+" / "+rs.getString("doctor_id"));
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDoctorName1()  = " + ex.getMessage();
            log.debug(msg);
        }
        return v;
    }

    @Override
    public int getCompare(String query) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("compare") != null) {
                    qty = rs.getInt("compare");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDao  Method  : getCompare Exception:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return qty;
    }

    //getShopName() By Saravanakumar
    @Override
    public List<String> getShopName() {
        List<String> sname = new ArrayList<String>();


        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM shop_information");
            while (rs.next()) {
                if (rs != null) {
                    sname.add(rs.getString("shop_name"));
                    sname.add(rs.getString("address1"));
                    sname.add(rs.getString("city"));
                    sname.add(rs.getString("state"));
                    sname.add(rs.getString("pincode"));
                    sname.add(rs.getString("contact_no1"));
                    sname.add(rs.getString("fax_no"));
                    sname.add(rs.getString("email_id"));
                }
            }


        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getShopName Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return sname;
    }

    //getSettingConfig() By Saravanakumar
    @Override
    public List<String> getSettingConfig() {
        List<String> scon = new ArrayList<String>();

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from settings_config");
            while (rs.next()) {
                if (rs != null) {
                    scon.add(rs.getString("email_username"));
                    scon.add(rs.getString("email_password"));
                    scon.add(rs.getString("defaultsms_gw"));
                    scon.add(rs.getString("way2sms_user"));
                    scon.add(rs.getString("way2sms_pass"));
                    scon.add(rs.getString("160by2_user"));
                    scon.add(rs.getString("160by2_pass"));
                }
            }


        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getShopName Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return scon;
    }

    @Override
    public String getQueryValue(String que) {
        String value = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                value = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getQueryValue():StringException:" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    @Override
    public int getQueryWitCol(String query, String col) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString(col) != null) {
                    qty = rs.getInt(col);
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getQueryWitCol:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }

        return qty;
    }

    @Override
    public int selectCountQuryExe(String query) {
        int save = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                save = rs.getInt("count(*)");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : selectCountQuryExe Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return save;
    }

    @Override
    public List<String> getChequeDetails(String chqNo) {

        List<String> chequeList = new ArrayList<String>();

        chequeList.add("");
        chequeList.add("");
        chequeList.add("");
        try {
            String sql = "select issued_to,bank_name,Amount from  cheque_transaction where chq_no='" + chqNo + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chequeList.set(0, rs.getString("issued_to"));
                chequeList.set(1, rs.getString("bank_name"));
                chequeList.set(2, rs.getString("Amount"));

            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getChequeDetails()  = " + e.getMessage();
            log.debug(msg);

        }
        return chequeList;

    }

    @Override
    public List<String> getEmployeeCode(String code) {
        List<String> employers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (code.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_code like'" + code + "%' and emp_flag_id = '0'");
            }
            employers.add("---Select---");

            while (rs.next()) {
                employers.add(rs.getString("emp_code"));
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getEmployeeCode()  = " + e.getMessage();
            log.debug(msg);
        }
        return employers;
    }

    @Override
    public String getProductType() {
        String productType = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select mode from license_details");
            while (rs.next()) {
                productType = rs.getString("mode");
            }
        } catch (Exception e) {
            log.debug("Class: CommonDAO  method:getProductType Error = " + e.getMessage());
        }
        return productType;
    }

    @Override
    public List<String> getUserName(String type) {
        List<String> userList = new ArrayList<String>();

        String query = "";
        try {

            if (type.equals("")) {
                query = "SELECT user_name FROM user_info where ui_flag_id=0";
            } else {
                query = "SELECT user_name FROM user_info WHERE user_name like'" + type + "%' and ui_flag_id=0";
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                userList.add(rs.getString("user_name"));
            }
        } catch (Exception e) {
            log.debug("Class : UserInformatonDAO Method:getUserName() Error = " + e.getMessage());
        }
        return userList;

    }

    @Override
    public boolean checkUserNameExists(String str) {
        boolean userName = true;
        try {

            String sql = "select user_name from user_info where user_name='" + str + "' and ui_flag_id=0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                userName = false;
            }

        } catch (Exception e) {
            log.debug("Class : CommonDAO  method:checkUserNameExists Error= " + e.getMessage());

        }
        return userName;
    }

    @Override
    public int selectCount(String dbTable, String name) {
        int count = 0;
        try {
            String sql = "select count(*)  from " + dbTable + " where concat(cust_name,' - ',mobile_no) as cust_name='" + name + "' and cust_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (Exception e) {
            count = 0;
            log.debug(e.getMessage());
        }
        return count;
    }

    public List<String> GetProductDetails(String bno, String btype) {
        List<String> s = new ArrayList<String>();
        String tname = null;

        if (btype.equals("Cash_Bill")) {
            tname = "sales_cash_bill";
        } else if (btype.equals("Account")) {
            tname = "sales_accounts";
        } else if (btype.equals("Partial_Paid")) {
            tname = "sales_partitions_bill";
        } else if (btype.equals("Credit_Bill")) {
            tname = "sales_credit_bill";
        } else if (btype.equals("CD_Card_Bill")) {
            tname = "sales_cards_bill";
        }
        try {
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery("select * from " + tname + " where bill_no = '" + bno + "'");
            while (rs.next()) {
                s.add(rs.getString("item_name"));
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : GetProductDetails()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    @Override
    public List<String> CompliantNumber(String name) {
        List<String> s = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select bill_no from compliants_register where cr_flag_id = '0' order by bill_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("select bill_no from compliants_register where   bill_no like'" + name + "%' and cr_flag_id = '0' order by bill_no");
            }
            while (rs.next()) {
                s.add(rs.getString("bill_no"));
            }



        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : ComplaintNumber()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    public List<String> ComplaintRegisterBillNo(String name) {
        List<String> s = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("SELECT bill_no FROM sales_maintain_bill s where bill_no not in (select bill_no from compliants_register) order by s.bill_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("SELECT bill_no FROM sales_maintain_bill s where bill_no not in (select bill_no from compliants_register) and s.bill_no like'" + name + "%' order by s.bill_no ");
            }
            while (rs.next()) {
                s.add(rs.getString("bill_no"));
            }

        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : ComplaintRegisterBillNo()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    @Override
    public List<String> CreditNoteDetails(String name) {
        List<String> customer = new ArrayList<String>();

        try {
            ResultSet rs = null;
            name = name.trim();
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select credit_note_no from credit_note where cre_flag_id=0 order by credit_note_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("select credit_note_no from credit_note where  cre_flag_id=0 and credit_note_no like'" + name + "%' order by credit_note_no");
            }
            while (rs.next()) {
                customer.add(rs.getString("credit_note_no"));
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : creditNoteDetails()  = " + ex.getMessage();
            log.debug(msg);
        }

        return customer;
    }

    @Override
    public boolean selectCreditNote(String creditNoteno) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select credit_note_no from credit_note where  cre_flag_id=0 and credit_note_no = '{txtCNoteNo.rawText}'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isSelect;
    }

    @Override
    public double CustTotAmt(String billNo, String custName) {
        double totAmt = 0.0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select total_amount from sales_maintain_bill where bill_no = '" + billNo + "' and cust_name = '" + custName + "'");
            while (rs.next()) {
                totAmt = rs.getDouble("total_amount");
            }

        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return totAmt;

    }

    @Override
    public double DistTotAmt(String invoiceNo, String distName) {
        double totAmt = 0.0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select total_amount from purchase_invoice  where invoice_no = '" + invoiceNo + "' and dist_name = '" + distName + "'");
            while (rs.next()) {
                totAmt = rs.getDouble("total_amount");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return totAmt;

    }

    public List<String> getchequeNumbers(String type) {
        List<String> chequeList = new ArrayList<String>();

        try {
            chequeList.add("-- Select --");
            String sql = "select chq_no from cheque_transaction where chq_flag_id=0 and paid_flag_id=0 and particulars='" + type + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chequeList.add(rs.getString("chq_no"));
            }

        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getchequeNumbers:" + e.getMessage();
            log.debug(ss);
        }
        return chequeList;
    }

    public double getCreditAmout(String name, String type) {
        double amount = 0.00;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM credit_note where issued_against='" + type.trim() + "' and name='" + name.trim() + "'  and cre_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getCreditAmout()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    public double getDebitAmout(String name, String type) {
        double amount = 0.00;
        name = name.trim();
        type = type.trim();
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM debit_note where issued_against='" + type + "' and name='" + name + "'  and dn_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDebitAmout()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public String checkSMSConf() {
        String ret = "Done";
        String que = "SELECT way2sms_user,way2sms_pass,160by2_user,160by2_pass,defaultsms_gw FROM settings_config";
        int cnt = 5;
        String[] getV = new String[cnt];
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                for (int i = 0; i < cnt; i++) {
                    getV[i] = rs.getString(i + 1);
                }
                if (getV[4].trim().equals("0") && (getV[0].trim().length() == 0 || getV[1].trim().length() == 0)) {
                    ret = "Please, provide way2sms Username & Password";
                } else if (getV[4].trim().equals("1") && (getV[2].trim().length() == 0 || getV[3].trim().length() == 0)) {
                    ret = "Please, provide 160by2 Username & Password";
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : checkSMSConf Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return ret;
    }

    @Override
    public boolean selectCustomer(String name) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_name='" + name + "' and cust_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;
            String ss = "Class : CommonDAO  Method  : selectCustomer:" + e.getMessage();
            log.debug(ss);
        }
        return isSelect;
    }

    @Override
    public String getShopDetails() {
        String sname = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT concat(shop_name,',',city,', ',contact_no1)as shop FROM shop_information");
            while (rs.next()) {
                if (rs.getString("shop") != null) {
                    sname = rs.getString("shop");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getShopDetails Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return sname;
    }

    @Override
    public List<String> GetCustomerList(String name) {
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select *,concat(cust_name,' - ',mobile_no) from cust_information where concat(cust_name,' - ',mobile_no) and  cust_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select *,concat(cust_name,' - ',mobile_no) from cust_information where concat(cust_name,' - ',mobile_no) like'" + name + "%' and cust_flag_id = '0'");
            }
            while (rs.next()) {
                customers.add(rs.getString("concat(cust_name,' - ',mobile_no)"));
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : GetCustomerList()   = " + ex.getMessage();
            log.debug(msg);
        }
        return customers;
    }

    @Override
    public String getCustId(String dbtable, String columnName, String frontChar) {
        NumberFormat nf = new DecimalFormat("0000000");
        int id = 0;
        String code = frontChar + nf.format(id);
        String sql = "select * from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            if (rs.wasNull()) {
                code = frontChar + nf.format(id += 1);
            } else {
                while (rs.next()) {
                    code = rs.getString(columnName);
                }
                id = Integer.parseInt(code.substring(frontChar.length()));
                id += 1;
                code = frontChar + nf.format(id);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return code;
    }

    @Override
    public boolean selectRecord(String distributorName) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name='" + distributorName + "' and dist_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            isSelect = false;
        }
        return isSelect;
    }

    @Override
    public String getName(String code) {
        String custCode = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_code='" + code + "'");
            while (rs.next()) {
                custCode = rs.getString("cust_name");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getName     Exception :" + ex.getMessage() + " For Code: " + code;
            log.debug(ss);
        }
        return custCode;
    }

    /*@Override
    public String getCode(String name) {
    String custName = null;
    try {
    ResultSet rs = DBConnection.getStatement().executeQuery("select cust_code from cust_information where cust_name='" + name + "'");
    while (rs.next()) {
    custName = rs.getString("cust_code");
    }
    } catch (Exception ex) {
    String ss = "Class : CommonDAO   Method  : getCode     Exception :" + ex.getMessage() + " For Patient: " + name;
    log.debug(ss);
    }
    return custName;
    }*/
    @Override
   public String getMobileNo(String code, String name) {
        String custCode = code;
        String custName = name;
        String mobileNo = "";

        try {
            if (name.equals("")) {
                ResultSet rs = DBConnection.getStatement().executeQuery("select mobile_no from cust_information where cust_code='" + custCode + "'");
                while (rs.next()) {
                    mobileNo = rs.getString("mobile_no");
                }
//            } else {
//                ResultSet rs = DBConnection.getStatement().executeQuery("select mobile_no,email_id from cust_information where cust_name='" + custName + "' and cust_code='" + custCode + "'");
//
//                while (rs.next()) {
//                    mobileNo = rs.getString("mobile_no");
//                }
//            }
        }} catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getMobileNo     Exception :" + ex.getMessage() + " For Name :" + name + " and Code: " + code;
            log.debug(ss);
        }
        return mobileNo;
    }
    @Override
    public String getEmailId(String code, String name) {
        String custCode = code;
        String custName = name;
        String emailId = "";

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select mobile_no,email_id from cust_information where cust_name='" + custName + "' and cust_code='" + custCode + "'");
            while (rs.next()) {
                emailId = rs.getString("email_id");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getEmailId     Exception :" + ex.getMessage() + " For Name :" + name + " and Code: " + code;
            log.debug(ss);
        }
        return emailId;
    }

    @Override
    public String checkEmailConf() {
        String ret = "Done";
        int cnt = 4;
        String[] getV = new String[cnt];
        try {
            String que = "SELECT email_username,email_password,alt_email_username, alt_email_password FROM settings_config";
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                for (int i = 0; i < cnt; i++) {
                    getV[i] = rs.getString(i + 1);
                }
            }
//        String[] getV = DBData.getQueryValue(que, 4);
            if ((getV[0].trim().length() == 0 || getV[1].trim().length() == 0)) {
                ret = "Please, provide Email ID & Password";
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return ret;
    }

    @Override
    public int selectCount(String dbTable, String columnname, String name) {
        int count = 0;
        String sql = "";
        try {
            if (dbTable.equals("cust_information")) {
                sql = "select count(*)  from " + dbTable + " where cust_name ='" + columnname + "' and mobile_no='" + name + "' and cust_flag_id = '0'";
            } else {
                sql = "select count(*)  from " + dbTable + " where " + columnname + "='" + name + "' and cust_flag_id = '0'";
            }
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (Exception e) {
            count = 0;
            log.debug(e.getMessage());
        }
        return count;
    }

    @Override
    public List<String> getBankNameList() {
        List<String> bankNames = new ArrayList<String>();


        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM bankvalue order by bankName asc");
            while (rs.next()) {
                bankNames.add(rs.getString("bankName"));
            }

        } catch (SQLException ex) {
            log.debug(ex.getMessage());
        }
        return bankNames;
    }

    @Override
    public boolean checkExistance(String tablename, String acNo) {
        boolean isExist = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from " + tablename + " where acc_number ='" + acNo + "' and bd_flag_id = '0'");
            while (rs.next()) {
                isExist = true;
            }
        } catch (SQLException ex) {
            log.debug(ex.getMessage());
        }
        return isExist;
    }

    @Override
    public List<String> getQueryValue(String query, int count) {
        List<String> value = new ArrayList<String>();

        try {
            //System.out.println("inside getQueryValue dao"+query);
            // System.out.println("inside getQueryValue dao query"+count);
            ResultSet rs = DBConnection.getStatement().executeQuery(query);

            while (rs.next()) {
                for (int i = 0; i < count; i++) {
                    value.add(rs.getString(i + 1));
                }

            }

//System.out.println("inside getQueryValue after try"+value.size());


        } catch (Exception ex) {
            //  System.out.println("inside getQueryValue catch"+ex);
            String ss = "Class : CommonDAO  Method  : getQueryValue():String[]   Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    @Override
    public List<String> getNoteNo(String tableName, String noteNo) {
        List<String> customer = new ArrayList<String>();


        try {
            ResultSet rs = null;
            noteNo = noteNo.trim();
            if (tableName.equals("credit_note")) {
                if (noteNo.equals("")) {
                    rs = DBConnection.getStatement().executeQuery("select credit_note_no from " + tableName + " where cre_flag_id=0 order by credit_note_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select credit_note_no from " + tableName + " where  cre_flag_id = 0 and credit_note_no like'" + noteNo + "%' order by credit_note_no");
                }
                while (rs.next()) {
                    customer.add(rs.getString("credit_note_no"));
                }
            } else {
                if (noteNo.equals("")) {
                    rs = DBConnection.getStatement().executeQuery("select debit_note_no from " + tableName + " where dn_flag_id=0 order by debit_note_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select debit_note_no from " + tableName + " where  dn_flag_id = 0 and debit_note_no like'" + noteNo + "%' order by debit_note_no");
                }
                while (rs.next()) {
                    customer.add(rs.getString("debit_note_no"));
                }
            }

        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getNoteNo()  = " + ex.getMessage();
            log.debug(msg);
        }

        return customer;
    }

    @Override
    public boolean selectDistributor(String distributorName) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name='" + distributorName + "' and dist_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            isSelect = false;
        }
        return isSelect;
    }

    @Override
    public boolean selectDebitNote(String debitNoteno) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select debit_note_no from debit_note where debit_note_no = '" + debitNoteno + "' and dn_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isSelect;
    }

    @Override
    public int getReturnCompare(String value, String itemCode, String itemName, String batch) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select count(*) as compare from sales_return where bill_no='" + value + "' and item_code='" + itemCode + "' and item_name='" + itemName + "' and batch_no='" + batch + "'");
            while (rs.next()) {
                if (rs.getString("compare") != null) {
                    qty = Integer.parseInt(rs.getString("compare"));
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getReturnCompare Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }

    @Override
    public int getReturnCompare(String itemCode, String itemName) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT count(*)as compare FROM stock_statement WHERE item_name = '" + itemName + "' AND item_code = '" + itemCode + "' and qty != 0");
            while (rs.next()) {
                if (rs.getString("compare") != null) {
                    qty = Integer.parseInt(rs.getString("compare"));
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getReturnCompare() Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }

    @Override
    public String getAlertType() {
        String ty = "";
        int mon = 0;
        int week = 0;
        try {

            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM  alert_setting");
            while (rs.next()) {
                mon = rs.getInt("alert_month");

                week = rs.getInt("alert_week");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getAlertType Exception:" + ex.getMessage();
            log.debug(ss);
        }
        if (mon > 0) {
            ty = "month";
        } else if (week > 0) {
            ty = "week";
        } else {
            ty = "day";
        }
        return ty;
    }

    @Override
    public String getAlertInterval() {
        String alertDays = "1";
        try {
            String alertType = "";
            alertType = getAlertType();
            String alertType1 = "";
            if (alertType.equals("month")) {
                alertType1 = "alert_month";
            } else if (alertType.equals("week")) {
                alertType1 = "alert_week";
            } else {
                alertType1 = "alert_days";
            }
            String sql = "";
            sql = (" select " + alertType1 + " as al  from alert_setting");
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                if (rs.getString("al") != null) {
                    alertDays = rs.getString("al");
                }
            }
        } catch (Exception ex) {
            String ss = " Class : commonDAO  Method  : getAlertInterval   Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return alertDays;
    }

    @Override
    public String getExpiryDate(String itemCode, String batchNumber, String alertType, String alertValue) {
        String expiry = "";
        String qry = "select expiry_date from stock_statement where item_code='" + itemCode + "'  and batch_no='" + batchNumber + "' and expiry_date between curdate() and DATE_ADD(curdate(),INTERVAL " + alertValue + "  " + alertType + ")";
        try {

            String sql = "";
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                if (rs.getString("expiry_date") != null) {
                    expiry = DateUtils.normalFormatDate(rs.getDate("expiry_date"));
                }
            }
        } catch (Exception ex) {
            log.debug("qry:" + qry);
            String ss = "Class : CommonDAO  Method  : getExpiryDate Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return expiry;
    }

    @Override
    public String getDummyExpiryDate() {
        String edate = DateUtils.now("MM-yy");
        String query = "select DATE_FORMAT(now(),'%b-%Y') as da";
        ResultSet rs = null;
        try {
            rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                edate = rs.getString("da");
                String[] arr = edate.split("-");
                String yearIn = String.valueOf(Integer.parseInt(arr[1]) + 2);
                edate = arr[0] + "-" + yearIn;
            }
        } catch (SQLException ex) {
            log.debug("query:" + query);
            String ss = "Class : CommonDAO  Method  : getDummyExpiryDate Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return edate;
    }

    @Override
    public String getProduct(String itemCode) {
        String itemName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select itemname from drugtable where itemcode=" + itemCode + "");
            while (rs.next()) {
                itemName = rs.getString("itemname");
            }
        } catch (Exception ex) {
            log.debug("Class : CommonDAO  Method  : getProduct Exception :" + ex.getMessage());
        }

        return itemName;
    }

    @Override
    public String getDosage(String itemCode, String itemName) {
        String dosage = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select dosage from drugtable where itemname = '" + itemName + "' and itemcode = '" + itemCode + "'");
            while (rs.next()) {
                if (rs.getString("dosage") != null) {
                    dosage = rs.getString("dosage");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getDosage Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return dosage;
    }

    @Override
    public String getFormulation(String itemCode, String itemName) {
        String dosage = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select formulation from drugtable where itemname = '" + itemName + "' and itemcode = '" + itemCode + "'");
            while (rs.next()) {
                if (rs.getString("formulation") != null) {
                    dosage = rs.getString("formulation");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getFormulation Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return dosage;
    }

    @Override
    public int checkItemBatch(String code1, String batch) {
        int qty = -9081;
        String query1 = "select qty from stock_statement where item_code='" + code1 + "' and batch_no='" + batch + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query1);
            while (rs.next()) {
                qty = rs.getInt("qty");
            }
        } catch (Exception e) {
            String ss = "Class : CommonDAO Method:checkitembatch   Exception:" + e.getMessage();
            log.debug(ss);
        }
        return qty;
    }

    @Override
    public String getCRNo(String srno) {
        String CreditNoteNumber = "";
        ResultSet rs = null;
        try {
            rs = DBConnection.getStatement().executeQuery("SELECT credit_note_no FROM credit_note where invoiceorbill_no='" + srno + "'");
            while (rs.next()) {
                rs.getString(1);
            }
        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getCRNo() StringException:" + e.getMessage();
            log.debug(ss);
        }

        return CreditNoteNumber;
    }

    @Override
    public void userLog(String formName, String type) {

        try {
            DBConnection.getStatement().executeUpdate("call pro_userlog('" + formName + "','" + type + "')");
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : userLog Exception:" + ex.getMessage();
            log.debug(ss);
        }
    }

    @Override
    public Boolean isNotAllow(int modName) {
        boolean s = false;
        String[] tSubName = new String[]{"Drug_Details,Cash_Bill", "Credit_Bill", "Counter_Bill", "Creditcard_Bill", "PartialPayment_Bill", "Dummy_Bill", "purchase_maintenance"};
        String[] tName = new String[]{"Cash_Bill", "Credit_Bill", "Account", "CD_Card_Bill", "Partial_Paid", "Dummy_Bill", "purchase_maintenance"};
        String que = "SELECT mode FROM license_details;";
        String mode = getQueryValue(que);
        if (mode.equalsIgnoreCase("Trial")) {
            String CntQue = "SELECT trial FROM version_tablelookup where submodule='" + tSubName[modName - 1] + "'";
            String CntQueMod = "";
            if (modName <= 6) {
                CntQueMod = "SELECT count(*) FROM sales_maintain_bill where bill_type='" + tName[modName - 1] + "'";
            } else if (modName == 7) {
                CntQueMod = "SELECT count(*) FROM purchase_maintenance";
            }
            int num = getQueryWitCol(CntQue, mode.toLowerCase());
            int rwCount = 0;
            if (CntQueMod.length() > 0) {
                rwCount = selectCountQuryExe(CntQueMod);
            }
            if (rwCount >= num) {
                s = true;
            }
        }
        return s;
    }

    @Override
    public Integer freeBillCount() {
        Boolean billRestrict = false;
        Integer billCount = -1;
        try {
            String que = "SELECT mode FROM license_details;";
            String mode = getQueryValue(que);
            if (mode.equalsIgnoreCase("Free")) {
                String que1 = "select count(*) from sales_maintain_bill";
                billCount = selectCountQuryExe(que1);
//            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT vat_val FROM vat_master where id =1");
//            while (rs.next()) {
//                billCount -= rs.getInt("vat_val");
//            }
            }
        } catch (Exception e) {
            log.debug("Class:CommonDAO  method :freeBillCount Exception:  " + e.getMessage());
        }
        return billCount;
    }

    @Override
    public int queryExecution(String q) {
        int save = 0;
        try {
            save = DBConnection.getStatement().executeUpdate(q);
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : queryExecution Exception:" + ex.getMessage() + "Query :" + q;
            log.debug(ss);
        }
        return save;
    }

    @Override
    public List<String> getYear(String name) {
        List<String> years = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name == "") {
                rs = DBConnection.getStatement().executeQuery("select distinct(cyear) from maintain_cost where mc_flag_id = '0' order by cyear ");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(cyear) from maintain_cost where cyear like'" + name + "%' and mc_flag_id = '0' order by cyear");
            }
            while (rs.next()) {
                years.add(rs.getString("cyear"));
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : getYear()   = " + ex.getMessage();
            log.debug(msg);
        }
        return years;
    }

    @Override
    public int countMaintCost(String cyear, String month) {
        int count = 0;
        try {
            String sql = "select count(*)  from maintain_cost where cmonth ='" + month + "' and cyear = '" + cyear + "' and mc_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return count;
    }

    @Override
    public List<String> getMonthList(String year) {
        List<String> monthList = new ArrayList<String>();
        try {
            String sql = "select distinct(cmonth) from maintain_cost where cyear = '" + year + "' and mc_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                monthList.add(rs.getString("cmonth"));
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return monthList;
    }

    @Override
    public boolean setChequeFlag(String chqNo, int value) {
        boolean isSet = false;
        try {
            String sql = "update cheque_transaction set paid_flag_id = '" + value + "' where chq_no = '" + chqNo + "'";
            if (DBConnection.getConnection().createStatement().executeUpdate(sql) > 0) {
                isSet = true;
            }
        } catch (Exception e) {
            isSet = false;
            log.debug(e.getMessage());
        }
        return isSet;
    }

    @Override
    public String getTruncateQuery(String que) {
        String value = "";
        try {
            DBConnection.getStatement().executeUpdate(que);

        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getTruncateQuery():StringException:" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    @Override
    public HashMap getModules(String str1, String str2, String str3) {
        HashMap moduleMap = new HashMap();
        try {
            String query = "SELECT submodule," + str1 + " FROM version_formlookup where object='" + str2 + "' and module='" + str3 + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                moduleMap.put(rs.getString("submodule"), rs.getString(str1));
            }
        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getModules() StringException:" + e.getMessage();
            log.debug(ss);
        }

        return moduleMap;
    }

    @Override
    public String HospitalName() throws RemoteException {

        String shopName = "";
        try {

            String sql = "select hospital_name from hospital_information;";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                shopName = rs.getString("hospital_name");
            }
        } catch (Exception e) {
            log.debug("Class : CommonDAO method : HospitalName Error = " + e.getMessage());
        }

        return shopName;
    }
    public ResultSet rsGen;
    public List<String> names = new ArrayList<String>();
    public String sql;

    @Override
    public List<String> getDrugGenerics(String name, String listType) {
        names.clear();
        try {
            if (name.equals("")) {
                if (listType.equals("drug")) {
                    sql = "select distinct(genericname) from drugtable where genericname !='' order by genericname";
                } else {
                    sql = "SELECT distinct d.genericname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and s.ban_flag_id!=1";
                }
            } else {
                if (listType.equals("drug")) {
                    sql = "select distinct(genericname) from drugtable where genericname like'" + name + "%'";
                } else {
                    sql = "SELECT distinct d.genericname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and d.genericname like'" + name + "%' and s.ban_flag_id!=1";
                }
            }
            rsGen = DBConnection.getStatement().executeQuery(sql);
            if (rsGen != null) {
                while (rsGen.next()) {
                    names.add(rsGen.getString("genericname"));
                }
            } else {
                names.add("No Values");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getDrugGenerics()     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return names;
    }

    @Override
    public List<String> getDrugProducts(String name, String listType) throws RemoteException {
        names.clear();
        try {
            if (name.equals("")) {
                if (listType.equals("drug")) {
                    sql = "select distinct itemname from drugtable where dru_flag_id != 3;";
                } else {
                    sql = "SELECT distinct d.itemname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and s.ban_flag_id!=1";
                }
            } else {
                if (listType.equals("drug")) {
                    sql = "select distinct itemname from drugtable where itemname like '" + name + "%' and dru_flag_id != 3;";
                } else {
                    sql = "SELECT distinct d.itemname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and s.item_name like'" + name + "%' and s.ban_flag_id!=1";
                }
            }
            rsGen = DBConnection.getStatement().executeQuery(sql);
            while (rsGen.next()) {
                names.add(rsGen.getString("itemname"));
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getDrugProducts()     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return names;
    }

    @Override
    public String getExpiryDrugNames() throws RemoteException {
        String expiryDrugNames = "<-----------------------------------------";

        try {
            int i = 0;
            String typeAler = getAlertType();
            String typeVal = getAlertInterval();
            String sql1 = "select   SUBSTRING_INDEX(concat(item_name,'_',formulation,','),'_',3) as expiry_drugname from stock_statement where  qty>0 and  expiry_date between curdate() and DATE_ADD(curdate(),INTERVAL " + typeVal + "  " + typeAler + ")";

            ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
            while (rs.next()) {
                if (i == 0) {
                    expiryDrugNames = expiryDrugNames.concat(" Expiry Drug Names :  ");
                }
                expiryDrugNames = expiryDrugNames.concat(rs.getString("expiry_drugname") + "  ");

                i++;
            }

            if (i > 0) {
                expiryDrugNames = expiryDrugNames.concat(" --------------    ");
                i = 10;
            }
            sql1 = "select   SUBSTRING_INDEX(concat(item_name,'_',formulation,','),'_',3) as minstock_drugname from stock_statement where   qty>0  and qty<=min_qty";
            rs = DBConnection.getStatement().executeQuery(sql1);
            while (rs.next()) {
                if (i == 10) {
                    expiryDrugNames = expiryDrugNames.concat(" Minimum Stock Drug Names :  ");
                }
                expiryDrugNames = expiryDrugNames.concat(rs.getString("minstock_drugname"));
                i++;
            }

            if (i <= 0) {
                expiryDrugNames = "";
            } else {
                expiryDrugNames = expiryDrugNames.replaceAll("__", "_");
                expiryDrugNames = expiryDrugNames.concat("   ----------------------------------------->");
            }

        } catch (Exception e) {
            log.debug("Class:CommonDAO  method :getExpiryDrugNames Exception:  " + e.getMessage());
        }
        return expiryDrugNames;
    }

    @Override
    public List<String> getVatValues() {
        ResultSet rs = null;
        List<String> vatList = new ArrayList<String>();
        try {
            rs = DBConnection.getStatement().executeQuery("select * from vat_master");
            vatList.add("---Select---");
            while (rs.next()) {
                vatList.add(rs.getString("vat_val"));
            }
        } catch (Exception e) {
            log.debug("Class:CommonDAO  method :getVatValues Exception:  " + e.getMessage());
        }
        return vatList;
    }

    @Override
    public boolean employeeCodeExists(String empcode, String empname, String mode) {
        ResultSet rs = null;
        boolean exists = false;
        String empOldcode;
        try {
            if (mode.equals("save")) {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_code='" + empcode + "'");
                while (rs.next()) {
                    exists = true;
                }
            } else if (mode.equals("update")) {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_name!='" + empname + "'");
                while (rs.next()) {
                    empOldcode = rs.getString("emp_code");
                    if (empcode.equalsIgnoreCase(empOldcode)) {
                        exists = true;
                        break;
                    }
                }
            }
        } catch (Exception e) {
            log.debug("Class:CommonDAO  method :employeeCodeExists Exception:  " + e.getMessage());
        }
        return exists;
    }

    @Override
    public List<Double> getSalesPurchase() {
        List<Double> salespurList = new ArrayList<Double>();
        try {
            String sql1 = "call pro_getsalespurchase()";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
            while (rs.next()) {
                salespurList.add(rs.getDouble("monthcashsales"));
                salespurList.add(rs.getDouble("monthcreditsales"));
                salespurList.add(rs.getDouble("monthcardsales"));
                salespurList.add(rs.getDouble("monthtotalsales"));
                salespurList.add(rs.getDouble("todaycashsales"));
                salespurList.add(rs.getDouble("todaycreditsales"));
                salespurList.add(rs.getDouble("todaycardsales"));
                salespurList.add(rs.getDouble("todaytotalsales"));
                salespurList.add(rs.getDouble("monthpurchase"));
                salespurList.add(rs.getDouble("todaypurchase"));
            }
        } catch (Exception e) {
            log.debug("Class:CommonDAO  method :getSalesPurchase Exception:  " + e.getMessage());
        }
        return salespurList;
    }

    @Override
    public List<String> getVisitingHours(String txtvalue, String doctorName) throws RemoteException {
        List<String> customers = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (txtvalue.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select visit_hours from medp_visithours_mt where doctor_name='" + doctorName + "'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select visit_hours from medp_visithours_mt where visit_hours like'" + txtvalue + "%' and doctor_name='" + doctorName + "'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("visit_hours"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getVisitingHours     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public boolean selectPatientName(String name) {
        boolean isSelect = false;
        try {
            String sql = "select * from med_patient_details_mt where cust_name='" + name + "' and is_active = '1'";
            //String sql = "select * from cust_information where cust_name='" + name + "'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;
            log.debug(e.getMessage());
        }
        return isSelect;
    }

    @Override
    public List<Integer> getPrescriptionNo(int prescriptionNo) {
        List<Integer> prescNo = new ArrayList<Integer>();
        try {
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery("select * from prescription where id like'" + prescriptionNo + "%'");
            while (rs.next()) {
                prescNo.add(rs.getInt("id"));
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : getPrescriptionNo()   = " + ex.getMessage();
            log.debug(msg);
        }
        return prescNo;
    }

    @Override
    public List<String> getPatientName(String name) {
        List<String> patientName = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                //rs = DBConnection.getStatement().executeQuery("select distinct(cust_name) from med_patient_details_mt where is_active=1 union all select distinct(cust_code) from med_patient_details_mt where is_active=1");
                rs = DBConnection.getStatement().executeQuery("select distinct(cust_name) from med_patient_details_mt where is_active=1");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_patient_details_mt where cust_name like '" + name + "%' or cust_code like '" + name + "%' and is_active=1");
            }
            int i = 0;
            while (rs.next()) {
                patientName.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getPatientName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return patientName;
    }

    @Override
    public List<String> getDepartment(String name) {
        List<String> v = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.trim().length() == 0) {
                rs = DBConnection.getStatement().executeQuery("select distinct(department) from med_patient_details_mt order by department");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(department) from med_patient_details_mt where department like '" + name + "%' order by department;");
            }
            while (rs.next()) {
                if (rs.getString("department").length() > 0) {
                    v.add(rs.getString("department"));
                }

            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDepartment()  = " + ex.getMessage();
            log.debug(msg);
        }

        return v;
    }

    public String dateTime() {
        try {
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            // DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            java.util.Date d = new java.util.Date();
            dTime = dateFormat.format(d);
        } catch (Exception e) {
            // System.out.println("DateTime="+e);
            log.debug("Class:CommonDAO  method :DateTime Exception:" + e.getMessage());
        }
        return dTime;
    }

    @Override
    public int getincExcl(String incl_excl_flag) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    public static int inexcl;

    @Override
    public int getAddService(String cs,String ms, Double amountss) throws RemoteException {
        System.out.println("getAddService Common DAO: "+" \n "+cs+"\n"+ms+" \n "+amountss);
        int a = 0;
        int b = 0;
        try {
            ResultSet rsa = DBConnection.getStatement().executeQuery("select sno FROM billing_catagory_type  where category='" + cs + "' and status='" + 0 + "'");
            while (rsa.next()) {
                if(rsa.getString("sno").length()>0){
                   // v.add(rsa.getString("catagoryid"));
                    b=rsa.getInt("sno");
                }
            }
            
            ResultSet rs = DBConnection.getStatement().executeQuery("select billingname,billing_amount FROM billing_catagory_list  where billingname='" + ms + "' and billing_amount='" + amountss + "' ");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                DBConnection.getStatement().executeUpdate("insert into billing_catagory_list(bcatagoryid,billingname,billing_amount,status) values('"+ b +"','" + ms + "','" + amountss + "','0')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public int getAddService2(String ms, String m2) throws RemoteException {
        int a = 0;
        int b = 0;
        try {
            ResultSet rsa = DBConnection.getStatement().executeQuery("select catagoryid FROM labreportcategory  where catagoryname='" + ms + "' and status='" + 0 + "'");
            while (rsa.next()) {
                if (rsa.getString("catagoryid").length() > 0) {
                    // v.add(rsa.getString("catagoryid"));
                    b = rsa.getInt("catagoryid");
                }
            }

            ResultSet rs = DBConnection.getStatement().executeQuery("select catagoryid,reportname FROM labreport_list  where catagoryid='" + b + "' and reportname='" + m2 + "' ");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                DBConnection.getStatement().executeUpdate("insert into labreport_list(catagoryid,reportname,status) values('" + b + "','" + m2 + "','0')");
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public int getAddService1(String ms) throws RemoteException {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM labreportcategory where catagoryname='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                // System.out.println("dao getAddService1: "+ms);
                DBConnection.getStatement().executeUpdate("insert into labreportcategory(catagoryname, status) values('" + ms + "','0')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public String getCustomeridsab(String name) {
        String custName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_id from cust_information where concat(cust_name,' - ',mobile_no) ='" + name + "'");
            while (rs.next()) {
                custName = rs.getString("cust_id");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getCustomeridsab  Exception :" + ex.getMessage() + " For Patient: " + name;
            log.debug(ss);
        }
        return custName;
    }

    @Override
    public String getdocidsab(String name) {
        String custName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT doctor_code FROM doctors_information  where doctor_name ='" + name + "'");
            while (rs.next()) {
                custName = rs.getString("doctor_code");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getdocidsab  Exception :" + ex.getMessage() + " For Patient: " + name;
            log.debug(ss);
        }
        return custName;
    }

    @Override
    public int getAddTest(String ms, String amountss) throws RemoteException {
        int a = 0;
        try {

            int i = 0;
            String sql = "CAll pro_addtest (?,?,?)";
            CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString(++i, ms);
            cs.setString(++i, amountss);
            cs.registerOutParameter(++i, Types.INTEGER);
            cs.executeUpdate();
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public int getAddTest2(String ms, String m2, String min, String max) throws RemoteException {
        // System.out.println("getAddTest2 Common DAO: "+" \n "+ms+" \n "+m2);
         int a = 0;
         int b = 0;
         int c = 0;
        try {
            ResultSet rsa = DBConnection.getStatement().executeQuery("select catagoryid FROM labreportcategory  where catagoryname='" + ms + "' and status='" + 0 + "'");
            while (rsa.next()) {
                if(rsa.getString("catagoryid").length()>0){
                   // v.add(rsa.getString("catagoryid"));
                    b=rsa.getInt("catagoryid");
                }
            }

            ResultSet rs = DBConnection.getStatement().executeQuery("select catagoryid,reportname FROM labreport_list  where catagoryid='" + b + "' and reportname='" + m2 + "' ");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                DBConnection.getStatement().executeUpdate("insert into labreport_list(catagoryid,reportname,status) values('" + b + "','" + m2 + "','0')");


                ResultSet rsb = DBConnection.getStatement().executeQuery("select labreportid  FROM labreport_list  where catagoryid='" + b + "' and reportname='" + m2 + "' limit 1");
            while (rsb.next()) {

                    c=rsb.getInt("labreportid");

            }

                System.out.println(ms+" "+m2+" "+min+" "+max);
                DBConnection.getStatement().executeUpdate("insert into lab_test_range(labtestid, lab_testname, minrange, maxrange , dia)values('" +c + "','" + m2 + "','" + min + "','" + max + "','" + ms + "')");
            }

        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public List<String> editcustomerName(String name) throws RemoteException {
        // System.out.println("customerName  "+name);
        List<String> customers = new ArrayList<String>();

        try {
            // System.out.println("customerName "+name);
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select concat(laballocateid,' _ ',cust_name) as cust_name from lab_allocated_main where status=0");
            } else {
                rs = DBConnection.getStatement().executeQuery("select concat(laballocateid,' _ ',cust_name) as cust_name from lab_allocated_main where status=0 and cust_name like'" + name + "%'");
            }
            int i = 0;
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : editcustomerName  Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public int getAddHSN(String hsnCode, String Generic) throws RemoteException {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from hsncodetable where hsn_code='" + hsnCode + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                DBConnection.getStatement().executeUpdate("insert into hsncodetable(hsn_code,description)values('" + hsnCode + "','" + Generic + "')");
            }
        } catch (Exception e) {
            System.out.println("getAddHSN=" + e);
            log.debug("Class:CommonDAO  method :getAddHSN Exception:  " + e.getMessage());
        }
        return a;
    }

    @Override
    public JasperPrint jasperPrint(String billno, String billmodel, JasperReport jasperReport) throws RemoteException {
        JasperPrint jasperPrint = null;
        try {
            // System.out.println("inside Doa jasper");
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("billno", billno);
            params1.put("billmodel", billmodel);
            jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());
        } catch (Exception ex) {
            System.out.println("Class : commonDAO Method : jasperPrint     Exception :" + ex);
            String ss = " Class : commonDAO Method : jasperPrint     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return jasperPrint;
    }

    @Override
    public String[] getdrugValues(String query) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

      @Override
    public int getDeleteServBill(String hsnCode) {
        int custName = 0;
        try {
            DBConnection.getStatement().executeUpdate("update billing_main inner join  billing_sub on billing_sub.billrefid=billing_main.billid set billing_main.status=1,billing_sub.status=1 where billing_main.billid='" + hsnCode + "'");

            ResultSet rs = DBConnection.getStatement().executeQuery("select status from billing_main where billid='" + hsnCode + "'");
            while(rs.next()){
            custName=rs.getInt("status");
            }
            System.out.println(custName);

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getDeleteServBill  Exception :" + ex.getMessage() + " For Patient: " + hsnCode;
            log.debug(ss);
        }
        return custName;
    }

      @Override
    public int getAddServcateg(String ms) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from billing_catagory_type where category='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                DBConnection.getStatement().executeUpdate("insert into billing_catagory_type(category,status) values('" + ms + "','0')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public String getcustomername(String name) throws RemoteException {
         String custName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_name ='" + name + "'");
            while (rs.next()) {
                custName = rs.getString("cust_name");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getcustomername  Exception :" + ex.getMessage() + " For Patient: " + name;
            log.debug(ss);
        }
        return custName;
    }

@Override
    public int insert(String name) throws RemoteException {
        int a = 1;
        try {

            System.out.println("get");
            boolean flag = true;
            ResultSet rs = DBConnection.getStatement().executeQuery("Select category from radiology_category_type where category = '" + name + "'");
            while (rs.next()) {
                flag = false;
                a = 0;
            }
            if (flag) {
                DBConnection.getStatement().executeUpdate("insert into radiology_category_type (category) values('" + name + "')");
            }
        } catch (Exception ex) {
            String ss = "Class: CommonDAO Method: insert Exception: " + ex.getMessage();
            log.debug(ss);
        }
        return a;
    }

 @Override
    public List<String> getRadiologySubtype(String radiology, String radiologyType) throws RemoteException {
        System.out.println("DAO");
        List<String> subtype = new ArrayList<String>();
        ResultSet rs = null;
        try {
            if (radiologyType.equals("")) {
                rs = DBConnection.getStatement().executeQuery("Select distinct radiology_subtype from radiology where radiology ='" + radiology + "'");
            } else {
                rs = DBConnection.getStatement().executeQuery("Select distinct radiology_subtype from radiology where radiology ='" + radiology + "' and radiology_subtype like '" + radiologyType + "%'");
            }

            while (rs.next()) {
                subtype.add(rs.getString("radiology_subtype"));
            }
            subtype.add("Add new");
        } catch (Exception e) {
            System.out.println(e.getMessage());
            String ss = "Class: CommonDAO Method: getRadiologySubtype Exception: " + e.getMessage();
            log.debug(ss);
        }
        return subtype;
    }


    @Override
    public int getRadiologyId(String radiology) throws RemoteException {
        int id = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("Select radiology_id from radiology_category_type where category ='" + radiology + "'");
            while (rs.next()) {
                id = rs.getInt("radiology_id");
            }
        } catch (Exception e) {
            String ss = "Class: CommonDAO Method: getRadiologyId Exception: " + e.getMessage();
            log.debug(ss);
        }
        return id;
    }



    @Override
    public String getPatientCode(String name) throws RemoteException {
        String cusCode = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("Select cust_code from cust_information where cusname_mobno ='" + name + "'");
            while (rs.next()) {
                cusCode = rs.getString("cust_code");
            }
        } catch (Exception e) {
            String ss = "Class: CommonDAO Method: getPatientCode Exception: " + e.getMessage();
            log.debug(ss);
        }
        return cusCode;

    }
     @Override
    public String getCustomerBalanceDue(String customer) throws RemoteException {
          String retVal = "";
        try{
             Double bal=0.00;
          java.sql.PreparedStatement ps;
            ResultSet rs;

          ps = DBConnection.getConnection().prepareStatement("Select advanceamounts from med_patient_details_mt where cust_name = ?");
         ps.setString(1, customer);
        rs= ps.executeQuery();
        while(rs.next())
        {
     bal=   rs.getDouble("advanceamounts");
        }

          retVal=Value.Round(bal);
         }
         catch(Exception e){
              String ss = "Class : CommonDAO  Method  : getCustomerBalanceDue:" + e.getMessage();
            log.debug(ss);
         e.printStackTrace();
         }
          return retVal;
    }


     @Override
    public int getAddSubcateg(String category,String subCategory) throws RemoteException {
         int a=0;
      try{

        java.sql.PreparedStatement ps;
        ResultSet rs;
        ps=DBConnection.getConnection().prepareStatement("Select sub_category from billing_subcategory where category = ? and sub_category = ?");
        ps.setString(1, category);
        ps.setString(2, subCategory);
        rs=ps.executeQuery();
        while(rs.next())
        {
        a=1;
        }
        if(a==0)
        {
        ps=DBConnection.getConnection().prepareStatement("Insert into billing_subcategory(category,sub_category) values (?,?) ");
        ps.setString(1, category);
        ps.setString(2, subCategory);
        ps.executeUpdate();
        a=2;
        }
      }
      catch(Exception ex){
        String ss = "Class : CommonDAO  Method  : getAddSubcateg:" + ex.getMessage() ;
            log.debug(ss);
      }
       return a;
    }

     @Override
    public int getAddService(String cs, String subcategory,String service,  Double amountss,Double gst) throws RemoteException {
//
        System.out.println("getAddService Common DAO: " + " \n " + subcategory + "\n" + service + " \n " + cs);
   int a = 0;
//       
        try {
            java.sql.PreparedStatement ps;
            ResultSet rs;
            ps = DBConnection.getConnection().prepareStatement("Select servicename from billing_category where category = ? and subcategory= ? and servicename = ?");
            ps.setString(1, cs);
            ps.setString(2, subcategory);
             ps.setString(3, service);
            rs = ps.executeQuery();
            System.out.println("nott");
            while (rs.next()) {
                System.out.println("not");
                System.out.println(rs.getString("servicename"));
                a = 1;
            }
            if (a != 1) {
                ps = DBConnection.getConnection().prepareStatement("Insert into billing_category(category,subcategory,servicename, amount, gst)values(?,?,?,?,?)");
                 ps.setString(1, cs);
                ps.setString(2, subcategory);
                ps.setString(3, service);
                ps.setDouble(4, amountss);
                ps.setDouble(5, gst);

               ps.executeUpdate();
                a=2;
            }
  }
  catch(SQLException ex)
  {
      String ss = "Class : CommonDAO   Method  : getAddService  Exception :" + ex.getMessage() ;
            log.debug(ss);
      ex.printStackTrace();
  }
   return a;
    }
 @Override
    public boolean updateAdvance(Double amt,String customer) throws RemoteException {
       try{
           System.out.println("?>>");
        Double bal=0.00;
          java.sql.PreparedStatement ps;
            ResultSet rs;

          ps = DBConnection.getConnection().prepareStatement("Select advanceamounts from med_patient_details_mt where cust_name = ?");
         ps.setString(1, customer);
        rs= ps.executeQuery();
        while(rs.next())
        {
     bal=   rs.getDouble("advanceamounts");
        }
         ps = DBConnection.getConnection().prepareStatement("Update med_patient_details_mt set  advanceamounts = ? where cust_name = ?");
       bal+=amt;
         ps.setDouble(1, bal);
         ps.setString(2, customer);
         ps.executeUpdate();
         System.out.println("updation......");
         return true;
       }
       catch(Exception e){
          String ss = "Class : CommonDAO  Method  : updateAdvance:" + e.getMessage();
            log.debug(ss);
         e.printStackTrace();
       }
       return false;

}

  @Override
    public int getQueryWitColumn(String query, String col) throws RemoteException {
        int qty = 0;
        try {
            System.out.println(query);
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                System.out.println("no");
                if (rs.getInt(col) != 0) {
                    System.out.println("came");
                    qty = rs.getInt(col);
                    System.out.println(qty);
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getQueryWitColumn:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
            ex.getMessage();
            ex.printStackTrace();
        }

        return qty;
    }
     @Override
    public List<ServiceModel> getCreditBill(String cusName) throws RemoteException {
        System.out.println("Cammmmmm");
        ServiceModel service;
        List<ServiceModel> a = new ArrayList<ServiceModel>();
        List<Integer> bill = new ArrayList<Integer>();
        try {
            java.sql.PreparedStatement ps;
            ResultSet rs;
            ps = DBConnection.getConnection().prepareStatement("Select billid from billing_main where cust_name = ? and  paymentmode = 'Credit' and bill_status = -1");
            ps.setString(1, cusName);
            rs = ps.executeQuery();
            if (rs.next() == false) {
                System.out.println("fallsseeeee");
                return a;
            } else {
                System.out.println("trueee");
                // Add the first result
            bill.add(rs.getInt("billid"));
                while (rs.next()) {
                    System.out.println(rs.getInt("billid"));
                    bill.add(rs.getInt("billid"));
                }
            }
            for (int i = 0; i < bill.size(); i++) {
                ps = DBConnection.getConnection().prepareStatement("Select * from billing_sub where billrefid = ? and paid_status = -1");
                ps.setInt(1, bill.get(i));
                rs = ps.executeQuery();
                while (rs.next()) {
                    service = new ServiceModel();
                    service.setBillno(rs.getInt("billrefid") + "");
                    service.setService_name(rs.getString("service_name"));
                    service.setQty(rs.getDouble("qty"));
                    service.setDiscount_amt(rs.getDouble("unit_discount"));
                    service.setUnit_price(rs.getDouble("unit_price"));
                    service.setUnit_gst(rs.getDouble("unit_vat"));
                    service.setTotal_amount(rs.getDouble("total_price"));
                    service.setCategory(rs.getString("categoryname"));
                    a.add(service);
                    System.out.println(a.toString());
                }
                 System.out.println(a.toString());
                 System.out.println("iter");
                 System.out.println(i);
                 System.out.println(bill.size());
                 System.out.println(bill.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
            String ss = "Class : CommonDAO  Method  : getCreditBill:" + e.getMessage();
            log.debug(ss);
        }
        return a;
    }
      @Override
    public List<String> getService(String category, String subcategory, String service) throws RemoteException {
     List<String> customers = new ArrayList<String>();
        try{
           java.sql.PreparedStatement ps;
        ResultSet rs;
      if(!service.equals(""))
      {
           ps=DBConnection.getConnection().prepareStatement("Select servicename from billing_category where category = ? and subcategory = ? and servicename like ?");
        ps.setString(1, category);
        ps.setString(2, subcategory);
        ps.setString(3, service + "%");


      }
 else
      {
       ps=DBConnection.getConnection().prepareStatement("Select servicename from billing_category where category = ? and subcategory = ?");
        ps.setString(1, category);
        ps.setString(2, subcategory);
 }
         rs=ps.executeQuery();
        while(rs.next())
        {
        customers.add(rs.getString("servicename"));
        }
      }
       catch(Exception ex){
           ex.printStackTrace();
         String ss = "Class : CommonDAO  Method  : getService:" + ex.getMessage() ;
            log.debug(ss);
       }
     System.out.println("cusss");
     customers.add("Others");
      System.out.println(customers);
        return customers;
    }

}
