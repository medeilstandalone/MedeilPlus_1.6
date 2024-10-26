/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.CustomerDAO;
import com.vanuston.medeil.implementation.Customer;
import com.vanuston.medeil.model.CustomerModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 *
 * @author jai
 */
public class CustomerController extends UnicastRemoteObject implements Customer {

    public CustomerController() throws RemoteException {
    }

    @Override
    public Object viewRecord(Object name) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.viewRecord(name);
    }

    @Override
    public boolean deleteRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.deleteRecord(customerModels);
    }

    @Override
    public Object createRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.createRecord(customerModels);
    }

    @Override
    public Object updateRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updateRecord(customerModels);
    }

    @Override
    public CustomerModel viewAllRecord(Object customerBeans) throws RemoteException {
        CustomerModel cusomterList = new CustomerModel();
        try {
            CustomerDAO CustomerDAO = new CustomerDAO();
            CustomerModel customerBean = (CustomerModel) customerBeans;
            cusomterList = CustomerDAO.viewAllRecord(customerBean);
        } catch (Exception e) {
        }
        return cusomterList;
    }

    @Override
    public boolean deletePatientDetailsRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.deletePatientDetailsRecord(customerModels);
    }

    @Override
    public Object createPatientDetailsRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.createPatientDetailsRecord(customerModels);

    }

    @Override
    public Object updatePatientDetailsRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updatePatientDetailsRecord(customerModels);

    }
 @Override
    public boolean delRecord6(String id, String date) throws RemoteException {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.delRecord6(id, date);
    }



    @Override
    public List<String> getAllergies() {
        return new CustomerDAO().getAllergies();
    }

    @Override
    public int addAllergie(String allergie) {
        return new CustomerDAO().addAllergie(allergie);
    }

    @Override
    public List<String> getHealthConditions() {
        return new CustomerDAO().getHealthConditions();
    }

    @Override
    public int addHealthCondition(String healthCondition) {
        return new CustomerDAO().addHealthCondition(healthCondition);
    }

    @Override
    public CustomerModel loadCustomerMaintain() {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.loadCustomerMaintain();
    }

    @Override
    public CustomerModel loadCustomerSearch(String option, String val) throws RemoteException {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.loadCustomerSearch(option, val);
    }

    @Override
    public CustomerModel loadCustomerSearch(String cdate) throws RemoteException {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.loadCustomerSearch(cdate);
    }

    @Override
    public boolean delRecord4(Integer id, String date) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.delRecord4(id, date);
    }

    @Override
    public Object updatePatientDetailsRecord2(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updatePatientDetailsRecord2(customerModels);

    }

    @Override
    public Object createRecordConsult(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.createRecordConsult(customerModels);
    }

    @Override
    public boolean delRecord5(Integer id, String date) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.delRecord5(id, date);
    }

    @Override
    public Object updatePatientDetailsRecord20(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updatePatientDetailsRecord20(customerModels);

    }

    @Override
    public Object createRecordDischarge(Object customerModels) {
        // System.out.println("createRecordDischarge Controller");
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.createRecordDischarge(customerModels);
    }

    @Override
    public boolean delRecord3(Integer id, String date) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.delRecord3(id, date);
    }

    @Override
    public Object updatePatientDetailsRecord1(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updatePatientDetailsRecord1(customerModels);
    }

    @Override
    public Object createPatientDetailsRecord1(Object customerModels) {
        // System.out.println("createPatientDetailsRecord1");
        CustomerDAO customerDAO = new CustomerDAO();
        // System.out.println("createPatientDetailsRecord1");
        return customerDAO.createPatientDetailsRecord1(customerModels);

    }
}
