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
 * @author Sabarish
 */
public class LabrangeModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private int labtestid;
    private String lab_testname;
    private String age;
    private int genderid;
    private String gendername;
    private String parameter_name;
    private String minrange;
    private String maxrange;
    private String dia;//sabarish
    private int status;

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getLabtestid() {
        return labtestid;
    }

    public void setLabtestid(int labtestid) {
        this.labtestid = labtestid;
    }

    public String getLab_testname() {
        return lab_testname;
    }

    public void setLab_testname(String lab_testname) {
        this.lab_testname = lab_testname;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public int getGenderid() {
        return genderid;
    }

    public void setGenderid(int genderid) {
        this.genderid = genderid;
    }

    public String getGendername() {
        return gendername;
    }

    public void setGendername(String gendername) {
        this.gendername = gendername;
    }

    public String getParameter_name() {
        return parameter_name;
    }

    public void setParameter_name(String parameter_name) {
        this.parameter_name = parameter_name;
    }

    public String getMinrange() {
        return minrange;
    }

    public void setMinrange(String minrange) {
        this.minrange = minrange;
    }

    public String getMaxrange() {
        return maxrange;
    }

    public void setMaxrange(String maxrange) {
        this.maxrange = maxrange;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
