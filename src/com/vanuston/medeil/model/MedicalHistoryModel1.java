/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;
import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Vanuston
 */
public class MedicalHistoryModel1 implements Serializable {

    private Integer custid;
    private String custromercode;
    private Integer medicalid;
    private Integer bloodgroup;
    private String g6pd;
    private Integer smokinghistory;
    private String drugalergies;
    private Integer lactation;
    private Integer pregnancy;
    private Integer alcoholhistory;
    private Integer previoussurgeryundergone;
    private int prescriptionId;
    private int drugCode;
    private String patientName;
    private String remarks;
    private String medicineName;
    private String morning;
    private String afternoon;
    private String evening;
    private String night;
    private double days;
    private String food;
    private String date;
    private double totalMedications;
    private List prescriptionListItems;
    private String insertType;
    private String diagnosis;
    private String currentUser;
    private String dose;
    private String surgerydetails;

    public String getSurgerydetails() {
        return surgerydetails;
    }

    public void setSurgerydetails(String surgerydetails) {
        this.surgerydetails = surgerydetails;
    }

    public String getDose() {
        return dose;
    }

    public void setDose(String dose) {
        this.dose = dose;
    }

    public String getAfternoon() {
        return afternoon;
    }

    public void setAfternoon(String afternoon) {
        this.afternoon = afternoon;
    }

    public Integer getAlcoholhistory() {
        return alcoholhistory;
    }

    public void setAlcoholhistory(Integer alcoholhistory) {
        this.alcoholhistory = alcoholhistory;
    }

    public Integer getBloodgroup() {
        return bloodgroup;
    }

    public void setBloodgroup(Integer bloodgroup) {
        this.bloodgroup = bloodgroup;
    }

    public String getCurrentUser() {
        return currentUser;
    }

    public void setCurrentUser(String currentUser) {
        this.currentUser = currentUser;
    }

    public Integer getCustid() {
        return custid;
    }

    public void setCustid(Integer custid) {
        this.custid = custid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getDays() {
        return days;
    }

    public void setDays(double days) {
        this.days = days;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public int getDrugCode() {
        return drugCode;
    }

    public void setDrugCode(int drugCode) {
        this.drugCode = drugCode;
    }

    public String getDrugalergies() {
        return drugalergies;
    }

    public void setDrugalergies(String drugalergies) {
        this.drugalergies = drugalergies;
    }

    public String getEvening() {
        return evening;
    }

    public void setEvening(String evening) {
        this.evening = evening;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public String getG6pd() {
        return g6pd;
    }

    public void setG6pd(String g6pd) {
        this.g6pd = g6pd;
    }

    public String getInsertType() {
        return insertType;
    }

    public void setInsertType(String insertType) {
        this.insertType = insertType;
    }

    public Integer getLactation() {
        return lactation;
    }

    public void setLactation(Integer lactation) {
        this.lactation = lactation;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getMorning() {
        return morning;
    }

    public void setMorning(String morning) {
        this.morning = morning;
    }

    public String getNight() {
        return night;
    }

    public void setNight(String night) {
        this.night = night;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public Integer getPregnancy() {
        return pregnancy;
    }

    public void setPregnancy(Integer pregnancy) {
        this.pregnancy = pregnancy;
    }

    public int getPrescriptionId() {
        return prescriptionId;
    }

    public void setPrescriptionId(int prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    public List getPrescriptionListItems() {
        return prescriptionListItems;
    }

    public void setPrescriptionListItems(List prescriptionListItems) {
        this.prescriptionListItems = prescriptionListItems;
    }

    public Integer getPrevioussurgeryundergone() {
        return previoussurgeryundergone;
    }

    public void setPrevioussurgeryundergone(Integer previoussurgeryundergone) {
        this.previoussurgeryundergone = previoussurgeryundergone;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getSmokinghistory() {
        return smokinghistory;
    }

    public void setSmokinghistory(Integer smokinghistory) {
        this.smokinghistory = smokinghistory;
    }

    public double getTotalMedications() {
        return totalMedications;
    }

    public void setTotalMedications(double totalMedications) {
        this.totalMedications = totalMedications;
    }
     public String getCustromercode() {
        return custromercode;
    }

    public void setCustromercode(String custromercode) {
        this.custromercode = custromercode;
    }
     public Integer getMedicalid() {
        return medicalid;
    }

    public void setMedicalid(Integer medicalid) {
        this.medicalid = medicalid;
    }
    


}
