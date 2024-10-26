/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.CreditNoteModel;
import com.vanuston.medeil.model.DiagnosticdoctorModel;
import com.vanuston.medeil.model.LabrangeModel;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.ServiceModel;
import com.vanuston.medeil.model.StockModel;
import java.rmi.RemoteException;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.util.ArrayList;
import com.vanuston.medeil.util.Value;
import java.io.File;
import java.util.HashMap;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.DocumentBuilderFactory;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class SalesDAO implements Sales {
    static Logger log=Logger.getLogger(SalesDAO.class,"com.vanuston.medeil.dao.SalesDAO");
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public int getCntFnRow;
    private String productName;
    private String ItemName;

   //Temporary Stock table insertion
    @Override
    public boolean insertTempStock(SalesModel sales) {
        boolean insertFlag = false;
        SalesModel tempSales = sales;
        try {

            DBConnection.getStatement().executeUpdate("INSERT INTO temp_stocks (item_code,item_name,batch_no,qty,packing,expiry_date,mrp,cdate,temp_flag_id) values('" + tempSales.getItemCode() + "','" + tempSales.getItemName() + "','" + tempSales.getBatchNumber() + "','" + tempSales.getQuantity() + "','" + tempSales.getPacking() + "','" + tempSales.getExpiryDate() + "','" + tempSales.getMrp() + "',curdate(),'0')");
            insertFlag =true;
        }
        catch(Exception ex) {
           
            String msg = "Class :SalesDAO  Method : insertTempStock Exception : " + ex.getMessage();
            log.debug(msg);
        }
        return insertFlag;
    }

    //Stock subtraction
    @Override
    public boolean stockSub(SalesModel model)
    {
       ResultSet rs=null;
       int oldStockQty=0;
       int newStockQty=0;
       int oldSoldQty=0;
       int adjid=0;
       String itemName = "";
       Boolean updateFlag=false;
        try {
            if(!model.getUpdateFlag().equals("true"))
            {
                rs = DBConnection.getStatement().executeQuery("select item_name,item_code,batch_no,qty,total_items from sales_" + model.getTableName() + " where bill_no='" + model.getBillNumber() + "'");
            }
            else
            {
                rs = DBConnection.getStatement().executeQuery("select item_name,item_code,batch_no,qty,total_items,adj_id from sales_return where sales_return_no='" + model.getSalesReturnNumber() + "'");
            }
            while(rs.next())
            {
                model.setOldItemCode(rs.getString("item_code"));
                model.setOldQty(rs.getInt("qty"));
                model.setOldBatch(rs.getString("batch_no"));
                itemName = rs.getString("item_name");
                adjid=rs.getInt("adj_id");
                if(adjid==0)
                {
               //sabarish     StockDAO stock=new StockDAO();
               //sabarish     String stkQty = stock.getStockQty(model.getOldItemCode(),model.getOldBatch());
                 //sabarish      if(stkQty!=null && !stkQty.equals("null") && !stkQty.trim().equals(""))
                //sabarish       {
                     //sabarish   oldStockQty=Integer.parseInt(stock.getStockQty(model.getOldItemCode(),model.getOldBatch()));
                //sabarish       }
                    oldSoldQty=model.getOldQty();
                    newStockQty=oldStockQty-oldSoldQty;
                    DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + newStockQty + "' where item_code='"+model.getOldItemCode()+"' and batch_no='"+model.getOldBatch()+"'");
                    String sql1 = "insert into stock_register(stock_date, item_code, item_name, batch_no, opening_stock, txn_qty, closing_stock, txn_type, txn_reference) values(now(),'"+model.getOldItemCode()+"','"+itemName+"','"+model.getOldBatch()+"','"+oldStockQty+"','"+oldSoldQty+"','"+newStockQty+"','Sales Maintenance (-)','"+model.getBillNumber()+"')";
                    DBConnection.getStatement().executeUpdate(sql1);
                }
                else
                {
                    int adjQty=0;
                    int physcialQty=0;
                    ResultSet rs1=DBConnection.getStatement().executeQuery("select adjusted_stock as qty,physical_stock from stock_adjustment where id='"+adjid+"'");
                    while(rs1.next()) {
                        adjQty=rs1.getInt("qty");
                        physcialQty=rs1.getInt("physical_stock");
                        newStockQty=adjQty+model.getOldQty();
                        physcialQty=physcialQty+model.getOldQty();
                        DBConnection.getStatement().executeUpdate("update stock_adjustment set adjusted_stock='" + newStockQty + "',physical_stock='"+physcialQty+"' where id='"+adjid+"'");
                    }
                    
                }                
            }
            updateFlag=true;
        }
        catch (Exception ex) {
            String msg = "Class :SalesDAO  Method : stockSub Exception : " + ex.getMessage();
            log.debug(msg);
        }
      return updateFlag;
    }


    //Stock Addition while updating in Sales Maintenance
    //Method purpose : While updating in sales maintenance, the rows in sales bills are deleted. So stock is added back
    @Override
    public boolean stockAdd(SalesModel model)
    {
        ResultSet rs=null;
        int oldStockQty=0;
        int newStockQty=0;
        int oldSoldQty=0;
        int retQty=0;
        int adjid=0;
        String itemName = "";
        Boolean updateFlag=false;
        try
        {
            if(!model.getBillType().equals("counter"))
            {
              rs=DBConnection.getStatement().executeQuery("select s.item_name as item_name,s.item_code as item_code,s.batch_no as batch_no,s.qty as qty,s.total_items as total_items,s.adj_id,"
                      + "coalesce(sr.qty,0) as retqty from sales_"+model.getBillType()+"_bill"+" s left join sales_return sr on s.bill_no=sr.bill_no and s.batch_no=sr.batch_no and s.item_code=sr.item_code "
                      + "and s.item_name=sr.item_name where s.bill_no='"+model.getBillNumber()+"'");
            }
            else
            {
              rs=DBConnection.getStatement().executeQuery("select s.item_name as item_name,s.item_code as item_code,s.batch_no as batch_no,s.qty as qty,s.total_items as total_items,0 as adj_id,"
                      + "coalesce(sr.qty,0) as retqty from sales_accounts s left join sales_return sr on s.bill_no=sr.bill_no and s.batch_no=sr.batch_no and s.item_code=sr.item_code and "
                      + "s.item_name=sr.item_name where s.bill_no='"+model.getBillNumber()+"'");
            }
            while(rs.next())
            {
                model.setOldItemCode(rs.getString("item_code"));
                model.setOldQty(rs.getInt("qty"));
                model.setOldBatch(rs.getString("batch_no"));
                itemName = rs.getString("item_name");
                retQty = rs.getInt("retqty");
                adjid=rs.getInt("adj_id");
                if(adjid==0) {
                   //sabarish    StockDAO stock=new StockDAO();
                   //sabarish    String stkQty = stock.getStockQty(model.getOldItemCode(),model.getOldBatch());
                   //sabarish    if(stkQty!=null && !stkQty.equals("null") && !stkQty.trim().equals("")) {
                     //sabarish      oldStockQty=Integer.parseInt(stock.getStockQty(model.getOldItemCode(),model.getOldBatch()));
                 //sabarish      }
                    oldSoldQty=model.getOldQty();
                    newStockQty=oldStockQty+oldSoldQty-retQty;
                    DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + newStockQty + "',ss_flag_id = 0 where item_code='"+model.getOldItemCode()+"' and batch_no='"+model.getOldBatch()+"'");
                    if(!model.getFormType().equals("cancelbill"))
                    {
                        String sql1 = "insert into stock_register(stock_date, item_code, item_name, batch_no, opening_stock, txn_qty, closing_stock, txn_type, txn_reference) values(now(),'"+model.getOldItemCode()+"','"+itemName+"','"+model.getOldBatch()+"','"+oldStockQty+"','"+(oldSoldQty-retQty)+"','"+newStockQty+"','Sales Maintenance (+)','"+model.getBillNumber()+"')";
                        DBConnection.getStatement().executeUpdate(sql1);
                    }
                }
                else
                {
                    int adjQty=0;
                    int physcialQty=0;
                    ResultSet rs1=DBConnection.getStatement().executeQuery("select adjusted_stock as qty,physical_stock from stock_adjustment where id='"+adjid+"'");
                    while(rs1.next()) {
                        adjQty=rs1.getInt("qty");
                        physcialQty=rs1.getInt("physical_stock");
                        newStockQty=adjQty-model.getOldQty();
                        physcialQty=physcialQty-model.getOldQty();
                        DBConnection.getStatement().executeUpdate("update stock_adjustment set adjusted_stock='" + newStockQty + "',physical_stock='"+physcialQty+"' where id='"+adjid+"'");
                    }                    
                }                
            }
            updateFlag=true;
        }
        catch(Exception ex) {           
            String msg = "Class :SalesDAO  Method : stockAdd()  Exception: " + ex.getMessage();
            log.debug(msg);
        }
        return updateFlag;
    }
    
    @Override
    public Object viewAllRecords() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Save sales bill, sales return.
    //Sales cash,card or credit bill tables are inserted first. Then sales maintenance table is inserted.
    @Override
    public Object createRecord(Object object) {       
        Boolean insert = false;
        int returnFlagCount = 0;
        SalesModel salesModel = (SalesModel) object;
        List<SalesModel> list = salesModel.getListofitems();
        try
        {
        // Sales cash, credit, cards Insert
        for (int index = 0; index < list.size(); index++) {
            SalesModel iterateModel = list.get(index);
            CallableStatement salesCall=DBConnection.getConnection().prepareCall("{call pro_savesales( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            salesCall.setString(1,salesModel.getBillNumber());
            salesCall.setString(2,salesModel.getBillDate());
            salesCall.setString(3,salesModel.getCustomerName());
            salesCall.setString(4,salesModel.getDoctorName());
            salesCall.setString(5,iterateModel.getItemCode());
            salesCall.setString(6,iterateModel.getItemName());
            salesCall.setString(7,iterateModel.getFormulation());
            salesCall.setString(8,iterateModel.getBatchNumber());
            salesCall.setInt(9,iterateModel.getQuantity());
            salesCall.setDouble(10, iterateModel.getUnitPrice());
            salesCall.setString(11,iterateModel.getExpiryDate());
            salesCall.setDouble(12, iterateModel.getMrp());
            salesCall.setDouble(13, iterateModel.getUnitDiscount());
            salesCall.setDouble(14, iterateModel.getUnitVAT());
            salesCall.setDouble(15, iterateModel.getSubTotal());
            salesCall.setDouble(16, salesModel.getTotalDiscount());
            salesCall.setDouble(17, salesModel.getTotalVAT());
            salesCall.setDouble(18, salesModel.getTotalAmount());
            salesCall.setDouble(19, salesModel.getPaidAmount());
            salesCall.setDouble(20, salesModel.getBalanceAmount());
            salesCall.setInt(21, salesModel.getTotalItems());
            salesCall.setInt(22, salesModel.getTotalQuantity());
            salesCall.setString(23, salesModel.getPaymentMode());
            salesCall.setString(24, salesModel.getCardNumber());
            salesCall.setString(25, salesModel.getCardHolderName());
            salesCall.setString(26,salesModel.getBankName());
            salesCall.setString(27, salesModel.getCardExpiry());
            salesCall.setString(28, salesModel.getAccountNumber());
            salesCall.setString(29, salesModel.getBillType());
            salesCall.setString(30, salesModel.getFormType());
            salesCall.setString(31,salesModel.getSalesReturnNumber());
            salesCall.setString(32,salesModel.getSalesReturnDate());
            salesCall.setString(33,salesModel.getEmployeeID());
            //Adjustment ID is set in Total Items
            salesCall.setInt(34,iterateModel.getTotalItems());
            salesCall.setInt(35,salesModel.getPrescriptionDays());            
            salesCall.setInt(36,salesModel.getrefillFlag());
            salesCall.registerOutParameter(37,Types.INTEGER);
            salesCall.executeUpdate();

            int returnFlag=salesCall.getInt("flag");
            
            if(returnFlag==1){
               returnFlagCount++;
            }
            }
            // Maintenance Table Insert
             if(returnFlagCount==list.size() && !salesModel.getBillType().equals("dummy") && !salesModel.getFormType().equals("return") && !salesModel.getFormType().equals("cancelbill")){
             String paymentMode="";
             if(salesModel.getBillType().equals("cards")) {
                paymentMode = salesModel.getPaymentMode();
             }
             for (int index = 0; index <= 1; index++) {
                 CallableStatement maintenanceCall=DBConnection.getConnection().prepareCall("{call pro_savesales( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
                 maintenanceCall.setString(1, salesModel.getBillNumber());
                 maintenanceCall.setString(2, salesModel.getBillDate());
                 maintenanceCall.setString(3, salesModel.getCustomerName());
                 maintenanceCall.setString(4, salesModel.getDoctorName());
                 maintenanceCall.setString(5,"");
                 maintenanceCall.setString(6,"");
                 maintenanceCall.setString(7,"");
                 maintenanceCall.setString(8,"");
                 maintenanceCall.setInt(9,0);
                 maintenanceCall.setDouble(10, 0.00);
                 maintenanceCall.setString(11,"0000-00-00");
                 maintenanceCall.setDouble(12, 0.00);
                 maintenanceCall.setDouble(13, 0.00);
                 maintenanceCall.setDouble(14, 0.00);
                 maintenanceCall.setDouble(15, 0.00);
                 maintenanceCall.setDouble(16, 0.00);
                 maintenanceCall.setDouble(17, 0.00);
                 maintenanceCall.setDouble(18, salesModel.getTotalAmount());
                 maintenanceCall.setDouble(19, salesModel.getPaidAmount());
                 maintenanceCall.setDouble(20, salesModel.getBalanceAmount());
                 maintenanceCall.setInt(21, salesModel.getTotalItems());
                 maintenanceCall.setInt(22, salesModel.getTotalQuantity());
                 maintenanceCall.setString(23, paymentMode);
                 maintenanceCall.setString(24, salesModel.getCardNumber());
                 maintenanceCall.setString(25, salesModel.getCardHolderName());
                 maintenanceCall.setString(26, salesModel.getBankName());
                 maintenanceCall.setString(27, salesModel.getCardExpiry());
                 maintenanceCall.setString(28, salesModel.getAccountNumber());
                 if (index == 0 && !salesModel.getBillType().equals("counter")) {
                    maintenanceCall.setString(29, "savemaintenance");
                 } else if(index == 0 && salesModel.getBillType().equals("counter")) {
                    maintenanceCall.setString(29, "savecountermaintenance");
                 } else if (index == 1 && salesModel.getBillType().equals("cards")) {
                    maintenanceCall.setString(29, "bankbook");
                 } else {
                     maintenanceCall.setString(29, "");
                 }
                 maintenanceCall.setString(30,salesModel.getFormType());
                 maintenanceCall.setString(31,salesModel.getSalesReturnNumber());
                 maintenanceCall.setString(32,salesModel.getSalesReturnDate());
                 maintenanceCall.setString(33,salesModel.getEmployeeID());
                 maintenanceCall.setInt(34,0);
                 maintenanceCall.setInt(35, salesModel.getPrescriptionDays());
                 maintenanceCall.setInt(36,0);
                 maintenanceCall.registerOutParameter(37,Types.INTEGER);
                 maintenanceCall.executeUpdate();
             }
            } else {
            // Rollback Sales items
            }
            insert = true;        
        }
        catch(Exception e)
        {           
           insert = false;
           log.debug(" Class : SalesDAO  Method   : CreateRecord Exception :" + e.getMessage()); 
        }
        return insert;
    }

    //Values for Expiry Stock Alert dialog box in Sales
    @Override
    public Integer getAlertStatus() {
        int i = 0;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT expiry_alerts   FROM alert_setting";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = rs.getInt("expiry_alerts");
            }
        } catch (Exception ex) {
            String msg = "Class :SalesDAO  Method : getAlertStatus Exception : " + ex.getMessage();
            log.debug(msg);
        }

        return i;
    }

    
    @Override
    public int getTotTempQty(int rowIndex,int n,List<SalesModel> salesTableItems) {
        int totTmpQty = 0;
        try {            
            SalesModel model = salesTableItems.get(rowIndex);
            String itemName = model.getItemName();
            Integer quantity = model.getQuantity();
            String batchNo = model.getBatchNumber();
            for (int index = 0; index < salesTableItems.size(); index++)
            {
                SalesModel salesmodel = salesTableItems.get(index);
                String batch = salesmodel.getBatchNumber();               
                String tableItemName = salesmodel.getItemName();

                if(!tableItemName.equals("") && !batch.equals(""))
                {
                    if (itemName.trim().equals(tableItemName.trim()) && batch.trim().equals(batchNo.trim()))
                    {
                            int rQty = salesmodel.getQuantity();
                            totTmpQty += rQty;
                            getCntFnRow = index;
                    }
                }
            }
            if(n==0)
            {
                totTmpQty -= quantity;                
            }
        }
        catch (Exception ex)
        {
          //  System.out.println("getTotTempQty="+ex);
            String msg = "Class :SalesDAO  Method : getTotTempQty Exception : " + ex.getMessage();
            log.debug(msg);
        }
        return totTmpQty;
    }

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Sales maintenance update - while clicking on update, the datas are actually deleted and inserted
    //Purpose: to delete values in sales cash,card or credit as well as maintenance tables
    @Override
    public boolean deleteRecord(Object object) {
        Boolean deleteFlag=false;
        SalesModel model = (SalesModel) object;
        try {
            if(!model.getFormType().equals("return")) {
            if(!model.getBillType().equals("counter"))
            {
            DBConnection.getStatement().executeUpdate("delete from sales_"+model.getBillType()+"_bill"+" where bill_no = '"+model.getBillNumber()+"'");
                
            }
            else
            {
            DBConnection.getStatement().executeUpdate("delete from sales_accounts where bill_no = '"+model.getBillNumber()+"'");
            }
            DBConnection.getStatement().executeUpdate("delete from sales_maintain_bill where bill_no='"+model.getBillNumber()+"'");
            deleteFlag=true;
            }
            else
            {
            DBConnection.getStatement().executeUpdate("delete from sales_return where sales_return_no = '"+model.getSalesReturnNumber()+"'");
            deleteFlag=true;
            }
        } 
        catch (Exception ex)
        {   
            //System.out.println("Class :SalesDAO  Method : deleteRecord  Exception: " + ex);
           deleteFlag=false;
           String msg = "Class :SalesDAO  Method : deleteRecord  Exception: " + ex.getMessage();
           log.debug(msg);
        }
        return deleteFlag;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object salesTableValidation(List<SalesModel> list, String billType,String formType,String billNumber, String tableName) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //To get the sales quantity in sales table before making any changes in sales maintenance
    @Override
    public String getSoldQty(String billNumber,String itemCode, String batchNumber,String billType) {
        String getSoldQty="0";
        ResultSet rs=null;
        try {            
            if(!billType.equals("counter"))
            {
            rs=DBConnection.getStatement().executeQuery("select qty from sales_"+billType+"_bill"+" where bill_no='"+billNumber+"' and item_code='"+itemCode+"' and batch_no='"+batchNumber+"'");
            }
            else
            {
            rs=DBConnection.getStatement().executeQuery("select qty from sales_accounts where bill_no='"+billNumber+"' and item_code='"+itemCode+"' and batch_no='"+batchNumber+"'");
            }

            
            while(rs.next())
            {
                 if (rs.getString("qty") != null && !rs.getString("qty").equals("")) {
                    getSoldQty = rs.getString("qty").toString();
                }
            }
        }
        catch(Exception ex){          
           String msg = "Class :SalesDAO  Method : getSoldQty Exception: " + ex.getMessage();
           log.debug(msg);
        }
        return getSoldQty;
    }    



    @Override
    public Integer getSoldQty(String billNumber,String itemCode, String batchNumber,String billType, String tableName)
    {
        int soldQty=0;
        ResultSet rs=null;
        try
        {
        rs=DBConnection.getStatement().executeQuery("select qty from sales_"+tableName+" where bill_no='"+billNumber+"' and item_code='"+itemCode+"' and batch_no='"+batchNumber+"'");     //bill_no previous
        while(rs.next())
        {
            soldQty=rs.getInt("qty");
        }
        }
        catch(Exception e)
        {
            String ss = " Class : SalesDAO  Method   : getSoldQty Exception :" + e.getMessage();
            log.debug(ss);
        }
        return soldQty;
    }


    //To insert in cedit note table in case of sales return
    @Override
    public CreditNoteModel insertCreditNoteNo(SalesModel sales) {
        ResultSet rs=null;
        CommonDAO commonDAO = new CommonDAO();
        CreditNoteModel creditModel=new CreditNoteModel();
        String creditNoteNo=commonDAO.getAutoIncrement(DateUtils.now("dd-MM-yyyy"),"CreditNotes");        
            try {
                if(!sales.getUpdateFlag().equals("true")){
                creditModel.setCreditNoteNumber(creditNoteNo);
                DBConnection.getStatement().executeUpdate("insert into credit_note (credit_note_no,issued_against,credit_opt,credit_date, invoiceorbill_no,name,amount,details,cre_flag_id) values('"+creditNoteNo+"','Customer','Sales Return','"+sales.getSalesReturnDate()+"','"+sales.getBillNumber()+"','"+sales.getCustomerName()+"',"+sales.getTotalAmount()+",'',0)");
                
                }
                else{
                rs=DBConnection.getStatement().executeQuery("select credit_note_no,details from credit_note where invoiceorbill_no = '"+sales.getBillNumber()+"'");
                while(rs.next())
                {
                   creditModel.setCreditNoteNumber(rs.getString("credit_note_no"));
                   creditModel.setDetails(rs.getString("details"));
                }
                DBConnection.getStatement().executeUpdate("update credit_note set issued_against='Customer',credit_opt='Sales Return',credit_date='"+sales.getSalesReturnDate()+"',name='"+sales.getCustomerName()+"',amount="+sales.getTotalAmount()+",details='"+creditModel.getDetails()+"' where credit_note_no = '"+creditModel.getCreditNoteNumber()+"'");
                }                
            } catch (Exception ex) {               
                String ss = " Class : SalesDAO  Method   : insertCreditNoteNo Exception :" + ex.getMessage();
                log.debug(ss);
            }
        return creditModel;
    
    }

    //Update credit note table in case of sales return
    @Override
    public Boolean updateCreditDetails(String details,String creditNoteNo)
    {
        Boolean updateFlag=false;
        try{
            
            DBConnection.getStatement().executeUpdate("update credit_note set details ='"+details+"' where credit_note_no = '"+creditNoteNo+"'");
            updateFlag = true;

        }
        catch(Exception ex){
               
                String ss = " Class : SalesDAO  Method   : updateCreditDetails Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return updateFlag;

    }

    //To load current date sales in Sales maintenance form on clicking Maintenance Submenu
    @Override
    public SalesModel loadSalesMaintain(String nowDate)
    {
        ResultSet rs=null;
        SalesModel sales = new SalesModel();
        SalesModel salesitems;
        List salesList = new ArrayList();
        try{
            rs = DBConnection.getStatement().executeQuery("select bill_no, bill_date,bill_type, cust_name,total_items, total_qty,total_amount from sales_maintain_bill where bill_date = '" + nowDate + "' order by bill_no desc");
            rs.last();
            int cnt = rs.getRow();            
            
            rs.beforeFirst();
            sales.setRowCount(cnt);
            while(rs.next()){
                salesitems = new SalesModel();
                salesitems.setBillNumber(rs.getString("bill_no"));                
                salesitems.setBillDate(rs.getString("bill_date"));
                salesitems.setBillType(rs.getString("bill_type"));
                salesitems.setCustomerName(rs.getString("cust_name"));
                salesitems.setTotalItems(rs.getInt("total_items"));
                salesitems.setTotalQuantity(rs.getInt("total_qty"));
                salesitems.setTotalAmount(rs.getDouble("total_amount"));                
                salesList.add(salesitems);
            }
            sales.setListofitems(salesList);
        }
        catch(Exception ex){
               
                String ss = " Class : SalesDAO  Method  : loadSalesMaintain Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return sales;
    }

    //To load sales values in Sales maintenance form based on date, bill number search
    @Override
    public SalesModel loadSalesMaintain(String option,String value)
    {
        ResultSet rs=null;
        SalesModel sales = new SalesModel();
        SalesModel salesitems;
        List salesList = new ArrayList();
        try {
            rs = DBConnection.getStatement().executeQuery("select bill_no, bill_date,bill_type, cust_name,total_items, total_qty,total_amount from sales_maintain_bill where " + option + " like '" + value + "%' order by bill_no desc ");
            rs.last();
            int cnt = rs.getRow();            
            rs.beforeFirst();
            sales.setRowCount(cnt);
            while(rs.next()){
                salesitems = new SalesModel();
                salesitems.setBillNumber(rs.getString("bill_no"));                
                salesitems.setBillDate(rs.getString("bill_date"));
                salesitems.setBillType(rs.getString("bill_type"));
                salesitems.setCustomerName(rs.getString("cust_name"));
                salesitems.setTotalItems(rs.getInt("total_items"));
                salesitems.setTotalQuantity(rs.getInt("total_qty"));
                salesitems.setTotalAmount(rs.getDouble("total_amount"));
                salesList.add(salesitems);
            }
            sales.setListofitems(salesList);
        }
        catch(Exception ex){
               
                String ss = " Class : SalesDAO  Method  : loadSalesMaintain Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return sales;
    }


    //Dummy Bill Loading table values
    @Override
        public Vector loadDummyStockTable(String val) {
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
     //sabarish   PurchaseDAO purchase = new PurchaseDAO();
        try {
            rs = DBConnection.getStatement().executeQuery("CALL pro_getDrugTables('" + val + "')");
            while(rs.next()){
                temp = new Vector();
                    String vt = "0";
                    String mfg = "";
                    String code = rs.getString("itemcode").trim();
                    double mrp = rs.getDouble("mrp");
                   //sabarish int pack = purchase.getPackingValue(code);
                   //sabarish  String unitmrp = Value.Round(mrp/pack);
                    if (rs.getString("vat") == null || rs.getString("vat").equals("0.00"));
                    else
                    {
                        vt = rs.getString("vat").trim();
                    }
                    mfg = rs.getString("mfgname").trim();
                    temp.addElement(rs.getString("itemname").trim());
                    temp.addElement(code);
                    temp.addElement(mfg);
                    temp.addElement(rs.getString("dosage").trim());
                   //sabarish temp.addElement(unitmrp);
                    temp.addElement(vt);
                    //gst table
                    temp.addElement(rs.getString("unit_gst").trim());                   
                    temp.addElement(rs.getString("unit_sgst").trim());
                    temp.addElement(rs.getString("unit_cgst").trim());
                    temp.addElement(rs.getString("unit_igst").trim());
                    temp.addElement(rs.getString("unit_utgst").trim());
                    temp.addElement(rs.getString("formulation"));
                    data.addElement(temp);
            }
        } catch(Exception ex) {
                String ss = " Class : SalesDAO  Method   : loadDummyStockTable Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return data;
    }


    //Loading table values for cash,credit,card and counter sales bills
    @Override
    public Vector loadStockTable (String val) {
     ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        try {                               
            rs = DBConnection.getStatement().executeQuery("CALL pro_getStockTables('" + val + "')");            
            while(rs.next())
            {                
                    temp = new Vector();
                    String unitPrice = "0";
                    String vat = "0";
                    String mfg = "";
                    String batch = "";
                    String schedule = "";
                    String edate = DateUtils.now("MM-yy");
                    edate = rs.getString("expiry_date");
                    String code = rs.getString("item_code").trim();
                    String mrp = rs.getString("mrp").trim();
                    String sellingPrice = rs.getString("selling_price").trim();
                    String bat = rs.getString("batch_no").trim();
                    int stkQty = rs.getInt("stkqty");
                    mfg = rs.getString("mfgname").trim();
                    schedule = rs.getString("schedule").trim();
                    if (rs.getString("vat") == null || rs.getString("vat").equals("0.00"));
                    else
                    {
                        vat = rs.getString("vat").trim();
                    }                                       
                    if (sellingPrice == null || sellingPrice.equals(""))
                    {
                        if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0"))
                        {
                            unitPrice = "0";
                        } 
                        else
                        {
                            unitPrice = mrp;
                        }
                    }
                    else
                    {
                        unitPrice = sellingPrice;
                    }
                    if (bat == null || bat.equals(""));
                    else
                    {
                        batch = bat;
                    }
                    temp.addElement(rs.getString("itemname").trim());
                    temp.addElement(code);
                    temp.addElement(mfg);
                    temp.addElement(rs.getString("dosage").trim());
                    temp.addElement(batch);
                    temp.addElement(stkQty);
                    temp.addElement(Double.parseDouble(unitPrice));
                    temp.addElement(mrp);
                    temp.addElement(vat);
                    temp.addElement(edate);
                    temp.addElement(rs.getString("formulation"));
                    temp.addElement(rs.getString("ban_flag_id"));
                    temp.addElement(rs.getString("rack"));
                    temp.addElement(rs.getString("shelf"));
                    temp.addElement(rs.getString("minstock"));
                    temp.addElement(rs.getString("packing"));
                    temp.addElement(rs.getDouble("sales_discount"));
                    temp.addElement(rs.getDouble("purchase_price"));
                    temp.addElement(schedule);
                    //gst here
                    temp.addElement(rs.getString("unit_gst"));
                    temp.addElement(rs.getString("unit_sgst"));
                    temp.addElement(rs.getString("unit_cgst"));
                    temp.addElement(rs.getString("unit_igst"));
                    temp.addElement(rs.getString("unit_utgst"));//getDouble
                    data.addElement(temp);                                    
            }
        } 
        catch(Exception ex)
        {
             //   System.out.println("Class : SalesDAO  Method : loadStockTable_1 Exception :" + ex.getMessage());
                String ss = "Class : SalesDAO  Method : loadStockTable_1 Exception :" + ex.getMessage();
                log.debug(ss);
        }   
        return data;
    }

    //to load values from Prescription to Sales
     @Override
    public SalesModel getStockItem(String val,double qty) {
        ResultSet rs = null ;
        SalesModel sm =null ;
        List<SalesModel> list ;
        try {
            String qry = "CALL pro_getStockDetails('" + val + "','"+qty+"')";            
            rs = DBConnection.getStatement().executeQuery(qry);
            if(rs != null){
                list = new ArrayList<SalesModel>();            
                while(rs.next()){
                        sm = new SalesModel();
                        sm.setModuleType("importSales");
                        String unitPrice = "0";
                        String vat = "0";
                        String mfg = "";
                        String batch = "";
                        String edate = DateUtils.now("mmm-yyyy");
                        edate = rs.getString("expiry_date");                        
                        String code = rs.getString("item_code").trim();
                        String mrp = rs.getString("mrp").trim();
                        String sellingPrice = rs.getString("selling_price").trim();
                        String bat = rs.getString("batch_no").trim();
                        int stkQty = rs.getInt("stkqty");
                        mfg = rs.getString("mfgname").trim();

                        if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                            vat = rs.getString("vat").trim();
                        }

                        if (sellingPrice == null || sellingPrice.equals("")) {
                            if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                                unitPrice = "0";
                            } else {
                                unitPrice = mrp;
                            }
                        } else {
                            unitPrice = sellingPrice;
                        }
                        if (bat == null || bat.equals("")); else {
                            batch = bat;
                        }
                        sm.setItemName(rs.getString("itemname").trim()+"_"+rs.getString("dosage").trim());
                        sm.setItemCode(code);
                        sm.setManufacturerName(mfg);
                        sm.setBatchNumber(batch);                        
                        sm.setQuantity((int) qty);                        
                        sm.setUnitPrice(Double.parseDouble(unitPrice));
                        sm.setMrp(rs.getDouble("mrp"));
                        sm.setUnitPrice(rs.getDouble("selling_price"));
                        sm.setUnitVAT(rs.getDouble("vat"));
                        sm.setExpiryDate(edate);
                        sm.setFormulation(rs.getString("formulation"));
                        sm.setUpdateFlag(rs.getString("ban_flag_id"));//use UbdateFlag instead baanedFlag 
                        sm.setPacking(rs.getInt("packing"));
                        sm.setUnitDiscount(rs.getDouble("sales_discount"));
                        list.add(sm);
                }
            }

        } catch(Exception ex) {
                String ss = "Class : SalesDAO  Method : getStockItem Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return sm;
    }

    //Loading table values for cash,credit,card and counter sales bills
    @Override
    public Vector loadStockTable(String val, Object dos) {
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        try {
                rs = DBConnection.getStatement().executeQuery("CALL pro_getStockTables('" + val + "')");
                while (rs.next()) {
                    temp = new Vector();
                    String name = rs.getString("itemname").trim();
                    String dosage = rs.getString("dosage").trim();
                    int stkQty = rs.getInt("stkqty");
                    if (name.equals(val.trim()) && dosage.equals(dos) && stkQty > 0) {
                        String up = "0";
                        String vt = "0";
                        String batch = "";
                        String edate = DateUtils.now("MMM-yyyy");
                        String mfg = "";
                        String code = rs.getString("item_code").trim();
                        String mrp = rs.getString("mrp").trim();
                        String s = rs.getString("selling_price").trim();
                        String bat = rs.getString("batch_no").trim();
                        edate = rs.getString("expiry_date");
                        if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                            vt = rs.getString("vat").trim();
                        }
                        mfg = rs.getString("mfgname").trim();
                        temp.addElement(name);
                        if (s == null || s.equals("")) {
                            if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                                up = "0";
                            } else {
                                up = mrp;
                            }
                        } else {
                            up = s;
                        }
                        if (bat == null || bat.equals("")); else {
                            batch = bat;
                        }
                        temp.addElement(code);
                        temp.addElement(mfg);
                        temp.addElement(dosage);
                        temp.addElement(batch);
                        temp.addElement(stkQty);
                        temp.addElement(Double.parseDouble(up));
                        temp.addElement(mrp);
                        temp.addElement(vt);
                        temp.addElement(edate);
                        temp.addElement(rs.getString("formulation"));
                        temp.addElement(rs.getString("ban_flag_id"));
                       //gst
                    temp.addElement(rs.getString("unit_gst").trim());
                    temp.addElement(rs.getString("unit_sgst").trim());
                    temp.addElement(rs.getString("unit_cgst").trim());
                    temp.addElement(rs.getString("unit_igst").trim());
                    temp.addElement(rs.getString("unit_utgst").trim());
                    data.addElement(temp);
                    }
                    else
                    {
                        continue;
                    }
                }
        } catch(Exception ex) {
                String ss = "Class : SalesDAO  Method   : loadStockTable_2 Exception :" + ex.getMessage();
                log.debug(ss);
        }        
        return data;
    }


    //Load substitute drug values in sales on pressing F11
    @Override
    public Vector loadSubstituteDrug(String val, int purRate, int stk){
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        try {
                rs = DBConnection.getStatement().executeQuery("CALL pro_getSubstitutes(" + val + "," + purRate + "," + stk + ")");
                rs.last();
                int rr = rs.getRow();
                rs.beforeFirst();
                if (rr > 0) {
                    while (rs.next()) {
                        temp = new Vector();
                        String up = "0";
                        String sgst="0";
                        String cgst="0";
                        String igst="0";
                        String gst="0";
                        String utgst="0";
                        String batch = "";
                        String edate = DateUtils.now("MM-yy");
                        String mfg = "";
                        String code = rs.getString("item_code").trim();
                        String mrp = rs.getString("mrp").trim();
                        String s = rs.getString("selling_price").trim();
                        String bat = rs.getString("batch_no").trim();
                        int stkQty = rs.getInt("stkqty");
                        edate = DateUtils.normalFormatExpDate(rs.getDate("expiry_date"));
                        //ajith
                        sgst=rs.getString("unit_sgst").trim();
                        cgst=rs.getString("unit_cgst").trim();
                        igst=rs.getString("unit_igst").trim();
                        gst=rs.getString("unit_gst").trim();
                        utgst=rs.getString("unit_utgst").trim();
                        mfg = rs.getString("mfgname").trim();
                        temp.addElement(rs.getString("itemname").trim());
                        if (s == null || s.equals("")) {
                            if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                                up = "0";
                            } else {
                                up = mrp;
                            }
                        } else {
                            up = s;
                        }
                        if (bat == null || bat.equals("")); else {
                            batch = bat;
                        }
                        temp.addElement(code);
                        temp.addElement(mfg);
                        temp.addElement(rs.getString("dosage"));
                        temp.addElement(rs.getString("generic"));
                        temp.addElement(batch);
                        temp.addElement(stkQty);
                        temp.addElement(Double.parseDouble(up));
                        temp.addElement(mrp);
                        temp.addElement(sgst);
                        temp.addElement(cgst);
                        temp.addElement(igst);
                        temp.addElement(edate);
                        temp.addElement(rs.getString("formulation"));
                        temp.addElement(rs.getString("ban_flag_id"));
                        temp.addElement(gst);
                        temp.addElement(utgst);
                        data.addElement(temp);                        
                    }
            }
        }
        catch(Exception ex) {
                String ss = " Class : SalesDAO  Method   : loadSubstituteDrug Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return data;
    }

    //sales return and sales Adjustment datas loading table
    @Override
    public Vector loadSalesDetails(String val,int no) {
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        CommonDAO commonDAO = new CommonDAO();
        try 
        {
                rs = DBConnection.getStatement().executeQuery( "CALL pro_getSalesDetails('" + val + "'," + no + ")");
                while (rs.next())
                {
                    temp = new Vector();
                    boolean bo = true;
                    String iname = rs.getString("item_name");
                    String icode = rs.getString("item_code");
                    String batch = rs.getString("batch_no");
                    temp.addElement(icode);
                    temp.addElement(iname);
                    temp.addElement(rs.getString("formulation"));
                    temp.addElement(rs.getInt("qty"));
                    temp.addElement(batch);
                    temp.addElement(DateUtils.normalFormatExpDate(rs.getDate("expiry_date")));
                    temp.addElement(rs.getDouble("unit_price"));
                    temp.addElement(Value.Round(rs.getString("mrp")));
                    temp.addElement(Value.Round(rs.getString("unit_discount")));
                    if(!val.equals("ADJUSTMENT"))
                     {
                         temp.addElement(Value.Round(rs.getString("unit_vat")));                        
                     }
                    //gst here
                    temp.addElement(rs.getDouble("unit_gst"));
                    temp.addElement(rs.getDouble("unit_sgst"));
                    temp.addElement(rs.getDouble("unit_cgst"));
                    temp.addElement(rs.getDouble("unit_igst"));
                    temp.addElement(rs.getDouble("unit_utgst"));
                    temp.addElement(Boolean.FALSE);
                    if(!val.equals("ADJUSTMENT"))
                    {
                        int ses = commonDAO.getReturnCompare(val,icode,iname,batch);
                        if (ses > 0)
                        {
                            bo = false;
                        }
                    }
                    else
                    {
                        bo=true;
                    }
                    temp.addElement(rs.getInt("adj_id"));                    
                    temp.addElement(bo);
                    data.addElement(temp);
                }
        }
        catch(Exception ex) {
           // System.out.println(" Class : SalesDAO  Method   : loadSalesDetails Exception :" + ex);
                String ss = " Class : SalesDAO  Method   : loadSalesDetails Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return data;
    }

    //List bill numbers in Sales Return
    @Override
    public List<String> billNum(String name) {
        List<String> billList = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name.equals("") || name == null) {
                rs = DBConnection.getStatement().executeQuery("select bill_no from sales_maintain_bill order by bill_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("select bill_no from sales_maintain_bill where bill_no like'" + name + "%' order by bill_no");
            }
            while (rs.next()) {
                billList.add(rs.getString("bill_no"));
            }

        } catch (Exception ex) {
            String ss = " Class : SalesDAO  Method  : billNum     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return billList;
    }

    //Load previous bill number in Sales
    @Override
    public List<String> previousBillNumber(String name) {
        List<String> billList = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name.equals("") || name == "") {
                rs = DBConnection.getStatement().executeQuery("select category from billing_catagory_type order by category");
            } else {
                rs = DBConnection.getStatement().executeQuery("select category from billing_catagory_type where category like '" + name + "%' order by category");
            }
            while (rs.next()) {
                billList.add(rs.getString("category"));
            }
            billList.add("Others");
        } catch (Exception ex) {
            ex.printStackTrace();
            String ss = " Class : SalesDAO  Method  : billNum     Exception :" + ex.getMessage();
            log.debug(ss);
        } finally {

        }   
        return billList;
    }
   
    //Load sales bill details in sales return on selecting a bill no
    @Override
    public SalesModel getBillDetails(String no, String tName) {
        String tabName = "sales_" + tName;
        String query = "select * from " + tabName + " where bill_no='" + no + "'";
        SalesModel sales=new SalesModel();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next())
             {
                if (tabName.equalsIgnoreCase("sales_cards_bill"))
                {
                    sales.setPaymentMode(rs.getString("payment_mode"));
                    sales.setCardNumber(rs.getString("card_no"));
                    sales.setCardHolderName(rs.getString("card_holders_name"));
                    sales.setBankName(rs.getString("bank_name"));
                    sales.setCardExpiry(rs.getString("card_expiry"));
                }
                sales.setBillDate(rs.getString("bill_date"));
                sales.setCustomerName(rs.getString("cust_name"));
                sales.setDoctorName(rs.getString("doctor_name"));
                sales.setTotalDiscount(rs.getDouble("total_discount"));
                sales.setTotalVAT(rs.getDouble("total_vat"));
                //gst here
                sales.setGstAmt(rs.getDouble("gst_amt"));
                sales.setSgstAmt(rs.getDouble("sgst_amt"));
                sales.setCgstAmt(rs.getDouble("cgst_amt"));
                sales.setIgstAmt(rs.getDouble("igst_amt"));
                sales.setUtgstamt(rs.getDouble("utgst_amt"));

                sales.setTotalAmount(rs.getDouble("total_amount"));
                sales.setPaidAmount(rs.getDouble("paid_amount"));
                sales.setBalanceAmount(rs.getDouble("balance_amount"));
                sales.setTotalQuantity(rs.getInt("total_qty"));
                sales.setTotalItems(rs.getInt("total_items"));
            }
        }
        catch (Exception ex)
        {
           // System.out.println("exception12="+ex);
            String ss = " Class : SalesDAO  Method  : getBillDetails     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return sales;
    }

    //Load sales return numbers list in edit
    @Override
    public List<String> srBillNum() {
        List salesReturnNo = new ArrayList();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select distinct(sales_return_no) from sales_return order by sales_return_no");
            while (rs.next()) {
                salesReturnNo.add(rs.getString("sales_return_no"));
            }

        } catch (Exception ex) {
            String ss = " Class : SalesDAO Method : srBillNum()     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return salesReturnNo;
    }

    //Load sales return details in edit on selecting a return number
    @Override
    public SalesModel srBillDetails(String no) {
        String billNO = no;
        SalesModel sales=new SalesModel();
        SalesModel salesTableItems;
        ResultSet rs=null;
        List salesList = new ArrayList();
        try {
            rs = DBConnection.getStatement().executeQuery("select * from sales_return where sales_return_no='" + billNO + "'");            
            while (rs.next()) {
                sales.setBillNumber(rs.getString("bill_no"));
                sales.setBillDate(rs.getString("bill_date"));
                sales.setSalesReturnDate(rs.getString("sales_return_date"));
                sales.setCustomerName(rs.getString("cust_name"));
                sales.setBillType(rs.getString("bill_type"));
                sales.setDoctorName(rs.getString("doctor_name"));
                sales.setTotalDiscount(rs.getDouble("total_discount"));
                sales.setTotalVAT(rs.getDouble("total_vat"));
                //gst here
                sales.setGstAmt(rs.getDouble("gst_amt"));
                sales.setSgstAmt(rs.getDouble("sgst_amt"));
                sales.setCgstAmt(rs.getDouble("cgst_amt"));
                sales.setIgstAmt(rs.getDouble("igst_amt"));
                sales.setUtgstamt(rs.getDouble("utgst_amt"));
                
                sales.setTotalAmount(rs.getDouble("total_amount"));
                sales.setPaidAmount(rs.getDouble("paid_amount"));
                sales.setBalanceAmount(rs.getDouble("balance_amount"));
                sales.setTotalQuantity(rs.getInt("total_qty"));
                sales.setTotalItems(rs.getInt("total_items"));
                if (sales.getBillType().equalsIgnoreCase("Credit/Debit Card")) {
                    sales.setPaymentMode(rs.getString("payment_mode"));
                    sales.setCardNumber(rs.getString("card_no"));
                    sales.setCardHolderName(rs.getString("card_holders_name"));
                    sales.setBankName(rs.getString("bank_name"));
                    sales.setCardExpiry(rs.getString("card_expiry"));
                }
            }
           // String query1 = "select item_code,item_name,formulation,qty,batch_no,unit_price,expiry_date,mrp,unit_discount,unit_vat,sub_total,adj_id from sales_return where sales_return_no='" + billNO + "'";
            String query1="select * from  sales_return sales_return where sales_return_no='" + billNO + "'";
            ResultSet rs1 = DBConnection.getStatement().executeQuery(query1);            
            rs1.last();
            int rowCount = rs1.getRow();
            rs1.beforeFirst();
            while (rs1.next())
            {
                  salesTableItems = new SalesModel();
                  salesTableItems.setItemCode(rs1.getString("item_code"));
                  salesTableItems.setItemName(rs1.getString("item_name"));
                  salesTableItems.setFormulation(rs1.getString("formulation"));
                  salesTableItems.setQuantity(rs1.getInt("qty"));
                  salesTableItems.setBatchNumber(rs1.getString("batch_no"));
                  salesTableItems.setReturnExpiryDate(rs1.getString("expiry_date"));
                  salesTableItems.setUnitPrice(rs1.getDouble("unit_price"));
                  salesTableItems.setMrp(rs1.getDouble("mrp"));
                  salesTableItems.setUnitDiscount(rs1.getDouble("unit_discount"));
                  salesTableItems.setUnitVAT(rs1.getDouble("unit_vat"));
                  //gst here
                  salesTableItems.setGst(rs1.getDouble("unit_gst"));
                   salesTableItems.setSgst(rs1.getDouble("unit_sgst"));                  
                    salesTableItems.setCgst(rs1.getDouble("unit_cgst"));
                     salesTableItems.setIgst(rs1.getDouble("unit_igst"));
                      salesTableItems.setUtgst(rs1.getDouble("unit_utgst"));

                  salesTableItems.setSubTotal(rs1.getDouble("sub_total"));
                  salesTableItems.setTotalItems(rs1.getInt("adj_id"));
                  salesList.add(salesTableItems);
                  sales.setListofitems(salesList);
            }

        } catch (Exception ex) {

            String ss =" Class : SalesDAO Method : srBillDetails     Exception :"+ ex.getMessage();
             log.debug(ss);
        }
        return sales;
    }

    //Stock update for Temp Stock
    @Override
    public boolean updateStock(StockModel stock,String type) {
        boolean  updateFlag = false;
        try {
            if(type.equals("update")){
            DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + stock.getStock_qty() + "' where item_code='"+stock.getStock_itemCode()+"' and batch_no='" + stock.getStock_batchNo() + "'");
            DBConnection.getStatement().executeUpdate("insert into stock_register(stock_date, item_code, item_name, batch_no, opening_stock, txn_qty, closing_stock, txn_type, txn_reference) values(now(),'"+stock.getStock_itemCode()+"','"+stock.getStock_itemName()+"','"+stock.getStock_batchNo()+"','"+stock.getStock_minQty() +"','"+stock.getStock_minQty()+"','"+(stock.getStock_qty() +stock.getStock_minQty())+"','Temporary Stock','')");
            }
            else {
            String expDate =DateUtils.changeFormatExpDate(stock.getStock_expiryDate())+"-01";
            DBConnection.getStatement().executeUpdate("INSERT INTO  stock_statement (item_code ,item_name,batch_no ,qty,packing ,expiry_date ,mrp ,selling_price ,formulation,stock_date,ban_flag_id) VALUES ('" + stock.getStock_itemCode() + "','" + stock.getStock_itemName()+ "','" + stock.getStock_batchNo() + "','" + stock.getStock_qty() + "','" +stock.getStock_packing() + "','" + expDate + "','" + stock.getStock_sellingPrice() + "','" + stock.getStock_sellingPrice() + "','" + stock.getStock_formulation() + "',concat(curdate(),\' \',curtime()),'0')");
            DBConnection.getStatement().executeUpdate("insert into stock_register(stock_date, item_code, item_name, batch_no, opening_stock, txn_qty, closing_stock, txn_type, txn_reference) values(now(),'"+stock.getStock_itemCode()+"','"+stock.getStock_itemName()+"','"+stock.getStock_batchNo()+"','0','"+stock.getStock_qty()+"','"+stock.getStock_qty()+"','Temporary Stock','')");
            }
           updateFlag =true;
        }
        catch(Exception ex)
        {
            String ss =" Class : SalesDAO Method : updateStock     Exception :"+ ex.getMessage();
            log.debug(ss);
        }
        return updateFlag;
    }


    //Load sales bill details on selecting previous bill number
    @Override
    public SalesModel loadEditTable(String billNumber, String type) {        
     ResultSet rs =null;
     SalesModel salesItems;
     SalesModel sales = new SalesModel();
     List salesList = new ArrayList();
     try {
          if(type.equalsIgnoreCase("cash"))
          {
          rs = DBConnection.getStatement().executeQuery("select * from sales_cash_bill where bill_no ='" + billNumber + "' ");
          } else if(type.equalsIgnoreCase("credit")) {
          rs = DBConnection.getStatement().executeQuery("select * from sales_credit_bill where bill_no ='" + billNumber + "' ");
          } else if(type.equalsIgnoreCase("counter")) {
          rs = DBConnection.getStatement().executeQuery("select *,0 as adj_id from sales_accounts where bill_no ='" + billNumber + "' ");
          } else if(type.equalsIgnoreCase("cards")) {
          rs = DBConnection.getStatement().executeQuery("select * from sales_cards_bill where bill_no ='" + billNumber + "' ");
          }       
          while(rs.next())
          {
            salesItems = new SalesModel();
            sales.setBillNumber(rs.getString("bill_no"));
            sales.setBillDate(DateUtils.normalFormatDate(rs.getDate("bill_date")));
            sales.setCustomerName(rs.getString("cust_name"));
            sales.setDoctorName(rs.getString("doctor_name"));
            sales.setTotalQuantity(rs.getInt("total_qty"));
            sales.setTotalItems(rs.getInt("total_items"));
            sales.setTotalDiscount(rs.getDouble("total_discount"));
            sales.setTotalVAT(rs.getDouble("total_vat"));
            sales.setPaidAmount(rs.getDouble("paid_amount"));
            sales.setBalanceAmount(rs.getDouble("balance_amount"));
            sales.setTotalAmount(rs.getDouble("total_amount"));
            //gst total amount
            sales.setGstAmt(rs.getDouble("gst_amt"));
            sales.setSgstAmt(rs.getDouble("sgst_amt"));
            sales.setCgst(rs.getDouble("cgst_amt"));
            sales.setIgstAmt(rs.getDouble("igst_amt"));
            sales.setUtgstamt(rs.getDouble("utgst_amt"));

            salesItems.setItemCode(rs.getString("item_code"));
            salesItems.setItemName(rs.getString("item_name"));
            salesItems.setManufacturerName(rs.getString("mfr_name"));
            salesItems.setFormulation(rs.getString("formulation"));
            salesItems.setBatchNumber(rs.getString("batch_no"));
            salesItems.setQuantity(rs.getInt("qty"));
            salesItems.setReturnExpiryDate(rs.getString("expiry_date"));
            salesItems.setUnitPrice(rs.getDouble("unit_price"));
            salesItems.setMrp(rs.getDouble("mrp"));
            salesItems.setUnitDiscount(rs.getDouble("unit_discount"));
            salesItems.setUnitVAT(rs.getDouble("unit_vat"));
            //gst
            salesItems.setGst(rs.getDouble("unit_gst"));         
            salesItems.setSgst(rs.getDouble("unit_sgst"));
            salesItems.setCgst(rs.getDouble("unit_cgst"));
            salesItems.setIgst(rs.getDouble("unit_igst"));
            salesItems.setUtgst(rs.getDouble("unit_utgst"));
            
            salesItems.setSubTotal(rs.getDouble("sub_total"));
            salesItems.setTotalItems(rs.getInt("adj_id"));            
            salesList.add(salesItems);
          }
          sales.setListofitems(salesList);        
     }
     catch(Exception ex)
     {
           // System.out.println("exception="+ex);
            String ss =" Class : SalesDAO Method : loadEditTable     Exception :"+ ex.getMessage();
            log.debug(ss);
     }
     return sales;
    }

    //Print Sales Bill
    @Override
    public JasperPrint jasperPrint(String billno, String billmodel,JasperReport jasperReport) {
        JasperPrint jasperPrint = null;
        try {
            //File reportSource = new File("printerfiles/Print.jasper");
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("billno", billno);
            params1.put("billmodel", billmodel);               
            // Guru Pharmacy

//           if(billtype=="CustomizeA5" | billtype.equals("CustomizeA5"))
//            {

//            params1.put("billmodel", billmodel.concat("A5"));
//            }
//            else
//            {
//             params1.put("billmodel", billmodel);
//            }
            //JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportSource);
              jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());
//            JasperPrintManager.printReport(jasperPrint, false);
        } catch (Exception ex) {
           // System.out.println("Class : SalesDAO Method : jasperPrint     Exception :"+ ex);
            String ss =" Class : SalesDAO Method : jasperPrint     Exception :"+ ex.getMessage();
            log.debug(ss);
        }
        return jasperPrint;
    }


    //Alert in sales for credit customers exceeding the limit
    @Override
    public double getCreditLimit(String custName){
        double creditLimit = 0.00;
        try {
        ResultSet rs = DBConnection.getStatement().executeQuery("select credit_limit from cust_information where cust_name ='"+custName+"'");
        while(rs.next()){
            creditLimit = rs.getDouble("credit_limit");
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : getCreditLimit Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return creditLimit;
    }

    //Display Emp Code in Sales Maintenance
    @Override
    public String getSalesEmpCode(String billNo) {
        String employeeid="";
       try {
        ResultSet rs = DBConnection.getStatement().executeQuery("select employee_id from sales_maintain_bill where bill_no ='"+billNo+"'");
        while(rs.next()){
            employeeid = rs.getString("employee_id");
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : loadMaintainTable     Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return employeeid;
    }

    //To highlight items having stock less than minimum stock in color
    @Override
    public int getMinStock(String query){
        int minQty = 0;
        int stk = 0;
        int returnFlag = 0;
        try {
        ResultSet rs = DBConnection.getStatement().executeQuery(query);
        while(rs.next()) {
            stk = rs.getInt("quantity");
            minQty = rs.getInt("min_qty");
            if(stk<=minQty){
            returnFlag = 1;
            }
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : getMinStock     Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return returnFlag;
    }

    //Print for credit note while entering Sales Return
    @Override
    public void creditNotePrint(String creditNoteno,String returnNumber) {
        try {
            File reportSource = new File("printerfiles/creditNotePrint.jasper");
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("creditnote", creditNoteno);
            params1.put("returnno", returnNumber);
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportSource);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());
            JasperPrintManager.printReport(jasperPrint, false);
        } catch (Exception ex) {
            String ss =" Class : SalesDAO Method : creditNotePrint     Exception :"+ ex.getMessage();
            log.debug(ss);
        }
    }

    //Get the list of old dummy bill numbers to avoid duplication of bill numbers
    @Override
    public Boolean getDummyBillNumbers(String dummyBillNumber) {
       Boolean retFlag = false;
       try {
        ResultSet rs = DBConnection.getStatement().executeQuery("select distinct bill_no from sales_dummy_bill");
        while(rs.next()){
            if(dummyBillNumber.equalsIgnoreCase(rs.getString("bill_no"))){
               retFlag = true;
            }
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : getDummyBillNumbers     Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return retFlag;
    }

    @Override
    public List getExportDetails(String qry, String type) throws RemoteException {
         List list = new ArrayList();
         //Sales Return
        if(type.equalsIgnoreCase("6"))
        {
        try
        {
            int i=1;
           ArrayList header = new ArrayList();
           header.add("Sales Return Number ");
           header.add("Sales Return Date ");
           header.add("Bill Number ");
           header.add("Bill Date ");
           header.add("Bill Type ");
           header.add("Customer Name " );
           header.add("Doctor Name ");
           header.add(" Item Code ");
           header.add("Item Name ");
           header.add("Manufacturer Name ");
           header.add("Formulation ");
           header.add("Batch Number ");
           header.add("Expiry Date ");
           header.add("Qty ");
           header.add("Unit Price ");
           header.add("MRP ");
           header.add("Unit Discount % ");
           header.add("GST");
           header.add("SGST");
           header.add("CGST");
           header.add("IGST");
           header.add("GST AMOUNT");          
        //   header.add("Unit VAT % ");
           header.add("Sub Total ");
           header.add("Total Items ");
           header.add("Total Qty ");
           header.add("Total Discount ");
         //  header.add("Total VAT ");
           header.add("Total Amount ");

           list.add(header);

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while(rs.next())
            {
             ArrayList al = new ArrayList();

             al.add(rs.getString("sales_return_no"));
             al.add(rs.getString("sales_return_date"));
             al.add(rs.getString("bill_no"));
             al.add(rs.getString("bill_date"));
             al.add(rs.getString("bill_type"));
             al.add(rs.getString("cust_name"));
             al.add(rs.getString("doctor_name"));
             al.add(rs.getString("item_code"));
             al.add(rs.getString("item_name"));
             al.add(rs.getString("mfr_name"));
             al.add(rs.getString("formulation"));
             al.add(rs.getString("batch_no"));
             al.add(rs.getString("expiry_date"));
             al.add(rs.getInt("qty"));
             al.add(rs.getDouble("unit_price"));
             al.add(rs.getDouble("mrp"));
             al.add(rs.getDouble("unit_discount"));
             al.add(rs.getDouble("unit_gst"));
             al.add(rs.getDouble("unit_sgst"));
             al.add(rs.getDouble("unit_cgst"));
             al.add(rs.getDouble("unit_igst"));
             al.add(rs.getDouble("gst_amt"));            
           //  al.add(rs.getDouble("unit_vat"));
             al.add(rs.getDouble("sub_total"));
             al.add(rs.getDouble("total_items"));
             al.add(rs.getInt("total_qty"));
             al.add(rs.getDouble("total_discount"));
            // al.add(rs.getDouble("total_vat"));
             al.add(rs.getDouble("total_amount"));

             list.add(i,al);
              i++;
            }

        }catch(Exception e)
        {
           // System.out.println("Exception in Stock dao ExportDetails " + e);
        }
    }
   else if(type.equalsIgnoreCase("5"))        //Counter Sales
        {
        try
        {
            int i=1;
           ArrayList header = new ArrayList();
           header.add("Bill Number ");
           header.add("Bill Date ");
           header.add("Customer Name ");
           header.add("Doctor Name ");
           header.add("Item Code ");
           header.add("Item Name ");
           header.add("Manufacturer Name");
           header.add("Formulation ");
           header.add("Batch Number ");
           header.add("Expiry Date ");
           header.add("Qty ");
           header.add("Unit Price ");
           header.add("MRP ");
           header.add("Unit Disc % ");
           header.add("GST");
           header.add("SGST");
           header.add("CGST");
           header.add("IGST");
           header.add("GST AMOUNT");                
         //  header.add("Unit VAT % ");
           header.add("Sub Total ");
           header.add("Total Items ");
           header.add("Total Qty ");
           header.add("Total Discount ");
         //  header.add("Total VAT ");
           header.add("Total Amount ");

           list.add(header);

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while(rs.next())
            {
             ArrayList al = new ArrayList();

             al.add(rs.getString("bill_no"));
             al.add(rs.getString("bill_date"));
             al.add(rs.getString("cust_name"));
             al.add(rs.getString("doctor_name"));
             al.add(rs.getString("item_code"));
             al.add(rs.getString("item_name"));
             al.add(rs.getString("mfr_name"));
             al.add(rs.getString("formulation"));
             al.add(rs.getString("batch_no"));
             al.add(rs.getString("expiry_date"));
             al.add(rs.getInt("qty"));
             al.add(rs.getDouble("unit_price"));
             al.add(rs.getDouble("mrp"));
             al.add(rs.getDouble("unit_discount"));
             al.add(rs.getDouble("unit_gst"));
             al.add(rs.getDouble("unit_sgst"));
             al.add(rs.getDouble("unit_cgst"));
             al.add(rs.getDouble("unit_igst"));
             al.add(rs.getDouble("gst_amt"));             
             //al.add(rs.getDouble("unit_vat"));
             al.add(rs.getDouble("sub_total"));
             al.add(rs.getInt("total_items"));
             al.add(rs.getInt("total_qty"));
             al.add(rs.getDouble("total_discount"));
            // al.add(rs.getDouble("total_vat"));
             al.add(rs.getDouble("total_amount"));
             
             list.add(i,al);
              i++;
            }

        }catch(Exception e)
        {
           System.out.println("Exception in Stock dao ExportDetails " + e);
        }
    }

          return list;
    }

    @Override
    public List getSalesExportDetails(String qry, String type) throws RemoteException {
        List list = new ArrayList();
        if(type.equalsIgnoreCase("1"))
        {
        try
        {
            int i=1;
           ArrayList header = new ArrayList();
           header.add("Bill Number ");
           header.add("Bill Date ");
           header.add("Customer Name ");
           header.add("Doctor Name ");
           header.add("Item Code ");
           header.add("Item Name ");
           header.add("Manufacturer Name");
           header.add("Formulation ");
           header.add("Batch Number ");
           header.add("Expiry Date ");
           header.add("Qty ");
           header.add("Unit Price ");
           header.add("MRP ");
           header.add("Unit Disc % ");
           header.add("GST");
           header.add("SGST");
           header.add("CGST");
           header.add("IGST");
           header.add("GST AMOUNT");         
          // header.add("Unit VAT % ");
           header.add("Sub Total ");
           header.add("Total Items ");
           header.add("Total Qty ");
           header.add("Total Discount ");
          // header.add("Total VAT ");
           header.add("Total Amount ");

           list.add(header);

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while(rs.next())
            {
             ArrayList al = new ArrayList();

             al.add(rs.getString("bill_no"));
             al.add(rs.getString("bill_date"));
             al.add(rs.getString("cust_name"));
             al.add(rs.getString("doctor_name"));
             al.add(rs.getString("item_code"));
             al.add(rs.getString("item_name"));
             al.add(rs.getString("mfr_name"));
             al.add(rs.getString("formulation"));
             al.add(rs.getString("batch_no"));
             al.add(rs.getString("expiry_date"));
             al.add(rs.getInt("qty"));
             al.add(rs.getDouble("unit_price"));
             al.add(rs.getDouble("mrp"));
             al.add(rs.getDouble("unit_discount"));
             al.add(rs.getDouble("unit_gst"));
             al.add(rs.getDouble("unit_sgst"));
             al.add(rs.getDouble("unit_cgst"));
             al.add(rs.getDouble("unit_igst"));
             al.add(rs.getDouble("gst_amt"));            
            // al.add(rs.getDouble("unit_vat"));
             al.add(rs.getDouble("sub_total"));
             al.add(rs.getInt("total_items"));
             al.add(rs.getInt("total_qty"));
             al.add(rs.getDouble("total_discount"));
            // al.add(rs.getDouble("total_vat"));
             al.add(rs.getDouble("total_amount"));

             list.add(i,al);
              i++;
            }

        }catch(Exception e)
        {
            System.out.println("Exception in Stock dao ExportDetails " + e);
        }
    }

     else if (type.equalsIgnoreCase("2"))
        {
        try
        {
            int i=1;
           ArrayList header = new ArrayList();
           header.add("Bill Number ");
           header.add("Bill Date ");
           header.add("Customer Name ");
           header.add("Doctor Name ");
           header.add("Item Code ");
           header.add("Item Name ");
           header.add("Manufacturer Name");
           header.add("Formulation ");
           header.add("Batch Number ");
           header.add("Expiry Date ");
           header.add("Qty ");
           header.add("Unit Price ");
           header.add("MRP ");
           header.add("Unit Disc % ");
           header.add("GST");
           header.add("SGST");
           header.add("CGST");
           header.add("IGST");
           header.add("GST AMOUNT");          
           //header.add("Unit VAT % ");
           header.add("Sub Total ");
           header.add("Total Items ");
           header.add("Total Qty ");
           header.add("Total Discount ");
           //header.add("Total VAT ");
           header.add("Total Amount ");
           header.add("Paid Amount ");
           header.add("Balance Amount ");

           list.add(header);

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while(rs.next())
            {
             ArrayList al = new ArrayList();

             al.add(rs.getString("bill_no"));
             al.add(rs.getString("bill_date"));
             al.add(rs.getString("cust_name"));
             al.add(rs.getString("doctor_name"));
             al.add(rs.getString("item_code"));
             al.add(rs.getString("item_name"));
             al.add(rs.getString("mfr_name"));
             al.add(rs.getString("formulation"));
             al.add(rs.getString("batch_no"));
             al.add(rs.getString("expiry_date"));
             al.add(rs.getInt("qty"));
             al.add(rs.getDouble("unit_price"));
             al.add(rs.getDouble("mrp"));
             al.add(rs.getDouble("unit_discount"));
             al.add(rs.getDouble("unit_gst"));
             al.add(rs.getDouble("unit_sgst"));
             al.add(rs.getDouble("unit_cgst"));
             al.add(rs.getDouble("unit_igst"));
             al.add(rs.getDouble("gst_amt"));           
           //  al.add(rs.getDouble("unit_vat"));
             al.add(rs.getDouble("sub_total"));
             al.add(rs.getInt("total_items"));
             al.add(rs.getInt("total_qty"));
             al.add(rs.getDouble("total_discount"));
             //al.add(rs.getDouble("total_vat"));
             al.add(rs.getDouble("total_amount"));
             al.add(rs.getDouble("paid_amount"));
             al.add(rs.getDouble("balance_amount"));

             list.add(i,al);
              i++;
            }

        }catch(Exception e)
        {
            System.out.println("Exception in Stock dao ExportDetails " + e);
        }
    }

      else if (type.equalsIgnoreCase("3"))
        {
        try
        {
            int i=1;
           ArrayList header = new ArrayList();
           header.add("Bill Number ");
           header.add("Bill Date ");
           header.add("Customer Name ");
           header.add("Doctor Name ");
           header.add("Item Code ");
           header.add("Item Name ");
           header.add("Manufacturer Name");
           header.add("Formulation ");
           header.add("Batch Number ");
           header.add("Expiry Date ");
           header.add("Qty ");
           header.add("Unit Price ");
           header.add("MRP ");
           header.add("Unit Disc % ");
           header.add("GST");
           header.add("SGST");
           header.add("CGST");
           header.add("IGST");
           header.add("GST AMOUNT");         
         //  header.add("Unit VAT % ");
           header.add("Sub Total ");
           header.add("Total Items ");
           header.add("Total Qty ");
           header.add("Total Discount ");
          // header.add("Total VAT ");
           header.add("Total Amount ");
           header.add("Paid Amount ");
           header.add("Balance Amount ");
           header.add("Payment Mode ");
           header.add("Card Number ");
           header.add("Card Holder Name ");

           list.add(header);

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while(rs.next())
            {
             ArrayList al = new ArrayList();

             al.add(rs.getString("bill_no"));
             al.add(rs.getString("bill_date"));
             al.add(rs.getString("cust_name"));
             al.add(rs.getString("doctor_name"));
             al.add(rs.getString("item_code"));
             al.add(rs.getString("item_name"));
             al.add(rs.getString("mfr_name"));
             al.add(rs.getString("formulation"));
             al.add(rs.getString("batch_no"));
             al.add(rs.getString("expiry_date"));
             al.add(rs.getInt("qty"));
             al.add(rs.getDouble("unit_price"));
             al.add(rs.getDouble("mrp"));
             al.add(rs.getDouble("unit_discount"));
             al.add(rs.getDouble("unit_gst"));
             al.add(rs.getDouble("unit_sgst"));
             al.add(rs.getDouble("unit_cgst"));
             al.add(rs.getDouble("unit_igst"));
             al.add(rs.getDouble("gst_amt"));           
             //al.add(rs.getDouble("unit_vat"));
             al.add(rs.getDouble("sub_total"));
             al.add(rs.getInt("total_items"));
             al.add(rs.getInt("total_qty"));
             al.add(rs.getDouble("total_discount"));
           //  al.add(rs.getDouble("total_vat"));
             al.add(rs.getDouble("total_amount"));
             al.add(rs.getDouble("paid_amount"));
             al.add(rs.getDouble("balance_amount"));
             al.add(rs.getString("payment_mode"));
             al.add(rs.getString("card_no"));
             al.add(rs.getString("card_holders_name"));

             list.add(i,al);
              i++;
            }

        }catch(Exception e)
        {
            System.out.println("Exception in Stock dao ExportDetails " + e);
        }
    }

          return list;
    }

    @Override
    public int queryExecution(String query) throws RemoteException {
        int save=0;
        try
        {
        save = DBConnection.getStatement().executeUpdate(query);
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return save;
    }


    

  

    @Override
    public String[] getVatDetails() throws RemoteException {
        String[] vatArray = null;
        try {
            Vector vectorVAT = new Vector();
            String sql = "SELECT * FROM vat_master  order by vat_val";
            vectorVAT.addElement("---Select---");
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next())
            {
                vectorVAT.addElement(rs.getString("vat_val"));
            }
            vatArray = new String[vectorVAT.size()];
            for (int i = 0; i < vectorVAT.size(); i++)
            {
                vatArray[i] = "" + vectorVAT.get(i);
            }
        }
        catch (Exception e)
        {
            String msg = "Class: SalesDAO  Method: getVatDetails()  = " + e.getMessage();
            log.debug(msg);

        }
        return vatArray;
    }

    @Override
    public String[] getProductBrandDetails(String val, int chk) throws RemoteException {
        String[]  s = new String[0];

       return s;
    }

   /* @Override
    public String[] getProductList(String name, int chk, String shopId) throws RemoteException {
        
        String[]  s = null;
        Vector v = new Vector();
        try{

         // System.out.println("inside method"+name);
            ResultSet rs = null;
            name =name.trim();
            String sql="";
            String sql1="";
          //  System.out.println("before if"+name.equalsIgnoreCase(""));
           if (name.equalsIgnoreCase(""))
            {
             //  System.out.println("inside first if");
           if(chk==0)
              {

                 sql = "select billingname FROM billing_catagory_list where status=0";
              }
              else
                {

                  sql ="select billingname FROM billing_catagory_list where status=0";
                }
            }
               else
                 {
//System.out.println("inside else");
                 if(chk ==0)
                 {
                    // System.out.println("inside else if"+name);
                  sql = "select billingname FROM billing_catagory_list where billingname like '"+name+"%' and status=0";
                 }
                else
                 {

                   sql ="select billingname FROM billing_catagory_list where billingname like '"+name+"%' and status=0";
                 }
              }
           rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
                v.addElement(rs.getString("billingname"));
            }
           v.addElement("Others");
             s = new String[v.size()];
             for (int i = 0; i < v.size();i++)
             {
                s[i] = "" + v.get(i);
             }
        }
        catch(Exception e)
        {
             String msg = "Class : SalesDAO  Method : getProductList()  = " + e.getMessage();
            log.debug(msg);
        }
           return s;
    }*/

    @Override
    public String[] getProductList(String name, int chk, String shopId) throws RemoteException {

        String[]  s = null;
        Vector v = new Vector();
        try{

         // System.out.println("inside method"+name);
            ResultSet rs = null;
            name =name.trim();
            String sql="";
            String sql1="";
          //  System.out.println("before if"+name.equalsIgnoreCase(""));
           if (name.equalsIgnoreCase(""))
            {
             //  System.out.println("inside first if");
           if(chk==0)
              {

                 sql = "select billingname FROM billing_catagory_list where  status=0";
              }
              else
                {

                  sql ="select billingname FROM billing_catagory_list where status=0";
                }
            }
               else
                 {
//System.out.println("inside else");
                 if(chk ==0)
                 {
                    // System.out.println("inside else if"+name);
                  sql = "select billingname FROM billing_catagory_list where billingname like '"+name+"%' and status=0";
                 }
                else
                 {

                   sql ="select billingname FROM billing_catagory_list where billingname like '"+name+"%' and status=0";
                 }
              }
           rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
                v.addElement(rs.getString("billingname"));
            }
           v.addElement("Others");
             s = new String[v.size()];
             for (int i = 0; i < v.size();i++)
             {
                s[i] = "" + v.get(i);
             }
        }
        catch(Exception e)
        {
             String msg = "Class : SalesDAO  Method : getProductList()  = " + e.getMessage();
            log.debug(msg);
        }
           return s;
    }

   @Override
    public String[] getProductList1(String name, int chk, String shopId) throws RemoteException {
        System.out.println("getProductList1: "+name);
        String[]  s = null;
        Vector v = new Vector();
        try{
            ResultSet rs = null;
            name =name.trim();
            String sql="";
            String sql1="";
           if (name.equalsIgnoreCase(""))
            {
           if(chk==0)
              {
                 sql = "select catagoryname FROM labreportcategory where status=0 and catagoryname like'"+name+"%'";
              }
            }else{
                  sql = "select catagoryname FROM labreportcategory where status=0 and catagoryname like'"+name+"%'";
                 }
           rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
                v.addElement(rs.getString("catagoryname"));
            }
        //nazi   v.addElement("Others");
             s = new String[v.size()];
             for (int i = 0; i < v.size();i++)
             {
                s[i] = "" + v.get(i);
             }
        }
        catch(Exception e)
        {
             String msg = "Class : SalesDAO  Method : getProductList1()  = " + e.getMessage();
            log.debug(msg);
        }
           return s;
    }

    @Override
    public String[] getProductList2(String name, int chk, String shopId, String dia) throws RemoteException {
        System.out.println("inside getProductList2 dao"+dia);
       String[]  s = null;
        int diacode=0;
        Vector v = new Vector();
        try{
            ResultSet rs = null;
            name =name.trim();
            String sql="";
            String sql1="";
            if(dia!=""){
                rs = DBConnection.getStatement().executeQuery("select catagoryid FROM labreportcategory where catagoryname='" + dia + "'");
                  while(rs.next()){
                  diacode=rs.getInt("catagoryid");
                  }
            }
             if (name.equals("") || name == "") {
           System.out.println("inside ifnull  dao");
                    //rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and catagoryid='" + diacode + "' order by reportname asc");
                  //  rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and reportname like'" + name + "%' and catagoryid='" + diacode + "' order by reportname asc");
                     rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where  catagoryid='" + diacode + "' order by reportname asc");
                     System.out.println("categoryid= "+diacode);
             } else {

                    //rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and catagoryid='" + diacode + "' order by reportname asc");
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct reportname FROM labreport_list l where reportname!='" + " " + "' and  reportname is not null and reportname like'" + name + "%' and catagoryid='" + diacode + "' order by reportname asc");
                   // System.out.println("Reportid= "+diacode+"Reportname="+name);
                }
                while (rs.next()) {
                    v.add(rs.getString("reportname"));
                }

        /*   if (name.equalsIgnoreCase(""))
            {
           if(chk==0){
                 sql = "select reportname FROM labreport_list where status=0";
              }
            }else{
                sql ="select reportname FROM labreport_list where status=0";
                 }
           rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
                v.addElement(rs.getString("reportname"));
            } */

         //nazi  v.addElement("Others");
             s = new String[v.size()];
             for (int i = 0; i < v.size();i++)
             {
                s[i] = "" + v.get(i);
             }
        }
        catch(Exception e)
        {
             String msg = "Class : SalesDAO  Method : getProductList2()  = " + e.getMessage();
            log.debug(msg);
        }
           return s;
    }


    @Override
    public int getProductCount(String ItemName, String shopId) throws RemoteException {
        int count = 0;
        try {
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery("select count(ss_no)as ct  from stock_statement where item_name='" + ItemName + "' and qty=>0 and  ss_flag_id='' limit 0,1 ");
            while (rs.next())
            {
                count = rs.getInt("ct");
            }
        } catch (Exception ex) {
            String msg = "Class : SalesDAO  Method : getProductCount()  = " + ex.getMessage();
            log.debug(msg);
        }
      return 0;
    }

    @Override
    public List<SalesModel> getStockDetails(String query) throws RemoteException {
        List<SalesModel> ls = new ArrayList<SalesModel>();
    return ls;
    }

    @Override
    public String[] getProductDetails(String val, int chk, String shopId) throws RemoteException {
        String[] proval = new String[8];
        proval[0] = "";
        proval[1] = "0";
        proval[2] = "";
        proval[3] = "";
        proval[4] = "";
        proval[5] = "";
        proval[6] = "";
        try {
            ResultSet rs = null;
            String val1 = val.trim();
            String sql = "";
            String sql1 = "";
           int id = 0;
            sql = "select ss_no,item_code,item_name,batch_no,mrp,qty from stock_statement order by item_name='"+val1+"'";
            sql1 = "select ss_no,item_code,item_name,batch_no,mrp,qty from stock_statement order by item_code='"+val1+"'";

            if (chk == 0) {
                rs = DBConnection.getStatement().executeQuery(sql1);
                while (rs.next()) {
                    id = rs.getInt("ss_no");
                    proval[0] = rs.getString("item_code");
                    String product_code = rs.getString("item_code");
                    proval[2] = rs.getString("batch_no");
                    proval[1] = String.valueOf(getProductQty(product_code,shopId));
                    proval[3] = rs.getString("item_name");
                    proval[4] = rs.getString("mrp");
                    proval[5] = rs.getString("qty");
                }
            }
           else
            {
                 rs = DBConnection.getStatement().executeQuery(sql);
                 while (rs.next())
                 {
                proval[0] = rs.getString("item_code");
                String product_code = rs.getString("item_code");
                proval[2] = rs.getString("batch_no");
                proval[1] = String.valueOf(getProductQty(product_code,shopId));
                proval[3] = rs.getString("item_name");
                proval[4] = rs.getString("mrp");
                proval[5] = rs.getString("qty");
            }
           }
        } catch (Exception ex) {
            String msg = "Class : SalesDAO  Method : getProductDetails()  = " + ex.getMessage();
            log.debug(msg);
        }
        if (proval[1].equals("0") || proval[1] == null || proval[1].equalsIgnoreCase("null") || proval[1].length() <= 0) {
            proval[1] = "0";
        }
        return proval;
    }

    @Override
    public List getbatchno(String ItemName) throws RemoteException {
       List batcList = new ArrayList<String>();
        try
        {
            ResultSet rs = null;
            String sql="Select batch_no from stock_statement where item_name = '"+ItemName+"' and ss_flag_id =0";
            rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
              batcList.add(rs.getString(1));
            }
        }
        catch(Exception e)
        {
             String msg = "Class : SalesDAO  Method : getbatchno() = " + e.getMessage();
            log.debug(msg);
        }
       return batcList;
    }

    @Override
    public String getStockQty(String ItemName, String batchno) throws RemoteException
    {
      String qty ="0";
      String sql = "Select Qty from stock_statement where item_name='"+ItemName+"' and batch_no ='"+batchno+"' and ss_flag_id =0;";
      ResultSet rs = null;
      try
      {
           rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
              qty= rs.getString(1);
            }
      }
      catch(Exception e)
      {
          System.out.println("Exception in get stockqty Salesdao "+e);
      }
      return qty;
    }

    @Override
    public String getupdatevalue(String ProductName) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public String getProductQty(String ItemName, String batchno) throws RemoteException {
         String qty ="0";
      String sql = "Select Qty from stock_statement where item_name='"+ItemName+"' and batch_no ='"+batchno+"' and ss_flag_id =0;";
      ResultSet rs = null;
      try
      {
           rs = DBConnection.getStatement().executeQuery(sql);
           while(rs.next())
            {
              qty= rs.getString(1);
            }
      }
      catch(Exception e)
      {
          System.out.println("Exception in get stockqty Salesdao "+e);
      }
      return qty;
    }

    @Override
    public List<SalesModel> getPreviousBillDetails(String query) throws RemoteException {
        List<SalesModel> ls = new ArrayList<SalesModel>();
          SalesModel listModel = null;
         try {
              ResultSet rs = DBConnection.getStatement().executeQuery(query);
              while (rs.next())
              {
                listModel = new SalesModel();
                listModel.setsno(rs.getInt("ss_no"));
                listModel.setQuantity(rs.getInt("qty"));
                listModel.setItemCode(rs.getString("item_code"));
                listModel.setExpiryDate(rs.getString("expiry_Date"));
                listModel.setBatchNumber(rs.getString("batch_no"));
                listModel.setItemName(rs.getString("item_name"));
                listModel.setMrp(rs.getDouble("mrp"));
                listModel.setFormulation(rs.getString("formulation"));
                listModel.setUnitPrice(rs.getDouble("unit_price"));
                listModel.setUnitDiscount(rs.getDouble("uit_discount"));
                listModel.setminQty(rs.getInt("min_qty"));
                listModel.setUnitVAT(rs.getDouble("unit_vat"));
                listModel.setTotalAmount(rs.getDouble("total_amount"));
                ls.add(listModel);
             }
        }
        catch (Exception ex)
        {
            String ss = "Class : SalesDAO Method : getPreviousBillDetails   Exception :" + ex.getMessage();
            log.debug(ss);
        }
           return ls;
    }

    @Override
    public int queryExecution1(String query) throws RemoteException {
         int count = 0;
        try
        {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next())
            {
                count = rs.getInt("qty");
            }
        }
        catch (Exception ex)
        {
            String ss = "Class : DBData  Method  : selectCountQuryExe Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return count;
    }
    // Ajith This is the record of Sales (createRecord1)
       @Override
        public Object createRecord1(Object object) throws RemoteException {

        ServiceModel serviceModel=(ServiceModel) object;
        List<ServiceModel> serviceItems = new ArrayList<ServiceModel>();
        serviceItems=serviceModel.getServiceListItems();
        System.out.println("DAOOOO");
        System.out.println(serviceModel.getPaymentmode());
      //  System.out.println("serviceItems"+serviceItems);
        int returnFlag = 0;
        Boolean insert = false;
        try {
        if(serviceModel.getInsertType().equals("save")) {
            String sql="";
            if(!serviceModel.getPaymentmode().equals("Credit"))
            {
             sql = "insert into billing_main ( bill_date, custid, cust_code, cust_name, doctorid, doctor_name, prescription_date,  sub_total, tax_amount, total_amount, status, insurance_status, insurance_name, insurance_schemes, insurance_amount, billno,total_discountamt,createdon,remarks,patienttypes,paymentmode,bill_status)"
                + "values('"+serviceModel.getBill_date()+"','"+serviceModel.getCustid()+"','"+serviceModel.getCust_code()+"','"+serviceModel.getCust_name()+"','"+serviceModel.getDoctorid()+"','"+serviceModel.getDoctor_name()+"'"
                + ",'"+serviceModel.getBill_date()+"','"+serviceModel.getSub_total()+"','"+serviceModel.getTax_amount()+"','"+serviceModel.getTotal_amount()+"','"+serviceModel.getStatus()+"','"+serviceModel.getInsurance_status()+"','"+serviceModel.getInsurance_name()+"','"+serviceModel.getInsurance_schemes()+"','"+serviceModel.getInsurance_amount()
                +"','"+serviceModel.getBillno()+"','"+serviceModel.getTotal_discountamt()+"','"+sdf.format(new Date())+"','"+serviceModel.getRemarks()+"','"+serviceModel.getPatienttypes()+"','"+serviceModel.getPaymentmode()+ "', 0)";
            }
            else {
               
//                 ps = DBConnection.getConnection().prepareStatement("Select balance_amount from billing_main where cust_name = ?");
//               ps.setString(1, serviceModel.getCust_name());
//                 rs=ps.executeQuery();
//                 Double uptd =0.0;
//                while (rs.next()) {
//                    uptd = rs.getDouble("balance_amount");
//                    if (uptd == 0.00) {
//                        uptd += serviceModel.getTotal_amount();
//                    } else {
//                        uptd+=serviceModel.getBalamce_amount();
//                    }
//                }
                 sql = "insert into billing_main ( bill_date, custid, cust_code, cust_name, doctorid, doctor_name, prescription_date,  sub_total, tax_amount, total_amount, status, insurance_status, insurance_name, insurance_schemes, insurance_amount, billno,total_discountamt,createdon,remarks,patienttypes,paymentmode,bill_status)"
                + "values('"+serviceModel.getBill_date()+"','"+serviceModel.getCustid()+"','"+serviceModel.getCust_code()+"','"+serviceModel.getCust_name()+"','"+serviceModel.getDoctorid()+"','"+serviceModel.getDoctor_name()+"'"
                + ",'"+serviceModel.getBill_date()+"','"+serviceModel.getSub_total()+"','"+serviceModel.getTax_amount()+"','"+serviceModel.getTotal_amount()+"','"+serviceModel.getStatus()+"','"+serviceModel.getInsurance_status()+"','"+serviceModel.getInsurance_name()+"','"+serviceModel.getInsurance_schemes()+"','"+serviceModel.getInsurance_amount()
                +"','"+serviceModel.getBillno()+"','"+serviceModel.getTotal_discountamt()+"','"+sdf.format(new Date())+"','"+serviceModel.getRemarks()+"','"+serviceModel.getPatienttypes()+"','"+serviceModel.getPaymentmode()+"'"+",-1)";

            }
        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        // System.out.println("after inserrt1");
        String sql1 = "select max(billid) as serviceId from billing_main";
       //  System.out.println("after inserrt2");
        ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
      //   System.out.println("after inserrt3");
        while(rs.next()) {
        //     System.out.println("after inserrt4");
            serviceModel.setBillrefid(rs.getInt("serviceId"));
          //   System.out.println("after inserrt5");
        }
  // System.out.println("after inserrt");
        }
        int a=0;
         if(serviceModel.getPaymentmode().equals("Credit"))
            {
               a=-1;
           }
      //  System.out.println("after inserrtbbeffor"+serviceItems.size());
        for(int i=0; i < serviceItems.size();i++) {
        ServiceModel model = serviceItems.get(i);
        CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_servicebill(?,?,?,?,?,?,?,?,?,?)");
        cs.setInt   (1,  serviceModel.getBillrefid());
        cs.setString(2,  model.getService_name());
        cs.setDouble(3,  model.getUnit_price());
        cs.setDouble(4,  model.getQty());
        cs.setDouble(5,  model.getUnit_vat());
        cs.setDouble(6,  model.getUnit_discount());
        cs.setDouble(7, model.getTotal_price());

        System.out.println(model.getCategory());
        cs.setString(8,model.getCategory());
        System.out.println(model.getCategory());
        cs.setInt(9,a);
        cs.registerOutParameter(10, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");
        }
        if(serviceModel.getModuleType().equals("0"))
        {
            System.out.println("?????");
            try{
              java.sql.PreparedStatement ps;
                ResultSet rs = null;
//                  ps = DBConnection.getConnection().prepareStatement("Select balance_amount from med_patient_details_mt where cust_name = ?");
//               ps.setString(1, serviceModel.getCust_name());
//                 rs=ps.executeQuery();
//                  Double uptd =0.0;
//                 while(rs.next())
//                 {
//                uptd= rs.getDouble("balance_amount");
//                uptd-=serviceModel.getBalamce_amount();
//                 }
        ps=DBConnection.getConnection().prepareStatement("update med_patient_details_mt set advanceamounts = ? where cust_name = ?");
      System.out.println("DAOOOOOOOO");
      System.out.println(serviceModel.getBalamce_amount());
        ps.setDouble(1, serviceModel.getBalamce_amount());
         ps.setString(2, serviceModel.getCust_name());
        ps.executeUpdate();
            }
            catch(Exception e)
            {
            e.printStackTrace();
            }
        }
 else
        {
 System.out.println("000000");
 }
//            if (serviceModel.getPaymentmode().equals("Credit")) {
//                System.out.println("???");
//                java.sql.PreparedStatement ps;
//                ResultSet rs = null;
//                String sqll = "Select billing_balance from cust_information where cusname_mobno=?";
//                ps = DBConnection.getConnection().prepareStatement(sqll);
//                ps.setString(1, serviceModel.getCust_name());
//                rs = ps.executeQuery();
//                 Double d=0.0;
//                d = rs.getDouble("billing_balance");
//                String sql = "update cust_information set billing_balance = ? where cusname_mobno = ?";
//               Double d1= serviceModel.getTotal_amount()+d;
//                ps = DBConnection.getConnection().prepareStatement(sql);
//                ps.setDouble(1, d1);
//                ps.setString(2, serviceModel.getCust_name());
//                ps.executeUpdate();
//        }
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : SalesDAO  Method   : CreateRecord1 Exception :" + e.getMessage());
            e.getMessage();
            e.printStackTrace();
        }
        return insert;
    }



     @Override
    public List<SalesModel> getQueryTableValues(String query) throws RemoteException {
         System.out.println("??data");
       List<SalesModel> ls = new ArrayList<SalesModel>();
           SalesModel listModel=new SalesModel();
           ResultSet rs=null;
           try
           {
            rs =DBConnection.getStatement().executeQuery(query);
            while(rs.next())
              {


                listModel = new SalesModel();
              /*  listModel.setModuleType("GetSalesData");
                listModel.setItemCode(rs.getString("item_code"));
                listModel.setItemName(rs.getString("item_name"));
                listModel.setBatchNumber(rs.getString("batch_no"));
                listModel.setUnitPrice(rs.getDouble("selling_price"));
                listModel.setPacking(rs.getInt("packing"));
                listModel.setUnitVAT(rs.getDouble("vat"));
                listModel.setExpiryDate((rs.getString("expiry_date")));
                listModel.setMrp(rs.getDouble("mrp"));
                listModel.setUnitDiscount(rs.getDouble("sales_discount"));
                listModel.setFormulation(rs.getString("formulation"));
                //gst
                listModel.setGst(rs.getDouble("unit_gst"));
                listModel.setSgst(rs.getDouble("unit_sgst"));
                listModel.setCgst(rs.getDouble("unit_cgst"));
                listModel.setIgst(rs.getDouble("unit_igst"));
                listModel.setUtgst(rs.getDouble("unit_utgst"));*/
                listModel.setCategory(rs.getString("category"));
                listModel.setBillingname(rs.getString("servicename"));
                listModel.setBilling_amount(rs.getDouble("amount"));
                listModel.setGst(rs.getDouble("gst"));//chg
//                listModel.setItemName(rs.getString("billingname"));
                ls.add(listModel);
             }
        }
        catch (Exception ex)
        {
            System.out.println("getQueryTableValues"+ex);
            String ss = "Class : SalesDAO Method : getQueryTableValues   Exception :" + ex.getMessage();
            log.debug(ss);
        }
           return ls;
    }


      @Override
    public List<LabrangeModel> getQueryTableValuess(String query) throws RemoteException {
         List<LabrangeModel> ls = new ArrayList<LabrangeModel>();
           LabrangeModel listModel=new LabrangeModel();
           ResultSet rs=null;
           try
           {
            rs =DBConnection.getStatement().executeQuery(query);
            while(rs.next())
              {


                listModel = new LabrangeModel();
              /*  listModel.setModuleType("GetSalesData");
                listModel.setItemCode(rs.getString("item_code"));
                listModel.setItemName(rs.getString("item_name"));
                listModel.setBatchNumber(rs.getString("batch_no"));
                listModel.setUnitPrice(rs.getDouble("selling_price"));
                listModel.setPacking(rs.getInt("packing"));
                listModel.setUnitVAT(rs.getDouble("vat"));
                listModel.setExpiryDate((rs.getString("expiry_date")));
                listModel.setMrp(rs.getDouble("mrp"));
                listModel.setUnitDiscount(rs.getDouble("sales_discount"));
                listModel.setFormulation(rs.getString("formulation"));
                //gst
                listModel.setGst(rs.getDouble("unit_gst"));
                listModel.setSgst(rs.getDouble("unit_sgst"));
                listModel.setCgst(rs.getDouble("unit_cgst"));
                listModel.setIgst(rs.getDouble("unit_igst"));
                listModel.setUtgst(rs.getDouble("unit_utgst"));*/
                listModel.setLab_testname(rs.getString("lab_testname"));
                listModel.setMinrange(rs.getString("minrange"));
                listModel.setMaxrange(rs.getString("maxrange"));
                listModel.setDia(rs.getString("dia"));

                ls.add(listModel);
             }
        }
        catch (Exception ex)
        {
           // System.out.println("getQueryTableValues"+ex);
            String ss = "Class : SalesDAO Method : getQueryTableValues   Exception :" + ex.getMessage();
            log.debug(ss);
        }
           return ls;
    }
   /* public Object createRecord1(Object object)
    {       
        Boolean insert = false;
        int returnFlagCount = 0;
        SalesModel salesModel = (SalesModel)object;
        List<SalesModel> list = salesModel.getListofitems();
        try
        {
        //Sales cash, credit, cards Insert
        for (int index = 0; index < list.size(); index++)
            {                
            SalesModel iterateModel = list.get(index);
            CallableStatement salesCall=DBConnection.getConnection().prepareCall("{call pro_savesales1( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}");
            salesCall.setString(1,salesModel.getBillNumber());
            salesCall.setString(2,salesModel.getBillDate());
            salesCall.setString(3,salesModel.getCustomerName());
            salesCall.setString(4,salesModel.getDoctorName());
            salesCall.setString(5,iterateModel.getItemCode());
            salesCall.setString(6,iterateModel.getItemName());           
            salesCall.setString(7,iterateModel.getFormulation());
            salesCall.setString(8,iterateModel.getBatchNumber());
            salesCall.setInt(9,iterateModel.getQuantity());
            salesCall.setDouble(10, iterateModel.getUnitPrice());
            salesCall.setString(11,iterateModel.getExpiryDate());
            salesCall.setDouble(12, iterateModel.getMrp());
            salesCall.setDouble(13, iterateModel.getUnitDiscount());
            salesCall.setDouble(14, iterateModel.getUnitVAT());
            salesCall.setDouble(15, iterateModel.getSubTotal());
            salesCall.setDouble(16, salesModel.getTotalDiscount());
            salesCall.setDouble(17, salesModel.getTotalVAT());
            salesCall.setDouble(18, salesModel.getTotalAmount());
            salesCall.setDouble(19, salesModel.getPaidAmount());
            salesCall.setDouble(20, salesModel.getBalanceAmount());
            salesCall.setInt(21,    salesModel.getTotalItems());
            salesCall.setInt(22,    salesModel.getTotalQuantity());
            salesCall.setString(23, salesModel.getPaymentMode());
            salesCall.setString(24, salesModel.getCardNumber());
            salesCall.setString(25, salesModel.getCardHolderName());
            salesCall.setString(26, salesModel.getBankName());
            salesCall.setString(27, salesModel.getCardExpiry());
            salesCall.setString(28, salesModel.getAccountNumber());
            salesCall.setString(29, salesModel.getBillType());
            salesCall.setString(30, salesModel.getFormType());
            salesCall.setString(31, salesModel.getSalesReturnNumber());
            salesCall.setString(32, salesModel.getSalesReturnDate());
            salesCall.setString(33, salesModel.getEmployeeID());
            //Adjustment ID is set in Total Items
            salesCall.setInt(34,iterateModel.getTotalItems());               
               //refill
            salesCall.setInt(35,salesModel.getPrescriptionDays());
            salesCall.setInt(36,salesModel.getrefillFlag());
              //GST Models******************
            salesCall.setDouble(37, iterateModel.getGst());
            salesCall.setDouble(38, iterateModel.getSgst());
            salesCall.setDouble(39, iterateModel.getCgst());
            salesCall.setDouble(40, iterateModel.getIgst());                
            salesCall.setDouble(41, iterateModel.getUtgst());
            salesCall.setDouble(42,salesModel.getGstAmt());        
            salesCall.setDouble(43, salesModel.getSgstAmt());
            salesCall.setDouble(44, salesModel.getCgstAmt());
            salesCall.setDouble(45, salesModel.getIgstAmt());
            salesCall.setDouble(46, salesModel.getUtgstAmt());
           //**************************
            salesCall.registerOutParameter(47,Types.INTEGER);
            salesCall.executeUpdate();               
            int returnFlag=salesCall.getInt("flag");
            if(returnFlag==1)
            {
               returnFlagCount++;
            }
            }
            // Maintenance Table Insert
             if(returnFlagCount==list.size() && !salesModel.getBillType().equals("dummy") && !salesModel.getFormType().equals("return") && !salesModel.getFormType().equals("cancelbill"))
             {
             String paymentMode="";
             if(salesModel.getBillType().equals("cards"))
             {
                paymentMode = salesModel.getPaymentMode();
             }
             for (int index = 0; index <= 1; index++)
             {
                 CallableStatement maintenanceCall=DBConnection.getConnection().prepareCall("{call pro_savesales1( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}");
                 maintenanceCall.setString(1, salesModel.getBillNumber());
                 maintenanceCall.setString(2, salesModel.getBillDate());
                 maintenanceCall.setString(3, salesModel.getCustomerName());
                 maintenanceCall.setString(4, salesModel.getDoctorName());
                 maintenanceCall.setString(5,"");
                 maintenanceCall.setString(6,"");
                 maintenanceCall.setString(7,"");
                 maintenanceCall.setString(8,"");
                 maintenanceCall.setInt(9,0);
                 maintenanceCall.setDouble(10, 0.00);
                 maintenanceCall.setString(11,"0000-00-00");
                 maintenanceCall.setDouble(12, 0.00);
                 maintenanceCall.setDouble(13, 0.00);
                 maintenanceCall.setDouble(14, 0.00);
                 maintenanceCall.setDouble(15, 0.00);
                 maintenanceCall.setDouble(16, 0.00);
                 maintenanceCall.setDouble(17, 0.00);
                 maintenanceCall.setDouble(18, salesModel.getTotalAmount());
                 maintenanceCall.setDouble(19, salesModel.getPaidAmount());
                 maintenanceCall.setDouble(20, salesModel.getBalanceAmount());
                 maintenanceCall.setInt(21, salesModel.getTotalItems());
                 maintenanceCall.setInt(22, salesModel.getTotalQuantity());
                 maintenanceCall.setString(23, paymentMode);
                 maintenanceCall.setString(24, salesModel.getCardNumber());
                 maintenanceCall.setString(25, salesModel.getCardHolderName());
                 maintenanceCall.setString(26, salesModel.getBankName());
                 maintenanceCall.setString(27, salesModel.getCardExpiry());
                 maintenanceCall.setString(28, salesModel.getAccountNumber());
                 if (index == 0 && !salesModel.getBillType().equals("counter"))
                 {
                    maintenanceCall.setString(29, "savemaintenance");
                 } 
                 else if(index == 0 && salesModel.getBillType().equals("counter"))
                 {
                    maintenanceCall.setString(29, "savecountermaintenance");
                 } 
                 else if (index == 1 && salesModel.getBillType().equals("cards"))
                 {
                    maintenanceCall.setString(29, "bankbook");
                 }
                 else
                 {
                     maintenanceCall.setString(29, "");
                 }
                 maintenanceCall.setString(30,salesModel.getFormType());
                 maintenanceCall.setString(31,salesModel.getSalesReturnNumber());
                 maintenanceCall.setString(32,salesModel.getSalesReturnDate());
                 maintenanceCall.setString(33,salesModel.getEmployeeID());
                 maintenanceCall.setInt(34,0);
                 maintenanceCall.setInt(35,salesModel.getPrescriptionDays());
                maintenanceCall.setInt(36,salesModel.getrefillFlag());
              //GST Models******************
            maintenanceCall.setDouble(37, 0.00);
            maintenanceCall.setDouble(38, 0.00);
            maintenanceCall.setDouble(39, 0.00);
            maintenanceCall.setDouble(40, 0.00);
            maintenanceCall.setDouble(41, 0.00);
            maintenanceCall.setDouble(42, salesModel.getGstAmt());
            maintenanceCall.setDouble(43, salesModel.getSgstAmt());
            maintenanceCall.setDouble(44, salesModel.getCgstAmt());
            maintenanceCall.setDouble(45, salesModel.getIgstAmt());
            maintenanceCall.setDouble(46,salesModel.getUtgstAmt());
              //GST Models******************
            maintenanceCall.registerOutParameter(47,Types.INTEGER);
            maintenanceCall.executeUpdate();
             }
            }
             else
             {
             // Rollback Sales itemssout            
            }
            insert = true;
        }
        catch(Exception e)
        {
            System.out.println("Exception sales DAO CREARE  RECORD(1)"+e);
            insert = false;
            log.debug(" Class : SalesDAO  Method   : CreateRecord1 Exception :" + e.getMessage());
        }        
        return insert;
    }*/

       @Override
        public Object createRecord2(Object object) throws RemoteException {
        DiagnosticdoctorModel serviceModel=(DiagnosticdoctorModel) object;
        List<DiagnosticdoctorModel> serviceItems = new ArrayList<DiagnosticdoctorModel>();
        serviceItems=serviceModel.getServiceListItems();
        //System.out.println("serviceItems"+serviceItems);
        int returnFlag = 0;
        Boolean insert = false;
        try {
        if(serviceModel.getInsertType().equals("save")) {
        String sql = "insert into lab_allocated_main (prescriptiondate, doctorname, doctorid, custid, cust_code, cust_name, status)"
                        + "values('"+serviceModel.getLabdate()+"','"+serviceModel.getDoctorname()+"','"+serviceModel.getDoctorid()+"','"
                        +serviceModel.getCustid()+"','"+serviceModel.getCust_code()+"','"+serviceModel.getCust_name()+"','0')";
        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        String sql1 = "select max(laballocateid) as serviceId from lab_allocated_main";

        ResultSet rs = DBConnection.getStatement().executeQuery(sql1);

        while(rs.next()) {
            serviceModel.setLabrefid(rs.getInt("serviceId"));
            }
        }

        for(int i=0; i < serviceItems.size();i++) {
        DiagnosticdoctorModel model = serviceItems.get(i);
        CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_diagdoctor(?,?,?,?)");

        cs.setInt   (1,  serviceModel.getLabrefid());
        cs.setString(2,  model.getLabreportname());
        cs.setString(3,  model.getCatoryname());

        cs.registerOutParameter(4, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");
        }
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : SalesDAO   Method : CreateRecord2 Exception :" + e.getMessage());
        }
        return insert;
    }
 @Override
    public List<SalesModel> getQueryTableValues1(String query) throws RemoteException {
          //System.out.println("Query: "+query);
       List<SalesModel> ls = new ArrayList<SalesModel>();
           SalesModel listModel=new SalesModel();
           ResultSet rs=null;
           try
           {
            rs =DBConnection.getStatement().executeQuery(query);
            while(rs.next())
              {
                listModel = new SalesModel();
              /*  listModel.setModuleType("GetSalesData");
                listModel.setItemCode(rs.getString("item_code"));
                listModel.setItemName(rs.getString("item_name"));
                listModel.setBatchNumber(rs.getString("batch_no"));
                listModel.setUnitPrice(rs.getDouble("selling_price"));
                listModel.setPacking(rs.getInt("packing"));
                listModel.setUnitVAT(rs.getDouble("vat"));
                listModel.setExpiryDate((rs.getString("expiry_date")));
                listModel.setMrp(rs.getDouble("mrp"));
                listModel.setUnitDiscount(rs.getDouble("sales_discount"));
                listModel.setFormulation(rs.getString("formulation"));
                //gst
                listModel.setGst(rs.getDouble("unit_gst"));
                listModel.setSgst(rs.getDouble("unit_sgst"));
                listModel.setCgst(rs.getDouble("unit_cgst"));
                listModel.setIgst(rs.getDouble("unit_igst"));
                listModel.setUtgst(rs.getDouble("unit_utgst"));*/
                listModel.setReportname(rs.getString("reportname"));
                listModel.setCategory(rs.getString("catagoryname"));
                listModel.setCatid(rs.getInt("catagoryid"));
                listModel.setReportid(rs.getInt("labreportid"));
               // System.out.println(rs.getString("reportname")+" / "+rs.getString("catagoryname")+" / "+rs.getInt("catagoryid")+" / "+rs.getInt("labreportid"));
                ls.add(listModel);
             }
        }
        catch (Exception ex)
        {
           // System.out.println("getQueryTableValues1"+ex);
            String ss = "Class : SalesDAO Method : getQueryTableValues1   Exception :" + ex.getMessage();
            log.debug(ss);
        }
           return ls;
    }
    @Override
    public int queryExecution2(String query) throws RemoteException {
      int result = 0;
        try
        {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next())
            {
                result = rs.getInt("billno");
            }
        }
        catch (Exception ex)
        {
            String ss = "Class : DBData  Method  : selectCountQuryExe Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return result;
    }

    @Override
    public boolean updatePayment(List<ServiceModel> serviceModel,String cusname) throws RemoteException {
System.out.println("????");
        //try{
//           System.out.println("::::::");
//        java.sql.PreparedStatement ps;
//        ResultSet rs=null;
//        boolean flag;
//        int count=0;
//        int counts=0;
//         for(int i=0;i<serviceModel.size();i++)
//        {
//         ServiceModel serviceModell = serviceModel.get(i);
//             String sql="Update billing_main set bill_status=0 where cust_name = ? bill_status=-1";
//              ps= DBConnection.getConnection().prepareStatement(sql);
//              ps.setString(1, cusname);
//              ps.executeUpdate(sql);
//              counts++;
//         }
//        for(int i=0;i<serviceModel.size();i++)
//        {
//             System.out.println("??");
//             ServiceModel serviceModell = serviceModel.get(i);
//             String sql="Update billing_sub set paid_status=0 where billrefid = ? and categoryname= ? and service_name = ? and paid_status=-1";
//           ps= DBConnection.getConnection().prepareStatement(sql);
//           ps.setString(1, serviceModell.getBillno());
//           ps.setString(2, serviceModell.getCategory());
//           ps.setString(3, serviceModell.getService_name());
//           System.out.println("!!");
//           System.out.println(serviceModell.getBillrefid());
//            System.out.println(serviceModell.getCategory());
//            System.out.println(serviceModell.getService_name());
//            ps.executeUpdate();
//            count++;
//        }
//        if(count==serviceModel.size())
//        {
//        return true;
//        }
//        return false;
//       }
//       catch(Exception e){
//
//       e.printStackTrace();
//       }
//    return true;

     try{

         java.sql.PreparedStatement ps=null;
        ResultSet rs=null;

        String sql="Update billing_main set bill_status = 0 where cust_name = ?";

         ps= DBConnection.getConnection().prepareStatement(sql);
           ps.setString(1, cusname);
         ps.executeUpdate();


         for(int i=0;i<serviceModel.size();i++)
         {
         String sqll="Update billing_sub set paid_status = 0 where billrefid = ?";

         ps= DBConnection.getConnection().prepareStatement(sqll);
          ps.setString(1, serviceModel.get(i).getBillno());
         ps.executeUpdate();
         }


         ps = DBConnection.getConnection().prepareStatement("Update med_patient_details_mt set advanceamounts = 0 where cust_name = ?");
         ps.setString(1, cusname);
         ps.executeUpdate();
         return true;
       }
       catch(Exception e)
       {
 String ss = "Class : DBData  Method  : updatePayment Exception:" + e.getMessage();
            log.debug(ss);
       }
       return false;
    }

   
}


//    @Override
//    public boolean updatePayments(String cusname) throws RemoteException {
////         boolean flag=false;
//        try{
//             java.sql.PreparedStatement ps=null;
//        ResultSet rs=null;
//
//        String sql="Update billing_main set bill_status = 0 where cust_name = ?";
//
//         ps= DBConnection.getConnection().prepareStatement(sql);
//           ps.setString(1, cusname);
//         ps.executeUpdate();
//         String sqll="Update billing_sub set paid_status = 0 where cust_name = ?";
//
//         ps= DBConnection.getConnection().prepareStatement(sqll);
//          ps.setString(1, cusname);
//         ps.executeUpdate();
//         ps = DBConnection.getConnection().prepareStatement("Update med_patient_details_mt set advanceamounts = 0 where cust_name = ?");
//         ps.setString(1, cusname);
//         ps.executeUpdate();
//         return true;
//       }
//       catch(Exception e)
//       {
//
//       }
//       return false;
//    }
//}
