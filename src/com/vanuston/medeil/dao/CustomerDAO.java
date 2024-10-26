/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import java.sql.PreparedStatement;
import com.vanuston.medeil.implementation.Customer;
import com.vanuston.medeil.model.CustomerModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.model.VitalScienceModel;
import com.vanuston.medeil.model.DischargeModel;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.lang.System;


/**
 *
 * @author jai
 */
public class CustomerDAO implements Customer {

    static Logger log = Logger.getLogger(CustomerDAO.class, "com.vanuston.medeil.dao.CustomerDAO");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public Object viewRecord(Object name) {
       CustomerModel customerModel = new CustomerModel();
        try {
            String sql = "select * from cust_information where where cusname_mobno = '" + name + "' or cust_code = '" + name + "'";
            //String sql = "select * from cust_information where concat(cust_name,' - ',mobile_no) = '" + name + "' or cust_code = '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                customerModel.setCustomerCode(rs.getString("cust_code"));
                customerModel.setCusttypeid(rs.getString("cust_type_id"));
                customerModel.setFamilyName(rs.getString("family_name"));
                customerModel.setAge(rs.getString("age"));
                customerModel.setGender(rs.getString("gender"));
                //customerModel.setDateofbirth(rs.getString("custdateofbirth"));
             //  cs.setString("custdateofbirth", customerModel.getDateofbirth());
               //cs.setString("custintime", customerModel.getIntime());employeeModel.setDateOfBirth(sdf.format(rs.getDate(++i)).toString());
              customerModel.setDateofbirth(rs.getString("dob"));
              System.out.println(rs.getString("dob"));
               // customerModel.setDateofbirth(srf.format(rs.getDate("dob")).toString());//padmini
              //  customerModel.setIntime(rs.getString("cintimes"));
                //customerModel.setIntime(sit.format(rs.getDate("cintimes")).toString());//padmini
              //  customerModel.setOccupation(rs.getString("occupation"));
                customerModel.setAddress1(rs.getString("cust_address1"));
                customerModel.setAddress2(rs.getString("cust_address2"));
                customerModel.setAddress3(rs.getString("cust_address3"));
                   System.out.println(rs.getString("cust_address1"));
                       System.out.println("jaikkk");
                customerModel.setCity(rs.getString("cust_city"));
                customerModel.setCountry(rs.getString("cust_country"));
                customerModel.setState(rs.getString("cust_state"));
                customerModel.setPincode(rs.getString("cust_pincode"));
                customerModel.setPhoneNumber(rs.getString("phone_no"));
                customerModel.setMobileNumber(rs.getString("mobile_no"));
                customerModel.setEmailid(rs.getString("email_id"));
                customerModel.setAlertType(rs.getString("alert_type"));
                customerModel.setCreditLimit(rs.getDouble("credit_limit"));
            }
        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : viewRecord() Exception : " + e.getMessage());
        }
        return customerModel;}

    @Override
    public boolean deleteRecord(Object customerName) {
        boolean isDelete = false;

        try {
            int rs = DBConnection.getStatement().executeUpdate("update cust_information set cust_flag_id = 1 where cust_name = '" + customerName + "'");
            if (rs > 0) {
                isDelete = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object createRecord(Object customerModels) {
        boolean iscreate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            String sql = "CALL pro_customerinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("custcode", customerModel.getCustomerCode());
            cs.setString("custTypeId", customerModel.getCusttypeid());
            cs.setString("familyname", customerModel.getFamilyName());
            cs.setString("custname", customerModel.getCustomerName());
            cs.setString("custage", customerModel.getAge());
            cs.setString("custgender", customerModel.getGender());
             cs.setDate("custdateofbirth",java.sql.Date.valueOf(customerModel.getDateofbirth()));
            cs.setString("custaddress1", customerModel.getAddress1());
            cs.setString("custaddress2", customerModel.getAddress2());
            cs.setString("custaddress3", customerModel.getAddress3());
            cs.setString("custcity", customerModel.getCity());
            cs.setString("custstate", customerModel.getState());
            cs.setString("custcountry", customerModel.getCountry());
            cs.setString("custpincode", customerModel.getPincode());
            cs.setString("phoneno", customerModel.getPhoneNumber());
            cs.setString("mobileno", customerModel.getMobileNumber());
            cs.setString("emailid", customerModel.getEmailid());
            cs.setString("alerttype", customerModel.getAlertType());
            cs.setDouble("creditlimit", customerModel.getCreditLimit());
            cs.setInt("sentflagid", customerModel.getSMSFlag());
            cs.setString("functionality", "save");
             cs.setInt(22, customerModel.getPatientType());
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            e.printStackTrace();
        }

        return iscreate;
    }

    @Override
    public Object updateRecord(Object customerModels) {
        boolean isUpdate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            String sql = "CALL pro_customerinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("custcode", customerModel.getCustomerCode());
            cs.setString("custTypeId", customerModel.getCusttypeid());
            cs.setString("familyname", customerModel.getFamilyName());
            cs.setString("custname", customerModel.getCustomerName());
            cs.setString("custage", customerModel.getAge());
            cs.setString("custgender", customerModel.getGender());
             cs.setDate("custdateofbirth",java.sql.Date.valueOf(customerModel.getDateofbirth()));
            cs.setString("custaddress1", customerModel.getAddress1());
            cs.setString("custaddress2", customerModel.getAddress2());
            cs.setString("custaddress3", customerModel.getAddress3());
            cs.setString("custcity", customerModel.getCity());
            cs.setString("custstate", customerModel.getState());
            cs.setString("custcountry", customerModel.getCountry());
            cs.setString("custpincode", customerModel.getPincode());
            cs.setString("phoneno", customerModel.getPhoneNumber());
            cs.setString("mobileno", customerModel.getMobileNumber());
            cs.setString("emailid", customerModel.getEmailid());
            cs.setString("alerttype", customerModel.getAlertType());
            cs.setDouble("creditlimit", customerModel.getCreditLimit());
            cs.setInt("sentflagid", customerModel.getSMSFlag());
            cs.setString("functionality", "update");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isUpdate;
    }

    @Override
    public CustomerModel viewAllRecord(Object customerBeans) throws RemoteException {

        ArrayList<CustomerModel> customerListBean = new ArrayList();
        CustomerModel customerBean = (CustomerModel) customerBeans;
        CustomerModel CustomerAddBean; //=new VatRegisterModel();
        try {
            if (customerBean.getChkValue().equals("getCustDiscountInfo")) {

                CustomerAddBean = new CustomerModel();
                customerBean = (CustomerModel) customerBeans;
                ResultSet rs = null;

                rs = DBConnection.getStatement().executeQuery("SELECT customer_type,customer_percentage FROM customer_type_mt where id = '" + customerBean.getCusttypeid() + "'");

                while (rs.next()) {
                    CustomerAddBean.setCustomerType(rs.getString("customer_type"));
                    CustomerAddBean.setCustomerPercentage(rs.getDouble("customer_percentage"));
                    customerListBean.add(CustomerAddBean);
                }
                customerBean.setCustomerinfoList(customerListBean);

            } else if (customerBean.getChkValue().equals("getCustDiscount")) {

                CustomerAddBean = new CustomerModel();
                customerBean = (CustomerModel) customerBeans;
                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery("SELECT id,customer_percentage FROM customer_type_mt where customer_type = '" + customerBean.getCusttypeid() + "'");

                while (rs.next()) {
                    CustomerAddBean.setCustomerType(rs.getString("id"));
                    CustomerAddBean.setCustomerPercentage(rs.getDouble("customer_percentage"));
                    customerListBean.add(CustomerAddBean);
                }
                customerBean.setCustomerinfoList(customerListBean);

            } else if (customerBean.getChkValue().equals("getCustDiscType")) {

                CustomerAddBean = new CustomerModel();
                customerBean = (CustomerModel) customerBeans;
                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery("SELECT * FROM customer_type_mt ");
                while (rs.next()) {
                    CustomerAddBean = new CustomerModel();
                    CustomerAddBean.setCustomerType(rs.getString("customer_type"));
                    customerListBean.add(CustomerAddBean);
                }
                customerBean.setCustomerinfoList(customerListBean);
            }
        } catch (Exception e) {
            String msg = "Class : CustomerDAO  Method : viewAllRecord()   =" + e.getMessage() + "";
            log.debug(msg);
        }
        return customerBean;
    }

    @Override
    public boolean deletePatientDetailsRecord(Object patientName) {
        boolean isDelete = false;
        try {
            int rs = DBConnection.getStatement().executeUpdate("update med_patient_details_mt set is_active = 0 where cust_name = '" + patientName + "'");
            DBConnection.getStatement().executeUpdate("update med_patient_allergies_mt set is_active = 0 where cust_name = '" + patientName + "'");
            DBConnection.getStatement().executeUpdate("update med_patient_health_conditions_mt set is_active = 0 where cust_name='" + patientName + "'");
            if (rs > 0) {
                isDelete = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isDelete;
    }
 
    @Override
    public  boolean delRecord6(String id, String date) {
        boolean isDelete = false;
        try {
            java.util.Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2= sdf.format(date1);
            int rs = DBConnection.getStatement().executeUpdate("update dischargesummary set status = 2 where Infodate='"+date2+"'and cust_code = '" + id + "' ");

            if (rs > 0) {
                isDelete = true;
            }

        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : delRecord4() Exception : " + e.getMessage());
        }
        return isDelete;

    }



    @Override
    public Object createPatientDetailsRecord(Object customerModels) {
        boolean iscreate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
//            boolean check = false;
//            java.sql.PreparedStatement p;
//            ResultSet r;
//            p=DBConnection.getConnection().prepareStatement("Select cust_name from med_patient_details_mt where cust_name = ?");
//            p.setString(1,customerModel.getPatientName());
//            r=p.executeQuery();
//            while(r.next())
//            {
//            check = true;
//
//            }
//            if(check==false)
//            {
            //String sql = "select cust_code,cust_name from cust_information where cust_name = '" + customerModel.getPatientName() + "' or mobile_no = '" + customerModel.getPatientName() + "' and cust_flag_id = 0";
           //String sql = "select cust_code,cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '"+customerModel.getPatientName()+"' or mobile_no = '"+customerModel.getPatientName()+"' and cust_flag_id = 0";
            String sql = "select cust_code,concat(cust_name,' - ',mobile_no) from cust_information where concat(cust_name,' - ',mobile_no) = '"+customerModel.getPatientName()+"' or mobile_no = '"+customerModel.getPatientName()+"' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                customerModel.setCustomerCode(rs.getString("cust_code"));
                //customerModel.setPatientName(rs.getString("cust_name"));
                customerModel.setPatientName(rs.getString("concat(cust_name,' - ',mobile_no)"));
            }
            String sql1 = "CALL pro_patient_details_dao(?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);
            cs.setString("custCode", customerModel.getCustomerCode());
            cs.setString("custDate", customerModel.getDate());
            cs.setString("custName", customerModel.getPatientName());
            cs.setString("doctorName", customerModel.getDoctorName());
            cs.setString("Department", customerModel.getDepartment());
            cs.setString("wardNumber", customerModel.getWardNumber());
            cs.setString("roomNumber", customerModel.getRoomNumber());
            cs.setString("custType", customerModel.getCustType());
            cs.setString("createdBy", customerModel.getCurrentUser());
            System.out.println("MarkAntony");
            System.out.println(customerModel.getAdvanceamount());
            cs.setDouble("advanceamounts",customerModel.getAdvanceamount());
          // System.out.println("advanceamount",customerModel.getAdvanceamount());
            System.out.println("ma");
            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);
             System.out.println("ma123");
         cs.executeUpdate();

            
                System.out.println("MarkAntony125");
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
            }
            if (customerModel.getAllergiesList().size() > 0) {
                String sql2 = "insert into med_patient_allergies_mt(cust_code,cust_name,patient_allergies,created_by,created_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql2);
                for (int j = 0; j < customerModel.getAllergiesList().size(); j++) {
                    ps.setString(1, customerModel.getCustomerCode());
                    ps.setString(2, customerModel.getPatientName());
                    ps.setString(3, customerModel.getAllergiesList().get(j));
                    ps.setString(4, customerModel.getCurrentUser());
                    ps.setString(5, sdf.format(new Date()));
                    ps.executeUpdate();
                }
            }
            if (customerModel.getHealthConditionsList().size() > 0) {
                String sql3 = "insert into med_patient_health_conditions_mt(cust_code,cust_name,patient_health_conditions,created_by,created_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
                for (int j = 0; j < customerModel.getHealthConditionsList().size(); j++) {
                    ps.setString(1, customerModel.getCustomerCode());
                    ps.setString(2, customerModel.getPatientName());
                    ps.setString(3, customerModel.getHealthConditionsList().get(j));
                    ps.setString(4, customerModel.getCurrentUser());
                    ps.setString(5, sdf.format(new Date()));
                    ps.executeUpdate();
                }
            }


//        else{
//         p=DBConnection.getConnection().prepareStatement("Select advanceamounts from med_patient_details where cust_name = ?");
//            p.setString(1,customerModel.getPatientName());
//            r=p.executeQuery();
//           Double d= r.getDouble("advanceamounts");
//           d+=customerModel.getAdvanceamount();
//           p=DBConnection.getConnection().prepareStatement("update med_patient_details set advanceamounts = ? where cust_name = ?");
//           p.executeUpdate();
//        }
        }
         catch (Exception e) {
            String msg = "Class : CustomerDAO  Method : createPatientDetailsRecord()   =" + e.getMessage() + "";
            log.debug(msg);
        }
        return iscreate;
    }

    @Override
    public Object updatePatientDetailsRecord(Object customerModels) {
        boolean isUpdate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            //String sql = "select cust_code,cust_name from cust_information where cust_name = '" + customerModel.getPatientName() + "' or mobile_no = '" + customerModel.getPatientName() + "' and cust_flag_id = 0";
            String sql = "select cust_code,cust_name from med_patient_details_mt where cust_name = '"+customerModel.getPatientName()+"' and is_active = 1";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                customerModel.setCustomerCode(rs.getString("cust_code"));
                customerModel.setPatientName(rs.getString("cust_name"));
            }
            String sql1 = "delete from med_patient_allergies_mt where cust_code='" + customerModel.getCustomerCode() + "' and cust_name='" + customerModel.getPatientName() + "'";
            String sql2 = "delete from med_patient_health_conditions_mt where cust_code='" + customerModel.getCustomerCode() + "' and cust_name='" + customerModel.getPatientName() + "'";
            DBConnection.getStatement().executeUpdate(sql1);
            DBConnection.getStatement().executeUpdate(sql2);
            String sql3 = "CALL pro_patient_details_dao(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql3);
            cs.setString("custCode", customerModel.getCustomerCode());
            cs.setString("custDate", customerModel.getDate());
            cs.setString("custName", customerModel.getPatientName());
            cs.setString("doctorName", customerModel.getDoctorName());
            cs.setString("Department", customerModel.getDepartment());
            cs.setString("wardNumber", customerModel.getWardNumber());
            cs.setString("roomNumber", customerModel.getRoomNumber());
            cs.setString("custType", customerModel.getCustType());
            System.out.println("555");
            cs.setDouble("advanceamounts",customerModel.getAdvanceamount());
             System.out.println("ma555");
            cs.setString("createdBy", customerModel.getCurrentUser());
            cs.setString("functionality", "update");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
            if (customerModel.getAllergiesList().size() > 0) {
                String sql4 = "insert into med_patient_allergies_mt(cust_code,cust_name,patient_allergies,updated_by,updated_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql4);
                for (int j = 0; j < customerModel.getAllergiesList().size(); j++) {
                    ps.setString(1, customerModel.getCustomerCode());
                    ps.setString(2, customerModel.getPatientName());
                    ps.setString(3, customerModel.getAllergiesList().get(j));
                    ps.setString(4, customerModel.getCurrentUser());
                    ps.setString(5, sdf.format(new Date()));
                    ps.executeUpdate();
                }
            }
            if (customerModel.getHealthConditionsList().size() > 0) {
                String sql5 = "insert into med_patient_health_conditions_mt(cust_code,cust_name,patient_health_conditions,updated_by,updated_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql5);
                for (int j = 0; j < customerModel.getHealthConditionsList().size(); j++) {
                    ps.setString(1, customerModel.getCustomerCode());
                    ps.setString(2, customerModel.getPatientName());
                    ps.setString(3, customerModel.getHealthConditionsList().get(j));
                    ps.setString(4, customerModel.getCurrentUser());
                    ps.setString(5, sdf.format(new Date()));
                    ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            String msg = "Class : CustomerDAO  Method : updatePatientDetailsRecord()   =" + e.getMessage() + "";
            log.debug(msg);
        }

        return isUpdate;
    }

    @Override
    public List<String> getAllergies() {
        List<String> list = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select allergies from med_allergies_list_mt where is_active=1");
            if (rs != null) {
                list = new ArrayList<String>();
                while (rs.next()) {
                    list.add(rs.getString("allergies"));
                }
            }
        } catch (Exception e) {
            log.debug(" Class:CustomerDAO Method:getAllergies Exception:" + e.getMessage());
        }
        return list;
    }

    @Override
    public int addAllergie(String allergie) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from med_allergies_list_mt where allergies='" + allergie + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                String query = "insert into med_allergies_list_mt(allergies) values(?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
                ps.setString(1, allergie);
                ps.executeUpdate();
                a = 0;
            }
        } catch (Exception ex) {
            log.debug(" Class:CustomerDAO Method:addAllergie Exception:" + ex.getMessage());
        }
        return a;
    }

    @Override
    public List<String> getHealthConditions() {
        List<String> list = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select health_conditions from med_health_conditions_list_mt where is_active=1");
            if (rs != null) {
                list = new ArrayList<String>();
                while (rs.next()) {
                    list.add(rs.getString("health_conditions"));
                }
            }
        } catch (Exception e) {
            log.debug(" Class:CustomerDAO Method:getHealthConditions Exception:" + e.getMessage());
        }
        return list;
    }

    @Override
    public int addHealthCondition(String healthCondition) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from med_health_conditions_list_mt where health_conditions='" + healthCondition + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                String query = "insert into med_health_conditions_list_mt(health_conditions) values(?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
                ps.setString(1, healthCondition);
                ps.executeUpdate();
                a = 0;
            }
        } catch (Exception ex) {
            log.debug(" Class:CustomerDAO Method:addHealthCondtion Exception:" + ex.getMessage());
        }
        return a;
    }

    @Override
    public CustomerModel loadCustomerMaintain() {
        ResultSet rs = null;
        CustomerModel customer = new CustomerModel();
        CustomerModel custsearch;
        List custlist = new ArrayList();
        try {
            rs = DBConnection.getStatement().executeQuery("select *,(select max(bill_no) from sales_maintain_bill sm  where sm.cust_name = cu.cust_name)bill_no,(select max(bill_date) from sales_maintain_bill sm  where sm.cust_name = cu.cust_name)bill_date from (select * from cust_information  order by cust_id desc limit 20)cu;");
            rs.last();
            int cnt = rs.getRow();

            rs.beforeFirst();
            customer.setRowCount(cnt);
            while (rs.next()) {
                custsearch = new CustomerModel();
                custsearch.setCustomerCode(rs.getString("cust_code"));
                custsearch.setCustomerName(rs.getString("cust_name"));
                custsearch.setMobileNumber(rs.getString("mobile_no"));
                custsearch.setCity(rs.getString("cust_city"));
                custsearch.setlastBillDate(rs.getString("bill_date"));
                custsearch.setlastBillNumber(rs.getString("bill_no"));
                custsearch.setCreditLimit(rs.getInt("credit_limit"));
                custlist.add(custsearch);
            }
            customer.setListofitems(custlist);
        } catch (Exception ex) {
            System.out.println("Exception in customer dao " + ex);
            String ss = " Class : CustomerDAO  Method  : loadCustomerMaintain Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customer;
    }

    @Override
    public CustomerModel loadCustomerSearch(String option, String val) throws RemoteException {
        ResultSet rs = null;
        CustomerModel customer = new CustomerModel();
        CustomerModel custsearch;
        List custlist = new ArrayList();
        try {

            if (option.equals("cust_name")) {
                rs = DBConnection.getStatement().executeQuery("select * from(select * from cust_information where cust_name like '" + val + "%')ci left join (select max(bill_date)BillDate,max(bill_no)BillNo,cust_name from sales_maintain_bill where cust_name like '" + val + "%' group by cust_name)sm  on ci.cust_name = sm.cust_name;");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from(select * from cust_information where mobile_no like '" + val + "%')ci left join (select max(bill_date)BillDate,max(bill_no)BillNo,cust_name from sales_maintain_bill group by cust_name)sm  on ci.cust_name = sm.cust_name;");
            }

            rs.last();
            int cnt = rs.getRow();
            rs.beforeFirst();
            customer.setRowCount(cnt);
            while (rs.next()) {
                custsearch = new CustomerModel();
                custsearch.setCustomerCode(rs.getString("cust_code"));
                custsearch.setCustomerName(rs.getString("cust_name"));
                custsearch.setMobileNumber(rs.getString("mobile_no"));
                custsearch.setCity(rs.getString("cust_city"));
                custsearch.setlastBillDate(rs.getString("BillDate"));
                custsearch.setlastBillNumber(rs.getString("BillNo"));
                custsearch.setCreditLimit(rs.getInt("credit_limit"));
                custlist.add(custsearch);
            }
            customer.setListofitems(custlist);
        } catch (Exception ex) {
            System.out.println("Exception in customeer dao search value " + ex);

            String ss = " Class : CustomerDAO  Method  : loadCustomerMaintain Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customer;
    }

    @Override
    public CustomerModel loadCustomerSearch(String cdate) throws RemoteException {
        ResultSet rs = null;
        CustomerModel customer = new CustomerModel();
        CustomerModel custsearch;
        List custlist = new ArrayList();
        try {
            rs = DBConnection.getStatement().executeQuery("select * from(select * from sales_maintain_bill where bill_Date ='" + cdate + "')s inner join cust_information ci on s.cust_name = ci.cust_name;");

            rs.last();
            int cnt = rs.getRow();
            rs.beforeFirst();
            customer.setRowCount(cnt);
            while (rs.next()) {
                custsearch = new CustomerModel();
                custsearch.setCustomerCode(rs.getString("cust_code"));
                custsearch.setCustomerName(rs.getString("cust_name"));
                custsearch.setMobileNumber(rs.getString("mobile_no"));
                custsearch.setCity(rs.getString("cust_city"));
                custsearch.setlastBillDate(rs.getString("bill_date"));
                custsearch.setlastBillNumber(rs.getString("bill_no"));
                custsearch.setCreditLimit(rs.getInt("credit_limit"));
                custlist.add(custsearch);
            }
            customer.setListofitems(custlist);
        } catch (Exception ex) {
            System.out.println("Exception in customeer dao search value " + ex);

            String ss = " Class : CustomerDAO  Method  : loadCustomerMaintain Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customer;
    }

    @Override
    public boolean delRecord4(Integer id, String date) {
        boolean isDelete = false;
        try {
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2 = sdf.format(date1);
            int rs = DBConnection.getStatement().executeUpdate("update med_consultantnote_mt set status = 2 where Infodate='" + date2 + "'and custid = '" + id + "' ");

            if (rs > 0) {
                isDelete = true;
            }

        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : delRecord4() Exception : " + e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object updatePatientDetailsRecord2(Object customerModels) {
        boolean isUpdate = false;
        VitalScienceModel vitalModel = (VitalScienceModel) customerModels;
        try {
            String sql = "select cust_id,cust_code,concat(cust_name,' - ',mobile_no) as cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '" + vitalModel.getPatientName() + "' or mobile_no = '" + vitalModel.getPatientName() + "' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                vitalModel.setPid(rs.getInt("cust_id"));
                vitalModel.setCustomerCode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
            }
            String sql1 = "CALL pro_consult_dao(?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);
            cs.setString("vDate", vitalModel.getDate());
            cs.setInt("vPid", vitalModel.getPid());
            cs.setString("vCode", vitalModel.getCustomerCode());
            cs.setString("vcustName", vitalModel.getPatientName());
            cs.setString("cSymp", vitalModel.getSymptom());
            cs.setString("cAssess", vitalModel.getAssessment());
            cs.setString("cObser", vitalModel.getObservation());
            cs.setString("cPlan", vitalModel.getPlan());
            cs.setString("vusername", vitalModel.getUserName());

            cs.setString("functionality", "update");

            cs.registerOutParameter("status_flag", Types.INTEGER);

            cs.executeUpdate();

            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
        } catch (Exception e) {
            log.debug("Class : CustomerDAO Method : updatePatientDetailsRecord1 Exception : " + e.getMessage());
        }

        return isUpdate;
    }

    @Override
    public Object createRecordConsult(Object customerModels) {
        boolean iscreate = false;
        VitalScienceModel vitalModel = (VitalScienceModel) customerModels;
        try {
            String sql = "select cust_id,cust_code,concat(cust_name,' - ',mobile_no) as cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '" + vitalModel.getPatientName() + "' or mobile_no = '" + vitalModel.getPatientName() + "' and cust_flag_id = 0";
            // String sql = "select cust_id,cust_code,cust_name from cust_information where cust_name = '"+vitalModel.getPatientName()+"' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                vitalModel.setPid(rs.getInt("cust_id"));
                vitalModel.setCustomerCode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
                //  System.out.println(rs.getInt("cust_id")+" / "+rs.getString("cust_code")+" / "+rs.getString("cust_name"));
            }

            String sql1 = "CALL pro_consult_dao(?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);

            cs.setString("vDate", vitalModel.getDate());
            cs.setInt("vPid", vitalModel.getPid());
            cs.setString("vCode", vitalModel.getCustomerCode());
            cs.setString("vcustName", vitalModel.getPatientName());
            cs.setString("cSymp", vitalModel.getSymptom());
            cs.setString("cAssess", vitalModel.getAssessment());
            cs.setString("cObser", vitalModel.getObservation());
            cs.setString("cPlan", vitalModel.getPlan());
            cs.setString("vusername", vitalModel.getUserName());

            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);

            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
            }

        } catch (Exception e) {
            log.debug("Class : CustomerDAO Method : createPatientDetailsRecord1 Exception : " + e.getMessage());
        }
        return iscreate;
    }

    @Override
    public boolean delRecord5(Integer id, String date) {
        boolean isDelete = false;
        try {
            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2 = sdf.format(date1);
            int rs = DBConnection.getStatement().executeUpdate("update dischargesummary set status = 2 where Infodate='" + date2 + "'and custid = '" + id + "' ");

            if (rs > 0) {
                isDelete = true;
            }

        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : delRecord5() Exception : " + e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object updatePatientDetailsRecord20(Object customerModels) {
        boolean isUpdate = false;
        DischargeModel vitalModel = (DischargeModel) customerModels;
        try {
          //  System.out.println("inside update dao");
            String sql = "select cust_code,concat(cust_name,' - ',mobile_no) as cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '"+vitalModel.getPatientName()+"' or mobile_no = '"+vitalModel.getPatientName()+"' and cust_flag_id = 0";
                ResultSet rs = DBConnection.getStatement().executeQuery(sql);
                while(rs.next()) {
                vitalModel.setCustcode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
                }
            String sql1 = "CALL pro_dischargesumm_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);

            cs.setString("dcustcode",vitalModel.getCustcode());
            cs.setString("dcustName",vitalModel.getPatientName());
            cs.setString("dDate",vitalModel.getDate());
            cs.setString("dcustage",vitalModel.getAge());
            cs.setString("dcustgender",vitalModel.getGender());
            cs.setString("dcustmobile",vitalModel.getMobileno());
            cs.setString("ddocname",vitalModel.getDoctorName());
            cs.setString("dadmissiondate",vitalModel.getAddate());
            cs.setString("ddischargedate",vitalModel.getDisdate());
            cs.setString("ddischargetype",vitalModel.getDistype());
            cs.setString("diagnosis",vitalModel.getDiagnosis());
            cs.setString("doctornote",vitalModel.getDrnote());
            cs.setString("consulation",vitalModel.getConsnote());
            cs.setString("patientadvice",vitalModel.getPatadvice());
            cs.setString("precomplaints",vitalModel.getPrevcomplaints());
            cs.setString("familyhis",vitalModel.getFamilyhis());
            cs.setString("investigation",vitalModel.getInvestigation());
            cs.setString("dischargeadvice",vitalModel.getDisadvice());
            cs.setString("followup",vitalModel.getFollowup());
            cs.setString("medication",vitalModel.getMedication());
            cs.setString("notes",vitalModel.getNotes());
            cs.setString("preparedby",vitalModel.getPreparedby());
            cs.setString("dep",vitalModel.getDep());
            cs.setString("symptoms",vitalModel.getSymptoms());
            cs.setString("genallergy",vitalModel.getGenallergy());
            cs.setString("drugallergy",vitalModel.getDrugallergy());
            cs.setString("dsurgeon",vitalModel.getSurgeon());

            cs.setString("functionality","update");

            cs.registerOutParameter("status_flag", Types.INTEGER);

            cs.executeUpdate();

            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
                }
            } catch (Exception e) {
            log.debug("Class : CustomerDAO Method : updatePatientDetailsRecord20 Exception : "+e.getMessage());
       }

        return isUpdate;
    }

    @Override
    public Object createRecordDischarge(Object customerModels) {
      // System.out.println("createRecordDischarge customer DAO");
        boolean iscreate = false;
        DischargeModel vitalModel = (DischargeModel) customerModels;
        try {
            String sql2 = "CALL pro_dischargesumm_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
           // System.out.println("procedure 1");
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql2);
            //System.out.println("procedure 2");

            cs.setString("dDate",vitalModel.getDate());
            cs.setString("dcustcode",vitalModel.getCustcode());
            cs.setString("dcustName", vitalModel.getPatientName());
            cs.setString("dcustage",vitalModel.getAge());
            cs.setString("dcustgender",vitalModel.getGender());
            cs.setString("dcustmobile",vitalModel.getMobileno());
            cs.setString("ddocname",vitalModel.getDoctorName());
            cs.setString("dadmissiondate",vitalModel.getAddate());
            cs.setString("ddischargedate", vitalModel.getDisdate());
            cs.setString("ddischargetype",vitalModel.getDistype());
            cs.setString("diagnosis", vitalModel.getDiagnosis());
            cs.setString("doctornote", vitalModel.getDrnote());
            cs.setString("consulation", vitalModel.getConsnote());
            cs.setString("patientadvice", vitalModel.getPatadvice());
            cs.setString("precomplaints", vitalModel.getPrevcomplaints());
            cs.setString("familyhis", vitalModel.getFamilyhis());
            cs.setString("investigation", vitalModel.getInvestigation());
            cs.setString("dischargeadvice", vitalModel.getDisadvice());
            cs.setString("followup", vitalModel.getFollowup());
            cs.setString("medication", vitalModel.getMedication());
            cs.setString("notes", vitalModel.getNotes());
            cs.setString("preparedby", vitalModel.getPreparedby());
            cs.setString("dep", vitalModel.getDep());
            cs.setString("symptoms", vitalModel.getSymptoms());
            cs.setString("genallergy", vitalModel.getGenallergy());
            cs.setString("drugallergy", vitalModel.getDrugallergy());
            cs.setString("dsurgeon", vitalModel.getSurgeon());

            cs.setString("functionality","save");

           // System.out.println(vitalModel.getDisdate()+" / "+Integer.parseInt(vitalModel.getCust_id())+" / "+vitalModel.getCustcode1()+" / "+vitalModel.getPatientName()+" / "+vitalModel.getDoctorid()+" / "+vitalModel.getDoctorName()+" / "+vitalModel.getDissummary()+" / "+vitalModel.getUserName()+" / "+"save");

            cs.registerOutParameter("status_flag", Types.INTEGER);

            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
                }

      } catch (Exception e) {
          System.out.println("Catch "+e);
           log.debug("Class : CustomerDAO Method : createRecordDischarge Exception : "+e.getMessage());
        }
        return iscreate;
    }

    @Override
    public boolean delRecord3(Integer id, String date) {
        boolean isDelete = false;

        try {

            java.util.Date date1 = new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2 = sdf.format(date1);
            int rs = DBConnection.getStatement().executeUpdate("update med_vitalsign_mt set status = 2 where Infodate='" + date2 + "'and custid = '" + id + "' ");

            if (rs > 0) {
                isDelete = true;
            }

        } catch (Exception e) {
            log.debug("Class : CommonDAO  Method : delRecord3() Exception : " + e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object updatePatientDetailsRecord1(Object customerModels) {
        boolean isUpdate = false;
        VitalScienceModel vitalModel = (VitalScienceModel) customerModels;
        try {
            String sql = "select cust_id,cust_code,concat(cust_name,' - ',mobile_no) as cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '" + vitalModel.getPatientName() + "' or mobile_no = '" + vitalModel.getPatientName() + "' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                vitalModel.setPid(rs.getInt("cust_id"));
                vitalModel.setCustomerCode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
            }

            String sql1 = "CALL pro_vitalscience_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);
            cs.setString("vDate", vitalModel.getDate());
            cs.setInt("vPid", vitalModel.getPid());
            cs.setString("vCode", vitalModel.getCustomerCode());
            cs.setString("vcustName", vitalModel.getPatientName());
            cs.setDouble("vWeight", vitalModel.getpWeight());
            cs.setDouble("vHeight", vitalModel.getpHeight());
            cs.setDouble("vBmi", vitalModel.getpBmi());
            cs.setString("vRemarks1", vitalModel.getpRemarks1());
            cs.setString("vBs", vitalModel.getpBloodSugar());
            cs.setString("vBP", vitalModel.getpBloodPressure());
            cs.setString("vTemp", vitalModel.getpTemp());
            cs.setString("vHR", vitalModel.getpHeartRate());
            cs.setString("vUS", vitalModel.getpUrineSugar());
            cs.setString("vRemarks2", vitalModel.getpRemarks2());
            cs.setString("vRR", vitalModel.getRRmin());
            cs.setString("vRBS1", vitalModel.getvRBS());
            cs.setString("vWaistcircum", vitalModel.getWaistcircum());
            cs.setString("vBPDiastolic", vitalModel.getBPDias());
            cs.setString("vusername", vitalModel.getUserName());

            cs.setString("functionality", "update");

            cs.registerOutParameter("status_flag", Types.INTEGER);

            cs.executeUpdate();

            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
        } catch (Exception e) {
            log.debug("Class : CustomerDAO Method : updatePatientDetailsRecord1 Exception : " + e.getMessage());
        }

        return isUpdate;
    }

    @Override
    public Object createPatientDetailsRecord1(Object customerModels) {
        //System.out.println("createPatientDetailsRecord1");
        boolean iscreate = false;
        VitalScienceModel vitalModel = (VitalScienceModel) customerModels;
        // CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            String sql = "select cust_id,cust_code,concat(cust_name,' - ',mobile_no) as cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '" + vitalModel.getPatientName() + "' or mobile_no = '" + vitalModel.getPatientName() + "' and cust_flag_id = 0";
            // String sql = "select cust_id,cust_code,cust_name from cust_information where cust_name = '"+vitalModel.getPatientName()+"' and cust_flag_id = 0";
           // String sql = "select cust_id,cust_code,cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '"+vitalModel.getPatientName()+"' or mobile_no = '"+vitalModel.getPatientName()+"' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                vitalModel.setPid(rs.getInt("cust_id"));
                vitalModel.setCustomerCode(rs.getString("cust_code"));
                vitalModel.setPatientName(rs.getString("cust_name"));
                // System.out.println(rs.getInt("cust_id")+" / "+rs.getString("cust_code")+" / "+rs.getString("cust_name"));

            }
            //System.out.println("procedure");
            String sql1 = "CALL pro_vitalscience_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);
            //System.out.println("after procedure");
            cs.setString("vDate", vitalModel.getDate());
            cs.setInt("vPid", vitalModel.getPid());
            cs.setString("vCode", vitalModel.getCustomerCode());
            cs.setString("vcustName", vitalModel.getPatientName());
            cs.setDouble("vWeight", vitalModel.getpWeight());
            cs.setDouble("vHeight", vitalModel.getpHeight());
            cs.setDouble("vBmi", vitalModel.getpBmi());
            cs.setString("vRemarks1", vitalModel.getpRemarks1());
            cs.setString("vBs", vitalModel.getpBloodSugar());
            cs.setString("vBP", vitalModel.getpBloodPressure());
            cs.setString("vTemp", vitalModel.getpTemp());
            cs.setString("vHR", vitalModel.getpHeartRate());
            cs.setString("vUS", vitalModel.getpUrineSugar());
            cs.setString("vRemarks2", vitalModel.getpRemarks2());
            cs.setString("vRR", vitalModel.getRRmin());
            cs.setString("vRBS1", vitalModel.getvRBS());
            cs.setString("vWaistcircum", vitalModel.getWaistcircum());
            cs.setString("vBPDiastolic", vitalModel.getBPDias());
            cs.setString("vusername", vitalModel.getUserName());

            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);

            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
            }

        } catch (Exception e) {
            log.debug("Class : CustomerDAO Method : createPatientDetailsRecord1 Exception : " + e.getMessage());
        }
        return iscreate;
    }
}
