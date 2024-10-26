/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

/**
 *
 * @author Administrator
 */

import com.vanuston.medeil.model.DrugModel;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.util.List;
import java.util.Vector;

public class DrugDAO  {

    //DrugModel drugBean;
    public String sql = "";
    public ResultSet rs = null;
    public ArrayList<DrugModel> drugListBean  = null ;
    public static Logger log = Logger.getLogger(DrugDAO.class, "DrugDAO");
	
    //Generic Search Method
     public ArrayList<DrugModel> SearchRecord(Object drugBeans) {
        drugListBean = new ArrayList<DrugModel>();
        DrugModel drugBean = (DrugModel)drugBeans;
        try {
            if (drugBean.getPassVale() == 110) {
                sql = "SELECT d.company_name,d.itemcode,d.itemname,d.genericname,d.dosage,d.formulation,d.therapeutic,d.subtherapeutic,d.indication,d.mfgname,d.mrp FROM drugtable d,stock_statement s where s.item_code=d.itemcode and d.genericname='"+drugBean.getGeneric_name()+"';";
            } else if (drugBean.getPassVale() == 100) {
                sql = "SELECT company_name,itemcode,itemname,genericname,dosage,formulation,therapeutic,subtherapeutic,indication,mfgname,mrp FROM drugtable where dru_flag_id!=3 and genericname = '"+drugBean.getGeneric_name()+"' ;";
            } else if (drugBean.getPassVale() == 111) {
                sql = "SELECT d.company_name,d.itemcode,d.itemname,d.genericname,d.dosage,d.formulation,d.therapeutic,d.subtherapeutic,d.indication,d.mfgname,d.mrp FROM drugtable d,stock_statement s where s.item_code=d.itemcode and d.itemname='"+drugBean.getDrug_name()+"';";
            } else if (drugBean.getPassVale() == 101) {
                sql = "SELECT company_name,itemcode,itemname,genericname,dosage,formulation,therapeutic,subtherapeutic,indication,mfgname,mrp FROM drugtable where dru_flag_id!=3 and itemname = '"+drugBean.getDrug_name()+"' ;";
            }
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                drugBean = new DrugModel();
                drugBean.setDrug_id(rs.getInt("itemcode"));
                drugBean.setDrug_name(rs.getString("itemname"));
                drugBean.setDosage(rs.getString("dosage"));
                drugBean.setFormulation(rs.getString("formulation"));
                drugBean.setGeneric_name(rs.getString("genericname"));
                drugBean.setClassification(rs.getString("therapeutic"));
                drugBean.setSub_classification(rs.getString("subtherapeutic"));
                drugBean.setIndication(rs.getString("indication"));
                drugBean.setMfr_name(rs.getString("company_name"));
                drugBean.setMrp(Double.valueOf(rs.getString("mrp")));
                drugListBean.add(drugBean);
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:SearchRecord() Exception:"+e.getMessage());
        }
        return drugListBean;
    }

	
    public ArrayList<DrugModel> viewAllRecord(Object drugBeans) {
        drugListBean = new ArrayList<DrugModel>();
        DrugModel drugBean = (DrugModel)drugBeans;
        try {            
            if (drugBean.getPassVale() == 1) {
                sql = "SELECT  *  FROM drugtable where dru_flag_id!=3  order by itemcode desc limit 0,8";
            } else if (drugBean.getPassVale() == 2) {
                sql = "SELECT  *  FROM drugtable  where dru_flag_id!=3  and itemname like '" + drugBean.getDrug_name() + "%'";
            } else if (drugBean.getPassVale() == 3) {
                sql = "SELECT  *  FROM drugtable  where dru_flag_id!=3  and formulation_length like '" + drugBean.getFormulation() + "%'";
            } else if (drugBean.getPassVale() == 4) {
                sql = "SELECT  * FROM drugtable where itemname like '" + drugBean.getGetDrugCharacter() + "%' and dru_flag_id!=3";
            }else {
                sql = "SELECT * FROM drugtable where itemname like '" +drugBean.getGetDrugCharacter()+ "%' and dru_flag_id!=3  order by itemname";            
            }            
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                drugBean = new DrugModel();                
                drugBean.setDrug_id(rs.getInt("itemcode"));
                drugBean.setDrug_name(rs.getString("itemname"));
                drugBean.setDosage(rs.getString("dosage"));
                drugBean.setFormulation(rs.getString("formulation"));
                drugBean.setClassification(rs.getString("therapeutic"));
                drugBean.setSub_classification(rs.getString("subtherapeutic"));
                drugBean.setIndication(rs.getString("indication"));                
                drugBean.setMrp(Double.valueOf(rs.getString("mrp")));
                drugBean.setGeneric_name(rs.getString("genericname"));
                drugBean.setMfr_name(rs.getString("company_name"));
                drugBean.setDrug_code(rs.getString("item_id"));
                drugBean.setFormulation_short(rs.getString("formulation_length"));
                drugBean.setVAT_percentage(rs.getDouble("vat"));
                drugBean.setVat_calc_flag(rs.getInt("vat_calc_flag"));
 //@//@kural
                 drugBean.setGst(rs.getInt("unit_gst"));
                 drugBean.setSgst(rs.getInt("unit_sgst"));
                 drugBean.setCgst(rs.getInt("unit_cgst"));
                  drugBean.setIgst(rs.getInt("unit_igst"));
                drugListBean.add(drugBean);
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:viewAllRecord() Exception:"+e.getMessage());
        }
        return drugListBean;
    }	
	
    public Object createRecord(Object drugBeans) {
        DrugModel drugBean = (DrugModel) drugBeans;
        boolean flag = false;
        try {
            String sql = "CALL pro_druginfodao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
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
            stmt.setDouble(16, 0.00);
            stmt.setInt(17, drugBean.getVat_calc_flag());
//@kural
           stmt.setDouble(18, 0.00);
           stmt.setDouble(19, drugBean.getSgst());
           stmt.setDouble(20, drugBean.getCgst());
           stmt.setDouble(21, drugBean.getIgst());
           stmt.setDouble(22, drugBean.getUtgst());



           
           stmt.setString(23, drugBean.getHsnCode());
           stmt.setString(24, drugBean.getDescription());
           stmt.setString(25, "save");

            int i= stmt.executeUpdate();
            if(i!=0)
            saveBarcode(drugBean,0);
            flag = true;
        } catch (Exception e) {
            log.debug("class:DrugDAO method:createRecord() Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    public void saveBarcode(DrugModel drugBean,int updateFlag) {
        try {
            List<String> barCodes = drugBean.getBarcode();
            int itemId = Integer.parseInt(drugBean.getDrug_code().substring(2, 9));
            if(barCodes.size() > 0){
                for(int j=0; j < barCodes.size();j++) {
                    String sql1 = "insert into barcode_mapping (item_id, item_code, item_name, barcode, created_by, created_on,update_flag)"
                            + "values('"+drugBean.getDrug_code()+"','"+itemId+"','"+drugBean.getDrug_name()+"',"
                            + "'"+barCodes.get(j)+"','"+drugBean.getUserName()+"','"+DateUtils.now("yyyy-MM-dd hh:mm:ss")+"',"+updateFlag+")";
                  DBConnection.getStatement().executeUpdate(sql1);
                }
            }
        }
        catch(Exception e) {
            log.debug("class:DrugDAO method:savebarcode() Exception:"+e.getMessage());
        }
    }

    public Object updateRecord(DrugModel drugBeans) {
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
            String sql = "CALL pro_druginfodao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
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
            stmt.setDouble(16, 0.00);
            stmt.setInt(17, drugBean.getVat_calc_flag());
//@kural
             stmt.setDouble(18, 0.00);
             stmt.setDouble(19, drugBean.getSgst());
             stmt.setDouble(20, drugBean.getCgst());
             stmt.setDouble(21, drugBean.getIgst());
             stmt.setDouble(22, drugBean.getUtgst());
             stmt.setString(23, drugBean.getHsnCode());
             stmt.setString(24, drugBean.getDescription());
            stmt.setString(25, "update");
            int i = stmt.executeUpdate();
            if(i!=0) {
                String sql1 = "delete from barcode_mapping where item_id='"+drugBean.getDrug_code()+"'";
                int j=DBConnection.getStatement().executeUpdate(sql1);
                saveBarcode(drugBean,1);
            }
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
            String sql = "CALL pro_druginfodao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
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
            stmt.setDouble(16, 0.00);
            stmt.setInt(17, drugBean.getVat_calc_flag());
//@kural
            stmt.setDouble(18, 0.00);
            stmt.setDouble(19, drugBean.getSgst());
            stmt.setDouble(20, drugBean.getCgst());
            stmt.setDouble(21, drugBean.getIgst());
            stmt.setDouble(22, drugBean.getUtgst());
            stmt.setString(23, drugBean.getHsnCode());
            stmt.setString(24, drugBean.getDescription());
            stmt.setString(25, "delete");
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
                sql = "SELECT item_code FROM stock_statement  where item_code=" + drugBean.getDrug_code().substring(2,9) + " and qty>0";
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
//@kural
                    drugBean.setGst(rs.getDouble("unit_gst"));
                    drugBean.setSgst(rs.getDouble("unit_sgst"));
                    drugBean.setCgst(rs.getDouble("unit_cgst"));
                    drugBean.setIgst(rs.getDouble("unit_igst"));
                  // drugBean.setUtgst(rs.getDouble("unit_gst"));
                    drugBean.setHsnCode(rs.getString("hsn_code"));
                     drugBean.setDescription(rs.getString("description"));
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
//@kural
                    drugBean.setGst(rs.getDouble("unit_gst"));
                    drugBean.setSgst(rs.getDouble("unit_sgst"));
                    drugBean.setCgst(rs.getDouble("unit_cgst"));
                    drugBean.setIgst(rs.getDouble("unit_igst"));
                  // drugBean.setUtgst(rs.getDouble("unit_gst"));
                    drugBean.setHsnCode(rs.getString("hsn_code"));
                     drugBean.setDescription(rs.getString("description"));
                }
                sql= "SELECT barcode FROM barcode_mapping WHERE item_id = '" + drugBean.getDrug_code() + "' and delete_flag=0";
                rs = DBConnection.getStatement().executeQuery(sql);
                List<String> barcodeList = new ArrayList<String>();
                while(rs.next()) {
                    barcodeList.add(rs.getString("barcode"));
                }
                drugBean.setBarcode(barcodeList);
                drugBean1 = drugBean;
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:viewRecord() Exception:"+e.getMessage());
        }
        return drugBean1;
    }
  public String SaveDrugMapping(ArrayList<String> mappingDetails)  {
        String ret = "Failed";
        String posname = mappingDetails.get(0);
        String posversion =  mappingDetails.get(1);
        String drugName =  mappingDetails.get(2);
        String genericName =  mappingDetails.get(3);
        String classification =  mappingDetails.get(4);
        String subclassific =  mappingDetails.get(5);
        String indication =  mappingDetails.get(6);
        String manufacturer =  mappingDetails.get(7);
        String formulation =  mappingDetails.get(8);
        String dosage =  mappingDetails.get(9);
        String pack =   mappingDetails.get(10);
        String schedule =  mappingDetails.get(11);
        String mrp =  mappingDetails.get(12);
        String vat =  "0.0";
        String sgst =  mappingDetails.get(13);
        String barcode =  mappingDetails.get(14);
        String cgst =  mappingDetails.get(15);
        String igst =  mappingDetails.get(16);
        try
        {

            String sql="Insert into csv_drug_posdetails(pos_name,pos_version,drug_index_name,generic_index_name,therapeutic_index_name,subtherap_index_name,indication_index_name,dosage_index_name,formulation_index_name,manufact_index_name,pack_index_name,mrp_index_name,schedule_index_name,vat_index_name,barcode_index_name,unit_sgst,unit_cgst,unit_igst)"
                    + "values('"+posname+"','"+posversion+"','"+drugName+"','"+genericName+"','"+classification+"','"+subclassific+"','"+indication+"','"+dosage+"','"+formulation+"','"+manufacturer+"','"+pack+"','"+mrp+"','"+schedule+"','"+vat+"','"+barcode+"','"+sgst+"','"+cgst+"','"+igst+"');";
            int returnMSG =DBConnection.getStatement().executeUpdate(sql);

            if(returnMSG ==1)
            {
                ret = "Success";
            }
        }
        catch(Exception e)
        {
            System.out.println("exception in drugdao saedrugmapping " +e);
        }
        return ret;
    }

    public String[] gethsncode(String name) {
         String[]  hsn = null;
        Vector v = new Vector();
        try
        {
            ResultSet rs=null;
            String query="select hsn_code from hsncodetable where hsn_code like '"+name+"%'";
            rs=DBConnection.getStatement().executeQuery(query);
            while(rs.next())
            {
               v.addElement(rs.getString("hsn_code"));
            }
             hsn = new String[v.size()];
             for (int i = 0; i < v.size();i++)
             {
                hsn[i] = "" + v.get(i);
             }
        }
        catch(Exception ex1)
        {
            String ex = " Class : PurchaseDAO  Method   : purchasemaintenance Exception :" + ex1.getMessage();
                log.debug(ex);
        }
        return hsn;
    }

    public String[] getdesc(String name) {
        String[] desc=null;
        Vector v1=new Vector();
        try
        {
            ResultSet rs=null;
            String query="select description from hsncodetable where hsn_code='"+name+"'";
            rs=DBConnection.getStatement().executeQuery(query);
            while(rs.next())
            {
                v1.addElement(rs.getString("description"));
            }
            desc=new String[v1.size()];
            for(int i=0;i<v1.size();i++)
            {
                desc[i]="" +v1.get(i);
            }
        }
        catch(Exception ex1)
        {
            String ex = " Class : PurchaseDAO  Method   : purchasemaintenance Exception :" + ex1.getMessage();
                log.debug(ex);
        }
        return desc;
    }
    
public ArrayList<DrugModel> SearchRecords(Object drugBeans,Integer start,Integer limit) {
        drugListBean = new ArrayList<DrugModel>();
        DrugModel drugBean = (DrugModel)drugBeans;
        try {
            if (drugBean.getPassVale() == 110) {
                sql = "SELECT d.company_name,d.itemcode,d.itemname,d.genericname,d.dosage,d.formulation,d.therapeutic,d.subtherapeutic,d.indication,d.mfgname,d.mrp FROM drugtable d,stock_statement s where s.item_code=d.itemcode and d.genericname='"+drugBean.getGeneric_name()+"'"+" limit "+start+", "+limit+";";
            } else if (drugBean.getPassVale() == 100) {
                sql = "SELECT company_name,itemcode,itemname,genericname,dosage,formulation,therapeutic,subtherapeutic,indication,mfgname,mrp FROM drugtable where dru_flag_id!=3 and genericname = '"+drugBean.getGeneric_name()+"' "+"limit "+start+", "+limit+";";
            } else if (drugBean.getPassVale() == 111) {
                sql = "SELECT d.company_name,d.itemcode,d.itemname,d.genericname,d.dosage,d.formulation,d.therapeutic,d.subtherapeutic,d.indication,d.mfgname,d.mrp FROM drugtable d,stock_statement s where s.item_code=d.itemcode and d.itemname='"+drugBean.getDrug_name()+"'"+" limit "+start+", "+limit+";";
            } else if (drugBean.getPassVale() == 101) {
                sql = "SELECT company_name,itemcode,itemname,genericname,dosage,formulation,therapeutic,subtherapeutic,indication,mfgname,mrp FROM drugtable where dru_flag_id!=3 and itemname = '"+drugBean.getDrug_name()+"' "+"limit "+start+", "+limit+";";
            }
            System.out.println(drugBean.getPassVale());
            System.out.println(sql);
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                drugBean = new DrugModel();
                drugBean.setDrug_id(rs.getInt("itemcode"));
                drugBean.setDrug_name(rs.getString("itemname"));
                drugBean.setDosage(rs.getString("dosage"));
                drugBean.setFormulation(rs.getString("formulation"));
                drugBean.setGeneric_name(rs.getString("genericname"));
                drugBean.setClassification(rs.getString("therapeutic"));
                drugBean.setSub_classification(rs.getString("subtherapeutic"));
                drugBean.setIndication(rs.getString("indication"));
                drugBean.setMfr_name(rs.getString("company_name"));
                drugBean.setMrp(Double.valueOf(rs.getString("mrp")));
                drugListBean.add(drugBean);
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:SearchRecord() Exception:"+e.getMessage());
        }
        return drugListBean;
    }


  public ArrayList<DrugModel> viewRecordByLimit(Object drugBeans,Integer start,Integer end) {
        drugListBean = new ArrayList<DrugModel>();
        DrugModel drugBean = (DrugModel)drugBeans;
        try {
            if (drugBean.getPassVale() == 1) {
                sql = "SELECT  *  FROM drugtable where dru_flag_id!=3  order by itemcode desc limit 0,8";
            } else if (drugBean.getPassVale() == 2) {
                sql = "SELECT  *  FROM drugtable  where dru_flag_id!=3  and itemname like '" + drugBean.getDrug_name() + "%' limit "+start+","+end;
                    System.out.println(sql);
            } else if (drugBean.getPassVale() == 3) {
                sql = "SELECT  *  FROM drugtable  where dru_flag_id!=3  and formulation_length like '" + drugBean.getFormulation() + "%' limit "+start+","+end;
                System.out.println(sql);
            } else if (drugBean.getPassVale() == 4) {
                sql = "SELECT  * FROM drugtable where itemname like '" + drugBean.getGetDrugCharacter() + "%' and dru_flag_id!=3";
            }else {
                sql = "SELECT * FROM drugtable where itemname like '" +drugBean.getGetDrugCharacter()+ "%' and dru_flag_id!=3  order by itemname";
            }
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                drugBean = new DrugModel();
                drugBean.setDrug_id(rs.getInt("itemcode"));
                drugBean.setDrug_name(rs.getString("itemname"));
                drugBean.setDosage(rs.getString("dosage"));
                drugBean.setFormulation(rs.getString("formulation"));
                drugBean.setClassification(rs.getString("therapeutic"));
                drugBean.setSub_classification(rs.getString("subtherapeutic"));
                drugBean.setIndication(rs.getString("indication"));
                drugBean.setMrp(Double.valueOf(rs.getString("mrp")));
                drugBean.setGeneric_name(rs.getString("genericname"));
                drugBean.setMfr_name(rs.getString("company_name"));
                drugBean.setDrug_code(rs.getString("item_id"));
                drugBean.setFormulation_short(rs.getString("formulation_length"));
                drugBean.setVAT_percentage(rs.getDouble("vat"));
                drugBean.setVat_calc_flag(rs.getInt("vat_calc_flag"));
 //@//@kural
                 drugBean.setGst(rs.getInt("unit_gst"));
                 drugBean.setSgst(rs.getInt("unit_sgst"));
                 drugBean.setCgst(rs.getInt("unit_cgst"));
                  drugBean.setIgst(rs.getInt("unit_igst"));
                drugListBean.add(drugBean);
            }
        } catch (Exception e) {
            log.debug("class:DrugDAO method:viewAllRecord() Exception:"+e.getMessage());
        }
        return drugListBean;
    }

}
