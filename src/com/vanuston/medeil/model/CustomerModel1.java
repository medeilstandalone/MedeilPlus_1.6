package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

public class CustomerModel1 implements Serializable {

    private static final long serialVersionUID = 1L;
    //cussearc model
    private int rowCount;//sabarish
    private String lastbillDate;//sabarish
    private String lastbillNumber;//sabarish
    private String cust_code;
    private String family_name;
    private String cust_name;
    private int age;
    private String gender;
    private String cust_address1;
    private String cust_address2;
    private String cust_address3;
    private String cust_city;
    private String cust_state;
    private String cust_country;
    private String cust_pincode;
    private String phone_no;
    private String mobile_no;
    private String email_id;
    private String alert_type;
    private double credit_limit;
    private int cust_flag_id;
    private int sent_flag_id;
    private String created_hsp_code;
    private String updated_hsp_code;
    private String dob;
    private String occupation;
    List<CustomerModel1> listofitems;//sabarish

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAlert_type() {
        return alert_type;
    }

    public void setAlert_type(String alert_type) {
        this.alert_type = alert_type;
    }

    public String getCreated_hsp_code() {
        return created_hsp_code;
    }

    public void setCreated_hsp_code(String created_hsp_code) {
        this.created_hsp_code = created_hsp_code;
    }

    public double getCredit_limit() {
        return credit_limit;
    }

    public void setCredit_limit(double credit_limit) {
        this.credit_limit = credit_limit;
    }

    public String getCust_address1() {
        return cust_address1;
    }

    public void setCust_address1(String cust_address1) {
        this.cust_address1 = cust_address1;
    }

    public String getCust_address2() {
        return cust_address2;
    }

    public void setCust_address2(String cust_address2) {
        this.cust_address2 = cust_address2;
    }

    public String getCust_address3() {
        return cust_address3;
    }

    public void setCust_address3(String cust_address3) {
        this.cust_address3 = cust_address3;
    }

    public String getCust_city() {
        return cust_city;
    }

    public void setCust_city(String cust_city) {
        this.cust_city = cust_city;
    }

    public String getCust_code() {
        return cust_code;
    }

    public void setCust_code(String cust_code) {
        this.cust_code = cust_code;
    }

    public String getCust_country() {
        return cust_country;
    }

    public void setCust_country(String cust_country) {
        this.cust_country = cust_country;
    }

    public int getCust_flag_id() {
        return cust_flag_id;
    }

    public void setCust_flag_id(int cust_flag_id) {
        this.cust_flag_id = cust_flag_id;
    }

    public String getCust_name() {
        return cust_name;
    }

    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }

    public String getCust_pincode() {
        return cust_pincode;
    }

    public void setCust_pincode(String cust_pincode) {
        this.cust_pincode = cust_pincode;
    }

    public String getCust_state() {
        return cust_state;
    }

    public void setCust_state(String cust_state) {
        this.cust_state = cust_state;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail_id() {
        return email_id;
    }

    public void setEmail_id(String email_id) {
        this.email_id = email_id;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLastbillDate() {
        return lastbillDate;
    }

    public void setLastbillDate(String lastbillDate) {
        this.lastbillDate = lastbillDate;
    }

    public String getLastbillNumber() {
        return lastbillNumber;
    }

    public void setLastbillNumber(String lastbillNumber) {
        this.lastbillNumber = lastbillNumber;
    }

    public String getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(String mobile_no) {
        this.mobile_no = mobile_no;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getPhone_no() {
        return phone_no;
    }

    public void setPhone_no(String phone_no) {
        this.phone_no = phone_no;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public int getSent_flag_id() {
        return sent_flag_id;
    }

    public void setSent_flag_id(int sent_flag_id) {
        this.sent_flag_id = sent_flag_id;
    }

    public String getUpdated_hsp_code() {
        return updated_hsp_code;
    }

    public void setUpdated_hsp_code(String updated_hsp_code) {
        this.updated_hsp_code = updated_hsp_code;
    }

    public List<CustomerModel1> getListofitems() {//sabarish
        return listofitems;//sabarish
    }//sabarish

    public void setListofitems(List<CustomerModel1> listofitems) {//sabarish
        this.listofitems = listofitems;//sabarish
    }//sabarish
}
