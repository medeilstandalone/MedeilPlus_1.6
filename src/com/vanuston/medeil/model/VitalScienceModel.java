package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

public class VitalScienceModel implements Serializable {

	private static final long serialVersionUID = 1L;
        private String date;
        private String patientName;
        private double pWeight;
        private double pHeight;
        private double pBmi;
        private String pRemarks1;
        private String pBloodSugar;
        private String pBloodPressure;
        private String pTemp;
	private String pHeartRate;
	private String pUrineSugar;
	private String pRemarks2;
        private String userName;
        private String CustomerCode;
        private int pid;
        private String Symptom;
        private String Assessment;
        private String Observation;
        private String Plan;
        private String RRmin;
        private String Waistcircum;
        private String BPDias;
        private String vRBS;
        private List prescriptionListItems;

    public List getPrescriptionListItems() {
        return prescriptionListItems;
    }

    public void setPrescriptionListItems(List prescriptionListItems) {
        this.prescriptionListItems = prescriptionListItems;
    }



    public String getvRBS() {
        return vRBS;
    }

    public void setvRBS(String vRBS) {
        this.vRBS = vRBS;
    }

    public String getBPDias() {
        return BPDias;
    }

    public void setBPDias(String BPDias) {
        this.BPDias = BPDias;
    }

    public String getRRmin() {
        return RRmin;
    }

    public void setRRmin(String RRmin) {
        this.RRmin = RRmin;
    }

    public String getWaistcircum() {
        return Waistcircum;
    }

    public void setWaistcircum(String Waistcircum) {
        this.Waistcircum = Waistcircum;
    }


    public String getAssessment() {
        return Assessment;
    }

    public void setAssessment(String Assessment) {
        this.Assessment = Assessment;
    }

    public String getObservation() {
        return Observation;
    }

    public void setObservation(String Observation) {
        this.Observation = Observation;
    }

    public String getPlan() {
        return Plan;
    }

    public void setPlan(String Plan) {
        this.Plan = Plan;
    }

    public String getSymptom() {
        return Symptom;
    }

    public void setSymptom(String Symptom) {
        this.Symptom = Symptom;
    }
        
    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public void setCustomerCode(String CustomerCode) {
        this.CustomerCode = CustomerCode;
    }

    public String getCustomerCode() {
        return CustomerCode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

         public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getpBloodPressure() {
        return pBloodPressure;
    }

    public void setpBloodPressure(String pBloodPressure) {
        this.pBloodPressure = pBloodPressure;
    }

    public String getpBloodSugar() {
        return pBloodSugar;
    }

    public void setpBloodSugar(String pBloodSugar) {
        this.pBloodSugar = pBloodSugar;
    }

    public double getpBmi() {
        return pBmi;
    }

    public void setpBmi(double pBmi) {
        this.pBmi = pBmi;
    }

    public String getpHeartRate() {
        return pHeartRate;
    }

    public void setpHeartRate(String pHeartRate) {
        this.pHeartRate = pHeartRate;
    }

    public double getpHeight() {
        return pHeight;
    }

    public void setpHeight(double pHeight) {
        this.pHeight = pHeight;
    }

    public String getpRemarks1() {
        return pRemarks1;
    }

    public void setpRemarks1(String pRemarks1) {
        this.pRemarks1 = pRemarks1;
    }

    public String getpRemarks2() {
        return pRemarks2;
    }

    public void setpRemarks2(String pRemarks2) {
        this.pRemarks2 = pRemarks2;
    }

    public String getpTemp() {
        return pTemp;
    }

    public void setpTemp(String pTemp) {
        this.pTemp = pTemp;
    }

    public String getpUrineSugar() {
        return pUrineSugar;
    }

    public void setpUrineSugar(String pUrineSugar) {
        this.pUrineSugar = pUrineSugar;
    }

    public double getpWeight() {
        return pWeight;
    }

    public void setpWeight(double pWeight) {
        this.pWeight = pWeight;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

     
}
