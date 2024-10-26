/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public class PrescriptionModel1 implements Serializable {
    //lab main

    private String labdate;
    private String prescriptiondate;
    private String doctorname;
    private int doctorid;
    private int custid;
    private String cust_code;
    private String cust_name;
    private int status;
    private String cust_age;
    private String cust_gender;
    private String labautoid;
    //lab sub
    private int labreportrefid;
    private int labtestid;
    private String lab_testname;
    private String minrange;
    private String maxrange;
    private String cust_minrange;
    private String cust_maxrange;
    private int status1;
    private String technology;
    private double price;
    private List diagnosticListItems;

    private String inserttype;
    private String remark;
    //
    private String dia;

    private String labtestdtid;

    public String getLabtestdtid() {
        return labtestdtid;
    }

    public void setLabtestdtid(String labtestdtid) {
        this.labtestdtid = labtestdtid;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getInserttype() {
        return inserttype;
    }

    public void setInserttype(String inserttype) {
        this.inserttype = inserttype;
    }

    public String getCust_age() {
        return cust_age;
    }

    public void setCust_age(String cust_age) {
        this.cust_age = cust_age;
    }

    public String getCust_code() {
        return cust_code;
    }

    public void setCust_code(String cust_code) {
        this.cust_code = cust_code;
    }

    public String getCust_gender() {
        return cust_gender;
    }

    public void setCust_gender(String cust_gender) {
        this.cust_gender = cust_gender;
    }

    public String getCust_maxrange() {
        return cust_maxrange;
    }

    public void setCust_maxrange(String cust_maxrange) {
        this.cust_maxrange = cust_maxrange;
    }

    public String getCust_minrange() {
        return cust_minrange;
    }

    public void setCust_minrange(String cust_minrange) {
        this.cust_minrange = cust_minrange;
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

    public int getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(int doctorid) {
        this.doctorid = doctorid;
    }

    public String getDoctorname() {
        return doctorname;
    }

    public void setDoctorname(String doctorname) {
        this.doctorname = doctorname;
    }

    public String getLab_testname() {
        return lab_testname;
    }

    public void setLab_testname(String lab_testname) {
        this.lab_testname = lab_testname;
    }

    public String getLabautoid() {
        return labautoid;
    }

    public void setLabautoid(String labautoid) {
        this.labautoid = labautoid;
    }

    public String getLabdate() {
        return labdate;
    }

    public void setLabdate(String labdate) {
        this.labdate = labdate;
    }

    public int getLabreportrefid() {
        return labreportrefid;
    }

    public void setLabreportrefid(int labreportrefid) {
        this.labreportrefid = labreportrefid;
    }

    public int getLabtestid() {
        return labtestid;
    }

    public void setLabtestid(int labtestid) {
        this.labtestid = labtestid;
    }

    public String getMaxrange() {
        return maxrange;
    }

    public void setMaxrange(String maxrange) {
        this.maxrange = maxrange;
    }

    public String getMinrange() {
        return minrange;
    }

    public void setMinrange(String minrange) {
        this.minrange = minrange;
    }

    public String getPrescriptiondate() {
        return prescriptiondate;
    }

    public void setPrescriptiondate(String prescriptiondate) {
        this.prescriptiondate = prescriptiondate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
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

    public String getTechnology() {
        return technology;
    }

    public void setTechnology(String technology) {
        this.technology = technology;
    }

    public String getDrug_name() {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public Object createRecord(Object drugBean) {
        throw new UnsupportedOperationException("Not yet implemented");
    }

    public List getDiagnosticListItems() {
        return diagnosticListItems;
    }

    public void setDiagnosticListItems(List diagnosticListItems) {
        this.diagnosticListItems = diagnosticListItems;
    }
}
