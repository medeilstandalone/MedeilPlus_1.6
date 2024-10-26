package com.vanuston.medeil.ui;

import javafx.scene.image.Image;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.input.KeyCode;
import javafx.scene.image.ImageView;
import java.awt.Dimension;
import java.lang.Exception;
import java.text.SimpleDateFormat;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.NumberUtils;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.PrescriptionTable1;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.io.File;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.JasperPrintManager;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.util.Validation;
import java.util.ArrayList;
import java.util.*;
import java.util.Date;
import com.vanuston.medeil.model.PrescriptionModel;
import com.vanuston.medeil.model.DrugModel1;
import com.vanuston.medeil.implementation.Prescription;
import com.vanuston.medeil.uitables.PrescriptionDetails;
import javax.swing.JTable;
import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.uitables.DrugSpecifications;
import com.vanuston.medeil.uitables.ConfirmDialogBox1;
import java.util.HashMap;
import com.vanuston.medeil.model.DrugSpecificationModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.vanuston.medeil.model.PrescriptionModel1;
import com.vanuston.medeil.controller.LabController;
import com.vanuston.medeil.implementation.Lab;

var symp:ArrayList=ArrayList{};
public class LabModule {

    var log: Logger = Logger.getLogger(LabModule.class, "LabModule");
    var prescriptionTableObj = new PrescriptionTable1();
    public var cashBillDate = DateUtils.now("dd-MM-yyyy");
    public var nextVisitDate = DateUtils.now("dd-MM-yyyy");
    var srCode: String = "";
    var productList:List;   
    var listH = 0.0;
    var sno: Integer = 0;
    var dateFlag: Boolean = false;
    var nextVisitFlag: Boolean = false;
    var fxCalendar: FXCalendar = FXCalendar { theme: Theme {}; };
    var tinNo = bind CommonDeclare.tin;
    var prescriptionController : Prescription = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as Prescription;
   // var LabController: Lab = RegistryFactory.getClientStub(RegistryConstants.Drug) as Lab;
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var prescriptionTable = prescriptionTableObj.createTable();
    var prescriptionFormatTable = SwingComponent.wrap(prescriptionTableObj.getScrollTable(prescriptionTable));
    var mandatory = CommonDeclare.presc_textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    var panelW = bind CommonDeclare.panelFormW on replace {
        listSalesCash.visible = false;
    }
    def Diagnostictype = Diagnostictype {};

     var ret3 = bind Diagnostictype.panel.visible on replace {
        panel.disable = ret3;
        panelDiagnostictype.visible = ret3;
        Diagnostictype.txtManufacturer.requestFocus();
        txtDiagnosis.text = Diagnostictype.manufacturer;
        Diagnostictype.manufacturer = "";
    }

    def Testname = Testname{};

       var ret43 = bind Testname.panel.visible on replace {
        panel.disable = ret43;
        panelTestname.visible = ret43;
        Testname.txtFormulation.requestFocus();
        //txtBloodSugar.text = Testname.formulation;
        Testname.formulation = "";
    }   
   

    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var firstCol = bind (5.8359375 * panelW) / 100;
    var firstCol1= bind (6.8359375 * panelW) / 100;
    var secondCol = bind firstCol+105.0;
    var secondCo1l = bind (18.5546875 * panelW) / 100;
    var thirdCol = bind (45.96875 * panelW) / 100;
    var fourthCol = bind (thirdCol+250);
    var fifthCol = bind (78.125 * panelW) / 100;
    var fifthCol1 = bind (62.125 * panelW) / 100;
    var fifthCol2 = bind fifthCol1+75;
    var fifthCol3 = bind (83.125 * panelW) / 100;
    var fifthCol4 = bind (87.125 * panelW) / 100;
    var sixCol = bind (85.0078125 * panelW) / 100;
    var textboxw1 = bind (19.53125 * panelW) / 100;
    var dateBoxW = bind (9.73125 * panelW) / 100;
    var textboxw2 = bind (26.53125 * panelW) / 100;
    var produtNamex = bind (37.23125 * panelW) / 100;
    var txtprodutNamex = bind (46.875 * panelW) / 100;
    var lblAvlqtyX = bind (50.3125 * panelW) / 100;
    var lblQtyLx = bind (67.9625 * panelW) / 100;
    var C1LX = bind (6.8359375 * panelW) / 100;
    var C2LX = 180.00;
    var C3LX = bind CommonDeclare.Column3LX - 30;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton51LX;
    var botton2LX = bind CommonDeclare.botton52LX;
    var botton3LX = bind CommonDeclare.botton53LX;
    var botton4LX = bind CommonDeclare.botton54LX;
    var botton5LX = bind CommonDeclare.botton55LX;
    var botton21LX = bind CommonDeclare.botton2LX;
    var botton22LX = bind CommonDeclare.botton3LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW + 15;
    var bottonH = bind CommonDeclare.bottonH;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var Type5TextboxW = bind CommonDeclare.Type4TextboxW - 10;
    var Type6TextboxW = bind CommonDeclare.Type2TextboxW;
    var ImageCalenderLX = bind C4LX + Type3TextboxW + 2;
    var imgClickdownLX = bind C2LX + Type1TextboxW - 2;
    var imgClickdown1LX = bind C4LX + Type1TextboxW - 2;
    var imgClickdownW = 20.5;
    var imgClickdownH = 20.5;
    var rectbuttonLX = bind 85.13341804 * panelW / 100;
    var ListLX = 0.0;
    var ListLY = 0.0;
    var LabelTINLX = bind 82.23888183 * panelW / 100;
    var AmtPanelLX = bind BottomC4LX + Type4TextboxW + 20;
    var AmtTextW = bind panelW - AmtPanelLX - 30;
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
   // var TableH = 148.0 on replace { changeTableSize(TableW, TableH); };
    var TableH = 245.0 on replace { changeTableSize(TableW, TableH); };
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 280.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind (panelTableLY + TableH);
    function changeTableSize(i: Integer, j: Integer): Void {
        prescriptionFormatTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }
    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX;
    var BottomC4LX = bind CommonDeclare.BottomC4LX;
    var BottomC5LX = bind BottomC4LX +Type4TextboxW+ 25;
    var pd:PrescriptionDetails;
    var ds:DrugSpecifications;
    var listW = Type2TextboxW;

    var ret4 = bind Diagnostictype.panel.visible on replace {
        panel.disable = ret4;
        panelDiagnostictype.visible = ret4;
        Diagnostictype.txtManufacturer.requestFocus();
        txtDiagnosis.text = Diagnostictype.manufacturer;
        Diagnostictype.manufacturer = "";
    }
    var sar2: Integer = 0;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_panelTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutInfo: __layoutInfo_panelTable
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def lblLabno: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-30
        text: "Label"
    }
    
    def __layoutInfo_txtLabno: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-80
    }
    public-read def txtLabno: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX-30
        layoutInfo: __layoutInfo_txtLabno
    }
    
    public-read def imglabno: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind (C2LX-30)+txtLabno.width-10
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def lblDocid: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-150
        text: "Label"
    }
    
    def __layoutInfo_editdiagnosisno: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-80
    }
    public-read def editdiagnosisno: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX-60
        layoutInfo: __layoutInfo_editdiagnosisno
    }
    
    public-read def imgeditpatient: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind (C3LX-60)+txtDoctorName.width-10
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH+4
    }
    
    public-read def imgPatientName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind (C2LX-30)+txtPatientName.width-10
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def CashDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind sixCol-50+dateBoxW+8 -40
        layoutY: 77.0
    }
    
    def __layoutInfo_txtNextVisit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind dateBoxW
    }
    public-read def txtNextVisit: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind fifthCol4-100
        layoutInfo: __layoutInfo_txtNextVisit
    }
    
    public-read def imgCalendar: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind sixCol-50+dateBoxW+8 -40
    }
    
    def __layoutInfo_btnSubstitute: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSubstitute: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C1LX+50
        layoutInfo: __layoutInfo_btnSubstitute
        text: "Button"
    }
    
    public-read def lblMedicineName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    def __layoutInfo_txtMedicineName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMedicineName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX
        layoutInfo: __layoutInfo_txtMedicineName
    }
    
    public-read def imgMedicineName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C1LX+txtMedicineName.width-10
    }
    
    def __layoutInfo_labelAvlQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelAvlQty: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+50
        layoutInfo: __layoutInfo_labelAvlQty
        text: "Label"
    }
    
    def __layoutInfo_txtAvlQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind dateBoxW+20
    }
    public-read def txtAvlQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+150
        layoutInfo: __layoutInfo_txtAvlQty
    }
    
    def __layoutInfo_btnDrugSpec: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnDrugSpec: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C1LX+30
        layoutY: 199.0
        layoutInfo: __layoutInfo_btnDrugSpec
        text: "Button"
    }
    
    def __layoutInfo_txtDoseType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW+5
    }
    public-read def txtDoseType: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX-140
        layoutInfo: __layoutInfo_txtDoseType
    }
    
    public-read def imgDoseType: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind txtDoseType.layoutX+txtDoseType.width-21
    }
    
    public-read def choiceboxDosType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C3LX-140
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtMedicineName.width
        height: bind listH
    }
    public-read def listProductName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C1LX
        layoutInfo: __layoutInfo_listProductName
        items: null
    }
    
    def __layoutInfo_lblAge: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblAge: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+80
        layoutInfo: __layoutInfo_lblAge
        text: "Label"
    }
    
    public-read def lblDiagnosis: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-150
        text: "Label"
    }
    
    def __layoutInfo_txtAge: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW -(Type4TextboxW*50/100)
    }
    public-read def txtAge: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind fifthCol4-100
        layoutInfo: __layoutInfo_txtAge
    }
    
    def __layoutInfo_txtDiagnosis: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW + Type4TextboxW
    }
    public-read def txtDiagnosis: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX-60
        layoutInfo: __layoutInfo_txtDiagnosis
    }
    
    public-read def imgDiagnosis: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind (C3LX-60)+txtDiagnosis.width-10
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def rdoMale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX-30
        layoutY: 130.0
        text: "Radio Button"
    }
    
    public-read def rdoFemale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX+20
        layoutY: 144.0
        text: "Radio Button"
    }
    
    public-read def rdoTrans: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX+80
        text: "Radio Button"
    }
    
    public-read def imgBloodSugar: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind (C3LX-60)+txtBloodSugar.width-10
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    def __layoutInfo_txtBloodPressure: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind dateBoxW
    }
    public-read def txtBloodPressure: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind fifthCol4-100
        layoutY: 95.0
        layoutInfo: __layoutInfo_txtBloodPressure
        styleClass: "Borderless-text-box"
    }
    
    public-read def PrescDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind sixCol-50+dateBoxW+8 -40
    }
    
    public-read def lbl_Days: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+40
        layoutY: 78.0
        text: "Label"
    }
    
    public-read def lblAfternoon: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+220
        text: "Label"
    }
    
    public-read def lblNight: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+380
        text: "Label"
    }
    
    public-read def lblFood: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+40
        text: "Label"
    }
    
    public-read def cboFood: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C3LX+40
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def lblDose: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+140
        layoutY: 110.0
        text: "Label"
    }
    
    def __layoutInfo_labelQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelQty: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+240
        layoutInfo: __layoutInfo_labelQty
        text: "Label"
    }
    
    def __layoutInfo_txtDays: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtDays: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+40
        layoutY: 64.0
        layoutInfo: __layoutInfo_txtDays
    }
    
    def __layoutInfo_txtAfternoon: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtAfternoon: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+220
        layoutInfo: __layoutInfo_txtAfternoon
    }
    
    def __layoutInfo_txtNight: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtNight: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+380
        layoutInfo: __layoutInfo_txtNight
    }
    
    public-read def txtDose: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+140
        layoutY: 145.0
    }
    
    def __layoutInfo_txtQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+240
        layoutInfo: __layoutInfo_txtQty
    }
    
    def __layoutInfo_listDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtDoctorName.width
        height: bind listH
    }
    public-read def listDoctorName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 128.0
        layoutY: 111.0
        layoutInfo: __layoutInfo_listDoctorName
        items: null
    }
    
    def __layoutInfo_listPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtPatientName.width
        height: bind listH
    }
    public-read def listPatientName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listPatientName
        items: null
    }
    
    def __layoutInfo_listSalesCash: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtPatientName.width
        height: bind listH
    }
    public-read def listSalesCash: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind ListLX
        layoutY: bind ListLY
        layoutInfo: __layoutInfo_listSalesCash
        items: null
    }
    
    def __layoutInfo_listDoseType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtDoseType.width
        height: bind listH
    }
    public-read def listDoseType: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listDoseType
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def txtPrescriptionId: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C1LX
    }
    
    def __layoutInfo_btnpatienttest: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnpatienttest: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind fifthCol4-50
        layoutInfo: __layoutInfo_btnpatienttest
        text: "Button"
        action: btnPatientSymptomsActionAtShown
    }
    
    public-read def txtFee: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
    }
    
    public-read def lblRemarks: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    public-read def imgFinal: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnFinal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+25
        height: bind bottonH
    }
    public-read def btnFinal: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C1LX
        layoutInfo: __layoutInfo_btnFinal
        graphic: imgFinal
        text: "Button"
    }
    
    public-read def lblNextVisit: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+80
        text: "Label"
    }
    
    public-read def lblFee: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        text: "Label"
    }
    
    def __layoutInfo_btnFood: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnFood: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton5LX
        layoutInfo: __layoutInfo_btnFood
        text: "Button"
    }
    
    public-read def lblnote: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 31.0
        content: [ txtFee, lblRemarks, btnFinal, lblNextVisit, lblFee, btnFood, lblnote, ]
    }
    
    public-read def imgPrint: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaveOnly: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaveOnly: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutY: 534.0
        layoutInfo: __layoutInfo_btnSaveOnly
        graphic: imgSave
        text: "Save [F3]"
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: null
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+15
        height: bind bottonH
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton3LX
        layoutInfo: __layoutInfo_btnEdit
        graphic: imgEdit
        text: "Button"
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+15
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton5LX
        layoutInfo: __layoutInfo_btnCancel
        graphic: imgCancel
        text: "Button"
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 50.0
        layoutY: 145.0
        layoutInfo: __layoutInfo_listView
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 325.0
        layoutY: 49.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY-100
        width: 120.0
        height: 50.0
    }
    
    def __layoutInfo_LabelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def LabelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY-100
        layoutInfo: __layoutInfo_LabelRemoveRow
        text: "Remove Row  [F12]"
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 0.0
    }
    
    def __layoutInfo_rectButton: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rectButton: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: 531.0
        layoutInfo: __layoutInfo_rectButton
        width: 100.0
        height: 50.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelPopUp: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX
    }
    
    public-read def panelPopUp2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind imgDoctorName.layoutX-50
    }
    
    def __layoutInfo_txtRemarks: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtRemarks: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+10
        layoutInfo: __layoutInfo_txtRemarks
    }
    
    def __layoutInfo_panelPopUp3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelPopUp3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX+150
        layoutY: bind panelAlertLY+70
        layoutInfo: __layoutInfo_panelPopUp3
    }
    
    def __layoutInfo_panelDiagnostictype: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelW
    }
    public-read def panelDiagnostictype: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX-100
        layoutY: bind panelAlertLY-150
        layoutInfo: __layoutInfo_panelDiagnostictype
    }
    
    def __layoutInfo_panelTestname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelTestname: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX-100
        layoutY: bind panelAlertLY-150
        layoutInfo: __layoutInfo_panelTestname
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ txtRemarks, panelPopUp3, panelDiagnostictype, panelTestname, ]
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtEvening: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtEvening: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C3LX+300
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtEvening
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtMorning: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtMorning: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C3LX+140
        layoutInfo: __layoutInfo_txtMorning
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtBloodSugar: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-80
    }
    public-read def txtBloodSugar: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C3LX-60
        layoutY: 1.0
        layoutInfo: __layoutInfo_txtBloodSugar
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtTemperature: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtTemperature: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 419.0
        layoutInfo: __layoutInfo_txtTemperature
        styleClass: "Borderless-text-box"
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtWeight: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtWeight: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtWeight
        styleClass: "text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtGender: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtGender: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 392.0
        layoutInfo: __layoutInfo_txtGender
        styleClass: "Borderless-text-box"
        onKeyReleased: txtGenderOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtPrescDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind dateBoxW
    }
    public-read def txtPrescDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind fifthCol4-100
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtPrescDate
        text: bind cashBillDate
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesCaTIN: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesCaTIN: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind LabelTINLX+45
        layoutY: 75.0
        layoutInfo: __layoutInfo_lblSalesCaTIN
        styleClass: "Borderless-text-box"
        text: bind tinNo
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-80
    }
    public-read def txtDoctorName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C2LX-30
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtDoctorName
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-80
        hfill: false
    }
    public-read def txtPatientName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX-30
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPatientName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        promptText: "Enter Customer Name"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def Arial_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 16.0
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 18.0
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 18.0
    }
    
    public-read def Arial_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 20.0
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnSalesCaReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesCaReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesCaReset
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPrint: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPrint: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPrint
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgPrint
        text: "Print  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnPrint, btnSaveOnly, btnEdit, btnSalesCaReset, btnCancel, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def lblEvening: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX+300
        layoutY: 490.0
        text: "Balance"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblMorning: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX+140
        layoutY: 444.0
        text: "VAT"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblBloodPressure: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX+80
        layoutY: 421.0
        text: "discount"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblBloodSugar: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-150
        layoutY: 398.0
        text: "subtotal"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblTemperature: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 421.0
        text: "Total Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblWeight: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX+80
        layoutY: 467.0
        text: "Amt. Paid"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblGender: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 398.0
        text: "Total Products"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind LabelTINLX
        layoutY: 75.0
        text: "TIN No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblDoctorName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-30
        layoutY: 75.0
        text: "Bill No"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lblPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblPatientName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 60.0
        layoutInfo: __layoutInfo_lblPatientName
        styleClass: "label"
        text: "Patient Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def productRectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        fill: linearGradient
        stroke: DarkGray
        x: bind panelTableLX+20
        width: bind TableW-20
        height: 80.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClickedAtShown
        blocksMouse: false
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.05
        green: 0.32
        blue: 0.07
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        effect: lightingEffect
        text: "Sales - Cash Bill"
        font: Arial_25
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 30.0
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95686275
        green: 0.9490196
        blue: 0.8627451
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutY: 0.0
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
    }
    
    public-read def Arial_Bold__65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDoctorName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind (C2LX-30)+txtDoctorName.width-10
        image: image
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def panelTopSection: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        focusTraversable: true
        content: [ productRectangle, lblLabno, txtLabno, imglabno, lblDocid, editdiagnosisno, imgeditpatient, lblPatientName, txtPatientName, imgPatientName, txtDoctorName, lblDoctorName, label3, lblSalesCaTIN, txtPrescDate, CashDatePicker, txtNextVisit, imgCalendar, imgDoctorName, btnSubstitute, lblMedicineName, txtMedicineName, imgMedicineName, labelAvlQty, txtAvlQty, btnDrugSpec, txtDoseType, imgDoseType, choiceboxDosType, listProductName, lblAge, lblDiagnosis, txtAge, txtDiagnosis, imgDiagnosis, lblGender, txtGender, rdoMale, rdoFemale, rdoTrans, lblWeight, lblTemperature, lblBloodSugar, lblBloodPressure, txtWeight, txtTemperature, txtBloodSugar, imgBloodSugar, txtBloodPressure, PrescDatePicker, lbl_Days, lblMorning, lblAfternoon, lblEvening, lblNight, lblFood, cboFood, lblDose, labelQty, txtDays, txtMorning, txtAfternoon, txtEvening, txtNight, txtDose, txtQty, listDoctorName, listPatientName, listSalesCash, listDoseType, txtPrescriptionId, btnpatienttest, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        blocksMouse: true
        focusTraversable: true
        content: [ rectangle, rectHeader, label, panelTable, rectTableBorder, panelTopSection, panelTxtColumn1, panelButtons, listView, separator, rectRemoveRow, LabelRemoveRow, panelCalender, rectButton, panelAlert, ]
    }
    
    public-read def MainPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        focusTraversable: true
        content: [ panel, panelPopUp, panelPopUp2, panel2, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def lightblue: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.9254902
        green: 0.96862745
        blue: 0.9843137
    }
    
    public-read def cardImage2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Card.png"
    }
    
    public-read def Coupon: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Card1.png"
    }
    
    public-read def lightOrange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.99607843
        green: 0.7254902
    }
    
    public-read def toggleGroup3: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def font2: javafx.scene.text.Font = javafx.scene.text.Font {
    }
    
    public-read def imgDate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def Red: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.styleClass = "rectFormHeader";
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Diagnostic Test";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            panelTable.visible = true;
                            panelTable.layoutY = 170.0;
                            __layoutInfo_panelTable.height = 0.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 170.0;
                            productRectangle.visible = false;
                            productRectangle.fill = null;
                            productRectangle.stroke = DarkGray;
                            productRectangle.strokeWidth = 2.0;
                            productRectangle.y = 152.0;
                            productRectangle.height = 105.0;
                            productRectangle.arcWidth = 5.0;
                            productRectangle.arcHeight = 5.0;
                            lblLabno.visible = true;
                            lblLabno.layoutY = 34.0;
                            lblLabno.text = "Diagnostic No";
                            lblLabno.font = Arial_Bold_12;
                            lblLabno.textFill = DarkGray;
                            txtLabno.visible = true;
                            txtLabno.layoutY = 34.0;
                            txtLabno.styleClass = "text-box";
                            txtLabno.onKeyPressed = txtLabnoOnKeyPressedAtShown;
                            txtLabno.onKeyReleased = txtLabnoOnKeyReleasedAtShown;
                            txtLabno.onKeyTyped = txtLabnoOnKeyTypedAtShown;
                            txtLabno.promptText = "Diagnosis No...";
                            txtLabno.editable = false;
                            txtLabno.font = Arial_Bold_14;
                            imglabno.visible = false;
                            imglabno.layoutY = 34.0;
                            imglabno.onMouseClicked = imglabnoOnMouseClickedAtShown;
                            imglabno.image = image3;
                            lblDocid.visible = true;
                            lblDocid.layoutY = 34.0;
                            lblDocid.text = "Diagnostic ID";
                            lblDocid.font = Arial_12;
                            lblDocid.textFill = DarkGray;
                            editdiagnosisno.visible = true;
                            editdiagnosisno.layoutY = 34.0;
                            editdiagnosisno.onKeyPressed = editdiagnosisnoOnKeyPressedAtShown;
                            editdiagnosisno.onKeyReleased = editdiagnosisnoOnKeyReleasedAtShown;
                            editdiagnosisno.promptText = "Select Diagnosis No";
                            editdiagnosisno.font = Arial_14;
                            imgeditpatient.visible = true;
                            imgeditpatient.layoutY = 34.0;
                            imgeditpatient.onMouseClicked = imgeditpatientOnMouseClickedAtShown;
                            imgeditpatient.image = image3;
                            lblPatientName.layoutY = 64.0;
                            __layoutInfo_lblPatientName.width = 100.0;
                            lblPatientName.text = "Patient Name";
                            txtPatientName.layoutY = 62.0;
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressedAtShown;
                            txtPatientName.onKeyReleased = txtPatientNameOnKeyReleasedAtShown;
                            txtPatientName.promptText = "Patientname or Mobile No or  UHID";
                            imgPatientName.visible = true;
                            imgPatientName.layoutY = 62.0;
                            imgPatientName.onMouseClicked = imgPatientNameOnMouseClickedAtShown;
                            imgPatientName.image = image3;
                            txtDoctorName.visible = true;
                            txtDoctorName.disable = false;
                            txtDoctorName.layoutY = 94.0;
                            txtDoctorName.styleClass = "text-box";
                            txtDoctorName.onKeyPressed = txtDoctorNameOnKeyPressedAtShown;
                            txtDoctorName.onKeyReleased = txtDoctorNameOnKeyReleasedAtShown;
                            txtDoctorName.promptText = "";
                            txtDoctorName.editable = true;
                            txtDoctorName.font = Arial_12;
                            lblDoctorName.visible = true;
                            lblDoctorName.layoutY = 94.0;
                            lblDoctorName.text = "Doctor Name";
                            label3.visible = false;
                            label3.layoutY = 30.0;
                            label3.text = "TIN No.";
                            lblSalesCaTIN.visible = false;
                            lblSalesCaTIN.layoutY = 30.0;
                            lblSalesCaTIN.blocksMouse = false;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_Bold_14;
                            txtPrescDate.layoutY = 60.0;
                            txtPrescDate.onKeyPressed = txtPrescDateOnKeyPressedAtShown;
                            txtPrescDate.editable = false;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = true;
                            CashDatePicker.fitWidth = 21.0;
                            CashDatePicker.fitHeight = 21.0;
                            CashDatePicker.preserveRatio = false;
                            txtNextVisit.visible = true;
                            txtNextVisit.layoutY = 95.0;
                            txtNextVisit.onKeyPressed = txtNextVisitOnKeyPressedAtShown;
                            txtNextVisit.font = Arial_12;
                            imgCalendar.visible = true;
                            imgCalendar.layoutY = 95.0;
                            imgCalendar.onMouseClicked = imgCalendarOnMouseClickedAtShown;
                            imgCalendar.image = imgDate;
                            imgCalendar.fitWidth = 21.0;
                            imgCalendar.fitHeight = 21.0;
                            imgDoctorName.visible = true;
                            imgDoctorName.layoutY = 94.0;
                            imgDoctorName.onMouseClicked = imgDoctorNameOnMouseClickedAtShown;
                            imgDoctorName.scaleX = 1.0;
                            imgDoctorName.scaleY = 1.0;
                            imgDoctorName.blocksMouse = true;
                            imgDoctorName.image = image;
                            btnSubstitute.visible = false;
                            btnSubstitute.layoutY = 220.0;
                            __layoutInfo_btnSubstitute.height = 20.0;
                            btnSubstitute.text = "Add Substitute Drug";
                            lblMedicineName.visible = false;
                            lblMedicineName.layoutY = 152.0;
                            lblMedicineName.text = "Medicine Name";
                            lblMedicineName.font = Arial_14;
                            lblMedicineName.textFill = DarkGray;
                            txtMedicineName.visible = false;
                            txtMedicineName.layoutY = 175.0;
                            __layoutInfo_txtMedicineName.height = 35.0;
                            txtMedicineName.onKeyPressed = txtMedicineNameOnKeyPressedAtShown;
                            txtMedicineName.onKeyReleased = txtMedicineNameOnKeyReleasedAtShown;
                            txtMedicineName.promptText = "";
                            txtMedicineName.selectOnFocus = true;
                            txtMedicineName.font = Arial_20;
                            imgMedicineName.visible = false;
                            imgMedicineName.layoutY = 175.0;
                            imgMedicineName.onMouseClicked = imgProductCodeOnMouseClickedAtShown;
                            imgMedicineName.blocksMouse = true;
                            imgMedicineName.image = image;
                            imgMedicineName.fitWidth = 25.0;
                            imgMedicineName.fitHeight = 34.5;
                            labelAvlQty.visible = false;
                            labelAvlQty.layoutY = 152.0;
                            __layoutInfo_labelAvlQty.width = 100.0;
                            labelAvlQty.text = "Available Qty";
                            labelAvlQty.font = Arial_14;
                            labelAvlQty.textFill = DarkGray;
                            txtAvlQty.visible = false;
                            txtAvlQty.layoutY = 150.0;
                            __layoutInfo_txtAvlQty.height = 35.0;
                            txtAvlQty.styleClass = "borderless-text-box";
                            txtAvlQty.onKeyPressed = txtAvlQtyOnKeyPressedAtShown;
                            txtAvlQty.editable = false;
                            txtAvlQty.font = Arial_20;
                            btnDrugSpec.visible = false;
                            btnDrugSpec.layoutY = 220.0;
                            __layoutInfo_btnDrugSpec.height = 30.0;
                            btnDrugSpec.onMouseClicked = btnDrugSpecOnMouseClickedAtShown;
                            btnDrugSpec.text = "Drug Specifications [F9]";
                            btnDrugSpec.font = Arial_12;
                            txtDoseType.visible = false;
                            txtDoseType.layoutY = 175.0;
                            __layoutInfo_txtDoseType.height = 23.0;
                            txtDoseType.onKeyPressed = txtDoseTypeOnKeyPressedAtShown;
                            txtDoseType.onKeyReleased = txtDoseTypeOnKeyReleasedAtShown;
                            txtDoseType.font = Arial_12;
                            imgDoseType.visible = false;
                            imgDoseType.layoutY = 176.25;
                            imgDoseType.onMouseClicked = imgDosTypeOnMouseClickedAtShown;
                            imgDoseType.blocksMouse = true;
                            imgDoseType.image = image;
                            choiceboxDosType.visible = false;
                            choiceboxDosType.layoutY = 175.0;
                            choiceboxDosType.items = [ "S.I.D", "B.I.D", "T.I.D", "Q.I.D", ];
                            listProductName.visible = false;
                            listProductName.layoutY = 85.0;
                            listProductName.items = null;
                            lblAge.visible = true;
                            lblAge.layoutY = 34.0;
                            __layoutInfo_lblAge.width = 80.0;
                            lblAge.text = "Age";
                            lblAge.font = Arial_12;
                            lblAge.textFill = DarkGray;
                            lblDiagnosis.visible = true;
                            lblDiagnosis.layoutY = 64.0;
                            lblDiagnosis.text = "Diagnostic Type";
                            lblDiagnosis.font = Arial_12;
                            lblDiagnosis.textFill = DarkGray;
                            txtAge.visible = true;
                            txtAge.managed = true;
                            txtAge.layoutY = 34.0;
                            txtAge.onKeyPressed = txtAgeOnKeyPressedAtShown;
                            txtAge.promptText = "";
                            txtAge.font = Arial_12;
                            txtDiagnosis.visible = true;
                            txtDiagnosis.layoutY = 62.0;
                            txtDiagnosis.onKeyPressed = txtDiagnosisOnKeyPressedAtShown;
                            txtDiagnosis.onKeyReleased = txtDiagnosisOnKeyReleasedAtShown;
                            txtDiagnosis.font = Arial_12;
                            imgDiagnosis.visible = true;
                            imgDiagnosis.layoutY = 62.0;
                            imgDiagnosis.onMouseClicked = imgDiagnosisOnMouseClickedAtShown;
                            imgDiagnosis.image = image3;
                            lblGender.layoutY = 128.0;
                            lblGender.text = "Gender";
                            txtGender.visible = false;
                            txtGender.layoutY = 130.0;
                            txtGender.styleClass = "text-box";
                            txtGender.onKeyReleased = txtGenderOnKeyReleased;
                            txtGender.promptText = "";
                            txtGender.selectOnFocus = false;
                            txtGender.editable = false;
                            rdoMale.visible = true;
                            rdoMale.layoutY = 128.0;
                            rdoMale.onKeyPressed = rdoMaleOnKeyPressedAtShown;
                            rdoMale.text = "Male";
                            rdoMale.toggleGroup = toggleGroup3;
                            rdoMale.selected = true;
                            rdoFemale.visible = true;
                            rdoFemale.layoutY = 128.0;
                            rdoFemale.onKeyPressed = rdoFemaleOnKeyPressedAtShown;
                            rdoFemale.text = "Female";
                            rdoFemale.toggleGroup = toggleGroup3;
                            rdoTrans.visible = true;
                            rdoTrans.layoutY = 128.0;
                            rdoTrans.onKeyPressed = rdoTransOnKeyPressedAtShown;
                            rdoTrans.text = "Transgender";
                            rdoTrans.toggleGroup = toggleGroup3;
                            lblWeight.layoutY = 62.0;
                            lblWeight.text = "Date";
                            lblTemperature.visible = false;
                            lblTemperature.layoutY = 64.0;
                            lblTemperature.text = "Temperature";
                            lblBloodSugar.layoutY = 96.0;
                            lblBloodSugar.text = "Test Name";
                            lblBloodPressure.visible = true;
                            lblBloodPressure.layoutY = 96.0;
                            lblBloodPressure.text = "Presc Date";
                            txtWeight.visible = false;
                            txtWeight.layoutY = 30.0;
                            __layoutInfo_txtWeight.height = 22.0;
                            txtWeight.styleClass = "text-box";
                            txtWeight.onKeyPressed = txtWeightOnKeyPressedAtShown;
                            txtWeight.text = "";
                            txtWeight.promptText = "";
                            txtWeight.editable = true;
                            txtWeight.font = Arial_12;
                            txtTemperature.visible = false;
                            txtTemperature.managed = true;
                            txtTemperature.layoutY = 62.0;
                            txtTemperature.styleClass = "text-box";
                            txtTemperature.onKeyPressed = txtTemperatureOnKeyPressedAtShown;
                            txtTemperature.text = "";
                            txtTemperature.promptText = "";
                            txtTemperature.selectOnFocus = false;
                            txtTemperature.editable = true;
                            txtBloodSugar.visible = true;
                            txtBloodSugar.layoutY = 94.0;
                            txtBloodSugar.styleClass = "text-box";
                            txtBloodSugar.onKeyPressed = txtBloodSugarOnKeyPressedAtShown;
                            txtBloodSugar.onKeyReleased = txtBloodSugarOnKeyReleasedAtShown;
                            txtBloodSugar.text = "";
                            txtBloodSugar.promptText = "";
                            txtBloodSugar.selectOnFocus = false;
                            txtBloodSugar.editable = true;
                            txtBloodSugar.font = Arial_12;
                            imgBloodSugar.visible = true;
                            imgBloodSugar.layoutY = 94.0;
                            imgBloodSugar.onMouseClicked = imgBloodSugarOnMouseClickedAtShown;
                            imgBloodSugar.image = image3;
                            txtBloodPressure.visible = false;
                            txtBloodPressure.layoutY = 95.0;
                            txtBloodPressure.styleClass = "text-box";
                            txtBloodPressure.onKeyPressed = txtBloodPressureOnKeyPressedAtShown;
                            txtBloodPressure.effect = null;
                            txtBloodPressure.promptText = "";
                            txtBloodPressure.selectOnFocus = false;
                            txtBloodPressure.editable = true;
                            txtBloodPressure.font = Arial_12;
                            PrescDatePicker.visible = false;
                            PrescDatePicker.layoutY = 95.0;
                            PrescDatePicker.onMouseClicked = PrescDatePickerOnMouseClickedAtShown;
                            PrescDatePicker.blocksMouse = true;
                            PrescDatePicker.fitWidth = 21.0;
                            PrescDatePicker.fitHeight = 21.0;
                            lbl_Days.visible = false;
                            lbl_Days.layoutY = 152.0;
                            lbl_Days.text = "Days";
                            lbl_Days.font = Arial_14;
                            lbl_Days.textFill = DarkGray;
                            lblMorning.visible = false;
                            lblMorning.layoutY = 152.0;
                            lblMorning.text = "Morning";
                            lblMorning.font = Arial_14;
                            lblAfternoon.visible = false;
                            lblAfternoon.layoutY = 152.0;
                            lblAfternoon.text = "Afternoon";
                            lblAfternoon.font = Arial_14;
                            lblAfternoon.textFill = DarkGray;
                            lblEvening.visible = false;
                            lblEvening.layoutY = 152.0;
                            lblEvening.text = "Evening";
                            lblEvening.font = Arial_14;
                            lblNight.visible = false;
                            lblNight.opacity = 1.0;
                            lblNight.layoutY = 152.0;
                            lblNight.text = "Night";
                            lblNight.font = Arial_14;
                            lblNight.textFill = DarkGray;
                            lblFood.visible = false;
                            lblFood.layoutY = 200.0;
                            lblFood.text = "BF/AF";
                            lblFood.font = Arial_12;
                            lblFood.textFill = DarkGray;
                            cboFood.visible = false;
                            cboFood.layoutY = 220.0;
                            cboFood.onKeyPressed = cboFoodOnKeyPressedAtShown;
                            cboFood.items = [ "AF", "BF", ];
                            lblDose.visible = false;
                            lblDose.layoutY = 200.0;
                            lblDose.text = "Dose/ML";
                            lblDose.font = Arial_12;
                            labelQty.visible = false;
                            labelQty.layoutY = 200.0;
                            __layoutInfo_labelQty.width = 100.0;
                            labelQty.text = "Total Medications";
                            labelQty.font = Arial_12;
                            labelQty.textFill = DarkGray;
                            txtDays.visible = false;
                            txtDays.layoutY = 175.0;
                            txtDays.onKeyPressed = txtDaysOnKeyPressedAtShown;
                            txtDays.onKeyReleased = txtDaysOnKeyReleasedAtShown;
                            txtDays.text = "1";
                            txtDays.font = Arial_12;
                            txtMorning.visible = false;
                            txtMorning.layoutY = 175.0;
                            txtMorning.styleClass = "text-box";
                            txtMorning.onKeyPressed = txtMorningOnKeyPressedAtShown;
                            txtMorning.text = "0";
                            txtMorning.promptText = "";
                            txtMorning.selectOnFocus = true;
                            txtMorning.editable = true;
                            txtAfternoon.visible = false;
                            txtAfternoon.layoutY = 175.0;
                            txtAfternoon.onKeyPressed = txtAfternoonOnKeyPressedAtShown;
                            txtAfternoon.text = "0";
                            txtAfternoon.font = Arial_12;
                            txtEvening.visible = false;
                            txtEvening.layoutY = 175.0;
                            txtEvening.styleClass = "text-box";
                            txtEvening.onKeyPressed = txtEveningOnKeyPressedAtShown;
                            txtEvening.text = "0";
                            txtEvening.promptText = "";
                            txtEvening.selectOnFocus = true;
                            txtEvening.editable = true;
                            txtNight.visible = false;
                            txtNight.layoutY = 175.0;
                            txtNight.onKeyPressed = txtNightOnKeyPressedAtShown;
                            txtNight.text = "0";
                            txtNight.editable = true;
                            txtNight.font = Arial_12;
                            txtDose.visible = false;
                            txtDose.layoutY = 220.0;
                            txtDose.onKeyPressed = txtDoseOnKeyPressedAtShown;
                            txtQty.visible = false;
                            txtQty.layoutY = 220.0;
                            __layoutInfo_txtQty.height = 30.0;
                            txtQty.onKeyPressed = txtQtyOnKeyPressedAtShown;
                            txtQty.onKeyTyped = txtQtyOnKeyTypedAtShown;
                            txtQty.font = Arial_18;
                            listDoctorName.visible = false;
                            listDoctorName.layoutX = 0.0;
                            listDoctorName.layoutY = 50.0;
                            listDoctorName.items = null;
                            listPatientName.visible = false;
                            listPatientName.cursor = null;
                            listPatientName.layoutY = 80.0;
                            listPatientName.styleClass = "list-view";
                            listPatientName.effect = null;
                            listPatientName.items = null;
                            listSalesCash.visible = false;
                            listSalesCash.onKeyPressed = listSalesCashOnKeyPressedAtShown;
                            listDoseType.visible = false;
                            txtPrescriptionId.visible = false;
                            txtPrescriptionId.layoutY = 40.0;
                            btnpatienttest.visible = false;
                            btnpatienttest.layoutY = 84.0;
                            __layoutInfo_btnpatienttest.height = 30.0;
                            btnpatienttest.text = "Patient Symptoms";
                            btnpatienttest.font = Arial_Bold_12;
                            btnpatienttest.action = btnPatientSymptomsActionAtShown;
                            panelTopSection.visible = true;
                            panelTopSection.layoutX = 0.0;
                            panelTopSection.layoutY = 14.0;
                            panelTopSection.onMouseClicked = panelTopSectionOnMouseClickedAtShown;
                            panelTopSection.focusTraversable = true;
                            txtFee.visible = false;
                            txtFee.onKeyPressed = txtFeeOnKeyPressedAtShown;
                            txtFee.font = Arial_12;
                            lblRemarks.visible = false;
                            lblRemarks.text = "Final Conclusions";
                            lblRemarks.font = Arial_12;
                            imgFinal.visible = false;
                            imgFinal.effect = reflectionEffect;
                            imgFinal.image = imageEdit;
                            btnFinal.visible = false;
                            btnFinal.onKeyPressed = btnFinalOnKeyPressedAtShown;
                            btnFinal.effect = reflectionEffect;
                            btnFinal.text = "Final Conclusion";
                            btnFinal.font = Arial_Bold_14;
                            lblNextVisit.visible = false;
                            lblNextVisit.layoutY = 30.0;
                            lblNextVisit.text = "Presc. Date";
                            lblNextVisit.font = Arial_12;
                            lblFee.visible = false;
                            lblFee.text = "Consultation Fee";
                            lblFee.font = Arial_12;
                            btnFood.visible = false;
                            btnFood.layoutY = 30.0;
                            __layoutInfo_btnFood.height = 30.0;
                            btnFood.onMouseClicked = btnFoodOnMouseClickedAtShown;
                            btnFood.text = "Food Interaction [F1]";
                            btnFood.font = Arial_12;
                            lblnote.visible = true;
                            lblnote.text = "Note : If you want to enter only one range, please enter in the patient max range.";
                            lblnote.font = Arial_14;
                            lblnote.textFill = Red;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutX = 100.0;
                            panelTxtColumn1.layoutY = 440.0;
                            imgPrint.visible = true;
                            imgPrint.image = imagePrint;
                            btnPrint.layoutY = 0.0;
                            btnPrint.onKeyPressed = btnPrintOnKeyPressedAtShown;
                            btnPrint.onKeyReleased = btnPrintOnKeyReleasedAtShown;
                            btnPrint.action = btnPrintActionAtShown;
                            imgSave.visible = true;
                            imgSave.image = imageSave;
                            btnSaveOnly.visible = true;
                            btnSaveOnly.cursor = null;
                            btnSaveOnly.layoutY = 0.0;
                            btnSaveOnly.onKeyPressed = btnSaveOnlyOnKeyPressedAtShown;
                            btnSaveOnly.effect = reflectionEffect;
                            btnSaveOnly.text = "Save [F3]";
                            btnSaveOnly.font = Arial_Bold_14;
                            btnSaveOnly.action = btnSaveOnlyActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.effect = reflectionEffect;
                            imgEdit.image = imageEdit;
                            btnEdit.visible = true;
                            btnEdit.onKeyPressed = btnEditOnKeyPressedAtShown;
                            btnEdit.effect = reflectionEffect;
                            btnEdit.text = "Edit [F6]";
                            btnEdit.font = Arial_Bold_14;
                            btnEdit.action = btnEditActionAtShown;
                            imgReset.visible = true;
                            imgReset.image = imageReset;
                            btnSalesCaReset.layoutY = 0.0;
                            btnSalesCaReset.onKeyPressed = btnSalesCaResetOnKeyPressedAtShown;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnCancel.visible = true;
                            btnCancel.effect = reflectionEffect;
                            btnCancel.text = "Cancel [F8]";
                            btnCancel.font = Arial_Bold_14;
                            btnCancel.action = btnCancelActionAtShown;
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.layoutX = 0.0;
                            listView.layoutY = 0.0;
                            listView.onKeyPressed = listViewOnKeyPressedAtShown;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            __layoutInfo_LabelRemoveRow.width = 120.0;
                            __layoutInfo_LabelRemoveRow.height = 20.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            panelCalender.visible = true;
                            panelCalender.managed = true;
                            panelCalender.layoutX = 0.0;
                            panelCalender.layoutY = 0.0;
                            panelCalender.onMouseClicked = panelCalenderOnMouseClickedAtShown;
                            panelCalender.blocksMouse = true;
                            rectButton.visible = false;
                            rectButton.managed = true;
                            rectButton.layoutY = 520.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            panelAlert.onMouseClicked = panelAlertOnMouseClickedAtShown;
                            panel.visible = true;
                            panel.onMouseClicked = panelOnMouseClickedAtShown;
                            panel.blocksMouse = false;
                            panelPopUp.visible = true;
                            panelPopUp.layoutY = 45.0;
                            panelPopUp.onMouseClicked = panelPopUpOnMouseClickedAtShown;
                            panelPopUp2.visible = false;
                            txtRemarks.visible = false;
                            txtRemarks.layoutY = 200.0;
                            __layoutInfo_txtRemarks.width = 285.0;
                            __layoutInfo_txtRemarks.height = 50.0;
                            txtRemarks.onKeyPressed = txtRemarksOnKeyPressedAtShown;
                            txtRemarks.font = Arial_12;
                            panelPopUp3.visible = false;
                            panelDiagnostictype.visible = true;
                            panelTestname.visible = true;
                            panel2.visible = true;
                            MainPanel.visible = true;
                            MainPanel.onMouseClicked = MainPanelOnMouseClickedAtShown;
                            MainPanel.blocksMouse = false;
                            MainPanel.focusTraversable = true;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ MainPanel, ]
    }
    // </editor-fold>//GEN-END:main

    function editdiagnosisnoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getPatientList12(event);
        if (event.code == KeyCode.VK_DOWN or event.code == KeyCode.VK_ENTER and listPatientName.items != null) {
                listPatientName.requestFocus();
                listPatientName.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listPatientName.visible = false;
                editdiagnosisno.requestFocus();
            }
         }

    function editdiagnosisnoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {

        }
        shortcut(event);
         }

    function txtLabnoOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
         getPatientList2();
         }

    function txtLabnoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
         getPatientList2();
        if (event.code == KeyCode.VK_DOWN) {
            listPatientName.requestFocus();
            listPatientName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listPatientName.visible = false;
            txtLabno.requestFocus();
        }
         }

    function imglabnoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getPatientList2();
         }

    function imgeditpatientOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {        
        getPatientList1();
         }

    function btnEditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       editKeyPressed();
         }

    function btnFinalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         panel.disable=true;
         txtRemarks.visible=true;
         }

    function imgBloodSugarOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if(not listView.visible){
        listView.layoutX = txtBloodSugar.layoutX;
        listView.layoutY = txtBloodSugar.layoutY + 35;
        listH = 0.0;
        listW = txtBloodSugar.width;
        var formulation: List = new ArrayList();
        listView.visible = true;
        var size = listView.items.size();
        if (not listView.items.isEmpty()) {
            for (i in [0..<size])
                listView.items[i] = null;
                txtBloodSugar.requestFocus();
        }
        var dia:String=txtDiagnosis.rawText;
        formulation = commonController.getListItems("", dia, "TEE");
        listView.clearSelection();
        listView.items = formulation.toArray();
        listView.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtBloodSugar.text = "{listView.selectedItem}";
                        listView.visible = false;
                        if (txtBloodSugar.rawText == "Others") {
                            if(txtDiagnosis.rawText !="" or txtDiagnosis.text != null ){
                                var dia : String;
                                dia=txtDiagnosis.rawText;
                                popFormulation(dia);
                                }
                                else{
                                    txtBloodSugar.text="";
                                     FXinfo("Please Select Diagnostic Type.");
                                    }
                        }
                        gettablevalue();
                        txtBloodSugar.text="";
                        txtBloodSugar.requestFocus();
                         
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listView.selectedIndex == 0) {
                            listView.selectFirstRow();
                            txtBloodSugar.text="";
                        txtBloodSugar.requestFocus();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listView.visible = false;
                        txtBloodSugar.text="";
                        txtBloodSugar.requestFocus();
                    }
                };
        listView.onMouseClicked = function(e) {
                    txtBloodSugar.text = "{listView.selectedItem}";
                    listView.visible = false;
                    if (txtBloodSugar.rawText == "Others") {
                        if(txtDiagnosis.rawText !="" or txtDiagnosis.text != null ){
                                var dia : String;
                                dia=txtDiagnosis.rawText;
                                popFormulation(dia);
                                }
                                else{
                                     FXinfo("Please Select Diagnostic Type.");
                                    }
                    }
                     gettablevalue();
                     txtBloodSugar.text="";
                    txtBloodSugar.requestFocus();
                }

        var height: Integer = 0;
        if (listView.items.size() < 10) {
            height = listView.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
        txtBloodSugar.text="";
        txtBloodSugar.requestFocus();
        }
        else{
            listView.visible=false;
            txtBloodSugar.text="";
            txtBloodSugar.requestFocus();
        }
         }


         var existRow : Integer = -1;

         
          function gettablevalue(): Void
       {
          // java.lang.System.out.println("gettablevalue");
         try
         {
               var itemname = txtBloodSugar.rawText.trim();
               var existId:Integer=0;
                if(existRow >= 0)
                {
                   existId = existRow + 2;
                }
                existRow = -1;                
               var freeArr =prescriptionTableObj.setTablevaluesss(itemname,sno,existId);

               if(freeArr == null)
                {
                    txtBloodSugar.requestFocus();
                }
                else
                {
                    txtBloodSugar.requestFocus();
                }

          }
         catch(e:Exception)
              {
               java.lang.System.out.println("add Table Value:{e.getMessage()}");
              }
      }

 function popFormulation(dia:String): Void {
        panelTestname.visible = true;
        Testname.Show();
        Testname.Setdiagnostic(dia);
    }

    function txtBloodSugarOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listView.layoutX = txtBloodSugar.layoutX;
        listView.layoutY = txtBloodSugar.layoutY + 35;
        var n: Integer = 0;
        n = getFormulation(event);
        sar2 = n;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_DOWN) {
            if (n == 0 or txtBloodSugar.rawText.trim() == null or txtBloodSugar.rawText.trim() == "null") {
                txtBloodSugar.text = " ";
                txtBloodSugar.requestFocus();
            }
        } else if (event.code == KeyCode.VK_DOWN ) {
            listView.requestFocus();
             
        }
        
        if (event.code == KeyCode.VK_DOWN ) {
            listView.requestFocus();
            listView.selectFirstRow();

           // txtBloodSugar.requestFocus();
           
                      
        } else if (event.code == KeyCode.VK_ENTER ) {
            listView.visible = false;
            //listView.requestFocus();

        }
         
      /*  if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listView.visible = false;
                txtBloodSugar.requestFocus();
            }*/
        
         }
function getFormulation(event: javafx.scene.input.KeyEvent): Integer {
        var drugBean = new DrugModel1();
        listH = 0.0;

        listW = txtBloodSugar.width;
        var m: Integer = 0;

        var formulationName: List = new ArrayList();
        listView.visible = true;
        var size = listView.items.size();
        if (not listView.items.isEmpty()) {
            for (i in [0..<size])
                listView.items[i] = null;
            txtBloodSugar.requestFocus();
        }
        drugBean.setFormulation(txtBloodSugar.rawText.trim());
        drugBean.setMfr_name(txtDiagnosis.rawText.trim());
//        var commonController: CommonImplements = new CommonController();
        formulationName = commonController.getListItems(drugBean.getFormulation(), drugBean.getMfr_name(), "TEST");

        if (formulationName.size() > 0) {

            m = 5;

            listView.clearSelection();
            listView.items = formulationName.toArray();
            listView.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtBloodSugar.text = "{listView.selectedItem}";
                            listView.visible = false;
                            if (m == 0 or txtBloodSugar.rawText.trim() == null or txtBloodSugar.rawText.trim() == "null") { m = 0; txtBloodSugar.text = ""; }
                            listView.visible = false;
                            if (txtBloodSugar.rawText == "Others") {
                                if(txtDiagnosis.rawText !="" or txtDiagnosis.text != null ){
                                var dia : String;
                                dia=txtDiagnosis.rawText;
                                popFormulation(dia);
                                }
                                else{
                                     FXinfo("Please Select Diagnostic Type.");
                                    }
                            }
                            gettablevalue();
                            txtBloodSugar.text="";
                            txtBloodSugar.requestFocus();
                            listView.visible = false;
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listView.selectedIndex == 0) {
                                listView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listView.visible = false;
                            txtBloodSugar.text="";
                            txtBloodSugar.requestFocus();
                        }
                    };
            listView.onMouseClicked = function(e) {
                        txtBloodSugar.text = "{listView.selectedItem}";
                        if (m == 0 or txtBloodSugar.rawText.trim() == null or txtBloodSugar.rawText.trim() == "null") { m = 0; txtBloodSugar.text = ""; }
                        listView.visible = false;
                        if (txtBloodSugar.rawText == "Others") {
                             if(txtDiagnosis.rawText !="" or txtDiagnosis.text != null ){
                                var dia : String;
                                dia=txtDiagnosis.rawText;
                                popFormulation(dia);
                                }
                                else{
                                     FXinfo("Please Select Diagnostic Type.");
                                    }
                        }
                        gettablevalue();
                        txtBloodSugar.text="";
                        txtBloodSugar.requestFocus();
                        listView.visible = false;
                       // txtNextVisit.requestFocus();
                    }
            var height: Integer = 0;
            if (listView.items.size() < 10) {
                height = listView.items.size();
            } else {
                height = 10;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }

        } else {
            m = 0; listView.visible = false;

        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listView.visible = false;
            if (m == 0 or txtBloodSugar.rawText.trim() == null or txtBloodSugar.rawText.trim() == "null") { m = 0; txtBloodSugar.text = ""; }
        }

        txtBloodSugar.requestFocus();
        return m;
    }
    function imgDiagnosisOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
          try {
            getMName();
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getSpecialist()   = {e.getMessage()}";
            log.debug(msg);
        }
         }

    function listViewOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          if (listView.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listView.selectFirstRow();
        }
         }

    function txtDiagnosisOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
           listPatientName.visible=false;
           getMfrName(event);
        if (event.code == KeyCode.VK_DOWN or event.code == KeyCode.VK_ENTER)
            listView.requestFocus();
         }
         function getMfrName(event: javafx.scene.input.KeyEvent) {
        try {
            getMName();
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listView.visible = false;
                txtDiagnosis.requestFocus();
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getSpecialist()   = {e.getMessage()}";
            log.debug(msg);
        }
    }
    function popManufacturer(): Void {
        panelDiagnostictype.visible = true;
        Diagnostictype.Show();
    }

    function getMName(): Void {
       // if(not listView.visible)
       try{
        var drugBean = new DrugModel1();
        var mfrName: List = new ArrayList();
        listH = 0.0;
        listView.visible = true;
        listView.layoutX = txtDiagnosis.layoutX;
        listView.layoutY = txtDiagnosis.layoutY+35;
        listW = txtDiagnosis.width;
        var size = listView.items.size();
        if (not listView.items.isEmpty()) {
            for (i in [0..<size])
                listView.items[i] = null;
        }
        drugBean.setMfr_name(txtDiagnosis.rawText.trim());
        mfrName = commonController.getListItems(drugBean.getMfr_name(), "", "DIG");
        listView.clearSelection();
        listView.items = mfrName.toArray();
        listView.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtDiagnosis.text = "{listView.selectedItem}";
                        listView.visible = false;
                        if (txtDiagnosis.rawText == "Others") {
                          //  java.lang.System.out.println("Others: ""{txtDiagnosis.rawText}");
                            popManufacturer();
                        }
                        txtBloodSugar.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listView.selectedIndex == 0) {
                            listView.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listView.visible = false;
                        txtAge.requestFocus();
                    }
                };
        listView.onMouseClicked = function(e) {
                    txtDiagnosis.text = "{listView.selectedItem}";
                    listView.visible = false;
                    if (txtDiagnosis.rawText == "Others") {
                      //java.lang.System.out.println("Others list: ""{txtDiagnosis.rawText}");
                            popManufacturer();
                        }
                    txtBloodSugar.requestFocus();
                }
        var height: Integer = 0;
        if (listView.items.size() < 10) {
            height = listView.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
       }
//       else{
//             listView.visible=false;
//
//        }

 catch(ex:Exception) {
            var que = " Class : LabModule   Method: getMName() )    Exception : {ex}";
            log.debug(que);
        }
    }

    function rdoTransOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          if(event.code==KeyCode.VK_ENTER) {
            rdoTrans.selected=true;
            txtAge.requestFocus();
        }else if(event.code == KeyCode.VK_TAB) {
            txtAge.requestFocus();
        }
        shortcut(event);
         }

    function PrescDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         if (not dateFlag) {
            panelCalender.layoutX = fifthCol4-100;
            panelCalender.layoutY = PrescDatePicker.layoutY + txtBloodPressure.height+10.0;
            if (txtPrescDate.text != null) {
                var dat = txtBloodPressure.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                fxCalendar.visible = true;
                dateFlag = true;
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                fxCalendar.visible = true;
                dateFlag = true;
            }
        } else {
            fxCalendar.visible = false;
        }
         }

    function txtLabnoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(btnSaveOnly.text == "Save [F3]"){
       if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtPatientName.requestFocus(); }
        shortcut(event);
       }else if(btnSaveOnly.text == "Update [F7]"){
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {txtLabno.requestFocus(); }
        shortcut(event);
        }
         }

    function btnPatientSymptomsActionAtShown(): Void {
        def ps = PatientSymptoms{};
        delete  panelPopUp2.content;
        insert ps.panelReturnNotes into panelPopUp2.content;
        ps.initShow();
        panelPopUp2.visible = true;
    }

    function imgCalendarOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not nextVisitFlag) {
            panelCalender.layoutX = fifthCol4-100;
            panelCalender.layoutY = imgCalendar.layoutY + txtNextVisit.height+10.0;
            //panelCalender.layoutX = C4LX;
            //panelCalender.layoutY = 220.0;
            if (txtNextVisit.text != null) {
                if(checkDateValid(txtNextVisit.rawText.trim())==1) {
                var dat = txtNextVisit.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
               // fxCalendar.set(d, m, y);// naziya
                fxCalendar.set(y, m, d);
                fxCalendar.visible=true;
                nextVisitFlag=true;
                }
                else {
                   FXinfo("Date of Birth date format or the date and month values are incorrect. Please check.");
                   txtNextVisit.requestFocus();
                   fxCalendar.visible=true;
                   nextVisitFlag=true;
                }
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                fxCalendar.visible=true;
                nextVisitFlag=true;
            }            
        } else {
            fxCalendar.visible = false;
        }
        }

    function btnFoodOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
       drugSpecification("yes");
     }

    function btnDrugSpecOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
       drugSpecification("no");
    }

    function drugSpecification(foodInteraction:String):Void {
        var genericName = commonController.getQueryValue("SELECT  genericname from drugtable where concat(itemname,'_',dosage,' |',formulation)='{txtMedicineName.rawText.trim()}' limit 1");
        if(txtMedicineName.rawText.trim().equals("")) {
          FXinfo("Please select the Medicine name");
        }
        else if(genericName.equals("")) {
          FXinfo("Generic Name details not available for this medicine");
        }
        else {
        ds = new DrugSpecifications();
        ds.loadSpecifications(txtMedicineName.rawText.trim(),foodInteraction);
        ds.setVisible(true);
        }
    }

    function txtDiagnosisOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDiagnosis.style = mandatory;
        listPatientName.visible=false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtBloodSugar.requestFocus(); }
        shortcut(event);

       /* if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //rdoMale.requestFocus();
            txtBloodSugar.requestFocus();
        } else if(event.shiftDown and event.code == KeyCode.VK_TAB){
            //txtAge.requestFocus();
            txtBloodSugar.requestFocus();
        }
        shortcut(event); */
        }

    function txtDoseTypeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            listDoseType.visible = false;
            txtDays.requestFocus();
        }
        shortcut(event);
    }

    function txtDoseTypeOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getDosageTypes();
        if (event.code == KeyCode.VK_DOWN) {
            listDoseType.requestFocus();
            listDoseType.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listDoseType.visible = false;
            txtDoseType.requestFocus();
        }
        shortcut(event);
    }

    function imgDosTypeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {        
        getDosageTypes();
    }
    function backKeypressed () : Void {
       // txtLabno.requestFocus();
        txtPatientName.requestFocus();
       
         txtLabno.editable=false;
         imglabno.visible=false;
         
         editdiagnosisno.visible=true;
         imgeditpatient.visible=true;
         lblDocid.visible=true;
         txtDoctorName.text="";
         resetValues();
        txtLabno.text = "";
        editdiagnosisno.text= "";

        srCode = itemCode();
        if (srCode == "") {
            srCode = "DT0000001";
        }
        txtLabno.text = srCode;

        btnEdit.text = "Edit [F6]";
        btnCancel.text = "Cancel [F8]";
        btnSaveOnly.text = "Save [F3]";
        imgCancel.image = imageCancel;
        imgEdit.image = imageEdit;
        //resetValues();
       // txtDoctorName.text = "{commonController.getQueryValue("select doctor_name FROM prescription_maintenance order by id desc limit 1;")}";
        txtPatientName.requestFocus();
    }

    function editKeyPressed() : Void {
        txtLabno.editable = true;
        txtLabno.text="";
        imglabno.visible = true;
       // java.lang.System.out.println("inside editKeyPressed");
        btnEdit.text = "Delete [F5]";
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        btnCancel.text = "Back [Ctrl+Left]";
        btnSaveOnly.text = "Update [F7]";
       // java.lang.System.out.println("edit ={btnEdit.text}");
        editdiagnosisno.visible=true;
        txtLabno.visible=true;
        imgeditpatient.visible=true;
         if(btnSaveOnly.text == "Update [F7]")
       {
        editdiagnosisno.visible=false;
        imgeditpatient.visible=false;
        lblDocid.visible=false;
       }
       
        resetValues();
       // pd = new PrescriptionDetails(prescriptionTable as JTable,"PrescriptionTable1");
       // pd.setVisible(true);
       // pd.setVisible(false);
       // var isVisible = bind pd.isVisible() on replace{
          //  if(not isVisible and not pd.isLoaded ){
              //  backKeypressed();
          //  }
            
       // }
    }

    function deleteKeyPressed() :Void {
        if(txtPrescriptionId.text.equals("")) {
            FXinfo("Please select the prescription number to delete");
        }
        else {
        var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "Practice Management");
        var a = bind cn.staus;
        if (a) {
            var insert1:Boolean = prescriptionController.deleteRecord(txtPrescriptionId.text);
            if(insert1.equals(true)) {
            FXalert(5);
            resetValues();
            }
       }
       symp.clear();
       PatientSymptoms.selSymptoms.clear();
       }
    }

    function btnCancelActionAtShown(): Void {
        /*if(btnCancel.text.equals("Back [Ctrl+Left]")) {
            backKeypressed();
        }
        else {
            panel.visible = false;
        }*/
        panel.visible = false;
       /* if (btnCancel.text == "Back [Ctrl+Left]") {
            back();
        } else if (btnCancel.text == "Cancel [F8]") {
           cancel();
        }*/
        }

    function btnEditActionAtShown(): Void {
        if(btnEdit.text.equals("Edit [F6]")) {
            editKeyPressed();
        }
        else {
            deleteKeyPressed();
        }
        }


    function txtNextVisitOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //btnSaveOnly.requestFocus();
            rdoMale.requestFocus();

        }
        shortcut(event);
         }

    function txtFeeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtNextVisit.requestFocus();
        }
        shortcut(event);
         }

    function txtRemarksOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtFee.requestFocus();
        }
        shortcut(event);
         }

    function txtDoseOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtQty.requestFocus(); 
        }
        shortcut(event);
         }

    function cboFoodOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDose.requestFocus(); 
        }
        shortcut(event);
         }

    function txtDaysOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
              /*if(getValid()[0]==10) {
                txtQty.text = ((Integer.parseInt(txtMorning.rawText.trim())+ Integer.parseInt(txtAfternoon.rawText.trim())+
                Integer.parseInt(txtEvening.rawText.trim())+Integer.parseInt(txtNight.rawText.trim()))*Integer.parseInt(txtDays.rawText.trim())).toString();
               }*/
               if(event.code == KeyCode.VK_ENTER){
                cboFood.requestFocus();
               }
         }        
         shortcut(event);
    }                           

    function txtDaysOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        
    }

    function txtNightOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
             setDoseType();
            cboFood.requestFocus();
        }
        shortcut(event);
         }

    function txtEveningOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            setDoseType();
            txtNight.requestFocus();
            txtNight.selectOnFocus;
        }
        shortcut(event);
         }

    function txtAfternoonOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
             setDoseType();
            txtEvening.requestFocus();
            txtEvening.selectOnFocus;
        }
        shortcut(event);
         }

    function txtMorningOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {           
            setDoseType();
            txtAfternoon.requestFocus();
            txtAfternoon.selectOnFocus;
        }
        shortcut(event);
         }

    function txtBloodPressureOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       if (event.code == KeyCode.VK_ENTER) { txtPatientName.requestFocus(); }
        shortcut(event);
       /* if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtMedicineName.requestFocus();
        }
        shortcut(event); */
        }

    function txtTemperatureOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtBloodSugar.requestFocus();
        }
        shortcut(event);
        }

    function rdoFemaleOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER) {
            rdoFemale.selected=true;
            txtAge.requestFocus();
        }else if(event.code == KeyCode.VK_TAB) {
            rdoTrans.requestFocus();
        }
        else if(event.code == KeyCode.VK_TAB) {
            txtAge.requestFocus();
        }
        shortcut(event);
        }

    function rdoMaleOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER) {
            rdoMale.selected=true;
            txtAge.requestFocus();
        }
        else if(event.code == KeyCode.VK_TAB) {
            rdoFemale.requestFocus();
        }
        else if(event.code == KeyCode.VK_TAB) {
            rdoTrans.requestFocus();
        }

        shortcut(event);
        }

    function imgPatientNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtPatientName.style=mandatory;
        getPatientList();
        txtAge.requestFocus();
      }

    
    function txtDoctorNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getDoctorList();
        if (event.code == KeyCode.VK_DOWN) {
            listDoctorName.requestFocus();
            listDoctorName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listDoctorName.visible = false;
            txtDoctorName.text="";
            txtDoctorName.requestFocus();
        }
        }

    function getDoctorList(): Void {
        //if(not listDoctorName.visible)
        try{
        var listControlObj: ListController = new ListController();
        listDoctorName.visible = true;
        listH = 0.0;
        listDoctorName.layoutX = txtDoctorName.layoutX;
        listDoctorName.layoutY = txtDoctorName.layoutY + txtDoctorName.height + 5;
        listH = listControlObj.listImageControlView(txtDoctorName, listDoctorName, "doctor", 1);
        var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    txtDiagnosis.requestFocus();
                    if (listDoctorName.selectedItem != "New name...") {
                        txtDoctorName.text = "{listDoctorName.selectedItem}";
                        listDoctorName.visible = false;
                        txtDiagnosis.requestFocus();
                    } else {
                        listDoctorName.visible = false;
                    }
                }
             }
            }
//       else{
//         listDoctorName.visible=false;
//         txtDoctorName.text="";
//         txtDoctorName.requestFocus();
//       }

 catch(ex:Exception) {
            var que = " Class : LabModule   Method: getDoctorList() )    Exception : {ex}";
            log.debug(que);
        }
    }

    public function getDosageTypes(): Void {
        if(not listDoseType.visible){
        listDoctorName.visible = false;
        listPatientName.visible = false;
        var listControlObj: ListController = new ListController();        
        listDoseType.visible = true;        
        listH = 0.0;
        listDoseType.layoutX = txtDoseType.layoutX;
        listDoseType.layoutY = txtDoseType.layoutY + txtDoseType.height-1 ;
        listH = listControlObj.listImageControlView(txtDoseType, listDoseType, "DosageTypes", 1);
        var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    setDoseTimePerDay(selS);
                    txtDays.requestFocus();
                    if (listDoseType.selectedItem != "New name...") {
                        txtDoseType.text = "{listDoseType.selectedItem}";
                        listDoseType.visible = false;
                        txtDays.requestFocus();
                    } else {
                        listDoseType.visible = false;
                    }
                }
              }
      }
      else{
          listDoseType.visible = false;
          txtDoseType.requestFocus();
      }
    }
    function setDoseTimePerDay(dType: String ) {
        if(dType=="S.I.D"){
            txtMorning.text = "0";
            txtAfternoon.text = "0";
            txtEvening.text = "0";
            txtNight.text = "1";
        } else if(dType=="B.I.D"){
            txtMorning.text = "1";
            txtAfternoon.text = "0";
            txtEvening.text = "0";
            txtNight.text = "1";
        } else if(dType=="T.I.D"){
            txtMorning.text = "1";
            txtAfternoon.text = "1";
            txtEvening.text = "0";
            txtNight.text = "1";
        } else if(dType=="Q.I.D"){
            txtMorning.text = "1";
            txtAfternoon.text = "1";
            txtEvening.text = "1";
            txtNight.text = "1";
        }
    }
    function setDoseType() {
        if(txtMorning.rawText.trim()=="0" and
            txtAfternoon.rawText.trim()=="0" and
            txtEvening.rawText.trim()=="0" and
            txtNight.rawText.trim()=="1"){
                txtDoseType.text = "S.I.D";
        } else if(txtMorning.rawText.trim()=="1" and
            txtAfternoon.rawText.trim()=="0" and
            txtEvening.rawText.trim()=="0" and
            txtNight.rawText.trim()=="1"){
                txtDoseType.text = "B.I.D";
        } else if(txtMorning.rawText.trim()=="1" and
            txtAfternoon.rawText.trim()=="1" and
            txtEvening.rawText.trim()=="0" and
            txtNight.rawText.trim()=="1"){
                txtDoseType.text = "T.I.D";
        } else if(txtMorning.rawText.trim()=="1" and
            txtAfternoon.rawText.trim()=="1" and
            txtEvening.rawText.trim()=="1" and
            txtNight.rawText.trim()=="1"){
                txtDoseType.text = "Q.I.D";
        }else {
            txtDoseType.text = "Other";
        }
    }


    function panelCalenderOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
     }

    function panelAlertOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
    }
    function panelPopUpOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
         }

    function MainPanelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
     }

    function panelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
     }
    function panelTopSectionOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
    }
    function listFalse():Void {
        listDoctorName.visible=false;
        listPatientName.visible=false;
        listProductName.visible=false;
        listDoseType.visible=false;
    }
    function rectangleOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         listFalse();
    }

    function btnSalesCaResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
              txtPatientName.requestFocus();
        }
        shortcut(event);
    }

    
    function txtAgeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorName.requestFocus();
        }
        shortcut(event);
    }

     function txtAvlQtyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
      shortcut(event);
         }
     function btnSaveOnlyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            savePrescription(0);
        }shortcut(event);
    }
   function txtQtyOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (NumberUtils.isNumeric(txtQty)) {
        }
    }

    function getValid():Double[] {
        var validValues:Double[];
        var valid:Validation = new Validation();
        //validValues[0]=valid.getDecimalValid(txtMorning.rawText.trim(), 1, 4);
        //validValues[1]=valid.getDecimalValid(txtAfternoon.rawText.trim(), 1, 4);
        //validValues[2]=valid.getDecimalValid(txtEvening.rawText.trim(), 1, 4);
        //validValues[3]=valid.getDecimalValid(txtNight.rawText.trim(), 1, 4);
        validValues[0]=valid.getDecimalValid(txtDays.rawText.trim(), 1, 4);
        return validValues;
    }
    
    function addTableItem(): Void {
        var valid = new Validation();
        var enterQtyString: String = txtQty.rawText;
        var enterQty: Double = 0.0;
        if (enterQtyString != null and enterQtyString != "" and enterQtyString != "null") {
            enterQty = Double.parseDouble(enterQtyString);
        }
        var prescriptionItems=[txtMedicineName.rawText.trim(),txtMorning.rawText.trim(),txtAfternoon.rawText.trim(),txtEvening.rawText.trim(),txtNight.rawText.trim(),
        cboFood.selectedItem.toString(),txtDose.rawText.trim(),txtQty.rawText.trim(),txtDays.rawText.trim(),""];
        if(txtMedicineName.rawText.trim().length() > 1) {
            productList=commonController.getQueryValue("select upper(concat(itemname,'_',dosage,' |',formulation)) as itemname  from drugtable where dru_flag_id<>3",1);
        }
        if(txtMedicineName.rawText.trim().equals("")) {
            FXinfo("Please enter the medicine Name");
            txtMedicineName.requestFocus();
        }
        else if(not productList.contains(txtMedicineName.rawText.trim().toUpperCase())) {
            FXinfo("The entered medicine name not available in list");
            txtMedicineName.requestFocus();
        }
        /*else if(getValid()[0]!=10) {
            FXinfo("The value entered in Morning is not valid");
            txtMorning.requestFocus();
        }
        else if(getValid()[1]!=10) {
            FXinfo("The value entered in Afternoon is not valid");
            txtAfternoon.requestFocus();
        }
        else if(getValid()[2]!=10) {
            FXinfo("The value entered in Evening is not a valid");
            txtEvening.requestFocus();
        }
        else if(getValid()[3]!=10) {
            FXinfo("The value entered in Night is not a valid");
            txtNight.requestFocus();
        }*/
          else if(getValid()[0]!=10) {
            FXinfo("The value entered in Days is not a valid");
            txtDays.requestFocus();
        }
        else if(txtDose.rawText.trim().length() > 15) {
            FXinfo("Dose/ml cannot be more than 15 characters");
            txtDose.requestFocus();
        }
        else if(valid.getDecimalValid(txtQty.rawText.trim(), 1, 3)!=10 or txtQty.rawText.trim()=="0") {
            FXinfo("The value entered in Total Medications is not valid",txtQty);
            txtQty.requestFocus();
        }
        else if(checkDrugInteraction()==1) {
                var cn: ConfirmDialogBox1 = new ConfirmDialogBox1(0, "Practice Management","<html>Item Name : {txtMedicineName.rawText.trim()} has interaction effects <br> with  already added items.Click on details button to view. <br> Click on yes to add the items anyway.<html>",msgHeader,txtMedicineName.rawText.trim(),DrugSpecModel);
                if(cn.staus) {
                    prescriptionTableObj.setTablevalues(prescriptionItems);
                    txtMedicineName.text = "";
                    txtAvlQty.text = "";
                    txtQty.text = "";
                    txtMorning.text = "0";
                    txtAfternoon.text = "0";
                    txtEvening.text = "0";
                    txtNight.text = "0";
                    txtDays.text = "1";
                    txtDose.text = "";
                    updateValues();
                }
                msgHeader="";
                txtMedicineName.requestFocus();
        }
        else {
                prescriptionTableObj.setTablevalues(prescriptionItems);
                txtMedicineName.text = "";
                txtAvlQty.text = "";
                txtQty.text = "";
                txtMorning.text = "0";
                txtAfternoon.text = "0";
                txtEvening.text = "0";
                txtNight.text = "0";
                txtDays.text = "1";
                txtDose.text = "";
                updateValues();
                txtMedicineName.requestFocus();
        }        
    }
    
    var msgHeader:String;
    var interactionDesc:String;    
    var itemMap = new HashMap();
    var DrugSpecModel;
    
    function checkDrugInteraction() :Integer {
        var d:Integer;
        try {
            //Generic Name list from prescription table
            var tableItems:List = prescriptionTableObj.getTableValues();
            var tablegenericList = new ArrayList();
            itemMap = new HashMap();
            var GenericList = new ArrayList();
            for(i in [0..<tableItems.size()]) {
                var prescModel = new PrescriptionModel();
                prescModel=tableItems.get(i) as PrescriptionModel;
                var tableGenericNames = commonController.getQueryValue("SELECT  genericname from drugtable where concat(itemname,'_',dosage,' |',formulation)='{prescModel.getMedicineName()}' limit 1");
                var tableGenericName = tableGenericNames.split(",");
                for(j in [0..<tableGenericName.length]) {
                    if(not tableGenericName[j].equals("") and not tablegenericList.contains(tableGenericName[j]))
                    tablegenericList.add(tableGenericName[j].toUpperCase());
                    itemMap.put("{tableGenericName[j].toUpperCase()}", prescModel.getMedicineName());
                }
            }
            //Generic Name list from Text Box
            var txtGenericNames = commonController.getQueryValue("SELECT  genericname from drugtable where concat(itemname,'_',dosage,' |',formulation)='{txtMedicineName.rawText.trim()}' limit 1");
            var txtGenericName = txtGenericNames.split(",");
            var txtGenericList = new ArrayList();
            for(j in [0..<txtGenericName.length]) {
                    if(not txtGenericName[j].equals("") and not txtGenericList.contains(txtGenericName[j]))
                    txtGenericList.add(txtGenericName[j].toUpperCase());
            }

            //Interacting generic name list from drug interaction db table
             for(m in [0.. < txtGenericList.size()]) {
                    for(k in [0.. <tablegenericList.size()]) {
                    var interactionDesc:String = commonController.getQueryValue("select distinct interaction_desc from drug_interaction di where di.generic_name ='{tablegenericList.get(k)}'and di.interacting_generic='{txtGenericList.get(m)}';");
                    var interactionDesc1:String = commonController.getQueryValue("select distinct interaction_desc from drug_interaction di where di.generic_name ='{txtGenericList.get(m)}'and di.interacting_generic='{tablegenericList.get(k)}';");
                    if((interactionDesc.equals("") and interactionDesc1.equals(""))) {
                    }
                    else {                        
                        if(interactionDesc.equals("")) {
                            this.interactionDesc =interactionDesc1;
                        }
                        else {
                            this.interactionDesc = interactionDesc;
                        }
                        d=1;
                        DrugSpecModel = new DrugSpecificationModel();
                        DrugSpecModel.setGenericName(txtGenericList.get(m).toString());
                        DrugSpecModel.setInteractingGenericName(tablegenericList.get(k).toString());
                        DrugSpecModel.setItemName(itemMap.get({tablegenericList.get(k)}).toString());
                        DrugSpecModel.setInteractionDesc(this.interactionDesc);
                        GenericList.add(DrugSpecModel);
                        DrugSpecModel.setDrugSpecificationModelList(GenericList);                        
                        msgHeader = "{msgHeader} \n{tablegenericList.get(k)} :\n{this.interactionDesc}\n";
                    }                                      
                }
            }
        }
        catch(ex:Exception) {
            var que = " Class : LabModule   Method: checkDrugInteraction() )    Exception : {ex}";
            log.debug(que);
        }
        return d;
    }


    function txtQtyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtQty.style=mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB) {
           //sabarish addTableItem();
            }
        shortcut(event);
    }
    function imgProductCodeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {        
          getProductCode(1, event);
 }
    function txtMedicineNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtMedicineName.style=mandatory;
        if (event.code == KeyCode.VK_ENTER) {
             if(txtMedicineName.rawText.trim().equals("")) {
                   FXinfo("Please enter the medicine Name");
                   txtMedicineName.requestFocus();
             } else {
                    var avlQty= {commonController.getQueryValue("select sum(qty) FROM stock_statement s where concat(item_name,' |',formulation)='{txtMedicineName.rawText.trim()}'")};
                    if(avlQty==null) {
                        txtAvlQty.text="0";
                    } else {
                        txtAvlQty.text=avlQty;
                    }
                    txtDoseType.requestFocus();
             }
        }
        else if(event.code == KeyCode.VK_TAB) {
            txtRemarks.requestFocus();
        }
        shortcut(event);
    }
    function txtMedicineNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getProductCode(1, event);
        if (event.code == KeyCode.VK_DOWN) {
            listProductName.requestFocus();
            listProductName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listProductName.visible = false;
            txtMedicineName.requestFocus();
        }
    }

    function itemExists() : Integer {
        var tableItems:List = prescriptionTableObj.getTableValues();
        var a=0;
        for(i in [0..<tableItems.size()]){
            var prescModel = new PrescriptionModel();
            prescModel=tableItems.get(i) as PrescriptionModel;
            if(prescModel.getMedicineName().equals(listProductName.selectedItem)) {
                    a=1;
                    break;
               }
         }
         return a;
    }

    function getProductCode(n: Integer, event: Object): Void {
        try {
            ShowList();
            listH = 0.0;                        
            var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                if(txtMedicineName.rawText.trim().length()>1){
                        productList=commonController.getQueryValue("select upper(concat(itemname,'_',dosage,' |',formulation))  as itemname  from drugtable where concat(itemname,'_',dosage) like concat('{txtMedicineName.rawText.trim()}','%') and dru_flag_id<>3",1);
                        listProductName.visible = true;
                        listProductName.layoutY = txtMedicineName.layoutY +34;
                        var size = listProductName.items.size();
                        if (not listProductName.items.isEmpty()) {
                          for (i in [0..<size])
                                    listProductName.items[i] = null;
                         txtMedicineName.requestFocus();
                }
                }
                if (productList.size() > 0) {
                        listProductName.clearSelection();
                        listProductName.items = productList.toArray();
                        listProductName.onKeyPressed = function(e) {
                        var avlQty= {commonController.getQueryValue("select sum(qty) FROM stock_statement s where concat(item_name,' |',formulation)='{listProductName.selectedItem}'")};
                        if (e.code == KeyCode.VK_ENTER) {                               
                                if(itemExists()==1) {
                                    FXinfo("The selected item already exists in table. please check");
                                }
                                else {
                                     txtMedicineName.text = "{listProductName.selectedItem}";
                                     if(avlQty==null) {
                                        txtAvlQty.text="0";
                                     }
                                     else {
                                        txtAvlQty.text=avlQty;
                                     }
                                     var sam: String = txtMedicineName.rawText.trim();
                                     if (sam == null or sam == "null") {
                                        txtMedicineName.text = "";
                                      }
                                     listProductName.visible = false;
                                     txtDoseType.selectOnFocus;
                                     txtDoseType.requestFocus();
                                     updateValues();
                                }                               
                                
                            } else if (e.code == KeyCode.VK_DOWN) {
                                if (listProductName.selectedIndex == 0) {
                                    listProductName.selectFirstRow();
                                }
                            } else if (e.code == KeyCode.VK_ESCAPE) {
                                listProductName.visible = false;
                                txtMedicineName.requestFocus();
                            }
                        };
                            listProductName.onMouseClicked = function(e) {
                 var avlQty= {commonController.getQueryValue("select sum(qty) FROM stock_statement s where concat(item_name,' |',formulation)='{listProductName.selectedItem}'")};
                                if(itemExists()==1) {
                                    FXinfo("The selected item already exists in table. please check");
                                }
                                else {
                                    txtMedicineName.text = "{listProductName.selectedItem}";
                                    if(avlQty==null) {
                                        txtAvlQty.text="0";
                                    }
                                    else {
                                        txtAvlQty.text=avlQty;
                                    }
                                    var sam: String = txtMedicineName.rawText.trim();
                                    if (sam == null or sam == "null") {  txtMedicineName.text = ""; }
                                    txtDoseType.requestFocus();
                                    txtDoseType.selectOnFocus;
                                    updateValues();
                                }
                        }
                if (txtMedicineName.rawText.trim() == "null" or txtMedicineName.rawText.trim().equals("null")) {
                    txtMedicineName.text = "";
                }
                var height: Integer = 0;
                if (listProductName.items.size() < 9) {
                    height = listProductName.items.size();
                } else {
                    height = 8;
                }
                for (i in [1..height]) {
                    listH += 25.0;
                }
            } else {
                listProductName.visible = false;
            }
        } catch (ex: Exception) {
            var que = " Class : LabModle   Method: getProductCode() )    Exception : {ex}";
            log.debug(que);
        }
    }

   function txtGenderOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
    if (event.code == KeyCode.VK_TAB){
         btnPrint.requestFocus();
    }
    shortcut(event);
    }    

    var tmp = bind listSalesCash.visible on replace {
        if (tmp == true)
            fxCalendar.visible = false;
    }
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Alert", type);
        showAlertbox();
    }
    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }
    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Alert", msg);
        showAlertbox();
    }
   /* function FXinfo(msg: String, t: TextBox): Void {
        CustomAlert.ShowInfo("Prescription", msg);
        showAlertbox();
        t.requestFocus();
        t.style = error;
    } */
    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Alert", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        if (not err_txtbox.equals(txtLabno)) {
            err_txtbox.style = error; }
    }
    
    function imgDoctorNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtDoctorName.style=mandatory;
        getDoctorList();
        txtPatientName.requestFocus();
    }
    function listSalesCashOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER)
            listSalesCash.visible = false;
    }

    public function ShowList(): Void {
        listFalse();        
    }
    
    function btnSaveOnlyActionAtShown(): Void {
        try {            
        savePrescription(0);
        }catch(ex: Exception){
        log.debug("LabModule btnSaveOnlyActionAtShown {ex.getMessage()}");
        }

    }

    function rectButtonOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    }
    def kr = KeyRegistry {};
    var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 11) {
            shortcut(short);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

      /*  if (event.code == kr.print and btnPrint.disable == false) {
            savePrescription(1);
        }
        else if ((event.code == kr.save  or event.code == kr.update) and btnPrint.disable == false) {
            savePrescription(0);
        }
        else if (event.code == kr.reset and btnSalesCaReset.text == "Reset [F4]") {
            backKeypressed();
        }
        else if (event.code == kr.rRow) {
            prescriptionTableObj.removeRow();
            updateValues();
        }
        else if(event.code == kr.cancel and btnEdit.text == "Edit [F6]") {
            panel.visible = false;
        }
        else if((event.controlDown and event.code == kr.back) and btnEdit.text == "Delete [F5]") {
            backKeypressed();
        }
        else if(event.code == kr.edit and btnEdit.text == "Edit [F6]") {
            editKeyPressed();
        }
        else if(event.code == kr.del and btnEdit.text == "Delete [F5]") {
            deleteKeyPressed();
        }
        else if(event.code == KeyCode.VK_F9) {
            drugSpecification("no");
        }
        else if(event.code == KeyCode.VK_F1) {
            drugSpecification("yes");
        } */
        if (event.code == kr.print and btnPrint.disable == false) {
            savePrescription(1);
        }
        else if ((event.code == kr.save  or event.code == kr.update) and btnPrint.disable == false) {
            savePrescription(0);
        }
        else if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

        else if (event.code == kr.save and btnSaveOnly.text == "Save [F3]" and not btnSaveOnly.disable) {
           // save();
           savePrescription(1);
        }
        else if (event.code == kr.edit and btnEdit.text == "Edit [F6]" and not btnEdit.disable) {
           // edit();
           editKeyPressed();
        }
        else if (event.code == kr.reset and btnSalesCaReset.text == "Reset [F4]") {
           // reset();
           backKeypressed();
        }
        else if (event.code == kr.update) {
            if (btnSaveOnly.text == "Update [F7]" and not btnSaveOnly.disable) {
            //update();
            savePrescription(0);

            }
        }
        else if (event.code == kr.del) {
            if (btnEdit.text == "Delete [F5]" and not btnEdit.disable) {
            //del();
            deleteKeyPressed();
            }
        }
       /* else if (event.controlDown and event.code == kr.back) {
            if (btnCancel.text == "Back [Ctrl+Left]") {
            back();
            }
        } */
        else if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") {
                //panel.visible = false;
                //CancelForm();
                 backKeypressed();
                }
        }

    }
     public function clickValid(): Integer {
        var icode = txtLabno.rawText.trim().replace("'", "");
        var iname = txtPatientName.rawText.trim().replace("'", "");
        var ther = txtDoctorName.rawText.trim().replace("'", "");
        var sther = txtAge.rawText.trim().replace("'", "");
        var indic = txtDiagnosis.rawText.trim().replace("'", "");
        var cname = txtBloodSugar.rawText.trim().replace("'", "");
        var formul = txtBloodPressure.rawText.trim().replace("'", "");
        //var pack = txtDrugPackType.rawText.trim().replace("'", "");
        //var mp = txtDrugMRP.rawText.trim().replace("'", "");
       // var sch = txtSchedule.rawText.trim().replace("'", "");
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        var itemExists: String = commonController.getQueryValue("SELECT labtestreportid FROM lab_report_main d where cust_name='{txtPatientName.rawText.trim()}'");
        var itemExistsUpdate: String = commonController.getQueryValue("SELECT labtestreportid FROM lab_report_main d where labautoid={txtLabno.rawText.trim()}' and cust_name='{txtPatientName.rawText.trim()}'");
        try {
           // var pk: Integer = 0; pk = val.getAlphaNumericValid(pack, 4, 30);
          //  var m: Integer = 0; m = val.getDecimalValid(mp, 1, 10);
            if (iname.trim().length() <= 0) {
                FXinfo("Please Enter Patient Name.", txtPatientName);
            } else if (ther.trim().length() <= 0) {
                FXinfo("Please Enter Doctor Name", txtDoctorName);
            }//naziya else if(btnSaveOnly.text == "Save [F3]" and itemExists!="") {
              //naziya  FXinfo("The same Patient Name already exists in Diagnostic Test. please check.");
          //naziya  }
            else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : LabModuleInformation  Method : clickValid()  = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    public function itemCode(): String {
        var code: String = "";
        var finalCode: String = "";
        var vanCode: String = "DT";
        try {
            var rs: ResultSet = null;
//            var commonController: CommonImplements = new CommonController();
            code = commonController.getMasterAutoIncrement("labInfo");
           

        //            rs = DBConnection.getStatement().executeQuery("SELECT MAX(item_id) as item_id from drugtable");
        //            while (rs.next()) {
        //                code = rs.getString("item_id");
        //            }
        } catch (e: SQLException) {
            var msg: String = "Class : DrugInformation  Method : itemCode()  = {e.getMessage()}";
            log.debug(msg);
        }
        if (code == "") {
            finalCode = "";
        } else {
            try {
                var len: Integer = code.trim().length();
                var subSt: String = code.substring(2, len);
                var subStr: Integer = Integer.parseInt(subSt);
                subStr = subStr + 1;
                var hCode: String = String.valueOf(subStr);
                var lent: Integer = hCode.trim().length();
                if (lent == 1) {
                    vanCode = vanCode.concat("000000");
                } else if (lent == 2) {
                    vanCode = vanCode.concat("00000");
                } else if (lent == 3) {
                    vanCode = vanCode.concat("0000");
                } else if (lent == 4) {
                    vanCode = vanCode.concat("000");
                } else if (lent == 5) {
                    vanCode = vanCode.concat("00");
                } else if (lent == 6) {
                    vanCode = vanCode.concat("0");
                }
                finalCode = vanCode.concat(hCode);
            } catch (e) {
                var msg: String = "Class : DrugInformation  Method : itemCode() Error in auto increment creation = {e.getMessage()}";
                log.debug(msg);
            }
            return finalCode;
        }
    }
    public function shortcutOnTable(event: java.awt.event.KeyEvent): Void {
        try {
            if (event.getKeyText(event.getKeyCode()) == "F2" and btnPrint.disable == false) {
                savePrescription(1);
            }
            else if ((event.getKeyText(event.getKeyCode()) == "F3" or event.getKeyText(event.getKeyCode()) == "F7") and btnPrint.disable == false) {
                savePrescription(0);
            }
            else if (event.getKeyText(event.getKeyCode()) == "F4") {
                backKeypressed();
            }
            else if (event.getKeyText(event.getKeyCode()) == "F12") {
                prescriptionTableObj.removeRow(); updateValues();
            }
            else if(event.getKeyText(event.getKeyCode()) == "F8" and btnEdit.text == "Edit [F6]") {
            panel.visible = false;
            }
            else if((event.getKeyText(event.getKeyCode()) == "Left" and event.isControlDown()) and btnEdit.text == "Delete [F5]") {
            backKeypressed();
            }
            else if(event.getKeyText(event.getKeyCode()) == "F6" and btnEdit.text == "Edit [F6]") {
            editKeyPressed();
            }
            else if(event.getKeyText(event.getKeyCode()) == "F5" and btnEdit.text == "Delete [F5]") {
            deleteKeyPressed();
            }
            else if(event.getKeyText(event.getKeyCode()) == "F9") {
            drugSpecification("no");
            }
            else if(event.getKeyText(event.getKeyCode()) == "F1") {
            drugSpecification("yes");
            }
        }
        catch (ex: Exception) {
            log.debug("LabModule shortcutOnTable {ex.getMessage()}");
        }
    }

    function CashDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            panelCalender.layoutX = fifthCol4-100;
            panelCalender.layoutY = CashDatePicker.layoutY + txtPrescDate.height+10.0;
            if (txtPrescDate.text != null) {
                var dat = txtPrescDate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                fxCalendar.visible = true;
                dateFlag = true;
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                fxCalendar.visible = true;
                dateFlag = true;
            }
        } else {
            fxCalendar.visible = false;
        }
    }
    function txtWeightOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {           
            txtTemperature.requestFocus();
        }
        shortcut(event);
    }
    function btnPrintOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER){
              savePrescription(1);
        }
        shortcut(event);          
    }
    function txtBloodSugarOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       /* if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //txtBloodPressure.requestFocus();
            txtNextVisit.requestFocus();
        }
        shortcut(event);*/

        txtBloodSugar.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER ) {

            if (sar2 == 0 or txtBloodSugar.rawText.trim() == null or txtBloodSugar.rawText.trim().trim().length() == 0 or txtBloodSugar.rawText.trim() == "null") {
                txtBloodSugar.text = "";
            }

            txtNextVisit.requestFocus();

        } else {

            shortcut(event);
        }
    }
    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        prescriptionTableObj.removeRow();
    }
    
    function txtPatientNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        listDoctorName.visible=false;
        getPatientList();
         if (event.code == KeyCode.VK_DOWN) {
            listPatientName.requestFocus();
            listPatientName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listPatientName.visible = false;
            txtPatientName.requestFocus();
        }
    }
    function txtPatientNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDoctorName.visible=false;
        txtPatientName.style=mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //txtAge.requestFocus();
            listPatientName.visible = false;
            txtDoctorName.requestFocus();
        }
                shortcut(event);
    }
    function btnSalesCaResetOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER){
            backKeypressed();
         }  }
    function btnSalesCaResetActionAtShown(): Void {
        backKeypressed();
    }
    function btnPrintOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }
    function btnPrintActionAtShown(): Void {
        savePrescription(1);
    }
    function txtPrescDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { txtPatientName.requestFocus(); }
        shortcut(event);
    }
    
    function txtDoctorNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorName.style=mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //txtPatientName.requestFocus();
            //txtDiagnosis.requestFocus();
        }
        shortcut(event);
    }
    
    public function disableList(): Void {
        listSalesCash.visible = false;
    }

    function checkValid(): Integer {
        updateValues();
        var retVal = 0;
        var valid = new Validation();
        
         if(txtDoctorName.rawText.trim().equals("")) {
            FXinfo("Please enter the doctor name",txtDoctorName);
            retVal = 1;
            txtDoctorName.requestFocus();
        }
        else if(txtDoctorName.rawText.trim().length() > 100) {
            FXinfo("Doctor name cannot be more than 100 characters",txtDoctorName);
            retVal = 1;
            txtDoctorName.requestFocus();
        }
        else if(txtPatientName.rawText.trim().equals("")) {
            FXinfo("Please enter the Patient name",txtPatientName);
            retVal = 1;
            txtPatientName.requestFocus();
        }
        else if(txtPatientName.rawText.trim().length() > 100) {
            FXinfo("Patient name cannot be more than 100 characters",txtPatientName);
            retVal = 1;
            txtPatientName.requestFocus();
        } else if((not txtAge.rawText.trim().equals("")) and valid.getNumberValid(txtAge.rawText.trim(), 0, 3)!=10) {
            FXinfo("The value for age entered is not valid");
            retVal = 1;
            txtAge.requestFocus();
        } else if(txtDiagnosis.rawText.trim().length() > 200) {
            FXinfo("Diagnosis cannot be more than 200 characters");
            retVal = 1;
            txtAge.requestFocus();
        }
        else {

            retVal = 0;
        }
        
        return retVal;
    }

    public function checkTableValid():Integer {
         var retVal:Integer;
         var tableItems:List = prescriptionTableObj.getTableValues();
                if (tableItems.size() == 0) {
                  retVal = 1;
                  FXinfo("Table is empty. Please enter some values!");
                } else {
                for(i in [0..<tableItems.size()]){
                    var prescModel = new PrescriptionModel1();
                    prescModel=tableItems.get(i) as PrescriptionModel1;
                    var valid = new Validation();                    
                   if(prescModel.getCust_minrange()=="") {
                        FXinfo("Minimum Range should not be empty");
                        prescriptionTableObj.focusSet(i, 5);
                        retVal=1;
                        break;
                    }
                   
                    else {
                     //naziya    java.lang.System.out.println("inside checkTableValid 4");
                        retVal=0;
                    }
                }
                }                
                return retVal;
    }

    public function patientSymptoms(sy:ArrayList)
    {
//       symp.clear();
       symp = sy;
       
    }
    
    public function savePrescription(ss: Integer): Void {
        try {
             var labBean: PrescriptionModel1 = new PrescriptionModel1();
             var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                if(btnSaveOnly.text == "Save [F3]"){
                srCode = itemCode();
                    if (srCode == "") {
                        srCode = "DT0000001";
                    }
                txtLabno.text = srCode;
                }
               //sabarish labBean.setLabid(txtLabno.rawText.trim().replace("'", ""));

                if (checkValid() == 0 and checkTableValid() == 0) {
                updateValues();
                var prescriptionModel1 =new PrescriptionModel1();

                var sdf = new SimpleDateFormat("dd-MM-yyyy");
               var prescDate : String;
               if(txtNextVisit.rawText == "" and txtNextVisit.rawText == null){
                  
                      prescDate = DateUtils.changeFormatDate(sdf.format(new Date()));

           
                   }
                   else{
                 prescDate = DateUtils.changeFormatDate(sdf.parse(txtNextVisit.rawText));
                }
                var labDate = DateUtils.changeFormatDate(sdf.parse(txtPrescDate.rawText));
                var doctorName = txtDoctorName.rawText;
                var  docid = commonController.getQueryValue("SELECT doctor_code FROM doctors_information where doctor_name='{txtDoctorName.rawText.trim()}' limit 1");
                var doctorid : Integer;
                doctorid =Integer.parseInt(docid); 
                var patientName = txtPatientName.rawText.trim();
                var custid = commonController.getQueryValue("SELECT cust_id FROM cust_information where concat(cust_name,' - ',mobile_no)='{txtPatientName.rawText.trim()}' limit 1");
                var customerid : Integer;
                customerid = Integer.parseInt(custid);
                 var custcode = commonController.getQueryValue("SELECT cust_code FROM cust_information where concat(cust_name,' - ',mobile_no)='{txtPatientName.rawText.trim()}' limit 1");

                var age = txtAge.rawText.trim();
                var gender="";

                if(rdoMale.selected==true)
                {
                    gender="Male";
                    }
                else if(rdoFemale.selected==true)
                {
                    gender="Female";
                    }
                else {
                    gender="Transgender";
                    }

               // var weight = txtWeight.rawText.trim();
               // var temperature = txtTemperature.rawText.trim();
               // var bloodSugar = txtBloodSugar.rawText.trim();
               //var bloodPressure = txtBloodPressure.rawText.trim();
               // var remarks = txtRemarks.rawText.trim();
              //sabarish  var consultationFee = txtFee.rawText.trim();
              var lab = txtLabno.rawText.trim();
               // var nextVisit = txtNextVisit.rawText.trim();
                var diagnosis = txtDiagnosis.rawText.trim();



                var returnObject;

                  prescriptionModel1.setLabdate(labDate);
                   prescriptionModel1.setPrescriptiondate(prescDate);
                   prescriptionModel1.setDoctorname(doctorName);
                   prescriptionModel1.setDoctorid(doctorid);
                   prescriptionModel1.setCustid(customerid);
                   prescriptionModel1.setCust_code(custcode);
                   prescriptionModel1.setCust_name(patientName);
                   prescriptionModel1.setCust_age(age);
                   prescriptionModel1.setCust_gender(gender);
                   prescriptionModel1.setLabautoid(lab);
                   
                   prescriptionModel1.setDiagnosticListItems(prescriptionTableObj.getTableValues());
                if(btnEdit.text.equals("Edit [F6]"))
                {
                   // PrescriptionModel1 prescriptionModel1=new
                 
                   prescriptionModel1.setStatus(0);
                   prescriptionModel1.setInserttype("save");
                  
                   returnObject = prescriptionController.createRecord2(prescriptionModel1);
                 //sabarish  java.lang.System.out.println("checking {returnObject}");
                   symp.clear();                   
                }
                else {
                    var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Practice Management");
                    var a = bind cn.staus;
                    if (a) {
                       // java.lang.System.out.println("inside else part for update");
                        prescriptionModel1.setStatus(1);
                        prescriptionModel1.setInserttype("update");
                      //sabarish  prescriptionModel.setPrescriptionId(Integer.parseInt(txtPrescriptionId.text));
                        returnObject = prescriptionController.updateRecord2(prescriptionModel1);
                        symp.clear();
                       //sabarish PatientSymptoms.selSymptoms.clear();
                    }
                }
                var type="";
                if(returnObject.equals(true))
                {                       
                    type="save";
                    if (ss == 1) {
                        //java.lang.System.out.println("inside if");
                        var salesController : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
                        var prescNo = "";
                        if(prescriptionModel1.getInserttype().equals("save")) {

                        prescNo = commonController.getQueryValue("select max(labautoid) from lab_report_main");
                       // java.lang.System.out.println("inside if if{prescNo}");
                        }
                        else {
                        prescNo = txtLabno.text;
                        }
                        type = "Print";
                        var reportSource: File = new File("printerfiles/Lab_module.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        //java.lang.System.out.println({prescNo});
                        var jasperPrint:JasperPrint = salesController.jasperPrint(prescNo, "Prescription",jasperReport);
                        //java.lang.System.out.println("after");
                        JasperPrintManager.printReport(jasperPrint, false);
                    }
                    FXalert(0);
                    backKeypressed();

                }
            }
            if(true){
               //sabarish FXinfo("Data Saved Successfully");
               //sabarish  srCode = itemCode();
                    if (srCode == "") {
                        srCode = "DT0000001";
                }
           /* if (LabController.createRecord(labBean).equals(true)) {
                    FXinfo("Data Saved Successfully");
                    UserLog('LabModule', 'Save');
                    FXalert(0);
                    txtLabno.requestFocus();
                    srCode = itemCode();
                    if (srCode == "") {
                        srCode = "DB0000001";
                    }
                    txtLabno.text = srCode;
                    //clear();
                    resetValues();
                }*/

          }
       }
        } catch (ex: Exception) {
            var que = " Class : LabModule   Method: savePrescription    Exception : {ex}";
            log.debug(que);
        }
    }

    public function resetValues(): Void {
        listPatientName.visible = false;
        listDoctorName.visible = false;
        listView.visible = false;
        
        txtDiagnosis.style = mandatory;
        txtPatientName.text = "";
        txtDoctorName.text="";
        editdiagnosisno.text= "";
        cashBillDate = DateUtils.now("dd-MM-yyyy");
        txtNextVisit.text="";
        txtDiagnosis.text = "";
        txtBloodSugar.text = "";
        txtBloodPressure.text = "";
        txtAge.text = "";
        rdoMale.visible = true;
        rdoFemale.visible = true;
        rdoTrans.visible = true;
       /* if(btnSaveOnly.text == "Save [F3]")
        {
         txtLabno.editable=false;
         imglabno.visible=false;
         editdiagnosisno.visible=true;
         imgeditpatient.visible=true;
         lblDocid.visible=true;
        } */
        // listProductName.visible = false;
       // txtDose.text = "";
       // txtDays.text = "1";
      //  txtTemperature.text = "";
      //  txtMorning.text = "0";
      //  txtAfternoon.text = "0";
      //  txtEvening.text="0";
      //  txtNight.text="0";
      //  txtRemarks.text="";
       // txtFee.text="";
      //  txtNextVisit.text="";
        txtPrescriptionId.text="";
        prescriptionTableObj.clearData();
      //  prescriptionTableObj.resetValues();
        txtPatientName.requestFocus();
        //txtWeight.text = "";
        //txtAvlQty.text = "";
        //txtQty.text = "";
       // txtMedicineName.text = "";
       
        updateValues();
        txtDoctorName.style = mandatory;
        txtPatientName.style=mandatory;
        //cboFood.select(0);
    }
    
    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            cashBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtPatientName.requestFocus();
        }
    };

    var visit1 = bind fxCalendar.visible on replace {
        if (nextVisitFlag and not visit1) {
            getDate(0);
        }
    };

    function getDate(i : Integer)
    {
        if(i==0){
            txtNextVisit.text = fxCalendar.getSelectedDate();
            nextVisitFlag = false;
            btnSaveOnly.requestFocus();
        }
    }


     function checkDateValid(txtDate:String) : Integer {
            var dat = txtDate.split("-");
            var valid = new Validation();
            var a:Integer=0;
            if(txtDate.length() < 10) {
                a=0;
            }
            else if(txtDate.charAt(2).toString().equals("-") and txtDate.charAt(5).toString().equals("-")) {
              if (valid.getNumberValid("{dat[0]}", 1, 2)==10 and valid.getNumberValid("{dat[1]}", 1, 2)==10 and valid.getNumberValid("{dat[2]}", 4, 4)==10) {
                   if(Integer.parseInt(dat[0]) <=31 and Integer.parseInt(dat[1]) <=12) {
                       a=1;
                      }
              }
              else {
                a=0;
              }
            }
            return a;
       }

    function updateValues(): Void {
          listFalse();
    }
public function UserLog(formName: String, actionName: String): Void {
//        var commonController: CommonImplements = new CommonController();
        var checkLog = commonController.getUserLog(formName, actionName);
        if (checkLog == false) {
        }
    }
  public function getPatientList(): Void {
   
        try {
        var listControlObj: ListController = new ListController();
        listPatientName.visible = true;
        listH = 0.0;
        listPatientName.layoutX = txtPatientName.layoutX;
        listPatientName.layoutY = txtPatientName.layoutY + txtPatientName.height + 5;
        listH = listControlObj.listImageControlView(txtPatientName, listPatientName, "Customer", 1);
         var selS: String = bind listControlObj.selectedString on replace {
         if (selS.length() > 0) {
                    txtPatientName.requestFocus();
         if (listPatientName.selectedItem != "New name...") {
            txtPatientName.text = "{listPatientName.selectedItem}";
            var customerDetails:List = commonController.getQueryValue("select age,gender from cust_information where concat(cust_name,' - ',mobile_no)='{txtPatientName.rawText.trim()}'", 2);
            txtAge.text = customerDetails.get(0).toString();
            if(customerDetails.get(1).toString().equalsIgnoreCase("Male")) {
                rdoMale.selected = true;
            }
            else if(customerDetails.get(1).toString().equalsIgnoreCase("Female")) {
                rdoFemale.selected = true;
            }
            else{
                }
          //sabarish  var prescriptionDetails:List = commonController.getQueryValue("select consultation_fee, followupvisit_fee from prescription_alert", 2);
          //sabarish  var followupDateLimit:String = commonController.getQueryValue("select DATE_ADD(prescription_date,interval followup_days DAY) from prescription_maintenance,prescription_alert where customer_name='{listPatientName.selectedItem}' order by prescription_Date desc limit 1");
          //sabarish  var curPrescriptionDate = new SimpleDateFormat("dd-MM-yyyy").parse(txtPrescDate.text);
//          println("curPrescriptionDate {curPrescriptionDate} followupDateLimit  {new SimpleDateFormat("yyyy-MM-dd").parse(followupDateLimit)}");
          //sabarish  if(not followupDateLimit.equals("")) {
             //sabarish   if(curPrescriptionDate.before(new SimpleDateFormat("yyyy-MM-dd").parse(followupDateLimit)) or curPrescriptionDate.equals(new SimpleDateFormat("yyyy-MM-dd").parse(followupDateLimit))) {
               //sabarish     txtFee.text = prescriptionDetails.get(1).toString();
              //sabarish  }
             //sabarish   else {
                  //sabarish  txtFee.text = prescriptionDetails.get(0).toString();
              //sabarish  }
         //sabarish   }
        //sabarish    else {
          //sabarish      txtFee.text = prescriptionDetails.get(0).toString();
         //sabarish   }
            listPatientName.visible = false;
            txtAge.requestFocus();
        } else {
            listPatientName.visible = false;
        }
    }
    }
    }
    catch(ex:Exception) {
       var que = " Class : LabModule   Method: getPatientList    Exception : {ex.getMessage()}";
       log.debug(que);
    }
    }

      public function getPatientList1(): Void {

        try {
        var st1: String;
        var st2: String[];
        var part1: String;
        var part2: String;      
        var listControlObj: ListController = new ListController();
        listPatientName.visible = true;
        listH = 0.0;
        listPatientName.layoutX = editdiagnosisno.layoutX;
        listPatientName.layoutY = editdiagnosisno.layoutY-7 + editdiagnosisno.height + 5;
        listH = listControlObj.listImageControlView(editdiagnosisno, listPatientName, "Customeredit", 1);
        var selS: String = bind listControlObj.selectedString on replace {
            
         if (selS.length() > 0) {
             displayedit2(selS);
            editdiagnosisno.requestFocus();
     
    }
    } 
    }
    catch(ex:Exception) {
       var que = " Class : LabModule   Method: getPatientList1    Exception : {ex.getMessage()}";
       log.debug(que);
    }
    }

     public function getPatientList12(event: javafx.scene.input.KeyEvent): Void {

        try {
        var st1: String;
        var st2: String[];
        var part1: String;
        var part2: String;
        var listControlObj: ListController = new ListController();
        listPatientName.visible = true;
        listH = 0.0;
        listPatientName.layoutX = editdiagnosisno.layoutX;
        listPatientName.layoutY = editdiagnosisno.layoutY-7 + editdiagnosisno.height + 5;
        listH = listControlObj.listImageControlView(editdiagnosisno, listPatientName, "Customeredit12", 1);
        var selS: String = bind listControlObj.selectedString on replace {

         if (selS.length() > 0) {
             displayedit2(selS);
            editdiagnosisno.requestFocus();

    }
    }
    }
    catch(ex:Exception) {
       var que = " Class : LabModule   Method: getPatientList12    Exception : {ex.getMessage()}";
       log.debug(que);
    }
    }

      public function getPatientList2(): Void {
     if(not listPatientName.visible){
       var listControlObj: ListController = new ListController();
        listPatientName.visible = true;
        listH = 0.0;
        listPatientName.layoutX = txtLabno.layoutX;
        listPatientName.layoutY = txtLabno.layoutY-7 + txtLabno.height + 5;
        if(btnSaveOnly.text == "Update [F7]"){
             listH = listControlObj.listImageControlView(txtLabno, listPatientName, "Customer21", 1);
             var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    displayedit(selS);
                    txtLabno.requestFocus();
                    if (listPatientName.selectedItem != "New number...") {
                        txtLabno.text = "{listPatientName.selectedItem}";
                        listPatientName.visible = false;
                        txtLabno.requestFocus();
                    } else {
                        listPatientName.visible = false;
                    }
                }
            }
       
             }

            }
       else{
         listPatientName.visible=false;
         txtLabno.requestFocus();
       }
     
    }
    
     public function displayedit(name: String): Void {
       // java.lang.System.out.println("displayedit fx: {name}");
         var medicalHistroyModel1  = new PrescriptionModel1();
         medicalHistroyModel1.setLabtestdtid(name);
        try {
            var prescriptionController : Prescription = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as Prescription;
             var medicalHistroyModel = prescriptionController.viewRecord2(name) as PrescriptionModel1;

           txtPatientName.text = medicalHistroyModel.getCust_name();
           txtDoctorName.text=medicalHistroyModel.getDoctorname();
           txtAge.text=medicalHistroyModel.getCust_age();
           var gender=medicalHistroyModel.getCust_gender();

                if(gender=="Male")
                {
                    rdoMale.selected=true;
                    //gender="Male";
                    }
                else if(gender=="Female")
                {
                    rdoFemale.selected=true;
                   // gender="Female";
                    }
                else {
                    rdoTrans.selected=true;
                    //gender="Transgender";
                    }          
            txtNextVisit.text = medicalHistroyModel.getPrescriptiondate();

           // txtPrescDate.text=medicalHistroyModel.getLabdate();
           //txtNextVisit.text = medicalHistroyModel.getLabdate();
                    
         
          prescriptionTableObj.settablevalues12(medicalHistroyModel);
         // java.lang.System.out.println("viewrecords table after");

        } catch (e: Exception) {
           // java.lang.System.out.println("fx catch: {e}");
            var msg: String = "Class : LabModule Method : displayedit()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function displayedit2(name: String): Void {
        //java.lang.System.out.println("displayedit2 fx: {name}");
         var medicalHistroyModel1  = new PrescriptionModel1();
         medicalHistroyModel1.setLabtestdtid(name);
        try {
            var prescriptionController : Prescription = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as Prescription;
             var medicalHistroyModel = prescriptionController.viewRecord3(name) as PrescriptionModel1;

           txtPatientName.text = medicalHistroyModel.getCust_name();
           txtDoctorName.text=medicalHistroyModel.getDoctorname();
           txtAge.text=medicalHistroyModel.getCust_age();
           var gender=medicalHistroyModel.getCust_gender();

                if(gender=="Male")
                {
                    rdoMale.selected=true;
                    //gender="Male";
                    }
                else if(gender=="Female")
                {
                    rdoFemale.selected=true;
                   // gender="Female";
                    }
                else {
                    rdoTrans.selected=true;
                    //gender="Transgender";
                    }
            txtNextVisit.text = medicalHistroyModel.getPrescriptiondate();

           // txtPrescDate.text=medicalHistroyModel.getLabdate();
           //txtNextVisit.text = medicalHistroyModel.getLabdate();


          prescriptionTableObj.settablevalues12(medicalHistroyModel);
        //  java.lang.System.out.println("displayedit2 fx table after");

        } catch (e: Exception) {
          //  java.lang.System.out.println("fx catch: {e}");
            var msg: String = "Class : LabModule Method : displayedit2()   = {e.getMessage()}";
            log.debug(msg);
        }
    }
    
    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
        updateValues();
    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("appointment", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {
                btnPrint.disable = true;
                btnSaveOnly.disable = true;
            } else if (val == 2) {
                btnPrint.disable = false;
                btnSaveOnly.disable = false;
            } else if (val == 3) {
                btnPrint.disable = false;
                btnSaveOnly.disable = false;
            }
        } else {
            btnPrint.disable = false;
            btnSaveOnly.disable = false;
        }
  }
  
  public function salesQuotaionSetting():Void {
    prescriptionTable = prescriptionTableObj.createTable();
    prescriptionFormatTable = SwingComponent.wrap(prescriptionTableObj.getScrollTable(prescriptionTable));
    panelTable.content = [prescriptionFormatTable,];
    changeTableSize(TableW, TableH);
	
  }    
   
    public var regularFocus : Boolean = false;
    public function StartUp() : Void {
        ShowList();
        cboFood.select(0);
        (prescriptionTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
            if(prescriptionTableObj.UIFocusFlag and not regularFocus) {
		    prescriptionTableObj.UIFocusFlag=false;
		} else if(prescriptionTableObj.UIFocusFlag and regularFocus ) {
                    txtEvening.requestFocus();
                    prescriptionTableObj.UIFocusFlag=false;
                    regularFocus = false;
                }
                shortcutOnTable(e);
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                shortcutOnTable(e);
                updateValues();
            }
            
        });
        (prescriptionTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseReleased(e: java.awt.event.MouseEvent): Void {
		if(not prescriptionTableObj.UIFocusFlag) {
		    prescriptionTableObj.focusSet(prescriptionTableObj.jcomp.getSelectedRow(), prescriptionTableObj.jcomp.getSelectedColumn());
		}
            }
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
		updateValues();
		if(prescriptionTableObj.UIFocusFlag) {
		    prescriptionTableObj.UIFocusFlag=false;
		}
            }
        });
        (prescriptionTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
                if (pd.tableValues==1) {
                txtDoctorName.text=pd.doctorName;
                txtPatientName.text=pd.patientName;
                txtAge.text=pd.age;
                if(pd.gender.equalsIgnoreCase("Male") ) {
                    rdoMale.selected = true;
                }
                else {
                    rdoFemale.selected = true;
                }
                txtWeight.text=pd.weight;
                txtTemperature.text=pd.temperature;
                txtBloodSugar.text=pd.bloodSugar;
                txtBloodPressure.text=pd.bloodPressure;
                txtDiagnosis.text=pd.diagnosis;
                txtRemarks.text=pd.remarks;
                txtFee.text=pd.consultationFee;
                txtNextVisit.text=pd.nextVisit;
                txtPrescriptionId.text=pd.prescriptionId;
                txtPatientName.requestFocus();
                }
            }
        });
       // txtDoctorName.text = "{commonController.getQueryValue("select doctor_name FROM prescription_maintenance order by id desc limit 1;")}";
        txtDoctorName.text = "";
        if(txtDoctorName.text =="null")  {
            txtDoctorName.text =="";
        }
        srCode = itemCode();
        if (srCode == "") {
            srCode = "DT0000001";
        }
        txtLabno.text = srCode;

        CashDatePicker.image = Image { url: "{__DIR__}images/Calender.png" };
        listView.visible = false;
        prescriptionFormatTable.layoutX = 0;
        prescriptionFormatTable.layoutY = 0;
        getPrivileges(logUser);
        updateValues();
        fxCalendar.visible = false;
        panelCalender.content = [fxCalendar,];
        panelTable.content = [prescriptionFormatTable,];
        delete  panelDiagnostictype.content;
        Diagnostictype.panel.visible = false;
        insert Diagnostictype.panel into panelDiagnostictype.content;

        
        delete panelTestname.content;
        Testname.panel.visible = false;
        insert Testname.panel into panelTestname.content;

        txtDoctorName.style=mandatory;
        txtPatientName.style=mandatory;
        txtMedicineName.style=mandatory;
        txtDiagnosis.style = mandatory;
        txtBloodSugar.style=mandatory;
        txtQty.style=mandatory;
        txtMedicineName.requestFocus();
        PrescDatePicker.image = Image { url: "{__DIR__}images/Calender.png" };
        //edit table events        
    }
}

