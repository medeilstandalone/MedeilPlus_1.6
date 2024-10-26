/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;
import com.vanuston.medeil.util.DateUtils;

/**
 *
 * @author www
 */
public class ServiceModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String moduleType = "Service";
    // billing main
    private String bill_date;
    private int custid;
    private String cust_code;
    private String cust_name;
    private int doctorid;
    private int patienttype;
    private String doctor_name;
    private String prescription_date;
    private double sub_total;
    private double tax_amount;
    private double total_amount;
    private double paid_amount;
    private double balamce_amount;
    private int status;
    private String insurance_status;
    private int insuranceid;
    private String insurance_name;
    private String insurance_schemes;
    //billing sub
    private int billrefid;
    private int servceid;
    private String service_name;
    private double qty;
    private double unit_vat;
    private double unit_discount;
    private double unit_gst;
    private double vat_amount;
    private double discount_amt;
    private double unit_price;
    private double total_price;
    private int status1;
    private double insurance_amount;
    private String billno;
    private int patient_type;
    private double total_discountamt;
    private List serviceListItems;
    private String insertType;
    private String remarks;
    private String category;
    private String patienttypes;
    private String paymentmode;

    public String getPaymentmode() {
        return paymentmode;
    }

    public void setPaymentmode(String paymentmode) {
        this.paymentmode = paymentmode;
    }

    

    public String getPatienttypes() {
        return patienttypes;
    }

    public void setPatienttypes(String patienttypes) {
        this.patienttypes = patienttypes;
    }

    

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getInsertType() {
        return insertType;
    }

    public void setInsertType(String insertType) {
        this.insertType = insertType;
    }

    public double getTotal_discountamt() {
        return total_discountamt;
    }

    public void setTotal_discountamt(double total_discountamt) {
        this.total_discountamt = total_discountamt;
    }

    public String getModuleType() {
        return moduleType;
    }

    public void setModuleType(String moduleType) {
        this.moduleType = moduleType;
    }

    public double getBalamce_amount() {
        return balamce_amount;
    }

    public void setBalamce_amount(double balamce_amount) {
        this.balamce_amount = balamce_amount;
    }

    public String getBill_date() {
        return bill_date;
    }

    public void setBill_date(String bill_date) {
        this.bill_date = bill_date;
    }

    public int getBillrefid() {
        return billrefid;
    }

    public void setBillrefid(int billrefid) {
        this.billrefid = billrefid;
    }

    public String getCust_code() {
        return cust_code;
    }

    public void setCust_code(String cust_code) {
        this.cust_code = cust_code;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public int getCustid() {
        return custid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }

    public double getDiscount_amt() {
        return discount_amt;
    }

    public void setDiscount_amt(double discount_amt) {
        this.discount_amt = discount_amt;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public int getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(int doctorid) {
        this.doctorid = doctorid;
    }

    public String getInsurance_name() {
        return insurance_name;
    }

    public void setInsurance_name(String insurance_name) {
        this.insurance_name = insurance_name;
    }

    public String getInsurance_schemes() {
        return insurance_schemes;
    }

    public void setInsurance_schemes(String insurance_schemes) {
        this.insurance_schemes = insurance_schemes;
    }

    public String getInsurance_status() {
        return insurance_status;
    }

    public void setInsurance_status(String insurance_status) {
        this.insurance_status = insurance_status;
    }

    public int getInsuranceid() {
        return insuranceid;
    }

    public void setInsuranceid(int insuranceid) {
        this.insuranceid = insuranceid;
    }

    public double getPaid_amount() {
        return paid_amount;
    }

    public void setPaid_amount(double paid_amount) {
        this.paid_amount = paid_amount;
    }

    public String getPrescription_date() {
        return prescription_date;
    }

    public void setPrescription_date(String prescription_date) {
        this.prescription_date = prescription_date;
    }

    public double getQty() {
        return qty;
    }

    public void setQty(double qty) {
        this.qty = qty;
    }

    public int getServceid() {
        return servceid;
    }

    public void setServceid(int servceid) {
        this.servceid = servceid;
    }

    public String getService_name() {
        return service_name;
    }

    public void setService_name(String service_name) {
        this.service_name = service_name;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStatus1() {
        return status1;
    }

    public void setStatus1(int status1) {
        this.status1 = status1;
    }

    public double getSub_total() {
        return sub_total;
    }

    public void setSub_total(double sub_total) {
        this.sub_total = sub_total;
    }

    public double getTax_amount() {
        return tax_amount;
    }

    public void setTax_amount(double tax_amount) {
        this.tax_amount = tax_amount;
    }

    public double getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(double total_amount) {
        this.total_amount = total_amount;
    }

    public double getTotal_price() {
        return total_price;
    }

    public void setTotal_price(double total_price) {
        this.total_price = total_price;
    }

    public double getUnit_discount() {
        return unit_discount;
    }

    public void setUnit_discount(double unit_discount) {
        this.unit_discount = unit_discount;
    }

    public double getUnit_gst() {
        return unit_gst;
    }

    public void setUnit_gst(double unit_gst) {
        this.unit_gst = unit_gst;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public double getUnit_vat() {
        return unit_vat;
    }

    public void setUnit_vat(double unit_vat) {
        this.unit_vat = unit_vat;
    }

    public double getVat_amount() {
        return vat_amount;
    }

    public void setVat_amount(double vat_amount) {
        this.vat_amount = vat_amount;
    }

    public int getPatienttype() {
        return patienttype;
    }

    public void setPatienttype(int patienttype) {
        this.patienttype = patienttype;
    }

    public String getBillno() {
        return billno;
    }

    public void setBillno(String billno) {
        this.billno = billno;
    }

    public double getInsurance_amount() {
        return insurance_amount;
    }

    public void setInsurance_amount(double insurance_amount) {
        this.insurance_amount = insurance_amount;
    }

    public int getPatient_type() {
        return patient_type;
    }

    public void setPatient_type(int patient_type) {
        this.patient_type = patient_type;
    }

    public List getServiceListItems() {
        return serviceListItems;
    }

    public void setServiceListItems(List serviceListItems) {
        this.serviceListItems = serviceListItems;
    }
}
