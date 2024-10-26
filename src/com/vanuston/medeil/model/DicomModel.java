/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.File;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Vanitha
 */
public class DicomModel implements Serializable {

    private int id;
    private int dicomId;
    private String doctorName;
    private int patientId;
    private String patientCode;
    private String patientName;
    private String mobileNo;
    private String custNameMobileNo;
    private String dicomFile;
    private String fileName;
    private Date dicomDate;
    private Timestamp update;
    private int dicomType;
    private String dicomSubType;
    private String payment;
    private byte[] fileData;
    private String patientType;
    private String process;
    private String type;
    private int passValue;
    private String finding;
     private String impression;
     private String recommendation;
     private String measurements;
    private String additionalNotes;
   private String observation;
   private File file;
   private String sequences;

    public String getSequences() {
        return sequences;
    }

    public void setSequences(String sequences) {
        this.sequences = sequences;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public String getAdditionalNotes() {
        return additionalNotes;
    }

    public void setAdditionalNotes(String additionalNotes) {
        this.additionalNotes = additionalNotes;
    }

    public String getMeasurements() {
        return measurements;
    }

    public void setMeasurements(String measurements) {
        this.measurements = measurements;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFinding() {
        return finding;
    }

    public void setFinding(String finding) {
        this.finding = finding;
    }

    public String getImpression() {
        return impression;
    }

    public void setImpression(String impression) {
        this.impression = impression;
    }

    public String getRecommendation() {
        return recommendation;
    }

    public void setRecommendation(String recommendation) {
        this.recommendation = recommendation;
    }
     private Date currentDate;

    public Date getCurrentDate() {
        return currentDate;
    }

    public void setCurrentDate(Date currentDate) {
        this.currentDate = currentDate;
    }

//    public Text getFinding() {
//        return finding;
//    }
//
//    public void setFinding(Text finding) {
//        this.finding = finding;
//    }
//
//    public Text getImpression() {
//        return impression;
//    }
//
//    public void setImpression(Text impression) {
//        this.impression = impression;
//    }
//
//    public Text getRecommendation() {
//        return recommendation;
//    }
//
//    public void setRecommendation(Text recommendation) {
//        this.recommendation = recommendation;
//    }


    public int getPassValue() {
        return passValue;
    }

    public void setPassValue(int passValue) {
        this.passValue = passValue;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public byte[] getFileData() {
        return fileData;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }

    public String getPatientType() {
        return patientType;
    }

    public void setPatientType(String patientType) {
        this.patientType = patientType;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }



    

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDicomSubType() {
        return dicomSubType;
    }

    public void setDicomSubType(String dicomSubType) {
        this.dicomSubType = dicomSubType;
    }

    public int getDicomType() {
        return dicomType;
    }

    public void setDicomType(int dicomType) {
        this.dicomType = dicomType;
    }


    public Timestamp getUpdate() {
        return update;
    }

    public void setUpdate(Timestamp update) {
        this.update = update;
    }

    public Date getDicomDate() {
        return dicomDate;
    }

    public void setDicomDate(Date dicomDate) {
        this.dicomDate = dicomDate;
    }
    private int statusCode;
   

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

   

    public String getDicomFile() {
        return dicomFile;
    }

    public void setDicomFile(String dicomFile) {
        this.dicomFile = dicomFile;
    }

    public int getDicomId() {
        return dicomId;
    }

    public void setDicomId(int dicomId) {
        this.dicomId = dicomId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientCode() {
        return patientCode;
    }

    public void setPatientCode(String patientCode) {
        this.patientCode = patientCode;
    }

    public String getCustNameMobileNo() {
        return custNameMobileNo;
    }

    public void setCustNameMobileNo(String custNameMobileNo) {
        this.custNameMobileNo = custNameMobileNo;
    }
}
