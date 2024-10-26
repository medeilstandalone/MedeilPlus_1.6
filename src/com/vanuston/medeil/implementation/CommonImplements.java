
        /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.VitalScienceModel;
import com.vanuston.medeil.model.DischargeModel;
import com.vanuston.medeil.model.ServiceModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Administrator
 */
public interface CommonImplements extends Remote {

    String getAutoIncrement(String date, String name) throws RemoteException;

    String getUserType(String uname) throws RemoteException;

    String getPrivileges(String modname, String uname) throws RemoteException;

    public List<Integer> getPrescriptionNo(int prescriptionNo) throws RemoteException;

    List<String> getListItems(String getTextFieldValue, String getTherapeuticValue, String listType) throws RemoteException;

    String getMasterAutoIncrement(String formName) throws RemoteException;

    boolean getUserLog(String formName, String actionName) throws RemoteException;

    int getAddVAT(String ms) throws RemoteException;

    int getAddFormulation(String ms) throws RemoteException;

    int getAddTherapeutic(String ms) throws RemoteException;

    List<String> Specialist(String name) throws RemoteException;

    String getDocId(String dbtable, String frontChar) throws RemoteException;

    String getDocCommisionNo(String dbtable, String frontChar) throws RemoteException;

    String getDocCommCode(String name) throws RemoteException;

    List<String> getDoctorName(String name) throws RemoteException;

    List<String> getDoctorName1(String name) throws RemoteException;

    List<String> DoctorCode(String name) throws RemoteException;

    String getDocCodeValue(String name) throws RemoteException;

    boolean selectState(String country, String state) throws RemoteException;

    boolean selectCountry(String country) throws RemoteException;

    boolean selectEmployee(String employee) throws RemoteException;

    Object viewCashBook(Object dailyCashBookModel) throws RemoteException;

    boolean updateLog(String moduleInfo, String logInfo) throws RemoteException;

    List<String> Country(String name) throws RemoteException;

    List<String> State(String country, String name) throws RemoteException;

    List<String> getEmployers(String empName) throws RemoteException;

    Object createRecord(Object dailyCashBookModel) throws RemoteException;

    String getAutoIncrement(String name) throws RemoteException;

    List<String> Distributors(String name) throws RemoteException;

    String getEmpSalId(String dbtable, String frontChar) throws RemoteException;

    String getDoctorId() throws RemoteException;

    List<String> getShopName() throws RemoteException;

    int getCompare(String query) throws RemoteException;

    List<String> getSettingConfig() throws RemoteException;

    String getQueryValue(String que) throws RemoteException;

    int getQueryWitCol(String query, String col) throws RemoteException;

    int selectCountQuryExe(String query) throws RemoteException;

    List<String> getChequeDetails(String chqNo) throws RemoteException;

    List<String> getEmployeeCode(String code) throws RemoteException;

    String getProductType() throws RemoteException;

    List<String> getUserName(String type) throws RemoteException;

    boolean checkUserNameExists(String str) throws RemoteException;

    String getAccountNoBankName(String accountNo) throws RemoteException;

    List<String> customerName(String name) throws RemoteException;

    List<String> prctcustomerName(String name) throws RemoteException;

    List<String> customerName21(String name) throws RemoteException;

    List<String> editcustomerName(String name) throws RemoteException;

    List<String> customerName6(String name) throws RemoteException;

    List<String> customerName4(String name) throws RemoteException;

    List<String> customerName1(String name) throws RemoteException;

    List<String> customerName0701(String name, String name1) throws RemoteException;

    List<String> customerName20(String name) throws RemoteException;

    List<String> customerName0703(String name, String name1) throws RemoteException;

    List<String> customerName2(String name) throws RemoteException;

    List<String> customerName0702(String name, String name1) throws RemoteException;

    List<String> customerName10(String name) throws RemoteException;

    List<String> customerName11(String name) throws RemoteException;

    String getCustomerBalance(String customer) throws RemoteException;

    double getCreditAmount(String name, String type) throws RemoteException;

    double getDebitAmount(String name, String type) throws RemoteException;

    String getCustomerCode(String name) throws RemoteException;

    String getShopTinNo() throws RemoteException;

    List<String> getDistributors(String name) throws RemoteException;

    //padmini
    List<String> getBloodgroup(String name) throws RemoteException;

    List<String> getSmoking(String name) throws RemoteException;


     List<String> prctcustomerName1(String name) throws RemoteException;

    List<String> getChequeNumbers(String type) throws RemoteException;



    double getBillAmount(String query) throws RemoteException;

    List<String> getAccountNumbers() throws RemoteException;

    String getAccountBalance(String accountno) throws RemoteException;

    String checkSMSConf() throws RemoteException;

    boolean selectCustomer(String name) throws RemoteException;

    int selectCount(String dbTable, String name) throws RemoteException;

    int selectCount(String dbTable, String columnname, String name) throws RemoteException;

    String getShopDetails() throws RemoteException;

    List<String> GetCustomerList(String name) throws RemoteException;

    String getCustId(String dbtable, String columnName, String frontChar) throws RemoteException;

    boolean selectRecord(String distributorName) throws RemoteException;

    String getName(String code) throws RemoteException;

//    String getCode(String name) throws RemoteException;
    String getMobileNo(String code, String name) throws RemoteException;

    String getEmailId(String code, String name) throws RemoteException;

    String checkEmailConf() throws RemoteException;

    List<String> GetProductDetails(String bno, String btype) throws RemoteException;

    List<String> CompliantNumber(String name) throws RemoteException;

    List<String> ComplaintRegisterBillNo(String name) throws RemoteException;

    List<String> CreditNoteDetails(String name) throws RemoteException;

    boolean selectCreditNote(String creditNoteno) throws RemoteException;

    double CustTotAmt(String billNo, String custName) throws RemoteException;

    double DistTotAmt(String invoiceNo, String distName) throws RemoteException;

    List<String> getBankNameList() throws RemoteException;

    boolean checkExistance(String tablename, String acNo) throws RemoteException;

    boolean selectDistributor(String distributorName) throws RemoteException;

    public List<String> getNoteNo(String tableName, String noteNo) throws RemoteException;

    List<String> getQueryValue(String query, int count) throws RemoteException;

    boolean selectDebitNote(String debitNoteno) throws RemoteException;

    int getReturnCompare(String value, String itemCode, String itemName, String batch) throws RemoteException;

    int getReturnCompare(String itemCode, String itemName) throws RemoteException;

    String getAlertType() throws RemoteException;

    String getAlertInterval() throws RemoteException;

    String getExpiryDate(String itemCode, String batchNumber, String typeAler, String typeVal) throws RemoteException;

    String getDummyExpiryDate() throws RemoteException;

    String getProduct(String drugName) throws RemoteException;

    String getDosage(String itemCode, String itemName) throws RemoteException;

    String getFormulation(String itemCode, String itemName) throws RemoteException;

    int checkItemBatch(String code1, String batch) throws RemoteException;

    String getCRNo(String srNumber) throws RemoteException;

    void userLog(String billType, String type) throws RemoteException;

    Boolean isNotAllow(int modname) throws RemoteException;

    int queryExecution(String query) throws RemoteException;

    List<String> getYear(String name) throws RemoteException;

    int countMaintCost(String cyear, String month) throws RemoteException;

    List<String> getMonthList(String year) throws RemoteException;

    boolean setChequeFlag(String chqNo, int value) throws RemoteException;

    String getTruncateQuery(String que) throws RemoteException;

    HashMap getModules(String str1, String str2, String str3) throws RemoteException;

    String HospitalName() throws RemoteException;

    List<String> getDrugGenerics(String name, String listType) throws RemoteException;

    List<String> getDrugProducts(String name, String listType) throws RemoteException;

    String getExpiryDrugNames() throws RemoteException;

    List<String> getVatValues() throws RemoteException;

    boolean employeeCodeExists(String empcode, String empname, String mode) throws RemoteException;

    List<Double> getSalesPurchase() throws RemoteException;

    public Integer freeBillCount() throws RemoteException;

    public List<String> getVisitingHours(String txtValue, String doctorName) throws RemoteException;

    public boolean selectPatientName(String name) throws RemoteException;

    public List<String> getDepartment(String dept) throws RemoteException;

    public List<String> getPatientName(String name) throws RemoteException;

    public VitalScienceModel viewRecord3(String name, String date) throws RemoteException;

    public VitalScienceModel viewRecord4(String name, String date) throws RemoteException;

    public DischargeModel viewRecord10(String name, String date) throws RemoteException;

    int getincExcl(String incl_excl_flag) throws RemoteException;//sabarish

    int getAddService(String cs,String ms, Double amountss) throws RemoteException;//sabarish

    int getAddService2(String ms, String m2) throws RemoteException;

    int getAddService1(String ms) throws RemoteException;//sabarish

    String getCustomeridsab(String name) throws RemoteException;//sbaridh

    String getdocidsab(String name) throws RemoteException;//sbaridh

    int getAddTest(String ms, String amountss) throws RemoteException;//sabarish

    public int getAddHSN(String hsnCode, String Generic) throws RemoteException;

    JasperPrint jasperPrint(String billno, String billmodel, JasperReport jasperReport) throws RemoteException;

    String[] getdrugValues(String query) throws RemoteException;

    int getAddTest2(String ms,String m2,String minval,String maxval) throws RemoteException;

    public int getDeleteServBill(String hsnCode) throws RemoteException;

    public int getAddServcateg(String ms) throws RemoteException;

    String getcustomername(String name) throws RemoteException;//sbaridh

     int insert(String name) throws RemoteException;

      public List<String> getRadiologySubtype(String radiology, String radiologyType) throws RemoteException;

     public int getRadiologyId(String radiology) throws RemoteException;

     public String getPatientCode(String name)throws RemoteException;

      String getCustomerBalanceDue(String customer)throws RemoteException;

       public int getAddSubcateg(String category,String subCategory) throws RemoteException;

           int getAddService(String cs,String subcategory,String service, Double amountss,Double gst) throws RemoteException;//sabarish

            boolean updateAdvance(Double amt,String customer) throws RemoteException;
            
            int getQueryWitColumn(String query, String col) throws RemoteException;
             List<ServiceModel> getCreditBill(String cusName) throws RemoteException;
              List<String> getService(String category,String subcategory,String service)throws RemoteException;
}
