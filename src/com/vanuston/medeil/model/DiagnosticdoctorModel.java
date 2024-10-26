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
public class DiagnosticdoctorModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String moduleType = "Service";
    // Diagdoctor main
    private String labdate;
	private String prescriptiondate;
	private String doctorname;
	private int doctorid;
	private int custid;
	private String cust_code;
	private String cust_name;
	private int status;
        //lab_allocated_report table
    private int laballocateid;
	private String labreportname;
	private int status1;
	private int lab_reportid;
        private String catoryname;

        private List serviceListItems;

        private int catid;
        private String InsertType;
        private String billno;
        private int labrefid;

    public int getLabrefid() {
        return labrefid;
    }

    public void setLabrefid(int labrefid) {
        this.labrefid = labrefid;
    }

    public String getBillno() {
        return billno;
    }

    public void setBillno(String billno) {
        this.billno = billno;
    }

        public String getLabreportname() {
        return labreportname;
    }

    public void setLabreportname(String labreportname) {
        this.labreportname = labreportname;
    }

    public String getInsertType() {
        return InsertType;
    }

    public void setInsertType(String InsertType) {
        this.InsertType = InsertType;
    }

    public int getCatid() {
        return catid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public String getCatoryname() {
        return catoryname;
    }

    public void setCatoryname(String catoryname) {
        this.catoryname = catoryname;
    }
      
     public List getServiceListItems() {
        return serviceListItems;
    }

    public void setServiceListItems(List serviceListItems) {
        this.serviceListItems = serviceListItems;
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

    public int getLab_reportid() {
        return lab_reportid;
    }

    public void setLab_reportid(int lab_reportid) {
        this.lab_reportid = lab_reportid;
    }

    public int getLaballocateid() {
        return laballocateid;
    }

    public void setLaballocateid(int laballocateid) {
        this.laballocateid = laballocateid;
    }

    public String getLabdate() {
        return labdate;
    }

    public void setLabdate(String labdate) {
        this.labdate = labdate;
    }

   

    public String getModuleType() {
        return moduleType;
    }

    public void setModuleType(String moduleType) {
        this.moduleType = moduleType;
    }

    public String getPrescriptiondate() {
        return prescriptiondate;
    }

    public void setPrescriptiondate(String prescriptiondate) {
        this.prescriptiondate = prescriptiondate;
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
  }
