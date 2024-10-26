/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.ui;

import javafx.scene.control.TextBox;
import java.lang.Exception;

import javafx.scene.input.KeyCode;
import java.lang.String;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.implementation.CommonImplements ;
import com.vanuston.medeil.client.RegistryFactory ;
import com.vanuston.medeil.util.RegistryConstants ;

import java.lang.System;
/**
 * @author saran
 */
public class ListController {
    var log:Logger = Logger.getLogger(ListController.class,"ListController");
    public var selectedString: String = "";
    public function listImageControlView1(txtBox: javafx.scene.control.TextBox,txtBox1: javafx.scene.control.TextBox,listView: javafx.scene.control.ListView, type: String, viewType: Integer): Number {
        var listH = 0.0;
         var comObj : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        listView.visible = true;
        try {

            var empName: List = new ArrayList();
            var dosageTypes: List = new ArrayList();
            dosageTypes.add("S.I.D");
            dosageTypes.add("B.I.D");
            dosageTypes.add("T.I.D");
            dosageTypes.add("Q.I.D");
            dosageTypes.add("S.O.S");
            var size = listView.items.size();
            if (not listView.items.isEmpty()) {
                for (i in [0..<size])
                    listView.items[i] = null;
                    txtBox.requestFocus();
            }
            var typedText = txtBox.rawText;
            var typedText2 = txtBox1.rawText;
            //java.lang.System.out.println("typed text: {typedText}");
            if (viewType == 0) { typedText = ""; }
            typedText=typedText.trim();
           // java.lang.System.out.println("typed text in if: {typedText}");
             if (type.equals("Distributor")) {
                empName = comObj.getDistributors(typedText);
            } else if (type.equals("Customer")) {
                empName = comObj.customerName(typedText);
            }
            else if (type.equals("Customer6")) {
                empName = comObj.customerName6(typedText);
            }
            else if (type.equals("Customer4")) {
                empName = comObj.customerName4(typedText);
            }else if (type.equals("Customer1")) {
                empName = comObj.customerName1(typedText);
            }else if (type.equals("Customer20")) {
                empName = comObj.customerName20(typedText);
            }else if (type.equals("Customer2")) {
                empName = comObj.customerName2(typedText);
            }else if (type.equals("Customer0701")) {
                 empName = comObj.customerName0701(typedText,typedText2);
            }else if (type.equals("Customer0702")) {
                 empName = comObj.customerName0702(typedText,typedText2);
            }else if (type.equals("Customer0703")) {
                 empName = comObj.customerName0703(typedText,typedText2);
            }else if (type.equals("Customer10")) {
             empName = comObj.customerName10(typedText);
            }else if (type.equals("Customer11")) {
             empName = comObj.customerName11(typedText);
            } else if (type.equals("Bloodgroup")) {
               empName = comObj.getBloodgroup(typedText);
            } else if (type.equals("Smoking")) {
               empName = comObj.getSmoking(typedText);
            } else if (type.equals("Country")) {
                empName = comObj.Country(typedText);
            } else if (type.equals("UserInformation")) {
                empName = comObj.getUserName(typedText);
            } else if (type.equals("employeename")) {
                empName = comObj.getEmployers(typedText);
            } else if (type.equals("employeecode")) {
                empName = comObj.getEmployeeCode(typedText);
            } else if (type.equals("salescustomer")) {
                empName = comObj.customerName(typedText);
                empName.add("New name...");
            } else if (type.equals("doctor")) {
                empName = comObj.getDoctorName(typedText);
            } else if (type.equals("salesdoctor")) {
                empName = comObj.getDoctorName(typedText);
                empName.add("New name...");
            } else if (type.equals("expirydistributorname")) {
                empName = comObj.getListItems(typedText, "", "DISTRI");
            } else if (type.equals("Specialist")) {
                empName = comObj.Specialist(typedText);
            } else if (type.equals("CreditNoteNo")) {
                empName = comObj.getNoteNo("credit_note", typedText) ;
            } else if (type.equals("DebitNoteNo")) {
                empName = comObj.getNoteNo("Debit_note", typedText) ;
            } else if (type.equals("DoctorCode")) {
                empName = comObj.DoctorCode(typedText);
            } else if (type.equals("DoctorName")) {
                empName = comObj.getDoctorName (typedText) ;
                empName.add("New name...");
            } else if (type.equals("PatientName")) {
                empName = comObj.getPatientName(typedText);
            }else if (type.equals("Department")) {
                empName = comObj.getDepartment(typedText);
            }else if (type.equals("DosageTypes")) {
                empName = dosageTypes;
            }else if (type.equals("PatientName")) {
                empName = comObj.getPatientName(typedText);
            }
            listView.clearSelection();
            listView.items = empName.toArray();
            listView.onKeyPressed = function(e) {

                        if (e.code == KeyCode.VK_ENTER) {
                            selectedString = "{listView.selectedItem}";
                            if (selectedString == null or selectedString.trim().length() == 0) {
                                selectedString = "";
                            }
                            txtBox1.text = selectedString;
                            listView.visible = false;
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listView.selectedIndex == 0) {
                                listView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listView.visible = false;
                            txtBox.requestFocus();


                        }

                    };
            listView.onMouseReleased = function(e) {
                        selectedString = "{listView.selectedItem}";
                        if (selectedString == null or selectedString.trim().length() == 0) {
                            selectedString = "";
                        }
                        txtBox1.text = selectedString;
                        listView.visible = false;
                    }

            var height: Integer = 0;
            if (listView.items.size() < 8) {
                height = listView.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            txtBox.requestFocus();

        } catch (e: Exception) {
            log.debug("Error in List controller = {e.getMessage()}");

        }

        return listH;

    }

    public function listImageControlView(txtBox: javafx.scene.control.TextBox, listView: javafx.scene.control.ListView, type: String, viewType: Integer): Number {
        var listH = 0.0;
         var comObj : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        listView.visible = true;
        try {
            var empName: List = new ArrayList();
            var dosageTypes: List = new ArrayList();
            dosageTypes.add("S.I.D");
            dosageTypes.add("B.I.D");
            dosageTypes.add("T.I.D");
            dosageTypes.add("Q.I.D");
            dosageTypes.add("S.O.S");
            var size = listView.items.size();
            if (not listView.items.isEmpty()) {
                for (i in [0..<size])
                    listView.items[i] = null;
                    txtBox.requestFocus();
            }
            var typedText = txtBox.rawText;
            if (viewType == 0) { typedText = ""; }
            typedText=typedText.trim();
             if (type.equals("Distributor")) {
                empName = comObj.getDistributors(typedText);
            }else if (type.equals("Customer21")) {
                empName = comObj.customerName21(typedText);
            }else if (type.equals("Customer")) {
                empName = comObj.customerName(typedText);
            }else if (type.equals("prctCustomer")) {
                empName = comObj.prctcustomerName(typedText);
            }else if (type.equals("Customeredit12")) {
                empName = comObj.editcustomerName(typedText);
            } else if (type.equals("Country")) {
                empName = comObj.Country(typedText);
            } else if (type.equals("UserInformation")) {
                empName = comObj.getUserName(typedText);
            }else if (type.equals("Bloodgroup")) {
               empName = comObj.getBloodgroup(typedText);
            }else if (type.equals("Smoking")) {
               empName = comObj.getSmoking(typedText);
            }else if (type.equals("prctCustomer1")) {
                empName = comObj.prctcustomerName1(typedText);}
             else if (type.equals("Customer6")) {
                empName = comObj.customerName6(typedText);
            }
             else if (type.equals("doctor1")) {
                empName = comObj.getDoctorName1(typedText);
            }
            else if (type.equals("employeename")) {
                empName = comObj.getEmployers(typedText);
            } else if (type.equals("employeecode")) {
                empName = comObj.getEmployeeCode(typedText);
            } else if (type.equals("salescustomer")) {
                empName = comObj.customerName(typedText);
                empName.add("New name...");
            } else if (type.equals("doctor")) {
                empName = comObj.getDoctorName(typedText);
            } else if (type.equals("salesdoctor")) {
                empName = comObj.getDoctorName(typedText);
                empName.add("New name...");
            } else if (type.equals("expirydistributorname")) {
                empName = comObj.getListItems(typedText, "", "DISTRI");
            } else if (type.equals("Specialist")) {
                empName = comObj.Specialist(typedText);
            } else if (type.equals("CreditNoteNo")) {
                empName = comObj.getNoteNo("credit_note", typedText) ;
            } else if (type.equals("DebitNoteNo")) {
                empName = comObj.getNoteNo("Debit_note", typedText) ;
            } else if (type.equals("DoctorCode")) {
                empName = comObj.DoctorCode(typedText);
            } else if (type.equals("DoctorName")) {
                empName = comObj.getDoctorName (typedText) ;
                empName.add("New name...");
            } else if (type.equals("PatientName")) {
                empName = comObj.getPatientName(typedText);
            }else if (type.equals("Department")) {
                empName = comObj.getDepartment(typedText);
            }else if (type.equals("DosageTypes")) {
                empName = dosageTypes;
            }
         
            System.out.println(empName);
           System.out.println("empName");
            listView.clearSelection();
            listView.items = empName.toArray();
            listView.onKeyPressed = function(e) {

                        if (e.code == KeyCode.VK_ENTER) {
                            selectedString = "{listView.selectedItem}";
                            if (selectedString == null or selectedString.trim().length() == 0) {
                                selectedString = "";
                            }
                            txtBox.text = selectedString;
                            listView.visible = false;
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listView.selectedIndex == 0) {
                                listView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listView.visible = false;
                            txtBox.requestFocus();


                        }

                    };
            listView.onMouseReleased = function(e) {
                        selectedString = "{listView.selectedItem}";
                        if (selectedString == null or selectedString.trim().length() == 0) {
                            selectedString = "";
                        }
                        txtBox.text = selectedString;
                        listView.visible = false;
                    }

            var height: Integer = 0;
            if (listView.items.size() < 8) {
                height = listView.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            txtBox.requestFocus();

        } catch (e: Exception) {
            log.debug("Error in List controller = {e.getMessage()}");

        }

        return listH;

    }

     public function listStateControlView(txtBox: javafx.scene.control.TextBox, str:String, listView: javafx.scene.control.ListView, type: String, viewType: Integer): Number {
        var listH = 0.0;
         var comObj : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        listView.visible = true;
        try {
            var empName: List = new ArrayList();
            var size = listView.items.size();
            if (not listView.items.isEmpty()) {
                for (i in [0..<size])
                    listView.items[i] = null;
                txtBox.requestFocus();
            }
            var typedText = txtBox.rawText;
            if (viewType == 0) { typedText = ""; }

            empName = comObj.State(str, typedText) ;

            listView.clearSelection();
            listView.items = empName.toArray();
            listView.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            selectedString = "{listView.selectedItem}";
                            if (selectedString == null or selectedString.trim().length() == 0) {
                                selectedString = "";
                            }
                            txtBox.text = selectedString;
                            listView.visible = false;

                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listView.selectedIndex == 0) {
                                listView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listView.visible = false;
                            txtBox.requestFocus();
                        }

                    };

            listView.onMouseReleased = function(e) {
                        selectedString = "{listView.selectedItem}";
                        if (selectedString == null or selectedString.trim().length() == 0) {
                            selectedString = "";
                        }
                        txtBox.text = selectedString;
                        listView.visible = false;
                    }

            var height: Integer = 0;
            if (listView.items.size() < 8) {
                height = listView.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            txtBox.requestFocus();

        } catch (e: Exception) {
            log.debug("Error in List controller = {e.getMessage()}");
        }

        return listH;

    }
public function listPurchaseControlView(txtBox: javafx.scene.control.TextBox, listView: javafx.scene.control.ListView, type: String, viewType: Integer): Number {
        var listH = 0.0;
//        var purObj: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
//        var purOrderObj: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
        listView.visible = true;
        try {
            var empName: List = new ArrayList();
            var size = listView.items.size();
            if (not listView.items.isEmpty()) {
                for (i in [0..<size])
                    listView.items[i] = null;
                txtBox.requestFocus();
            }
            var typedText = txtBox.rawText;
            if (viewType == 0) {
                typedText = "";
            }
            typedText = typedText.trim();
            /*if (type.equals("Distributor")) {
                empName = purObj.getDistributorsForPurchase(typedText);
            } else if (type.equals("InvoiceNumber")) {
                empName = purObj.PurchaseBillNum(typedText);
            } else if (type.equals("ReturnBillNumber")) {
                empName = purObj.PurcRetBill(typedText);
            } else if (type.equals("PurchaseOrderBill")) {
                empName = purOrderObj.billNum(typedText);
            }else if (type.equalsIgnoreCase("PrePo")) {
             empName = purOrderObj.getPoNumbers(typedText);
           }*/
            listView.clearSelection();
            listView.items = empName.toArray();
            listView.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            selectedString = "{listView.selectedItem}";
                            if (selectedString == null or selectedString.trim().length() == 0) {
                                selectedString = "";
                            }
                            listView.visible = false;
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listView.selectedIndex == 0) {
                                listView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listView.visible = false;
                            txtBox.requestFocus();
                        }
                    };

            listView.onMouseReleased= function(e) {
                        selectedString = "{listView.selectedItem}";
                        if (selectedString == null or selectedString.trim().length() == 0) {
                            selectedString = "";
                        }
                        listView.visible = false;
                    }
            var height: Integer = 0;
            if (listView.items.size() < 8) {
                height = listView.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            txtBox.requestFocus();
        } catch (e: Exception) {
            log.debug("Error in List controller = {e.getMessage()}");
        }
        return listH;
    }

}

