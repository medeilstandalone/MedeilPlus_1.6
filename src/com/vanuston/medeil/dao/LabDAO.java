/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

/**
 *
 * @author Administrator
 */

//import com.vanuston.medeil.model.DrugModel;
import com.vanuston.medeil.model.PrescriptionModel1;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;

public class LabDAO  {

    //DrugModel drugBean;
    public String sql = "";
    public ResultSet rs = null;
    public ArrayList<PrescriptionModel1> drugListBean  = null ;
    public static Logger log = Logger.getLogger(LabDAO.class, "LabDAO");
	
	//Generic Search Method
     public ArrayList<PrescriptionModel1> SearchRecord(Object drugBeans) {
         /*
        drugListBean = new ArrayList<PrescriptionModel>();
        PrescriptionModel1 drugBean = (PrescriptionModel)drugBeans;
        try {

            if (drugBean.getPassVale() == 110) {
                sql = "SELECT * FROM medeil_plus.lab_report_main d,medeil_plus.lab_report_sub s where s.labreportsubid=d.labtestreportid and d.cust_name='"+drugBean.getPatientName()+"';";
            } else if (drugBean.getPassVale() == 101) {
                sql = "SELECT * FROM lab_report_main where status!=2 and cust_name = '"+drugBean.getPatientName()+"' ;";
            }
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                drugBean = new PrescriptionModel1();
                drugBean.setLabid(rs.getString("labautoid"));
                drugBean.setPatientName(rs.getString("cust_name"));
                drugBean.setDoctorName(rs.getString("doctorname"));
                drugBean.setLdate(rs.getString("labdate"));
                drugBean.setPdate(rs.getString("prescriptiondate"));
                drugBean.setTestType(rs.getString("lab_testname"));
                drugBean.setTechno(rs.getString("technology"));
                drugBean.setRefMin(rs.getString("minrange"));
                drugBean.setRefMax(rs.getString("maxrange"));
                drugBean.setPatMin(rs.getString("cust_minrange"));
                drugBean.setPatMax(rs.getString("cust_maxrange"));
                drugBean.setPrice(rs.getString("price"));
                drugBean.setRemarks(rs.getString("remarks"));
                drugBean.setFinalcon(rs.getString("remarks"));
                drugListBean.add(drugBean);
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:SearchRecord() Exception:"+e.getMessage());
        }
          *  *
          */

        return drugListBean;

    }

	
    public ArrayList<PrescriptionModel1> viewAllRecord(Object drugBeans) {
        /*
        drugListBean = new ArrayList<PrescriptionModel1>();
        PrescriptionModel1 drugBean = (PrescriptionModel1)drugBeans;
        try {            
            if (drugBean.getPassVale() == 1) {
                sql = "SELECT  *  FROM lab_report_main where status!= 2  order by labtestreportid desc limit 0,8";
            }else {
                sql = "SELECT * FROM lab_report_main where cust_name like '" +drugBean.getPatientName()+ "%' and status!=2  order by labtestreportid";
            }            
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                drugBean = new PrescriptionModel1();
                drugBean.setLabid(rs.getString("labautoid"));
                drugBean.setPatientName(rs.getString("cust_name"));
                drugBean.setDoctorName(rs.getString("doctorname"));
                drugBean.setLdate(rs.getString("labdate"));
                drugBean.setPdate(rs.getString("prescriptiondate"));
                drugBean.setTestType(rs.getString("lab_testname"));
                drugBean.setTechno(rs.getString("technology"));                               
                drugBean.setRefMin(rs.getString("minrange"));
                drugBean.setRefMax(rs.getString("maxrange"));
                drugBean.setPatMin(rs.getString("cust_minrange"));
                drugBean.setPatMax(rs.getString("cust_maxrange"));
                drugBean.setPrice(rs.getString("price"));
                drugBean.setRemarks(rs.getString("remarks"));
                drugBean.setFinalcon(rs.getString("remarks"));
                drugListBean.add(drugBean);
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:viewAllRecord() Exception:"+e.getMessage());
        }
         *
         */
        return drugListBean;
    }
	
	

    public Object createRecord(Object drugBeans) {
         boolean flag = false;
        /*
        PrescriptionModel1 drugBean = (PrescriptionModel1) drugBeans;
       
        try {
            String sql = "CALL pro_druginfodao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);

                drugBean.setLabid(rs.getString("labautoid"));
                drugBean.setPatientName(rs.getString("cust_name"));
                drugBean.setDoctorName(rs.getString("doctorname"));
                drugBean.setLdate(rs.getString("labdate"));
                drugBean.setPdate(rs.getString("prescriptiondate"));
                drugBean.setTestType(rs.getString("lab_testname"));
                drugBean.setTechno(rs.getString("technology"));
                drugBean.setRefMin(rs.getString("minrange"));
                drugBean.setRefMax(rs.getString("maxrange"));
                drugBean.setPatMin(rs.getString("cust_minrange"));
                drugBean.setPatMax(rs.getString("cust_maxrange"));
                drugBean.setPrice(rs.getString("price"));
                drugBean.setRemarks(rs.getString("remarks"));
                drugBean.setFinalcon(rs.getString("remarks"));
                drugListBean.add(drugBean);

            stmt.setString(1, drugBean.getLabid());
            stmt.setString(2, drugBean.getPatientName());
            stmt.setString(3, drugBean.getDoctorName());
            stmt.setString(4, drugBean.getLdate());
            stmt.setString(5, drugBean.getPdate());
            stmt.setString(6, drugBean.getTestType());
            stmt.setString(7, drugBean.getGender());
            stmt.setInt(8, drugBean.getAge());
            stmt.setString(9, drugBean.getTechno());
            stmt.setString(10, drugBean.getPatMin());
            stmt.setString(11, drugBean.getPatMax());
            stmt.setString(12, drugBean.getRefMin());
            stmt.setString(13, drugBean.getRefMax());
            stmt.setString(14, drugBean.getPrice());
            stmt.setString(15, drugBean.getRemarks());
            stmt.setString(16, drugBean.getTypeName2());
            stmt.setString(17, drugBean.getFinalcon());
            stmt.setString(18, "save");
            stmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            log.debug("class:DrugDAO method:createRecord() Exception:"+e.getMessage());
            flag = false;
        }
         *
         */
        return flag;

    }

 /*   public Object updateRecord(DrugModel drugBeans) {
        DrugModel drugBean = (DrugModel) drugBeans;
        boolean flag = false;
        try {
            if(drugBean.getPassVale()==10)
            {
              String sql1="update drugtable set mrp='"+drugBean.getMrp()+"' , vat = '"+drugBean.getVAT_percentage()+"' where itemcode='"+drugBean.getDrug_code()+"'";
              
              DBConnection.getStatement().executeUpdate(sql1);
              flag=true;
            }
            else
            {
            String sql = "CALL pro_druginfodao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            stmt.setString(1, drugBean.getDrug_code());
            stmt.setString(2, drugBean.getDrug_name());
            stmt.setString(3, drugBean.getGeneric_name());
            stmt.setString(4, drugBean.getClassification());
            stmt.setString(5, drugBean.getSub_classification());
            stmt.setString(6, drugBean.getIndication());
            stmt.setString(7, drugBean.getMfr_name());
            stmt.setString(8, drugBean.getMfr_name_short());
            stmt.setString(9, drugBean.getFormulation());
            stmt.setString(10, drugBean.getFormulation_short());
            stmt.setString(11, drugBean.getGenericname_short());
            stmt.setString(12, drugBean.getDosage());
            stmt.setString(13, drugBean.getPack());
            stmt.setDouble(14, drugBean.getMrp());
            stmt.setString(15, drugBean.getSchedule());
            stmt.setDouble(16, drugBean.getVAT_percentage());
            stmt.setInt(17, drugBean.getVat_calc_flag());
            stmt.setString(18, "update");
            stmt.executeUpdate();
            flag = true;
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:updateRecord() Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    public boolean deleteRecord(DrugModel drugBean) {
        boolean flag = false;
        try {
            String sql = "CALL pro_druginfodao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            stmt.setString(1, drugBean.getDrug_code());
            stmt.setString(2, drugBean.getDrug_name());
            stmt.setString(3, drugBean.getGeneric_name());
            stmt.setString(4, drugBean.getClassification());
            stmt.setString(5, drugBean.getSub_classification());
            stmt.setString(6, drugBean.getIndication());
            stmt.setString(7, drugBean.getMfr_name());
            stmt.setString(8, drugBean.getMfr_name_short());
            stmt.setString(9, drugBean.getFormulation());
            stmt.setString(10, drugBean.getFormulation_short());
            stmt.setString(11, drugBean.getGenericname_short());
            stmt.setString(12, drugBean.getDosage());
            stmt.setString(13, drugBean.getPack());
            stmt.setDouble(14, drugBean.getMrp());
            stmt.setString(15, drugBean.getSchedule());
            stmt.setDouble(16, drugBean.getVAT_percentage());
            stmt.setInt(17, drugBean.getVat_calc_flag());
            stmt.setString(18, "delete");
            //stmt.setInt(17,1);
            stmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            log.debug("class:DrugDAO method:deleteRecord() Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    public Object viewRecord(Object drugBeans) {
        //drugBean=new DrugModel();
        //ArrayList<Object> drugBeans=null;
        DrugModel drugBean = (DrugModel) drugBeans;
        Object drugBean1 = null;
        String sql = "";
        try {
            if (drugBean.getPassVale() == 5) {
                int cnt = 0;
                sql = "SELECT item_code FROM stock_statement  where item_code='" + drugBean.getDrug_code() + "' and qty>0";

                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    cnt = 1;
                }
                log.debug("Count = " + cnt);
                drugBean1 = cnt;
            } else if (drugBean.getPassVale() == 6) { //For Stock From Drug Table
                sql = "select * from drugtable where itemcode='"+drugBean.getDrug_id()+"'";

                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    drugBean.setDrug_code(rs.getString("item_id"));
                    drugBean.setDrug_name(rs.getString("itemname"));
                    drugBean.setGeneric_name(rs.getString("genericname"));
                    drugBean.setDosage(rs.getString("dosage"));
                    drugBean.setFormulation_short(rs.getString("formulation"));                    
                    drugBean.setMrp(rs.getDouble("mrp"));                                                      
                    drugBean.setClassification(rs.getString("therapeutic"));                   
                    drugBean.setSub_classification(rs.getString("subtherapeutic"));                    
                    drugBean.setIndication(rs.getString("indication"));
                    drugBean.setMfr_name(rs.getString("company_name"));
                    drugBean.setFormulation(rs.getString("formulation_length"));                                                        
                    drugBean.setPack(rs.getString("package"));                    
                    drugBean.setVAT_percentage(rs.getDouble("vat"));                    
                    drugBean.setSchedule(rs.getString("schedule"));
                    drugBean.setDrug_id(rs.getInt("itemcode"));
                    drugBean.setVat_calc_flag(rs.getInt("vat_calc_flag"));
                }
                drugBean1=drugBean;
            }
                else if(drugBean.getPassVale() == 1) {
                sql = "SELECT * FROM drugtable WHERE item_id = '" + drugBean.getDrug_code() + "'";
                
                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    drugBean.setDrug_code(rs.getString("item_id"));
                    drugBean.setDrug_name(rs.getString("itemname"));
                    drugBean.setGeneric_name(rs.getString("genericname"));
                    drugBean.setClassification(rs.getString("therapeutic"));
                    drugBean.setSub_classification(rs.getString("subtherapeutic"));
                    drugBean.setIndication(rs.getString("indication"));
                    drugBean.setMfr_name(rs.getString("company_name"));
                    drugBean.setFormulation(rs.getString("formulation_length"));
                    drugBean.setFormulation_short(rs.getString("formulation"));
                    drugBean.setDosage(rs.getString("dosage"));
                    drugBean.setPack(rs.getString("package"));
                    drugBean.setMrp(rs.getDouble("mrp"));
                    drugBean.setVAT_percentage(rs.getDouble("vat"));                    
                    drugBean.setSchedule(rs.getString("schedule"));
                    drugBean.setDrug_id(rs.getInt("itemcode"));
                    drugBean.setVat_calc_flag(rs.getInt("vat_calc_flag"));
                }
                drugBean1 = drugBean;
            }

        } catch (Exception e) {
            log.debug("class:DrugDAO method:viewRecord() Exception:"+e.getMessage());
        }
        return drugBean1;
    }
*/

}
