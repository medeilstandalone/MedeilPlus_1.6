package com.vanuston.medeil.model;

import java.io.Serializable;
import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;


@Entity
@Table(name = "cust_information")




public class CustomerModel implements Serializable {

    private static final long serialVersionUID = 1L;
//@Column(name = "cust_code")
    private String customerCode;
    private String customerName;
    private String familyName;
    private String gender;
    private String age;
    private String address1;
    private String address2;
    private String address3;
    private String city;
    private String country;
    private String state;
    private String pincode;
    private String phoneNumber;
//    @Column(name = "cusname_mobno")
    private String mobileNumber;
    private String emailid;
    private String alertType;
    private double creditLimit;
    private String lastbillDate;
    private String lastbillNumber;
    private Integer SMSFlag;
    private int rowCount;
    private String DlNumber;
    private String TinNumber;
    private String GstNumber;
    private String chkValue;
    private String customerType;
    private double customerPercentage;
    private List customerinfoList;
    private String custtypeid;
    private String date;
    private String patientName;
    private String wardNumber;
    private String roomNumber;
    private String doctorName;
    private String department;
    private String custType;
    private List allergiesList;
    private List healthConditionsList;
    private String currentUser;
    private String CreatedHspCode;
    private String UpdatedHspCode;
    private String dateofbirth;
    private double advanceamount;
     private int patientType;

    public double getAdvanceamount() {
        return advanceamount;
    }

    public int getPatientType() {
        return patientType;
    }

    public void setPatientType(int patientType) {
        this.patientType = patientType;
    }

    public void setAdvanceamount(double advanceamount) {
        this.advanceamount = advanceamount;
    }



    

public String getDateofbirth() {
        return dateofbirth;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }








    public String getCreatedHspCode() {
        return CreatedHspCode;
    }

    public String getUpdatedHspCode() {
        return UpdatedHspCode;
    }

    public void setCreatedHspCode(String CreatedHspCode) {
        this.CreatedHspCode = CreatedHspCode;
    }

    public void setUpdatedHspCode(String UpdatedHspCode) {
        this.UpdatedHspCode = UpdatedHspCode;
    }

    public String getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(String currentUser) {
        this.currentUser = currentUser;
    }
     
    public List<String> getAllergiesList() {
        return allergiesList;
    }

    public String getCustType() {
        return custType;
    }

    public List<String> getHealthConditionsList() {
        return healthConditionsList;
    }

    public void setAllergiesList(List<String> allergiesList) {
        this.allergiesList = allergiesList;
    }

    public void setCustType(String custType) {
        this.custType = custType;
    }

    public void setHealthConditionsList(List<String> healthConditionsList) {
        this.healthConditionsList = healthConditionsList;
    }
    

    public String getDepartment() {
        return department;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public void setWardNumber(String wardNumber) {
        this.wardNumber = wardNumber;
    }
    

    

    public String getPatientName() {
        return patientName;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public String getWardNumber() {
        return wardNumber;
    }


    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }
  

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }





    public String getCusttypeid() {
        return custtypeid;
    }

    public void setCusttypeid(String custtypeid) {
        this.custtypeid = custtypeid;
    }

    public List getCustomerinfoList() {
        return customerinfoList;
    }

    public void setCustomerinfoList(List customerinfoList) {
        this.customerinfoList = customerinfoList;
    }
     
    public double getCustomerPercentage() {
        return customerPercentage;
    }

    public void setCustomerPercentage(double customerPercentage) {
        this.customerPercentage = customerPercentage;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public String getChkValue() {
        return chkValue;
    }

    public void setChkValue(String chkValue) {
        this.chkValue = chkValue;
    }

    public String getDlNumber() {
        return DlNumber;
    }

    public String getGstNumber() {
        return GstNumber;
    }

    public String getTinNumber() {
        return TinNumber;
    }

    public void setDlNumber(String DlNumber) {
       
        this.DlNumber = DlNumber;
    }

    public void setGstNumber(String GstNumber) {
        this.GstNumber = GstNumber;
    }

    public void setTinNumber(String TinNumber) {
        this.TinNumber = TinNumber;
    }


    

    public double getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(double creditLimit) {
        this.creditLimit = creditLimit;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public String getAddress3() {
        return address3;
    }

    public void setAddress3(String address3) {
        this.address3 = address3;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getAlertType() {
        return alertType;
    }

    public void setAlertType(String alertType) {
        this.alertType = alertType;
    }

    public String getlastBillDate() {
        return lastbillDate;
    }

    public void setlastBillDate(String billDate) {
        this.lastbillDate = billDate;
    }

    public String getlastBillNumber() {
        return lastbillNumber;
    }

    public void setlastBillNumber(String billNumber) {
        this.lastbillNumber = billNumber;
    }

    public Integer getSMSFlag() {
        return SMSFlag;
    }

    public void setSMSFlag(Integer flag) {
        SMSFlag = flag;
    }
    List<CustomerModel> listofitems ;
	public String getBillNumber() {
		return lastbillNumber;
	}
        public void setlastNumber(String lastbillNumber) {
		this.lastbillNumber = lastbillNumber;
	}
    public List<CustomerModel> getListofitems() {
		return listofitems;
	}
	public void setListofitems(List<CustomerModel> listofitems) {
		this.listofitems = listofitems;
	}
        public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }
}
