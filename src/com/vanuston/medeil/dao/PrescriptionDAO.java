/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;


import com.vanuston.medeil.model.DrugSpecificationModel;
import java.sql.CallableStatement;
import com.vanuston.medeil.implementation.Prescription;
import com.vanuston.medeil.model.MedicalHistoryModel1;
import com.vanuston.medeil.model.PrescriptionModel;
import com.vanuston.medeil.model.PrescriptionModel1;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javafx.scene.control.CheckBox;


/**
 *
 * @author muralikrishnan
 */
public class PrescriptionDAO implements Prescription {
    static Logger log = Logger.getLogger(PrescriptionDAO.class, "com.vanuston.medeil.dao.PrescriptionDAO");
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public Object createRecord(Object object) throws RemoteException {
        PrescriptionModel prescriptionModel=(PrescriptionModel) object;
        List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
        prescriptionItems=prescriptionModel.getPrescriptionListItems();
        int returnFlag = 0;
        Boolean insert = false;
        try {
        if(prescriptionModel.getInsertType().equals("save")) {
        String sql = "insert into prescription_maintenance (prescription_date, doctor_name, customer_name, age, gender, weight, temperature, blood_sugar, blood_pressure, diagnosis,remarks, consultation_fee, next_visit,created_by,created_on)"
                + "values('"+prescriptionModel.getDate()+"','"+prescriptionModel.getDoctorName()+"','"+prescriptionModel.getPatientName()+"','"+prescriptionModel.getAge()+"','"+prescriptionModel.getGender()+"','"+prescriptionModel.getWeight()+"'"
                + ",'"+prescriptionModel.getTemperature()+"','"+prescriptionModel.getBloodSugar()+"','"+prescriptionModel.getBloodPressure()+"','"+prescriptionModel.getDiagnosis()+"','"+prescriptionModel.getRemarks()+"','"+prescriptionModel.getConsultationFee()+"','"+prescriptionModel.getNextVisit()+"','"+prescriptionModel.getCurrentUser()+"','"+sdf.format(new Date())+"')";
        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        String sql1 = "select max(id) as prescriptionId from prescription_maintenance";
        ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
        while(rs.next()) {
            prescriptionModel.setPrescriptionId(rs.getInt("prescriptionId"));
        }
        if(prescriptionModel.getPatientSymptomsList().size()>0) //Patient Symptoms List
        {
            String sql3 = "insert into med_patient_symptoms_mt(pres_key,patient_symptoms,created_by,created_on) values(?,?,?,?)";
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
            for(int j=0;j<prescriptionModel.getPatientSymptomsList().size();j++)
            {
            ps.setInt(1,prescriptionModel.getPrescriptionId());
            ps.setString(2,prescriptionModel.getPatientSymptomsList().get(j));
            ps.setString(3,prescriptionModel.getCurrentUser());
            ps.setString(4,sdf.format(new Date()));
            ps.executeUpdate();
            }
        }
        }
        for(int i=0; i < prescriptionItems.size();i++) {
        PrescriptionModel model = prescriptionItems.get(i);
  CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_prescription(?,?,?,?,?,  ?,?,?,?,?,   ?,?,?,?,?,  ?,?,?,?,?,  ?,?,?,?,?)");
        cs.setInt   (1,  prescriptionModel.getPrescriptionId());
        cs.setString(2,  model.getDoctorName());
        cs.setString(3,  model.getPatientName());
        cs.setInt   (4,  model.getAge());
        cs.setString(5,  model.getGender());
        cs.setString(6,  model.getWeight());
        cs.setString(7,  model.getTemperature());
        cs.setString(8,  model.getBloodSugar());
        cs.setString(9,  model.getBloodPressure());
        cs.setString(10, model.getRemarks());
        cs.setDouble(11, model.getConsultationFee());
        cs.setString(12, model.getNextVisit());
        cs.setString(13, model.getMedicineName());
        cs.setString(14, model.getMorning());
        cs.setString(15, model.getAfternoon());
        cs.setString(16, model.getEvening());
        cs.setString(17, model.getNight());
        cs.setString(18, model.getFood());
        cs.setString(19, model.getDose());
        cs.setDouble(20, model.getTotalMedications());
        cs.setDouble(21, model.getDays());
        cs.setString(22, prescriptionModel.getCurrentUser());
        cs.setString(23, model.getInsertType());
        cs.setInt(24, prescriptionModel.getAppoinmentid());
        System.out.println("a5");
      System.out.println(prescriptionModel.getAppoinmentid());
      System.out.println("a4");
      System.out.println(prescriptionModel.getAppoinmentid());
        cs.registerOutParameter(25, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");

        }
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
       List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
       PrescriptionModel model = new PrescriptionModel();
       PrescriptionModel prescriptionModel;
       int prescriptionId=(Integer) object;
       try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select *,m.id as prescription_id from prescription p,prescription_maintenance m where m.id=p.pres_key and m.id='"+prescriptionId+"' and del_flag=0");
            while(rs.next()) {
                prescriptionModel = new PrescriptionModel();
                model.setPrescriptionId(rs.getInt("prescription_id"));
                model.setDate(rs.getString("prescription_date"));
                model.setPatientName(rs.getString("customer_name"));
                model.setDoctorName(rs.getString("doctor_name"));
                model.setAge(rs.getInt("age"));
                model.setGender(rs.getString("gender"));
                model.setWeight(rs.getString("weight"));
                model.setTemperature(rs.getString("temperature"));
                model.setBloodSugar(rs.getString("blood_sugar"));
                model.setBloodPressure(rs.getString("blood_pressure"));
                model.setDiagnosis(rs.getString("diagnosis"));
                model.setRemarks(rs.getString("remarks"));
                model.setConsultationFee(rs.getDouble("consultation_fee"));
                model.setNextVisit(rs.getString("next_visit"));
                prescriptionModel.setMedicineName(rs.getString("medicine_name"));
                prescriptionModel.setMorning(rs.getString("morning"));
                prescriptionModel.setAfternoon(rs.getString("afternoon"));
                prescriptionModel.setEvening(rs.getString("evening"));
                prescriptionModel.setNight(rs.getString("night"));
                prescriptionModel.setDays(rs.getDouble("days"));
                prescriptionModel.setFood(rs.getString("food"));
                prescriptionModel.setDose(rs.getString("dose"));
                prescriptionModel.setTotalMedications(rs.getDouble("total_medications"));
                prescriptionItems.add(prescriptionModel);
            }
           model.setPrescriptionListItems(prescriptionItems);
        } catch (Exception ex) {
            log.debug(" Class : PrescriptionDAO  Method   : viewRecord Exception :" + ex.getMessage());
        }
        return model;
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        PrescriptionModel prescriptionModel = (PrescriptionModel) object;
        int returnFlag=0;
        int returnFlag1=0;
        Boolean insert = false;
        try {
        String sql = "delete from prescription where pres_key='"+prescriptionModel.getPrescriptionId()+"'";
      //naziya  System.out.println(prescriptionModel.getPrescriptionId());
        String sql1= "update prescription_maintenance set prescription_date='"+prescriptionModel.getDate()+"',doctor_name='"+prescriptionModel.getDoctorName()+"',"
                + "customer_name='"+prescriptionModel.getPatientName()+"',age='"+prescriptionModel.getAge()+"',gender='"+prescriptionModel.getGender()+"',weight='"+prescriptionModel.getWeight()+"'"
                + ",temperature='"+prescriptionModel.getTemperature()+"',blood_sugar='"+prescriptionModel.getBloodSugar()+"',blood_pressure='"+prescriptionModel.getBloodPressure()+"'"
                + ",diagnosis = '"+prescriptionModel.getDiagnosis()+"', remarks='"+prescriptionModel.getRemarks()+"',consultation_fee='"+prescriptionModel.getConsultationFee()+"',next_visit='"+prescriptionModel.getNextVisit()+"' where id='"+prescriptionModel.getPrescriptionId()+"'";
        String sql2 = "delete from med_patient_symptoms_mt where pres_key='"+prescriptionModel.getPrescriptionId()+"'";
        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        returnFlag1 = DBConnection.getStatement().executeUpdate(sql1);
        DBConnection.getStatement().executeUpdate(sql2);
        if(returnFlag > 0 && returnFlag1 >0) {
            insert = (Boolean) createRecord(object);
        }
        if(prescriptionModel.getPatientSymptomsList().size()>0) //Patient Symptoms List
        {
            List<String> patientSymptomsList = new ArrayList<String>();
            patientSymptomsList=prescriptionModel.getPatientSymptomsList();
            String sql3 = "insert into med_patient_symptoms_mt(pres_key,patient_symptoms,updated_by,updated_on) values(?,?,?,?)";
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
            for(int j=0;j<patientSymptomsList.size();j++)
            {
            ps.setInt(1,prescriptionModel.getPrescriptionId());
            ps.setString(2,patientSymptomsList.get(j));
            ps.setString(3,prescriptionModel.getCurrentUser());
            ps.setString(4,sdf.format(new Date()));
            ps.executeUpdate();
            }
        }
        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : updateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        String prescId=(String) object;
        boolean insert = false;
        try {
        String sql = "update prescription_maintenance set del_flag = 1 where id='"+prescId+"'";
        String sql1 = "update med_patient_symptoms_mt set is_active = 0 where pres_key='"+prescId+"'";
        DBConnection.getStatement().executeUpdate(sql);
        DBConnection.getStatement().executeUpdate(sql1);
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : deleteRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object viewAllRecord(String recId, String searchType) {
        List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
        try {
            if(searchType.equals("prescription_date")) {
                recId=DateUtils.changeFormatDate(recId);
            }
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from prescription_maintenance m where m."+searchType+" like '" + recId + "%' and del_flag=0 order by m.id desc");
            while(rs.next()) {
                PrescriptionModel model = new PrescriptionModel();
                model.setPrescriptionId(rs.getInt("id"));
                model.setDate(rs.getString("prescription_date"));
                model.setPatientName(rs.getString("customer_name"));
                model.setDoctorName(rs.getString("doctor_name"));
                prescriptionItems.add(model);
            }
        } catch (Exception ex) {
            log.debug(" Class : PrescriptionDAO  Method   : viewAllRecord Exception :" + ex.getMessage());
        }
        return prescriptionItems;
    }

    @Override
    public int insertDrugSpecification(DrugSpecificationModel drugSpecificationModel) throws RemoteException {
        DrugSpecificationModel model = drugSpecificationModel;
        int returnFlag = 0;
        try {
        CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_drugspecifications(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        cs.setString (1, model.getGenericName());
        cs.setString(2,  model.getDescription());
        cs.setString(3,  model.getCategories());
        cs.setString(4,  model.getChemicalFormula());
        cs.setString(5,  model.getIndication());
        cs.setString(6,  model.getPharmaCodynamics());
        cs.setString(7,  model.getMechanism());
        cs.setString(8,  model.getAbsorption());
        cs.setString(9,  model.getVolumeDistribution());
        cs.setString(10, model.getMetabolism());
        cs.setString(11, model.getRouteElimination());
        cs.setString(12, model.getHalfLife());
        cs.setString(13, model.getToxicity());
        cs.setString(14, model.getFoodInteractions());
        cs.setString(15, model.getSaveType());
        cs.registerOutParameter(16, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");
    }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : insertDrugSpecification Exception :" + e.getMessage());
        }
        return returnFlag;
    }

    @Override
    public List<String> getSymptoms() {
        List<String> list = null ;
        try{
            ResultSet rs = DBConnection.getStatement().executeQuery("select symptoms from med_symptoms_list_mt where is_active=1");
            if(rs!=null){
                list=new ArrayList<String>();
                while(rs.next()) {
                    list.add(rs.getString("symptoms"));
                }
            }
        }catch(Exception e){
            log.debug(" Class:PrescriptionDAO Method:getSymptoms Exception:" + e.getMessage());
        }
        return list;
    }

    @Override
    public int addSymptom(String symptom,String user) {
        int a=0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from med_symptoms_list_mt where symptoms='"+symptom+"'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            }
            else{
                String query = "insert into med_symptoms_list_mt(symptoms,created_by,created_on) values(?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
                ps.setString(1, symptom);
                ps.setString(2,user);
                ps.setString(3,sdf.format(new Date()));
                ps.executeUpdate();
                a=0;
            }
        } catch (Exception ex) {
            log.debug(" Class:PrescriptionDAO Method:addSymptoms Exception:" + ex.getMessage());
        }
        return a;
    }

    @Override
    public Object createRecord1(Object object) throws RemoteException {
        MedicalHistoryModel1 medicalhistoryModel1=(MedicalHistoryModel1) object;
        List<MedicalHistoryModel1> prescriptionItems = new ArrayList<MedicalHistoryModel1>();
        prescriptionItems=medicalhistoryModel1.getPrescriptionListItems();
        int returnFlag = 0;
        Boolean insert = false;
        try {
        if(medicalhistoryModel1.getInsertType().equals("save")) {
        String sql = "select cust_id,cust_code,concat(cust_name,' - ',mobile_no) as cust_name from cust_information where concat(cust_name,' - ',mobile_no) = '"+medicalhistoryModel1.getPatientName()+"' or mobile_no = '"+medicalhistoryModel1.getPatientName()+"' and cust_flag_id = 0";
                ResultSet rs = DBConnection.getStatement().executeQuery(sql);
                while(rs.next()) {
                medicalhistoryModel1.setCustid(rs.getInt("cust_id"));
         // java.lang.System.out.println(medicalhistoryModel1.getCustid());
                medicalhistoryModel1.setCustromercode(rs.getString("cust_code"));
                medicalhistoryModel1.setPatientName(rs.getString("cust_name"));
            }
                  String sql1 = "CALL pro_medical_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                  java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);
        // System.out.println("after medical history dao");
                  cs.setString("mDate",medicalhistoryModel1.getDate());
        //  java.lang.System.out.println(medicalhistoryModel1.getDate());
                  cs.setInt("c_id", medicalhistoryModel1.getCustid());
          //java.lang.System.out.println(medicalhistoryModel1.getCustid());
                  cs.setString("cust_code", medicalhistoryModel1.getCustromercode());
           //java.lang.System.out.println(medicalhistoryModel1.getCustromercode());
                  cs.setString("cname", medicalhistoryModel1.getPatientName());
          // java.lang.System.out.println(medicalhistoryModel1.getPatientName());
                  cs.setInt("blgroup", medicalhistoryModel1.getBloodgroup());
          // java.lang.System.out.println(medicalhistoryModel1.getBloodgroup());
                 cs.setString("mgpid", medicalhistoryModel1.getG6pd());
          // java.lang.System.out.println(medicalhistoryModel1.getG6pd());
                  cs.setInt("msmokingid", medicalhistoryModel1.getSmokinghistory());
           //java.lang.System.out.println(medicalhistoryModel1.getSmokinghistory());
                  cs.setString("mremarks1",medicalhistoryModel1.getRemarks());
          // java.lang.System.out.println(medicalhistoryModel1.getRemarks());
                  cs.setString("mdrugalergies",medicalhistoryModel1.getDrugalergies());
           //java.lang.System.out.println(medicalhistoryModel1.getDrugalergies());
              cs.setInt("alcoholid",medicalhistoryModel1.getAlcoholhistory());
              cs.setInt("lactaionid",medicalhistoryModel1.getLactation());
              cs.setInt("pregnencyid",medicalhistoryModel1.getPregnancy());
              cs.setInt("surgeryid",medicalhistoryModel1.getPrevioussurgeryundergone());
              cs.setString("surgerydetails",medicalhistoryModel1.getSurgerydetails());

                 cs.setString("functionality","save");
                 cs.registerOutParameter("status_flag", Types.INTEGER);
                 cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                insert = true;
            }
         }
        if(medicalhistoryModel1.getInsertType().equals("save")) {
           // System.out.println("before Medicalid history dao");
                String sql = "select Medicalid,custid from medicalhistory where cust_name= '"+medicalhistoryModel1.getPatientName()+"' and status = 0";
                ResultSet rs = DBConnection.getStatement().executeQuery(sql);
          //  System.out.println("after Medicalid history dao");
                while(rs.next()) {
                medicalhistoryModel1.setMedicalid(rs.getInt("Medicalid"));
          // java.lang.System.out.println(medicalhistoryModel1.getMedicalid());
                medicalhistoryModel1.setCustid(rs.getInt("custid"));
            // java.lang.System.out.println(medicalhistoryModel1.getCustid());
          // System.out.println("after Medicalid history dao");
              }}
          // System.out.println(prescriptionItems.size());
               for(int i=0; i < prescriptionItems.size();i++) {
               MedicalHistoryModel1 model = prescriptionItems.get(i);
              CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_medicinetable(?,?,?,?,?,?,?,?,?,?,?,?,?)");
         //System.out.println("after 2ND PROCEDURE");
       //  System.out.println(medicalhistoryModel1.getCustid());
        // System.out.println(medicalhistoryModel1.getMedicalid());

               cs.setInt   (1,  medicalhistoryModel1.getMedicalid());
               cs.setInt   (2,  medicalhistoryModel1.getCustid());
        // System.out.println(medicalhistoryModel1.getCustid());
        // System.out.println(medicalhistoryModel1.getMedicalid());

        // System.out.println(model.getCustid());
              cs.setString(3, model.getMedicineName());
        //System.out.println(model.getMedicineName());
             cs.setString(4, model.getMorning());
       // System.out.println(model.getMorning());
             cs.setString(5, model.getAfternoon());
       // System.out.println(model.getAfternoon());
             cs.setString(6, model.getEvening());
       //  System.out.println(model.getEvening());
             cs.setString(7, model.getNight());
        // System.out.println(model.getNight());
             cs.setString(8, model.getFood());
        //System.out.println(model.getFood());
             cs.setString(9, model.getDose());
       //System.out.println(model.getDose());
             cs.setDouble(10, model.getTotalMedications());
      // System.out.println(model.getTotalMedications());
             cs.setDouble(11, model.getDays());

             cs.setString(12, model.getInsertType());
     // System.out.println(model.getInsertType());
             cs.registerOutParameter(13, Types.INTEGER);
             cs.executeUpdate();
           returnFlag = cs.getInt("retflag");

        }
        insert = true;
            }

        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : CreateRecord1 Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object viewRecord1(String name, String date) throws RemoteException {
                //MedicalHistoryModel1 medical = new MedicalHistoryModel1();

       List<MedicalHistoryModel1> prescriptionItems = new ArrayList<MedicalHistoryModel1>();
       MedicalHistoryModel1 medical = new MedicalHistoryModel1();
       MedicalHistoryModel1 medicalHistoryModel1;

        try {
           // System.out.println("view record dao");
            java.util.Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(date);
            String date2= sdf.format(date1);
            String sql = "select * from medicalhistory "
                + "inner join currentmedication  on currentmedication.medicalid=medicalhistory.medicalid where medicalhistory.status = 0 and medicalhistory.cust_name= '" + name + "' and medicalhistory.Date= '" + date2 + "'order by cust_name";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while(rs.next()) {
               medicalHistoryModel1 = new MedicalHistoryModel1();
               // System.out.println("view after record dao");
                medical.setCustid(rs.getInt("custid"));
                //System.out.println(medical.getCustid());
                medical.setDate(rs.getString("date"));
                medical.setPatientName(rs.getString("cust_name"));
                medical.setBloodgroup(rs.getInt("bloodgroup"));
                medical.setG6pd(rs.getString("gpdid"));
                medical.setSmokinghistory(rs.getInt("smokingid"));
                medical.setLactation(rs.getInt("lactationid"));
                medical.setAlcoholhistory(rs.getInt("alcoholid"));
                medical.setPrevioussurgeryundergone(rs.getInt("surgeryid"));
                medical.setPregnancy(rs.getInt("pregnancyid"));
                medical.setDrugalergies(rs.getString("patientallgeries"));
                medical.setRemarks(rs.getString("remarks1"));
                medical.setSurgerydetails(rs.getString("surgerydetails"));
                 //System.out.println( medical.getSurgerydetails());
               // medical.setConsultationFee(rs.getDouble("consultation_fee"));
                //medical.setNextVisit(rs.getString("next_visit"));
                medicalHistoryModel1.setMedicineName(rs.getString("itemname"));
                medicalHistoryModel1.setMorning(rs.getString("morning"));
                medicalHistoryModel1.setAfternoon(rs.getString("afternoon"));
                medicalHistoryModel1.setEvening(rs.getString("evening"));
               // System.out.println(medicalHistoryModel1.getMedicineName());
                medicalHistoryModel1.setNight(rs.getString("night"));
                medicalHistoryModel1.setDays(rs.getDouble("days"));
                //medical.setFood(rs.getString("food"));
                medicalHistoryModel1.setDose(rs.getString("dose"));
                medicalHistoryModel1.setTotalMedications(rs.getDouble("total_medications"));
                prescriptionItems.add(medicalHistoryModel1);
            }
            medical.setPrescriptionListItems(prescriptionItems);
        }  catch (Exception e) {
            log.debug("Class : CommonDAO  Method : viewRecord1() Exception : " + e.getMessage());
        }
        return medical;

    }

    @Override
    public Object updateRecord1 (Object object) {
       MedicalHistoryModel1 medicalhistorymodel = (MedicalHistoryModel1) object;
        int returnFlag=0;
        int returnFlag1=0;
        Boolean insert = false;
        try {
             if(medicalhistorymodel.getInsertType().equals("update")) {

        

            String sqlc = "select medicalid,custid,cust_code,cust_name from medicalhistory where cust_name = '"+medicalhistorymodel.getPatientName()+"' and date='"+medicalhistorymodel.getDate()+"' and status=0";
                ResultSet rs = DBConnection.getStatement().executeQuery(sqlc);
                while(rs.next()) {
                medicalhistorymodel.setCustid(rs.getInt("custid"));
         // java.lang.System.out.println(medicalhistoryModel1.getCustid());
                medicalhistorymodel.setCustromercode(rs.getString("cust_code"));
                medicalhistorymodel.setPatientName(rs.getString("cust_name"));
                medicalhistorymodel.setMedicalid(rs.getInt("medicalid"));
                 }
        String sql = "delete from currentmedication where  medicalid='"+medicalhistorymodel.getMedicalid()+"'";
       // System.out.println(medicalhistorymodel.getCustid());
        String sql1= "update medicalhistory set Date='"+medicalhistorymodel.getDate()+"',custid='"+medicalhistorymodel.getCustid()+"',"
                + "cust_name='"+medicalhistorymodel.getPatientName()+"',cust_code='"+medicalhistorymodel.getCustromercode()+"',bloodgroup='"+medicalhistorymodel.getBloodgroup()+"',gpdid='"+medicalhistorymodel.getG6pd()+"'"
                + ",smokingid='"+medicalhistorymodel.getSmokinghistory()+"',remarks1='"+medicalhistorymodel.getRemarks()+"',alcoholid='"+medicalhistorymodel.getAlcoholhistory()+"'"
                + ",lactationid = '"+medicalhistorymodel.getLactation()+"', medicalid = '"+medicalhistorymodel.getMedicalid()+"', pregnancyid='"+medicalhistorymodel.getPregnancy()+"',surgeryid='"+medicalhistorymodel.getPrevioussurgeryundergone()+"',surgerydetails='"+medicalhistorymodel.getSurgerydetails()+"',patientallgeries='"+medicalhistorymodel.getDrugalergies()+"' where medicalid='"+medicalhistorymodel.getMedicalid()+"'";
       // System.out.println(medicalhistorymodel.getCustid());

        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        returnFlag1 = DBConnection.getStatement().executeUpdate(sql1);

       // System.out.println(returnFlag);
        // System.out.println(returnFlag1);
        if(returnFlag > 0 && returnFlag1 >0) {

 insert = (Boolean) createRecord1(object);

       // if(prescriptionModel.getPatientSymptomsList().size()>0) //Patient Symptoms List
        /*{
            List<String> patientSymptomsList = new ArrayList<String>();
            patientSymptomsList=prescriptionModel.getPatientSymptomsList();
            String sql3 = "insert into med_patient_symptoms_mt(pres_key,patient_symptoms,updated_by,updated_on) values(?,?,?,?)";
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
            for(int j=0;j<patientSymptomsList.size();j++)
            {
            ps.setInt(1,prescriptionModel.getPrescriptionId());
            ps.setString(2,patientSymptomsList.get(j));
            ps.setString(3,prescriptionModel.getCurrentUser());
            ps.setString(4,sdf.format(new Date()));
            ps.executeUpdate();
            }
        }*/
        }}}
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : updateRecord1 Exception :" + e.getMessage());
        }//System.out.println(insert);
        return insert;

    }

    @Override
    public boolean deleteRecord1(Object object) throws RemoteException {
         MedicalHistoryModel1 medicalhistorymodel = (MedicalHistoryModel1) object;
        boolean insert = false;
        try {
            String sqlc = "select medicalid,custid,cust_code,cust_name from medicalhistory where cust_name = '"+medicalhistorymodel.getPatientName()+"' and date='"+medicalhistorymodel.getDate()+"' and medicalhistory.status= 0";
                ResultSet rs = DBConnection.getStatement().executeQuery(sqlc);
                while(rs.next()) {
                medicalhistorymodel.setCustid(rs.getInt("custid"));
              // java.lang.System.out.println("custid ="+medicalhistorymodel.getCustid());
                medicalhistorymodel.setCustromercode(rs.getString("cust_code"));
                medicalhistorymodel.setPatientName(rs.getString("cust_name"));
              //  java.lang.System.out.println(medicalhistorymodel.getPatientName());
                medicalhistorymodel.setMedicalid(rs.getInt("medicalid"));
               // java.lang.System.out.println(medicalhistorymodel.getMedicalid());
            }
        String sql = "update medicalhistory set status=1 where cust_name = '"+medicalhistorymodel.getPatientName()+"' and medicalid='"+medicalhistorymodel.getMedicalid()+"' and custid='"+medicalhistorymodel.getCustid()+"'";
        insert = true;
       // String sql1 = "update med_patient_symptoms_mt set is_active = 0 where pres_key='"+prescId+"'";
        DBConnection.getStatement().executeUpdate(sql);
        //DBConnection.getStatement().executeUpdate(sql1);
        //java.lang.System.out.println("updatequery ="+sql);

        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : deleteRecord1 Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object createRecord2(Object object) throws RemoteException {
        PrescriptionModel1 serviceModel=(PrescriptionModel1) object;
        List<PrescriptionModel1> serviceItems = new ArrayList<PrescriptionModel1>();
        serviceItems=serviceModel.getDiagnosticListItems();
        int returnFlag = 0;
        Boolean insert = false;
        try {
        if(serviceModel.getInserttype().equals("save")) {
       //naziya   System.out.println("inside if");

        String sql = "insert into lab_report_main (labdate, prescriptiondate, doctorname, doctorid, custid, cust_code, cust_name, status, cust_age, cust_gender, labautoid )"
                + "values('"+serviceModel.getLabdate()+"','"+serviceModel.getPrescriptiondate()+"','"+serviceModel.getDoctorname()+"','"+serviceModel.getDoctorid()+"','"+serviceModel.getCustid()+"','"+serviceModel.getCust_code()+"'"
                + ",'"+serviceModel.getCust_name()+"','"+serviceModel.getStatus()+"','"+serviceModel.getCust_age()+"','"+serviceModel.getCust_gender()+"','"+serviceModel.getLabautoid()+"')";

        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        String sql1 = "select max(labtestreportid) as labId from lab_report_main";
        ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
        while(rs.next()) {
            serviceModel.setLabreportrefid(rs.getInt("labId"));
        }

        }
      //naziya  System.out.println("inside if");
        for(int i=0; i < serviceItems.size();i++) {
        PrescriptionModel1 model = serviceItems.get(i);
        CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_labreportsub(?,?,?,?,?,?,?,?,?,?)");
       //naziya  System.out.println("inside labrefid"+serviceModel.getLabreportrefid());
        cs.setInt   (1,  serviceModel.getLabreportrefid());
        System.out.println(serviceModel.getLabreportrefid());
        cs.setString(2,  model.getLab_testname());
        System.out.println(model.getLab_testname());
      //  System.out.println("labtetsname"+model.getLab_testname());
        cs.setString(3,  model.getMinrange());
        System.out.println(model.getMinrange());
        cs.setString(4,  model.getMaxrange());
        System.out.println(model.getMaxrange());
        cs.setString(5,  model.getCust_minrange());
        System.out.println(model.getCust_minrange());
        cs.setString(6,  model.getCust_maxrange());
        System.out.println(model.getCust_maxrange());
        cs.setString(7,  model.getRemark());
        System.out.println(model.getRemark());
        cs.setString(8,  model.getTechnology());
        System.out.println(model.getTechnology());
//        cs.setDouble(9, model.getPrice());
//        System.out.println(model.getPrice());
        cs.setString   (9,  model.getDia());
        System.out.println(model.getDia());
       // cs.setString   (11, "save");
       // System.out.println("status=save=0");
        //System.out.println("chchc"+serviceModel.getDia());
        cs.registerOutParameter(10, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");
        }
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : SalesDAO  Method   : CreateRecord2 Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object viewfirstAllRecord(String recId) {
     System.out.println("patienthistory4");
        List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
        try {
          System.out.println("patienthistory5");
            System.out.println(recId+ " ");
             System.out.println("patienthistory6");
           // ResultSet rs = DBConnection.getStatement().executeQuery("select * from prescription_maintenance m where m.customer_name = '" + recId + "' and del_flag=0 order by m.id desc");
             ResultSet rs = DBConnection.getStatement().executeQuery("select pm.id,pm.prescription_date,pm.doctor_name,pm.diagnosis,p.medicine_name,p.morning,p.afternoon,"
                            +"p.evening,p.night,p.days,p.dose,p.food,pm.remarks from prescription_maintenance pm,prescription p where pm.customer_name = '" + recId + "' and pm.del_flag=0 and pm.id=p.pres_key order by pm.id desc");
          // System.out.println(rs.getInt("id")+" "+rs.getString("prescription_date")+" "+rs.getString("customer_name")+" "+rs.getString("doctor_name"));
            System.out.println("patienthistory7");
             while(rs.next()) {
                  System.out.println("patienthistory8");
                PrescriptionModel model = new PrescriptionModel();
                 System.out.println("patienthistory9");
                 System.out.println(rs.getInt("id")+" "+rs.getString("prescription_date")+" "+rs.getString("doctor_name")+" "+rs.getString("diagnosis")
                  +" "+rs.getString("medicine_name")+" "+rs.getString("morning")+" "+rs.getString("afternoon")+" "+rs.getString("evening")+" "+rs.getString("night")+" "+rs.getString("food")
                  +" "+rs.getDouble("days")+" "+rs.getString("dose")+" "+rs.getString("remarks"));
                  System.out.println("patienthistory10");
                model.setPrescriptionId(rs.getInt("id"));
                model.setDate(rs.getString("prescription_date"));
                //model.setPatientName(rs.getString("customer_name"));
                model.setDoctorName(rs.getString("doctor_name"));
                model.setDiagnosis(rs.getString("diagnosis"));
                model.setMedicineName(rs.getString("medicine_name"));
                model.setMorning(rs.getString("morning"));
                model.setAfternoon(rs.getString("afternoon"));
                model.setEvening(rs.getString("evening"));
                model.setNight(rs.getString("night"));
                model.setFood(rs.getString("food"));
                model.setDays(rs.getDouble("days"));
                model.setDose(rs.getString("dose"));
                model.setRemarks(rs.getString("remarks"));
                 System.out.println("patienthistory11");
                prescriptionItems.add(model);
                 System.out.println("patienthistory12");
            }

        } catch (Exception ex) {
            log.debug(" Class : PrescriptionDAO  Method   : viewAllRecord Exception :" + ex.getMessage());
        }
        return prescriptionItems;
    }






























     @Override
    public Object viewRecord2(String name) throws RemoteException {
      //   System.out.println("viewRecord2: "+name);
                //MedicalHistoryModel1 medical = new MedicalHistoryModel1();
       List<PrescriptionModel1> prescriptionItems = new ArrayList<PrescriptionModel1>();
       List<PrescriptionModel1> psi = new ArrayList<PrescriptionModel1>();//list print rref
       PrescriptionModel1 medical = new PrescriptionModel1();
       PrescriptionModel1 medicalHistoryModel1;
       SimpleDateFormat srf=new SimpleDateFormat("dd-MM-yyyy");
        try {
            String sql = "select * from lab_report_main lrm"
                    + " inner join lab_report_sub lrs on lrs.labreportrefid=lrm.labtestreportid inner join labreport_list lac on lac.labreportid=lrs.labtestid inner join labreportcategory lcc on lcc.catagoryid=lac.catagoryid where lrm.status <2 and lrm.labautoid='" + name + "' ";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while(rs.next()) {
               medicalHistoryModel1 = new PrescriptionModel1();
               medical.setPrescriptiondate(srf.format(rs.getDate("labdate")).toString());
               medical.setDoctorname(rs.getString("doctorname"));
               medical.setDoctorid(rs.getInt("doctorid"));
               medical.setCustid(rs.getInt("custid"));
               medical.setCust_code(rs.getString("cust_code"));
               medical.setCust_name(rs.getString("cust_name"));
               medical.setStatus(rs.getInt("status"));
               medical.setCust_age(rs.getString("cust_age"));
               medical.setCust_gender(rs.getString("cust_gender"));
               medical.setLabautoid(rs.getString("labautoid"));

               medicalHistoryModel1.setLabreportrefid(rs.getInt("labreportrefid"));

               medicalHistoryModel1.setLab_testname(rs.getString("lab_testname"));
               medicalHistoryModel1.setTechnology(rs.getString("technology"));
               medicalHistoryModel1.setMinrange(rs.getString("minrange"));
               medicalHistoryModel1.setMaxrange(rs.getString("maxrange"));
               medicalHistoryModel1.setCust_minrange(rs.getString("cust_minrange"));
               medicalHistoryModel1.setCust_maxrange(rs.getString("cust_maxrange"));
               medicalHistoryModel1.setRemark(rs.getString("remarks"));
               //medicalHistoryModel1.setPrice(rs.getDouble("price"));
               medicalHistoryModel1.setDia(rs.getString("catagoryname"));
               //System.out.println(rs.getInt("labreportrefid")+" "+rs.getString("lab_testname")+" "+rs.getString("technology")+" "+rs.getString("minrange")+" "+rs.getString("maxrange")+" "+rs.getString("cust_minrange")+" "+rs.getString("cust_maxrange")+" "+rs.getString("remarks")+" "+rs.getString("technology")+" "+rs.getDouble("price")+" "+rs.getString("catagoryname"));

               prescriptionItems.add(medicalHistoryModel1);
             //  System.out.println("finish");
            }
            medical.setDiagnosticListItems(prescriptionItems);

            psi=medical.getDiagnosticListItems();//list print
          //  System.out.println("DAO viewRecord2 list:"+psi);
        }  catch (Exception e) {
           // System.out.println("DAO Catch: "+e);
            log.debug("Class : CommonDAO  Method : viewRecord2() Exception : " + e.getMessage());
        }
        return medical;
    }

     @Override
    public Object updateRecord2 (Object object) {
        // System.out.println("inside updateRecord2");

         PrescriptionModel1 prescriptionmodel1 = (PrescriptionModel1) object;
        int returnFlag=0;
        int returnFlag1=0;
        Boolean insert = false;
        try {
             if(prescriptionmodel1.getInserttype().equals("update")) {

          // System.out.println("update record if"+prescriptionmodel1.getLabautoid());
               // SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
           // System.out.println("model date: "+medicalhistorymodel.getDate());
                // java.util.Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(medicalhistorymodel.getDate());
                // System.out.println("date1: "+date1);
                // String date2= sdf.format(date1);
               //  System.out.println("date2: "+date2);

                 String sqlc = "select labtestreportid FROM lab_report_main where  labautoid= '"+prescriptionmodel1.getLabautoid()+"' ";
                ResultSet rs = DBConnection.getStatement().executeQuery(sqlc);
                while(rs.next()) {
                prescriptionmodel1.setLabreportrefid(rs.getInt("labtestreportid"));
                //System.out.println("labtestreportid"+ prescriptionmodel1.getLabreportrefid());
         // java.lang.System.out.println(medicalhistoryModel1.getCustid());

                 }


        String sql = "delete from lab_report_sub where  labreportrefid='"+prescriptionmodel1.getLabreportrefid()+"'";
       // System.out.println(medicalhistorymodel.getCustid());
        String sql1= "update lab_report_main set labdate='"+prescriptionmodel1.getLabdate()+"',prescriptiondate='"+prescriptionmodel1.getPrescriptiondate()+"',"
                + "doctorname='"+prescriptionmodel1.getDoctorname()+"',doctorid='"+prescriptionmodel1.getDoctorid()+"',custid='"+prescriptionmodel1.getCustid()+"',cust_code='"+prescriptionmodel1.getCust_code()+"'"
                + ",cust_name='"+prescriptionmodel1.getCust_name()+"',status='"+prescriptionmodel1.getStatus()+"',cust_age='"+prescriptionmodel1.getCust_age()+"'"
                + ",cust_gender = '"+prescriptionmodel1.getCust_gender()+"' where labautoid='"+prescriptionmodel1.getLabautoid()+"'";
       // System.out.println(medicalhistorymodel.getCustid());

        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        returnFlag1 = DBConnection.getStatement().executeUpdate(sql1);

       // System.out.println(returnFlag);
        // System.out.println(returnFlag1);
        if(returnFlag > 0 && returnFlag1 >0) {

 insert = (Boolean) createRecord2(object);

       // if(prescriptionModel.getPatientSymptomsList().size()>0) //Patient Symptoms List
        /*{
            List<String> patientSymptomsList = new ArrayList<String>();
            patientSymptomsList=prescriptionModel.getPatientSymptomsList();
            String sql3 = "insert into med_patient_symptoms_mt(pres_key,patient_symptoms,updated_by,updated_on) values(?,?,?,?)";
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
            for(int j=0;j<patientSymptomsList.size();j++)
            {
            ps.setInt(1,prescriptionModel.getPrescriptionId());
            ps.setString(2,patientSymptomsList.get(j));
            ps.setString(3,prescriptionModel.getCurrentUser());
            ps.setString(4,sdf.format(new Date()));
            ps.executeUpdate();
            }
        }*/
        }}}
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : updateRecord1 Exception :" + e.getMessage());
        }//System.out.println(insert);
        return insert;
    }

      @Override
    public Object viewRecord3(String name) throws RemoteException {
        // System.out.println("viewRecord3: "+name);
                //MedicalHistoryModel1 medical = new MedicalHistoryModel1();
       List<PrescriptionModel1> prescriptionItems = new ArrayList<PrescriptionModel1>();
       List<PrescriptionModel1> psi = new ArrayList<PrescriptionModel1>();//list print rref
       PrescriptionModel1 medical = new PrescriptionModel1();
       PrescriptionModel1 medicalHistoryModel1;
       SimpleDateFormat srf=new SimpleDateFormat("dd-MM-yyyy");
        try {
            String sql = "select lrm.*,lrs.*,ltr.minrange,ltr.maxrange,ci.cust_id,ci.age,ci.gender from lab_allocated_main lrm"
                    + " inner join lab_allocated_report lrs on lrs.laballocateid=lrm.laballocateid inner join lab_test_range ltr on ltr.labtestid=lrs.lab_reportid inner join cust_information ci on ci.cust_id=lrm.custid where lrm.status <2 and lrm.laballocateid='" + name + "' ";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            //String sql33="select cust_id,cust_name,age,gender from cust_information where cust_name='" + rs.getString("cust_name") + "' and cust_id='" + rs.getInt("custid") + "'";
           // ResultSet rs2 = DBConnection.getStatement().executeQuery(sql33);
            while(rs.next()) {
               medicalHistoryModel1 = new PrescriptionModel1();
               medical.setPrescriptiondate(srf.format(rs.getDate("prescriptiondate")).toString());
               medical.setDoctorname(rs.getString("doctorname"));
               medical.setDoctorid(rs.getInt("doctorid"));
               medical.setCustid(rs.getInt("custid"));
               medical.setCust_code(rs.getString("cust_code"));
               medical.setCust_name(rs.getString("cust_name"));
               medical.setStatus(rs.getInt("status"));

               medical.setCust_age(rs.getString("age"));
               medical.setCust_gender(rs.getString("gender"));
               //medical.setLabautoid(rs.getString("labautoid"));

               medicalHistoryModel1.setLabreportrefid(rs.getInt("laballocateid"));

               medicalHistoryModel1.setLab_testname(rs.getString("labreportname"));
               //medicalHistoryModel1.setTechnology("");
               medicalHistoryModel1.setMinrange(rs.getString("minrange"));
               medicalHistoryModel1.setMaxrange(rs.getString("maxrange"));
              // medicalHistoryModel1.setCust_minrange("");
              // medicalHistoryModel1.setCust_maxrange("");
              // medicalHistoryModel1.setRemark("");
              // medicalHistoryModel1.setPrice(rs.getDouble(""));
               medicalHistoryModel1.setDia(rs.getString("catryname"));
              // System.out.println(rs.getInt("laballocateid")+" "+rs.getString("labreportname")+" "+rs.getString("minrange")+" "+rs.getString("maxrange")+" "+rs.getString("catryname"));

               prescriptionItems.add(medicalHistoryModel1);
               //System.out.println("finish");
            }
            medical.setDiagnosticListItems(prescriptionItems);

            psi=medical.getDiagnosticListItems();//list print
            //System.out.println("DAO viewRecord3 list:"+psi);
        }  catch (Exception e) {
           // System.out.println("DAO viewRecord3 Catch: "+e);
            log.debug("Class : CommonDAO  Method : viewRecord3() Exception : " + e.getMessage());
        }
        return medical;
    }

}

