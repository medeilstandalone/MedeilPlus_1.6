/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import java.sql.PreparedStatement;
import com.vanuston.medeil.implementation.Customer1;
import com.vanuston.medeil.model.CustomerModel1;
import com.vanuston.medeil.model.VitalScienceModel;
import com.vanuston.medeil.model.MedicalHistoryModel1;
import com.vanuston.medeil.model.ServiceModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *
 * @author San
 */

public class CustomerDAO1 implements Customer1 {

    static Logger log = Logger.getLogger(CustomerDAO1.class, "com.vanuston.medeil.dao.CustomerDAO");
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public Object viewRecord(Object name) {
       {
        CustomerModel1 customerModel1 = new CustomerModel1();
        try {
           // System.out.println("Custdao viewrecord try:"+name);
            String sql = "select * from cust_information where  cust_code = '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
           
            while (rs.next()) {
                customerModel1.setCust_code(rs.getString("cust_code"));
                customerModel1.setCust_name(rs.getString("cust_name"));
                customerModel1.setAge(rs.getInt("age"));
                customerModel1.setGender(rs.getString("gender"));
              
                
            }
        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : viewRecord() Exception : " + e.getMessage());
        }
        return customerModel1;
    }
    }


     @Override
    public Object viewRecord1(Object name){
       {
          // System.out.println(" viewrecord1 ");
        VitalScienceModel VitalScienceModel = new VitalScienceModel();
        try {
           // System.out.println(" viewrecord1 dao1 try:"+name);
            String sql = "select v.cust_code,v.cust_name,v.weigth,v.height,v.rbs,v.heart_rate,v.bp_systolic,v.bp_diastolic,v.Infodate from med_vitalsign_mt v inner join(select cust_code, max(InfoDate) as MaxDate from med_vitalsign_mt group by cust_code) tm on v.cust_code=tm.cust_code and v.Infodate= tm.MaxDate where  v.cust_code = '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
               VitalScienceModel.setpBloodPressure(rs.getString("bp_systolic"));
               VitalScienceModel.setBPDias(rs.getString("bp_diastolic"));
               VitalScienceModel.setpHeartRate(rs.getString("heart_rate"));
               VitalScienceModel.setpWeight(rs.getDouble("weigth"));
               VitalScienceModel.setDate(rs.getString("Infodate"));
               VitalScienceModel.setpHeight(rs.getDouble("height"));
               VitalScienceModel.setvRBS(rs.getString("rbs"));
              // System.out.println("DAO1\n"+VitalScienceModel.getpBloodPressure()+"-"+VitalScienceModel.getBPDias()+"-"+VitalScienceModel.getpHeartRate());
              // System.out.println(VitalScienceModel.getpWeight()+"-"+VitalScienceModel.getDate()+"-"+VitalScienceModel.getpHeight()+"-"+VitalScienceModel.getvRBS());
            }
        } catch (Exception e) {
           // System.out.println(e.getMessage());
            log.debug("Class : CustomerDAO  Method : viewRecord1() Exception : " + e.getMessage());
        }
        return VitalScienceModel;
    }
    }
   


      


    @Override
    public CustomerModel1 loadCustomerSearch(String option, String val) throws RemoteException {
        ResultSet rs=null;
        CustomerModel1 Customer1 = new CustomerModel1();
        CustomerModel1 custsearch;
        List custlist = new ArrayList();
        try {

            if(option.equals("cust_name"))
            rs = DBConnection.getStatement().executeQuery("select * from cust_information where cust_name like '%"+val+"%';");
            else if(option.equals("Mobile_num"))
            rs = DBConnection.getStatement().executeQuery("select * from cust_information where mobile_no like '%"+val+"%';");
            else
             rs = DBConnection.getStatement().executeQuery("select * from cust_information where cust_code like '%"+val+"%';");
                
            rs.last();
            int cnt = rs.getRow();
            rs.beforeFirst();
            Customer1.setRowCount(cnt);
            while(rs.next()){
                custsearch = new CustomerModel1();
          
               custsearch.setCust_name(rs.getString("cust_name"));
               custsearch.setMobile_no(rs.getString("mobile_no"));
               custsearch.setCust_city(rs.getString("cust_city"));
               custsearch.setDob(rs.getString("age"));
               custsearch.setCust_code(rs.getString("cust_code"));
            
                custlist.add(custsearch);
            }
            Customer1.setListofitems(custlist);
        }
        catch(Exception ex){
           // System.out.println("Exception in customeer dao search value "+ex);

                String ss = " Class : CustomerDAO  Method  : loadCustomerMaintain Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return Customer1;
    }

    @Override
    public CustomerModel1 loadCustomerMaintain() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

   

    @Override
    public CustomerModel1 viewAllRecord(Object customerBean) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

   

    @Override
    public List<String> getAllergies() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<String> getHealthConditions() throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int addAllergie(String allergie) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int addHealthCondition(String healthCondition) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }


     @Override
    public Object viewRecord2(Object name) {
        {
        VitalScienceModel VitalScienceModel = new VitalScienceModel();
      
        try {
            String sql = "select s.cust_code,s.infodate,s.observation,s.assessment,s.symptoms,s.plan FROM med_consultantnote_mt s  inner join(select cust_code, max(InfoDate) as MaxDate from med_consultantnote_mt group by cust_code) tm  on s.cust_code=tm.cust_code and s.Infodate= tm.MaxDate where  s.cust_code= '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {

                VitalScienceModel.setAssessment(rs.getString("assessment"));
                VitalScienceModel.setObservation(rs.getString("observation"));
                VitalScienceModel.setSymptom(rs.getString("symptoms"));
                VitalScienceModel.setPlan(rs.getString("plan"));
                VitalScienceModel.setDate(rs.getString("infodate"));



            }
        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : viewRecord2() Exception : " + e.getMessage());
        }
        return VitalScienceModel;
    }
    }

     

    @Override
    public Object viewRecord3(Object name) {
       // System.out.println("inside viewRecord4");
         List<MedicalHistoryModel1> prescriptionItems = new ArrayList<MedicalHistoryModel1>();
        MedicalHistoryModel1 Mhm = new MedicalHistoryModel1();
        MedicalHistoryModel1 medicalHistoryModel1;
       // VitalScienceModel VitalScienceModel = new VitalScienceModel();
        try {
            //String sql = "select v.cust_code,v.cust_name,v.weigth,v.height,v.rbs,v.heart_rate,v.bp_systolic,v.bp_diastolic,v.Infodate from med_vitalsign_mt v inner join(select cust_code, max(InfoDate) as MaxDate from med_vitalsign_mt group by cust_name) tm on v.cust_code=tm.cust_code and v.Infodate= tm.MaxDate where  v.cust_code = '" + name + "'";
            String sql = "select v.medicalid,v.custid,v.cust_code,v.cust_name,v.date,v.smokingid,v.alcoholid,v.pregnancyid,v.lactationid,v.bloodgroup,v.gpdid,v.surgeryid,v.surgerydetails,c.itemname,c.morning, c.afternoon, c.evening, c.night,c.food,c.dose,c.total_medications,c.days from medicalhistory v inner join(select cust_code, max(Date) as MaxDate from medicalhistory group by cust_code) tm on v.cust_code=tm.cust_code and v.Date= tm.MaxDate left join currentmedication c on c.medicalid=v.medicalid  where  v.cust_code = '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
               medicalHistoryModel1 = new MedicalHistoryModel1();

               Mhm.setCustromercode(rs.getString("cust_code"));
               Mhm.setPatientName(rs.getString("cust_name"));
               Mhm.setDate(rs.getString("Date"));
               Mhm.setSmokinghistory(rs.getInt("smokingid"));
               Mhm.setAlcoholhistory(rs.getInt("alcoholid"));
               Mhm.setLactation(rs.getInt("lactationid"));
               Mhm.setPregnancy(rs.getInt("pregnancyid"));
               Mhm.setBloodgroup(rs.getInt("bloodgroup"));
               Mhm.setG6pd(rs.getString("gpdid"));
               Mhm.setPrevioussurgeryundergone(rs.getInt("surgeryid"));
               Mhm.setSurgerydetails(rs.getString("surgerydetails"));

               medicalHistoryModel1.setMedicineName(rs.getString("itemname"));
               medicalHistoryModel1.setMorning(rs.getString("morning"));
               medicalHistoryModel1.setAfternoon(rs.getString("afternoon"));
               medicalHistoryModel1.setEvening(rs.getString("evening"));
               medicalHistoryModel1.setNight(rs.getString("night"));
               medicalHistoryModel1.setFood(rs.getString("food"));
               medicalHistoryModel1.setDose(rs.getString("dose"));
              // System.out.println("inside viewRecord4 get"+Mhm.getMedicineName());
               medicalHistoryModel1.setTotalMedications(rs.getDouble("total_medications"));
               medicalHistoryModel1.setDays(rs.getDouble("days"));
                prescriptionItems.add(medicalHistoryModel1);
              

             }
            Mhm.setPrescriptionListItems(prescriptionItems);
        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : viewRecord3() Exception : " + e.getMessage());
        }
        return Mhm;
    }

    @Override
    public Object viewRecord5(Object name) throws RemoteException {
      // System.out.println("inside viewRecord5");
         List<ServiceModel> prescriptionItems = new ArrayList<ServiceModel>();
        ServiceModel Mhm = new ServiceModel();
        ServiceModel sserviceModel1;
       // VitalScienceModel VitalScienceModel = new VitalScienceModel();
        try {
            //String sql = "select v.cust_code,v.cust_name,v.weigth,v.height,v.rbs,v.heart_rate,v.bp_systolic,v.bp_diastolic,v.Infodate from med_vitalsign_mt v inner join(select cust_code, max(InfoDate) as MaxDate from med_vitalsign_mt group by cust_name) tm on v.cust_code=tm.cust_code and v.Infodate= tm.MaxDate where  v.cust_code = '" + name + "'";
           String sql = "select s.cust_code,s.bill_date,su.service_name,su.unit_price,su.total_price,s.remarks FROM billing_main s  inner join(select cust_code, max(bill_date) as MaxDate from billing_main group by cust_code) tm  on s.cust_code=tm.cust_code and s.bill_date= tm.MaxDate inner join billing_sub su on su.billrefid=s.billid where  s.cust_code= '" + name + "'";
           // String sql = "select s.cust_code,s.bill_date,su.service_name,su.unit_price,su.total_price,su.remarks1 FROM billing_main s  inner join(select cust_code, max(bill_date) as MaxDate from billing_main group by cust_code) tm  on s.cust_code=tm.cust_code and s.bill_date= tm.MaxDate inner join billing_sub su on su.billrefid=s.billid where  s.cust_name= '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
               sserviceModel1 = new ServiceModel();
                

               sserviceModel1.setService_name(rs.getString("service_name"));
              // System.out.println("sserviceModel1.getService_name"+sserviceModel1.getService_name());
               sserviceModel1.setUnit_price(rs.getDouble("unit_price"));
               sserviceModel1.setTotal_amount(rs.getDouble("total_price"));
               sserviceModel1.setRemarks(rs.getString("remarks"));//sabarish
             
              // System.out.println("inside viewRecord4 get"+Mhm.getMedicineName());
             
                prescriptionItems.add(sserviceModel1);


             }
            Mhm.setServiceListItems(prescriptionItems);
        } catch (Exception e) {
            log.debug("Class : CustomerDAO  Method : viewRecord5() Exception : " + e.getMessage());
        }
        return Mhm;
    }
    }



   

   

