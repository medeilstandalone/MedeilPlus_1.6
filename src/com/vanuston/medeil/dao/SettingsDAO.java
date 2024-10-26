/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Settings;
import com.vanuston.medeil.model.CustomerTypeModel;
import com.vanuston.medeil.model.SettingsModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author saran
 */
public class SettingsDAO implements Settings {

    static Logger log = Logger.getLogger(SettingsDAO.class, "com.vanuston.medeil.dao.SettingsDAO");

    @Override
    public Object createRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        SettingsModel settingsModel = (SettingsModel) object;
        try {
            CallableStatement settingsCall = DBConnection.getConnection().prepareCall("{call pro_hosp_saveconfiguration(?, ?, ?, ?, ?, ?, ?, ?,? ,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )}");
            settingsCall.setString(1, settingsModel.getEmial_user_name());
            settingsCall.setString(2, settingsModel.getEmail_user_password());
            settingsCall.setString(3, settingsModel.getSms_mobile_no());
            settingsCall.setString(4, settingsModel.getAlternateUserName());
            settingsCall.setString(5, settingsModel.getAlternatePassword());
            settingsCall.setString(6, settingsModel.getServerAddress());
            settingsCall.setString(7, settingsModel.getServerPort());
            settingsCall.setString(8, settingsModel.getUpdateAutomatic());
            settingsCall.setString(9, settingsModel.getUpdateManual());
            settingsCall.setString(10, settingsModel.getUpdateDay());
            settingsCall.setString(11, settingsModel.getUpdateTime());
            settingsCall.setString(12, settingsModel.getUpdateSession());
            settingsCall.setString(13, settingsModel.getWays2smsUserName());
            settingsCall.setString(14, settingsModel.getWay2smsPassword());
            settingsCall.setString(15, settingsModel.getOne60UserName());
            settingsCall.setString(16, settingsModel.getOne160Password());
            settingsCall.setString(17, settingsModel.getSmsGateway1api());
            settingsCall.setString(18, settingsModel.getSmsGateway2api());
            settingsCall.setString(19, settingsModel.getDefault_sms_gw());
            settingsCall.setString(20, settingsModel.getMaintenance_cost_alert());
            settingsCall.setString(21, settingsModel.getMaintenance_cost_days());
            settingsCall.setDouble(22, settingsModel.getConsultationFee());
            settingsCall.setDouble(23, settingsModel.getFollowupVisitFee());
            settingsCall.setInt(24,   settingsModel.getFollowupDays());
            settingsCall.setString(25, settingsModel.getAppointmentTemplate());
            settingsCall.registerOutParameter(26, Types.INTEGER);
            settingsCall.executeUpdate();
            int returnFlag = settingsCall.getInt("flag");
            if (returnFlag == 1) {                
                returnFlagCount++;
            }            
            RegistryFactory.serverPort = Integer.parseInt(settingsModel.getServerPort());
            insert = true;
        } catch (Exception e) {
            insert = false;
            e.printStackTrace();
            log.debug(" Class : SettingsDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public Integer[] getEnableAutoRoundoff() {
        Integer isEnable[] = new Integer[2];
        try {
        String sql = "select roundoff_sales,roundoff_purchase from settings_config ";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                isEnable[0] = rs.getInt("roundoff_sales");
                isEnable[1] = rs.getInt("roundoff_purchase");
            }
        }catch(SQLException ex){
            log.debug("getEnableAutoRoundoff() Exception:"+ex.getMessage());
        }        
        return isEnable;
    }

    @Override
    public Integer setEnableAutoRoundoff(Integer isAutoRnd[]) {
        int result=0;
        try {
        String sql = "update settings_config set roundoff_sales="+isAutoRnd[0]+",roundoff_purchase="+isAutoRnd[1];
            result = DBConnection.getStatement().executeUpdate(sql);
         }catch(SQLException ex){
            log.debug("getEnableAutoRoundoff() Exception:"+ex.getMessage());
        }
        return result;
    }
    
    @Override
    public SettingsModel displaySettingValues() {
        SettingsModel settingsModel = new SettingsModel();
        try {
            settingsModel.setAlertStaus("1");
            settingsModel.setExpiryAlertStatus("0");
            String sql = "";
            
            sql = "select * from medp_hosp_settings_config";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                
                settingsModel.setUpdateAutomatic(rs.getString("updates_manual"));
                settingsModel.setUpdateDay(rs.getString("update_day"));
                settingsModel.setUpdateSession(rs.getString("update_session"));
                settingsModel.setUpdateTime(rs.getString("update_time"));
                settingsModel.setWays2smsUserName(rs.getString("way2sms_user"));
                settingsModel.setWay2smsPassword(rs.getString("way2sms_pass"));
                settingsModel.setSmsGateway1api(rs.getString("smsgateway_apikey1"));
                settingsModel.setOne60UserName(rs.getString("160by2_user"));
                settingsModel.setOne160Password(rs.getString("160by2_pass"));
                settingsModel.setSmsGateway1api(rs.getString("smsgateway_apikey2"));
                settingsModel.setEmial_user_name(rs.getString("email_username"));
                settingsModel.setEmail_user_password(rs.getString("email_password"));
                settingsModel.setSms_mobile_no(rs.getString("sms_mobilenumber"));
                settingsModel.setAlternateUserName(rs.getString("alternate_email"));
                settingsModel.setAlternatePassword(rs.getString("alternate_pwd"));             
                settingsModel.setDefault_sms_gw(rs.getString("defaultsms_gw"));               
                settingsModel.setMaintenance_cost_days(rs.getString("maintain_cost_days"));
                settingsModel.setMaintenance_cost_alert(rs.getString("maintain_cost_alert"));
                settingsModel.setReminder_email(rs.getString("reminder_email"));
                settingsModel.setAppointmentTemplate(rs.getString("apmt_template"));
            }
            sql = "select * from medp_hosp_server_details";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                settingsModel.setServerAddress(rs.getString("ip_address"));
                settingsModel.setServerPort(rs.getString("port_address"));
            }
            sql = "select * from prescription_alert";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                settingsModel.setConsultationFee(rs.getDouble("consultation_fee"));
                settingsModel.setFollowupVisitFee(rs.getDouble("followupvisit_fee"));
                settingsModel.setFollowupDays(rs.getInt("followup_days"));
            }
        } catch (Exception e) {
            log.debug("Class: SettingDAO Method : displaySettingsValues Error = " + e.getMessage());
        }
        return settingsModel;
    }

    @Override
    public int setSalesDiscountType(int salesDiscType) throws RemoteException {
        int result = 0;
        try {
        String sql = "update settings_config set sales_discounttype='"+salesDiscType+"'";
        result = DBConnection.getStatement().executeUpdate(sql);        
        }
        catch(Exception ex) {
          log.debug("setSalesDiscountType() Exception:"+ex.getMessage());
        }
        return result;
    }

    @Override
    public int getSalesDiscountType() throws RemoteException {        
        int result=0;
        try {
        String sql ="select sales_discounttype from settings_config";
        ResultSet  rs = DBConnection.getStatement().executeQuery(sql);
        while(rs.next()) {
            result=rs.getInt("sales_discounttype");
        }
        }
        catch(Exception ex) {
          log.debug("getSalesDiscountType() Exception:"+ex.getMessage());
        }
        return result;
    }

    @Override
    public int getSalesInvoiceSettings() throws RemoteException {
        int result=0;
        try {
        String sql ="select sales_invoice_settings from settings_config";
        ResultSet  rs = DBConnection.getStatement().executeQuery(sql);
        while(rs.next()) {
            result=rs.getInt("sales_invoice_settings");
        }
        }
        catch(Exception ex) {
          log.debug("getSalesInvoiceSettings() Exception:"+ex.getMessage());
        }
        
        return result;
    }
	

	
    @Override
    public CustomerTypeModel viewCustomerType () {
        CustomerTypeModel customerTypeModel = new CustomerTypeModel();
        List<CustomerTypeModel> models = new ArrayList<CustomerTypeModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select customer_type,customer_percentage from customer_type_mt");
            while (rs.next()) {
                customerTypeModel = new CustomerTypeModel();
                customerTypeModel.setCustomertype(rs.getString("customer_type"));
                customerTypeModel.setCustomerPercent(rs.getDouble("customer_percentage"));
                models.add(customerTypeModel);
            }
            customerTypeModel.setListModel(models);
        } catch (Exception e) {
            log.debug(" Class : SettingsDAO  Method   : viewCustomerType Exception :" + e.getMessage());
        }
        return customerTypeModel;
    }
	
    @Override
     public Boolean createCustomerType(CustomerTypeModel customerTypeModel){
     Boolean isCreate = false;
     List<CustomerTypeModel> models = customerTypeModel.getListModel();
        try {
            for (int i =0;i<models.size();i++){
                isCreate = false ;
                customerTypeModel = models.get(i);
                String query = "call pro_customertypeinfo(?, ?, ?)";
                java.sql.CallableStatement userInformationCall = DBConnection.getConnection().prepareCall(query);
                userInformationCall.setString(1, customerTypeModel.getCustomertype());
                userInformationCall.setDouble(2, customerTypeModel.getCustomerPercent());
                userInformationCall.registerOutParameter(3, Types.INTEGER);
                userInformationCall.executeUpdate ();
                if (userInformationCall.getInt("flag") == 1) {
                    isCreate = true ;
                }
            }
        } catch (Exception e) {
          log.debug(" Class : SettingsDAO  Method   : createCustomerType Exception :" + e.getMessage());
        }
     return isCreate;
    }

    @Override
    public String[] getsmsConfiguration() throws RemoteException {
     String[] config = new String[3];
     config[0] = "";
     config[1] = "";
     config[2] = "";

     String sql ="select way2sms_user as username ,way2sms_pass as senderid ,smsgateway_apikey1 as apikey  from medp_hosp_settings_config;";
     try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                
                config[0] = rs.getString("");
                config[1] = rs.getString("");
                config[2] = rs.getString("");
                
            }
        }catch(Exception e)
             {

            }
     return config;
    }
}


