/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author muralikrishnan
 */
@Entity
@Table (name = "medp_appointment_mt")



public class AppointmentModel implements Serializable {
    @Id
    @GeneratedValue
    @Column(name="id", columnDefinition="int(10)")
    private int id;
    
    @Column (name="appoint_no", columnDefinition="varchar(45)")
    private String appointmentId;

    @Column (name="patient_name" , columnDefinition="varchar(100)")
    private String patientName;

    @Column (name="doctor_name" , columnDefinition="varchar(100)")
    private String doctorName;

    @Column (name="appointment_date" , columnDefinition="datetime")
    private Date appointmentDate;

    @Column (name="appoint_fromtime" , columnDefinition="varchar(45)")
    private String appointmentFromTime;

    @Column (name="appoint_totime" , columnDefinition="varchar(45)")
    private String appointmentToTime;

    @Column (name="emergency_level" , columnDefinition="varchar(45)")
    private String emergencylevel;

    @Column (name="appoint_reason", columnDefinition="TEXT")
    private String appointmentReason;

    @Column (name="appoint_duration" , columnDefinition="varchar(255)")
    private String appointmentDuration;

    @Column (name="created_by" , columnDefinition="varchar(100)")
    private String createdBy;

    @Column (name="created_on", columnDefinition="DATETIME")
    private String createdOn;

    @Column (name="updated_by" , columnDefinition="varchar(100)")
    private String updatedBy;
    
    @Column (name="updated_on", columnDefinition="DATETIME")
    private String updatedOn;
    
    @Column (name="is_active", columnDefinition="int(1)")
    private int isActive;


    @Column (name="app_status", columnDefinition="int(10)")
    private int app_status;
   @Column (name="status", columnDefinition="varchar(100)")
   private String status;
     @Column(name="cust_code", columnDefinition="varchar(12)")
private String cust_code;





    public String getCust_code() {
        return cust_code;
    }

    public void setCust_code(String cust_code) {
        this.cust_code = cust_code;
    }

   
   
   
   
   


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public int getApp_status() {
        return app_status;
    }

    public void setApp_status(int app_status) {
        this.app_status =app_status;
    }








    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }




    public String getAppointmentDuration() {
        return appointmentDuration;
    }

    public void setAppointmentDuration(String appointmentDuration) {
        this.appointmentDuration = appointmentDuration;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(String createdOn) {
        this.createdOn = createdOn;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public String getUpdatedOn() {
        return updatedOn;
    }

    public void setUpdatedOn(String updatedOn) {
        this.updatedOn = updatedOn;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentFromTime() {
        return appointmentFromTime;
    }

    public void setAppointmentFromTime(String appointmentFromTime) {
        this.appointmentFromTime = appointmentFromTime;
    }

    public String getAppointmentId() {
        return appointmentId;
    }

    public void setAppointmentId(String appointmentId) {
        this.appointmentId = appointmentId;
    }

    public String getAppointmentReason() {
        return appointmentReason;
    }

    public void setAppointmentReason(String appointmentReason) {
        this.appointmentReason = appointmentReason;
    }

    public String getAppointmentToTime() {
        return appointmentToTime;
    }

    public void setAppointmentToTime(String appointmentToTime) {
        this.appointmentToTime = appointmentToTime;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getEmergencylevel() {
        return emergencylevel;
    }

    public void setEmergencylevel(String emergencylevel) {
        this.emergencylevel = emergencylevel;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }
}
