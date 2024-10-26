/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author prave
 */
public class RadiologyTypesModel implements Serializable {
    private int radiologyId;
    private String doctorName;//
    private String patientName;
     private int age;
     private String gender;
    private String radiologyType;
    private String radiologySubtype;
    private String diagnosis;
    private int radiologyTypeNo;

    public String getPaidStatus() {
        return paidStatus;
    }

    public void setPaidStatus(String paidStatus) {
        this.paidStatus = paidStatus;
    }
    private int status;
    private Date date;
    private String mobileNo;
     private String custCode;
    private String amount;
    private String paidStatus;
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getCustCode() {
        return custCode;
    }

    public void setCustCode(String custCode) {
        this.custCode = custCode;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public int getRadiologyId() {
        return radiologyId;
    }

    public void setRadiologyId(int radiologyId) {
        this.radiologyId = radiologyId;
    }

    public String getRadiologySubtype() {
        return radiologySubtype;
    }

    public void setRadiologySubtype(String radiologySubtype) {
        this.radiologySubtype = radiologySubtype;
    }

    public String getRadiologyType() {
        return radiologyType;
    }

    public void setRadiologyType(String radiologyType) {
        this.radiologyType = radiologyType;
    }

    public int getRadiologyTypeNo() {
        return radiologyTypeNo;
    }

    public void setRadiologyTypeNo(int radiologyTypeNo) {
        this.radiologyTypeNo = radiologyTypeNo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
