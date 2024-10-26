package com.vanuston.medeil.ui;

import java.lang.Exception;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.DateUtils;
import javafx.scene.input.KeyCode;
import java.text.SimpleDateFormat;
import java.util.List;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.model.DischargeModel;
import com.vanuston.medeil.util.Validation;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.implementation.Customer;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.JasperPrintManager;
import com.vanuston.medeil.implementation.Sales;
import java.io.File;
import com.vanuston.medeil.util.KeyRegistry;
import java.lang.*;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class PatientDischargeSummary {
    public var cashBillDate = DateUtils.now("dd-MM-yyyy");
    var log: Logger = Logger.getLogger(PatientDischargeSummary.class, "DischargeSummary");
    var patientDetailsController: Customer = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var customerController: Customer = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
    var listH = 0.0;
     var panelW = bind CommonDeclare.panelFormW on replace {
        Type5TextboxW = panelW * 3.811944091 / 100;
        //listViewPatient.visible = false;
    }
    var Type5TextboxW = panelW * 3.811944091 / 100;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX - 10;
    var C2LX = bind CommonDeclare.Column2LX + 10;
    var C3LX = bind CommonDeclare.Column3LX + 35;
    var C4LX = bind CommonDeclare.Column4LX + 50;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var botton21LX = bind CommonDeclare.botton2LX;
    var botton22LX = bind CommonDeclare.botton3LX;
    var CancelW = bottonW;
    var imgClickdownW = 20.5;
    var imgClickdownH = 20.5;
    var mandatory = CommonDeclare.presc_textbox_mandatory();
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var listW = Type2TextboxW;
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 148.0 on replace { changeTableSize(TableW, TableH); };
    function changeTableSize(i: Integer, j: Integer): Void {
        //prescriptionFormatTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 280.0;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var dateFlag: Boolean = false;
    var addateFlag:Boolean = false;
    var discdateFlag:Boolean = false;
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    var fxCalendar = FXCalendar {
            theme: Theme {};
     };

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind panelW
        height: bind panelH
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind panelW
        height: 50.0
    }
    
    def __layoutInfo_lblPatientDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def lblPatientDetails: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-200
        layoutInfo: __layoutInfo_lblPatientDetails
        text: "Label"
    }
    
    public-read def lblPatientDate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX
        text: "Label"
    }
    
    def __layoutInfo_txtdate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+50
        layoutInfo: __layoutInfo_txtdate
        text: bind cashBillDate
    }
    
    public-read def imgCalendar: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+txtdate.width+50
    }
    
    def __layoutInfo_txtsearchpatient: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtsearchpatient: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX
        layoutInfo: __layoutInfo_txtsearchpatient
    }
    
    def __layoutInfo_imagsearchpatname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def imagsearchpatname: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C1LX+290
        layoutInfo: __layoutInfo_imagsearchpatname
    }
    
    public-read def patientRectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        x: bind panelTableLX+20
        width: bind TableW-20
        height: 50.0
    }
    
    public-read def lblPatientcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    public-read def txtPatientcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+40
    }
    
    public-read def lblPatientname: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+150
        text: "Label"
    }
    
    def __layoutInfo_txtPatientname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPatientname: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+200
        layoutInfo: __layoutInfo_txtPatientname
    }
    
    public-read def lblPatientage: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+230
        text: "Label"
    }
    
    def __layoutInfo_txtPatientage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPatientage: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+275
        layoutInfo: __layoutInfo_txtPatientage
    }
    
    public-read def lblgender: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-50
        text: "Label"
    }
    
    public-read def txtgender: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX
    }
    
    public-read def lblmobileno: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+150
        text: "Label"
    }
    
    public-read def txtmobile: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+215
    }
    
    public-read def lbladmissiondate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    def __layoutInfo_txtadmissiondate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtadmissiondate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+100
        layoutInfo: __layoutInfo_txtadmissiondate
    }
    
    public-read def admissiondate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C1LX+180
    }
    
    public-read def lbldischargedate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+225
        text: "Label"
    }
    
    public-read def txtdischargedate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+325
    }
    
    def __layoutInfo_dischargedate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def dischargedate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C1LX+400
        layoutInfo: __layoutInfo_dischargedate
    }
    
    public-read def lblDischargetype: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+450
        text: "Label"
    }
    
    def __layoutInfo_txtdischargetype: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdischargetype: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+550
        layoutInfo: __layoutInfo_txtdischargetype
    }
    
    public-read def lbldoctorname: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+780
        text: "Label"
    }
    
    def __layoutInfo_txtdoctor: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdoctor: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+845
        layoutInfo: __layoutInfo_txtdoctor
    }
    
    public-read def imagedoctor: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C1LX+1025
    }
    
    public-read def lblsurgeon: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+780
        text: "Label"
    }
    
    def __layoutInfo_txtsurgeon: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtsurgeon: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+845
        layoutInfo: __layoutInfo_txtsurgeon
    }
    
    public-read def imagesurgeon: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C1LX+1025
    }
    
    public-read def panelTopSection: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ patientRectangle, lblPatientcode, txtPatientcode, lblPatientname, txtPatientname, lblPatientage, txtPatientage, lblgender, txtgender, lblmobileno, txtmobile, lbladmissiondate, txtadmissiondate, admissiondate, lbldischargedate, txtdischargedate, dischargedate, lblDischargetype, txtdischargetype, lbldoctorname, txtdoctor, imagedoctor, lblsurgeon, txtsurgeon, imagesurgeon, ]
    }
    
    public-read def rectpastmedhistory: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def rectheader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def lblpastheader: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def lblsymptoms: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtsymptoms: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtsymptoms: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtsymptoms
    }
    
    public-read def lblgenallery: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtgenallergy: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtgenallergy: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtgenallergy
    }
    
    public-read def lbldrugallergy: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtdrugallergy: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdrugallergy: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtdrugallergy
    }
    
    public-read def PastMedicalhistory: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C4LX-20
        content: [ rectpastmedhistory, rectheader, lblpastheader, lblsymptoms, txtsymptoms, lblgenallery, txtgenallergy, lbldrugallergy, txtdrugallergy, ]
    }
    
    public-read def lbldiagnosis: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtdiagnosis: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdiagnosis: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtdiagnosis
    }
    
    public-read def lbldrnote: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtdrnote: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdrnote: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtdrnote
    }
    
    public-read def lblconsnote: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtconsnote: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtconsnote: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtconsnote
    }
    
    public-read def lblpatadvice: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtpatadvice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtpatadvice: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtpatadvice
    }
    
    public-read def lblprecomplaints: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtprecomplaints: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtprecomplaints: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtprecomplaints
    }
    
    public-read def lblfamilyhistory: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtfamilyhis: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtfamilyhis: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtfamilyhis
    }
    
    public-read def lblinvestigation: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtinvesstiagtion: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtinvesstiagtion: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtinvesstiagtion
    }
    
    public-read def lbldisadvice: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtdisadvice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdisadvice: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtdisadvice
    }
    
    public-read def lblfollowup: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtfollowup: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtfollowup: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtfollowup
    }
    
    public-read def lblMedication: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtmedication: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtmedication: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtmedication
    }
    
    public-read def lblnotes: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtnotes: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtnotes: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtnotes
    }
    
    public-read def lblprepared: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtprepared: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtprepared: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtprepared
    }
    
    public-read def lbldep: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtdep: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtdep: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtdep
    }
    
    public-read def paneldiagnosis: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C1LX
        content: [ lbldiagnosis, txtdiagnosis, lbldrnote, txtdrnote, lblconsnote, txtconsnote, lblpatadvice, txtpatadvice, lblprecomplaints, txtprecomplaints, lblfamilyhistory, txtfamilyhis, lblinvestigation, txtinvesstiagtion, lbldisadvice, txtdisadvice, lblfollowup, txtfollowup, lblMedication, txtmedication, lblnotes, txtnotes, lblprepared, txtprepared, lbldep, txtdep, ]
    }
    
    public-read def imageprint: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnprint: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnprint: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnprint
        graphic: imageprint
        text: "Button"
    }
    
    public-read def imagesave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW+10
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnsave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnsave: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnsave
        graphic: imagesave
        text: "Button"
    }
    
    public-read def imageedit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnedit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnedit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnedit
        graphic: imageedit
        text: "Button"
    }
    
    public-read def imagereset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnreset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnreset: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnreset
        graphic: imagereset
        text: "Button"
    }
    
    public-read def imagecancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btncancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btncancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btncancel
        graphic: imagecancel
        text: "Button"
    }
    
    public-read def panelbuttons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind botton1LX
        content: [ btnprint, btnsave, btnedit, btnreset, btncancel, ]
    }
    
    def __layoutInfo_listpatient: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind listH
    }
    public-read def listpatient: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C1LX
        layoutInfo: __layoutInfo_listpatient
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelCalendar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C4LX+txtdate.width+50
    }
    
    public-read def datepanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX
    }
    
    def __layoutInfo_listdoctorview: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind listH
    }
    public-read def listdoctorview: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C1LX+845
        layoutInfo: __layoutInfo_listdoctorview
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    def __layoutInfo_listsurgeonview: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind listH
    }
    public-read def listsurgeonview: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C1LX+845
        layoutInfo: __layoutInfo_listsurgeonview
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def MainPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, lblPatientDetails, lblPatientDate, txtdate, imgCalendar, txtsearchpatient, imagsearchpatname, panelTopSection, PastMedicalhistory, paneldiagnosis, panelbuttons, listpatient, panelCalendar, datepanel, listdoctorview, panelAlert, listsurgeonview, ]
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.6
        blue: 0.6
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
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
        name: "Arial"
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
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Blue: javafx.scene.paint.Color = javafx.scene.paint.Color {
        green: 0.6
        blue: 1.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imagecalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
    }
    
    public-read def LightBlue: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.8
        green: 0.8
        blue: 1.0
    }
    
    public-read def Sandal: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 1.0
        blue: 0.8
    }
    
    public-read def DarKBlue: javafx.scene.paint.Color = javafx.scene.paint.Color {
        green: 0.2
        blue: 0.2
    }
    
    public-read def imagdate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imagecal: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
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
                            rectangle.styleClass = "form-background";
                            rectangle.fill = linearGradient;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.styleClass = "rectFormHeader";
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            lblPatientDetails.visible = true;
                            lblPatientDetails.opacity = 1.0;
                            lblPatientDetails.layoutY = 1.0;
                            lblPatientDetails.effect = lightingEffect;
                            lblPatientDetails.text = "DischargeSummary";
                            lblPatientDetails.font = Arial_25;
                            lblPatientDetails.textFill = javafx.scene.paint.Color.BLACK;
                            lblPatientDate.visible = true;
                            lblPatientDate.layoutY = 50.0;
                            lblPatientDate.text = "Date";
                            lblPatientDate.font = Arial_12;
                            lblPatientDate.textFill = DarkGray;
                            txtdate.visible = true;
                            txtdate.layoutY = 50.0;
                            __layoutInfo_txtdate.width = 85.0;
                            txtdate.onKeyPressed = txtdateOnKeyPressedAtShown;
                            txtdate.editable = false;
                            imgCalendar.visible = true;
                            imgCalendar.layoutY = 50.0;
                            imgCalendar.onKeyPressed = imgCalendarOnKeyPressedAtShown;
                            imgCalendar.onMouseClicked = imgCalendarOnMouseClickedAtShown;
                            imgCalendar.image = imagecalender;
                            txtsearchpatient.visible = true;
                            txtsearchpatient.disable = false;
                            txtsearchpatient.layoutY = 50.0;
                            __layoutInfo_txtsearchpatient.width = 290.0;
                            txtsearchpatient.onKeyPressed = txtsearchpatientOnKeyPressedAtShown;
                            txtsearchpatient.onKeyReleased = txtsearchpatientOnKeyReleasedAtShown;
                            txtsearchpatient.promptText = "Search Patient Name or Mobile No or UHID";
                            txtsearchpatient.font = Arial_14;
                            imagsearchpatname.visible = true;
                            imagsearchpatname.disable = false;
                            imagsearchpatname.layoutY = 50.0;
                            __layoutInfo_imagsearchpatname.height = 0.0;
                            imagsearchpatname.onMouseClicked = imagsearchpatnameOnMouseClickedAtShown;
                            imagsearchpatname.image = imageDown;
                            imagsearchpatname.fitHeight = 25.0;
                            patientRectangle.visible = true;
                            patientRectangle.fill = null;
                            patientRectangle.stroke = DarkGray;
                            patientRectangle.strokeWidth = 2.0;
                            patientRectangle.y = 90.0;
                            patientRectangle.height = 40.0;
                            lblPatientcode.visible = true;
                            lblPatientcode.layoutY = 100.0;
                            lblPatientcode.text = "UID";
                            lblPatientcode.font = Arial_12;
                            lblPatientcode.textFill = DarkGray;
                            txtPatientcode.visible = true;
                            txtPatientcode.layoutY = 100.0;
                            txtPatientcode.font = Arial_12;
                            lblPatientname.visible = true;
                            lblPatientname.layoutY = 100.0;
                            lblPatientname.text = "Name";
                            lblPatientname.font = Arial_12;
                            lblPatientname.textFill = DarkGray;
                            txtPatientname.visible = true;
                            txtPatientname.layoutY = 100.0;
                            __layoutInfo_txtPatientname.width = 175.0;
                            txtPatientname.font = Arial_12;
                            lblPatientage.visible = true;
                            lblPatientage.layoutY = 100.0;
                            lblPatientage.text = "Age";
                            lblPatientage.font = Arial_12;
                            lblPatientage.textFill = DarkGray;
                            txtPatientage.visible = true;
                            txtPatientage.layoutY = 100.0;
                            __layoutInfo_txtPatientage.width = 50.0;
                            txtPatientage.font = Arial_12;
                            lblgender.visible = true;
                            lblgender.layoutY = 100.0;
                            lblgender.text = "Gender";
                            lblgender.font = Arial_12;
                            lblgender.textFill = DarkGray;
                            txtgender.visible = true;
                            txtgender.layoutY = 100.0;
                            txtgender.font = Arial_12;
                            lblmobileno.visible = true;
                            lblmobileno.layoutY = 100.0;
                            lblmobileno.text = "Mobile";
                            lblmobileno.font = Arial_12;
                            lblmobileno.textFill = DarkGray;
                            txtmobile.visible = true;
                            txtmobile.layoutY = 100.0;
                            txtmobile.font = Arial_12;
                            lbladmissiondate.visible = true;
                            lbladmissiondate.layoutY = 140.0;
                            lbladmissiondate.text = "Admission Date";
                            lbladmissiondate.font = Arial_12;
                            lbladmissiondate.textFill = DarkGray;
                            txtadmissiondate.visible = true;
                            txtadmissiondate.layoutY = 140.0;
                            __layoutInfo_txtadmissiondate.width = 85.0;
                            txtadmissiondate.font = Arial_12;
                            admissiondate.visible = false;
                            admissiondate.disable = true;
                            admissiondate.layoutY = 140.0;
                            admissiondate.onMouseClicked = admissiondateOnMouseClickedAtShown;
                            admissiondate.image = imagdate;
                            lbldischargedate.visible = true;
                            lbldischargedate.layoutY = 140.0;
                            lbldischargedate.text = "Discharge Date";
                            lbldischargedate.font = Arial_12;
                            lbldischargedate.textFill = DarkGray;
                            txtdischargedate.visible = true;
                            txtdischargedate.layoutY = 140.0;
                            txtdischargedate.font = Arial_12;
                            dischargedate.visible = false;
                            dischargedate.disable = true;
                            dischargedate.layoutY = 140.0;
                            __layoutInfo_dischargedate.width = 85.0;
                            dischargedate.onMouseClicked = dischargedateOnMouseClickedAtShown;
                            dischargedate.image = imagecal;
                            lblDischargetype.visible = true;
                            lblDischargetype.layoutY = 140.0;
                            lblDischargetype.text = "Discharge Type";
                            lblDischargetype.font = Arial_12;
                            lblDischargetype.textFill = DarkGray;
                            txtdischargetype.visible = true;
                            txtdischargetype.layoutY = 140.0;
                            __layoutInfo_txtdischargetype.width = 200.0;
                            txtdischargetype.font = Arial_12;
                            lbldoctorname.visible = true;
                            lbldoctorname.layoutY = 140.0;
                            lbldoctorname.text = "Ref.By";
                            lbldoctorname.font = Arial_12;
                            lbldoctorname.textFill = DarkGray;
                            txtdoctor.visible = true;
                            txtdoctor.layoutY = 140.0;
                            __layoutInfo_txtdoctor.width = 200.0;
                            txtdoctor.onKeyPressed = txtdoctorOnKeyPressedAtShown;
                            txtdoctor.onKeyReleased = txtdoctorOnKeyReleasedAtShown;
                            txtdoctor.font = Arial_12;
                            imagedoctor.visible = true;
                            imagedoctor.layoutY = 140.0;
                            imagedoctor.onMouseClicked = imagedoctorOnMouseClickedAtShown;
                            imagedoctor.image = imageDown;
                            imagedoctor.fitHeight = 20.0;
                            lblsurgeon.visible = true;
                            lblsurgeon.layoutY = 180.0;
                            lblsurgeon.text = "Surgeon";
                            lblsurgeon.font = Arial_12;
                            lblsurgeon.textFill = DarkGray;
                            txtsurgeon.visible = true;
                            txtsurgeon.layoutY = 180.0;
                            __layoutInfo_txtsurgeon.width = 200.0;
                            txtsurgeon.onKeyPressed = txtsurgeonOnKeyPressedAtShown;
                            txtsurgeon.onKeyReleased = txtsurgeonOnKeyReleasedAtShown;
                            txtsurgeon.font = Arial_12;
                            imagesurgeon.visible = true;
                            imagesurgeon.layoutY = 180.0;
                            imagesurgeon.onMouseClicked = imagesurgeonOnMouseClickedAtShown;
                            imagesurgeon.image = imageDown;
                            panelTopSection.visible = true;
                            rectpastmedhistory.visible = true;
                            rectpastmedhistory.fill = LightBlue;
                            rectpastmedhistory.stroke = javafx.scene.paint.Color.BLACK;
                            rectpastmedhistory.strokeWidth = 2.0;
                            rectpastmedhistory.width = 400.0;
                            rectpastmedhistory.height = 280.0;
                            rectheader.visible = true;
                            rectheader.fill = Blue;
                            rectheader.stroke = javafx.scene.paint.Color.BLACK;
                            rectheader.width = 400.0;
                            rectheader.height = 25.0;
                            lblpastheader.visible = true;
                            lblpastheader.layoutX = 10.0;
                            lblpastheader.layoutY = 5.0;
                            lblpastheader.text = "Past Medical Histroy";
                            lblpastheader.font = Arial_Bold_14;
                            lblpastheader.textFill = javafx.scene.paint.Color.BLACK;
                            lblsymptoms.visible = true;
                            lblsymptoms.layoutX = 10.0;
                            lblsymptoms.layoutY = 35.0;
                            lblsymptoms.text = "Symptoms";
                            lblsymptoms.font = Arial_14;
                            lblsymptoms.textFill = javafx.scene.paint.Color.BLACK;
                            txtsymptoms.visible = true;
                            txtsymptoms.layoutX = 50.0;
                            txtsymptoms.layoutY = 60.0;
                            __layoutInfo_txtsymptoms.width = 300.0;
                            __layoutInfo_txtsymptoms.height = 40.0;
                            txtsymptoms.onKeyPressed = txtsymptomsOnKeyPressedAtShown;
                            txtsymptoms.font = Arial_12;
                            txtsymptoms.multiline = true;
                            lblgenallery.visible = true;
                            lblgenallery.layoutX = 10.0;
                            lblgenallery.layoutY = 110.0;
                            lblgenallery.text = "General Allergy";
                            lblgenallery.font = Arial_14;
                            txtgenallergy.visible = true;
                            txtgenallergy.layoutX = 50.0;
                            txtgenallergy.layoutY = 135.0;
                            __layoutInfo_txtgenallergy.width = 300.0;
                            __layoutInfo_txtgenallergy.height = 40.0;
                            txtgenallergy.onKeyPressed = txtgenallergyOnKeyPressedAtShown;
                            txtgenallergy.font = Arial_12;
                            txtgenallergy.multiline = true;
                            lbldrugallergy.visible = true;
                            lbldrugallergy.layoutX = 10.0;
                            lbldrugallergy.layoutY = 190.0;
                            lbldrugallergy.text = "Drug Allergy";
                            lbldrugallergy.font = Arial_14;
                            txtdrugallergy.visible = true;
                            txtdrugallergy.layoutX = 50.0;
                            txtdrugallergy.layoutY = 220.0;
                            __layoutInfo_txtdrugallergy.width = 300.0;
                            __layoutInfo_txtdrugallergy.height = 40.0;
                            txtdrugallergy.onKeyPressed = txtdrugallergyOnKeyPressedAtShown;
                            txtdrugallergy.font = Arial_12;
                            txtdrugallergy.multiline = true;
                            PastMedicalhistory.visible = true;
                            PastMedicalhistory.layoutY = 230.0;
                            lbldiagnosis.visible = true;
                            lbldiagnosis.text = "Diagnosis";
                            lbldiagnosis.font = Arial_12;
                            lbldiagnosis.textFill = DarkGray;
                            txtdiagnosis.visible = true;
                            txtdiagnosis.layoutY = 20.0;
                            __layoutInfo_txtdiagnosis.width = 200.0;
                            __layoutInfo_txtdiagnosis.height = 50.0;
                            txtdiagnosis.onKeyPressed = txtdiagnosisOnKeyPressedAtShown;
                            txtdiagnosis.font = Arial_12;
                            txtdiagnosis.multiline = true;
                            lbldrnote.visible = true;
                            lbldrnote.layoutX = 220.0;
                            lbldrnote.text = "Doctor Note";
                            lbldrnote.font = Arial_12;
                            lbldrnote.textFill = DarkGray;
                            txtdrnote.visible = true;
                            txtdrnote.layoutX = 220.0;
                            txtdrnote.layoutY = 20.0;
                            __layoutInfo_txtdrnote.width = 200.0;
                            __layoutInfo_txtdrnote.height = 50.0;
                            txtdrnote.onKeyPressed = txtdrnoteOnKeyPressedAtShown;
                            txtdrnote.font = Arial_12;
                            txtdrnote.multiline = true;
                            lblconsnote.visible = true;
                            lblconsnote.layoutX = 450.0;
                            lblconsnote.text = "Consulation ";
                            lblconsnote.font = Arial_12;
                            lblconsnote.textFill = DarkGray;
                            txtconsnote.visible = true;
                            txtconsnote.layoutX = 450.0;
                            txtconsnote.layoutY = 20.0;
                            __layoutInfo_txtconsnote.width = 200.0;
                            __layoutInfo_txtconsnote.height = 50.0;
                            txtconsnote.onKeyPressed = txtconsnoteOnKeyPressedAtShown;
                            txtconsnote.font = Arial_12;
                            txtconsnote.multiline = true;
                            lblpatadvice.visible = true;
                            lblpatadvice.layoutX = 0.0;
                            lblpatadvice.layoutY = 80.0;
                            lblpatadvice.text = "Condition Of Patient On Advice";
                            lblpatadvice.font = Arial_12;
                            lblpatadvice.textFill = DarkGray;
                            txtpatadvice.visible = true;
                            txtpatadvice.layoutY = 100.0;
                            __layoutInfo_txtpatadvice.width = 200.0;
                            __layoutInfo_txtpatadvice.height = 50.0;
                            txtpatadvice.onKeyPressed = txtpatadviceOnKeyPressedAtShown;
                            txtpatadvice.font = Arial_12;
                            txtpatadvice.multiline = true;
                            lblprecomplaints.visible = true;
                            lblprecomplaints.layoutX = 220.0;
                            lblprecomplaints.layoutY = 80.0;
                            lblprecomplaints.text = "Previous Complaints";
                            lblprecomplaints.font = Arial_12;
                            lblprecomplaints.textFill = DarkGray;
                            txtprecomplaints.visible = true;
                            txtprecomplaints.layoutX = 220.0;
                            txtprecomplaints.layoutY = 100.0;
                            __layoutInfo_txtprecomplaints.width = 200.0;
                            __layoutInfo_txtprecomplaints.height = 50.0;
                            txtprecomplaints.onKeyPressed = txtprecomplaintsOnKeyPressedAtShown;
                            txtprecomplaints.font = Arial_12;
                            txtprecomplaints.multiline = true;
                            lblfamilyhistory.visible = true;
                            lblfamilyhistory.layoutX = 450.0;
                            lblfamilyhistory.layoutY = 80.0;
                            lblfamilyhistory.text = "Family History";
                            lblfamilyhistory.font = Arial_12;
                            lblfamilyhistory.textFill = DarkGray;
                            txtfamilyhis.visible = true;
                            txtfamilyhis.layoutX = 450.0;
                            txtfamilyhis.layoutY = 100.0;
                            __layoutInfo_txtfamilyhis.width = 200.0;
                            __layoutInfo_txtfamilyhis.height = 50.0;
                            txtfamilyhis.onKeyPressed = txtfamilyhisOnKeyPressedAtShown;
                            txtfamilyhis.font = Arial_12;
                            txtfamilyhis.multiline = true;
                            lblinvestigation.visible = true;
                            lblinvestigation.layoutY = 170.0;
                            lblinvestigation.text = "Investigation";
                            lblinvestigation.font = Arial_12;
                            lblinvestigation.textFill = DarkGray;
                            txtinvesstiagtion.visible = true;
                            txtinvesstiagtion.layoutY = 190.0;
                            __layoutInfo_txtinvesstiagtion.width = 200.0;
                            __layoutInfo_txtinvesstiagtion.height = 50.0;
                            txtinvesstiagtion.onKeyPressed = txtinvesstiagtionOnKeyPressedAtShown;
                            txtinvesstiagtion.font = Arial_12;
                            txtinvesstiagtion.multiline = true;
                            lbldisadvice.visible = true;
                            lbldisadvice.layoutX = 220.0;
                            lbldisadvice.layoutY = 170.0;
                            lbldisadvice.text = "Discharge Advice";
                            lbldisadvice.font = Arial_12;
                            lbldisadvice.textFill = DarkGray;
                            txtdisadvice.visible = true;
                            txtdisadvice.layoutX = 220.0;
                            txtdisadvice.layoutY = 190.0;
                            __layoutInfo_txtdisadvice.width = 200.0;
                            __layoutInfo_txtdisadvice.height = 50.0;
                            txtdisadvice.onKeyPressed = txtdisadviceOnKeyPressedAtShown;
                            txtdisadvice.font = Arial_12;
                            txtdisadvice.multiline = true;
                            lblfollowup.visible = true;
                            lblfollowup.layoutX = 450.0;
                            lblfollowup.layoutY = 170.0;
                            lblfollowup.text = "Follow UP";
                            lblfollowup.font = Arial_12;
                            lblfollowup.textFill = DarkGray;
                            txtfollowup.visible = true;
                            txtfollowup.layoutX = 450.0;
                            txtfollowup.layoutY = 190.0;
                            __layoutInfo_txtfollowup.width = 200.0;
                            __layoutInfo_txtfollowup.height = 50.0;
                            txtfollowup.onKeyPressed = txtfollowupOnKeyPressedAtShown;
                            txtfollowup.font = Arial_12;
                            txtfollowup.multiline = true;
                            lblMedication.visible = true;
                            lblMedication.layoutX = 0.0;
                            lblMedication.layoutY = 250.0;
                            lblMedication.text = "Medication";
                            lblMedication.font = Arial_12;
                            lblMedication.textFill = DarkGray;
                            txtmedication.visible = true;
                            txtmedication.layoutY = 270.0;
                            __layoutInfo_txtmedication.width = 200.0;
                            __layoutInfo_txtmedication.height = 50.0;
                            txtmedication.onKeyPressed = txtmedicationOnKeyPressedAtShown;
                            txtmedication.font = Arial_12;
                            txtmedication.multiline = true;
                            lblnotes.visible = true;
                            lblnotes.layoutX = 220.0;
                            lblnotes.layoutY = 250.0;
                            lblnotes.text = "Notes";
                            lblnotes.font = Arial_12;
                            lblnotes.textFill = DarkGray;
                            txtnotes.visible = true;
                            txtnotes.layoutX = 220.0;
                            txtnotes.layoutY = 270.0;
                            __layoutInfo_txtnotes.width = 250.0;
                            __layoutInfo_txtnotes.height = 50.0;
                            txtnotes.onKeyPressed = txtnotesOnKeyPressedAtShown;
                            txtnotes.font = Arial_12;
                            txtnotes.multiline = true;
                            lblprepared.visible = true;
                            lblprepared.layoutX = 490.0;
                            lblprepared.layoutY = 250.0;
                            lblprepared.text = "Prepared By";
                            lblprepared.font = Arial_12;
                            lblprepared.textFill = DarkGray;
                            txtprepared.visible = true;
                            txtprepared.layoutX = 580.0;
                            txtprepared.layoutY = 248.0;
                            __layoutInfo_txtprepared.width = 200.0;
                            txtprepared.onKeyPressed = txtpreparedOnKeyPressedAtShown;
                            txtprepared.font = Arial_12;
                            txtprepared.multiline = false;
                            lbldep.visible = true;
                            lbldep.layoutX = 490.0;
                            lbldep.layoutY = 290.0;
                            lbldep.text = "Department";
                            lbldep.font = Arial_12;
                            lbldep.textFill = DarkGray;
                            txtdep.visible = true;
                            txtdep.layoutX = 580.0;
                            txtdep.layoutY = 288.0;
                            __layoutInfo_txtdep.width = 200.0;
                            txtdep.onKeyPressed = txtdepOnKeyPressedAtShown;
                            txtdep.font = Arial_12;
                            txtdep.multiline = false;
                            paneldiagnosis.visible = true;
                            paneldiagnosis.layoutY = 170.0;
                            imageprint.visible = true;
                            imageprint.image = imagePrint;
                            btnprint.visible = true;
                            btnprint.effect = reflectionEffect;
                            btnprint.text = "Print [F2]";
                            btnprint.font = Arial_Bold_14;
                            btnprint.action = btnprintActionAtShown;
                            imagesave.visible = true;
                            imagesave.image = imageSave;
                            btnsave.visible = true;
                            btnsave.layoutX = 170.0;
                            btnsave.layoutY = 0.0;
                            btnsave.onKeyPressed = btnsaveOnKeyPressedAtShown;
                            btnsave.effect = reflectionEffect;
                            btnsave.text = "Save [F3]";
                            btnsave.font = Arial_Bold_14;
                            btnsave.action = btnsaveActionAtShown;
                            imageedit.visible = true;
                            imageedit.image = imageEdit;
                            btnedit.visible = true;
                            btnedit.layoutX = 350.0;
                            btnedit.effect = reflectionEffect;
                            btnedit.text = "Edit [F6]";
                            btnedit.font = Arial_Bold_14;
                            btnedit.action = btneditActionAtShown;
                            imagereset.visible = true;
                            imagereset.image = imageReset;
                            btnreset.visible = true;
                            btnreset.layoutX = 525.0;
                            btnreset.onMouseClicked = btnresetOnMouseClickedAtShown;
                            btnreset.effect = reflectionEffect;
                            btnreset.text = "Reset [F4]";
                            btnreset.font = Arial_Bold_14;
                            imagecancel.visible = true;
                            imagecancel.image = imageCancel;
                            btncancel.visible = true;
                            btncancel.layoutX = 700.0;
                            btncancel.effect = reflectionEffect;
                            btncancel.text = "Cancel[F8]";
                            btncancel.font = Arial_Bold_14;
                            btncancel.action = btncancelActionAtShown;
                            panelbuttons.visible = true;
                            panelbuttons.layoutY = 525.0;
                            listpatient.visible = false;
                            listpatient.disable = false;
                            listpatient.layoutY = 75.0;
                            __layoutInfo_listpatient.width = 250.0;
                            listpatient.items = null;
                            panelCalendar.visible = true;
                            panelCalendar.layoutY = 50.0;
                            panelCalendar.blocksMouse = true;
                            datepanel.visible = false;
                            datepanel.blocksMouse = true;
                            listdoctorview.visible = false;
                            listdoctorview.layoutY = 160.0;
                            __layoutInfo_listdoctorview.width = 200.0;
                            listdoctorview.items = null;
                            panelAlert.visible = true;
                            listsurgeonview.visible = false;
                            listsurgeonview.layoutY = 200.0;
                            __layoutInfo_listsurgeonview.width = 200.0;
                            listsurgeonview.items = null;
                            MainPanel.visible = true;
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

    function btnprintActionAtShown(): Void {
        if(btnsave.text == "Save [F3]"){
            save(1);
        }
        else{
            update(1);
        }
         }
         
    function txtdepOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtsymptoms.requestFocus();
        }
        shortcut(event);
         }

    function txtpreparedOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtdep.requestFocus();
        }
        shortcut(event);
         }

    function txtnotesOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtprepared.requestFocus();
        }
        shortcut(event);
         }

    function txtmedicationOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtnotes.requestFocus();
        }
        shortcut(event);
         }

    function txtfollowupOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtmedication.requestFocus();
        }
        shortcut(event);
         }

    function txtdisadviceOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtfollowup.requestFocus();
        }
        shortcut(event);
         }

    function txtinvesstiagtionOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtdisadvice.requestFocus();
        }
        shortcut(event);
         }

    function txtfamilyhisOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtinvesstiagtion.requestFocus();
        }
        shortcut(event);
         }

    function txtprecomplaintsOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtfamilyhis.requestFocus();
        }
        shortcut(event);
         }

    function txtpatadviceOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtprecomplaints.requestFocus();
        }
        shortcut(event);
         }

    function txtdrugallergyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            btnprint.requestFocus();
        }
        shortcut(event);
         }

    function txtconsnoteOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtpatadvice.requestFocus();
        }
        shortcut(event);
         }

    function txtdrnoteOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtconsnote.requestFocus();
        }
        shortcut(event);
         }

    function txtdiagnosisOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtdrnote.requestFocus();
        }
        shortcut(event);
         }

    function txtgenallergyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtdrugallergy.requestFocus();
        }
        shortcut(event);
         }

    function txtsymptomsOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
      if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtgenallergy.requestFocus();
        }
        shortcut(event);
         }

    function imagesurgeonOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
             if(not listsurgeonview.visible){
         //txtsearchpatient.style = mandatoryStyle;
         getSurgeonList(1);
         listpatient.visible=false;
         }
         else{
             listsurgeonview.visible = false;
         }
         }

    function txtsurgeonOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
             getSurgeonList(1);
        if (event.code == KeyCode.VK_DOWN) {
            listsurgeonview.requestFocus();
            listsurgeonview.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listsurgeonview.visible = false;
            txtsurgeon.requestFocus();
        }
         }

    function txtsurgeonOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtdiagnosis.requestFocus();
        }
        shortcut(event);
         }

  
    function btncancelActionAtShown(): Void {
      if (btncancel.text == "Back [Ctrl+Left]") {
            back();
      } else if (btncancel.text == "Cancel [F8]") {
           cancel();
        }
         }
     public function cancel(): Void {
            delete  MainPanel.content;
            MainPanel.visible = false;
            CommonDeclare.form[5] = 0;
    }
    public function back(): Void {
        imagecancel.image = imageCancel;
        imageedit.image = imageEdit;
        CancelW = bottonW;
        listpatient.visible = false;
        btnsave.disable = false;
        btnsave.text = "Save [F3]";
        btnedit.disable = false;
        btnedit.text = "Edit [F6]";
        btnreset.disable = false;
        btnreset.text = "Reset [F4]";
        clear();
        btncancel.text = "Cancel [F8]";
        StartUp();
    }

    function btneditActionAtShown(): Void {
             if (btnedit.text == "Delete [F5]") {
            del();
               } else {
            edit();
            }
         }
  public function del(): Void {
        displaycust1(txtPatientcode.text,txtdate.text);
    }
     public function displaycust1(id: String, date: String): Void {

         var vitalModel  = new DischargeModel();
         vitalModel.setCustcode(id);
        var vm: Boolean;
        try {
            customerController = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
           vm = customerController.delRecord6(id,date);
           FXalert(5);
           reset();

        } catch (e: Exception) {
            var msg: String = "Class : Consultantnote Method : displaycust1()   = {e.getMessage()}";
            log.debug(msg);
        }
    }


     public function edit(): Void {
        clear();
        listpatient.visible = false;
        btncancel.text = "Back [Ctrl+Left]";
        btnsave.text = "Update [F7]";
        btnedit.text = "Delete [F5]";
        CancelW = bottonW + 50;
        imageedit.image = imageCancel;
        imagecancel.image = imageBack;
    }
    function dischargedateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            if (not discdateFlag) {
            panelCalendar.layoutY = dischargedate.layoutY + txtdischargedate.height + 5.0;
            if (txtdischargedate.rawText != null) {
                var dat = txtdischargedate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            }
            fxCalendar.visible = true;
            discdateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
         }

    function admissiondateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
             if (not addateFlag) {
            panelCalendar.layoutY = admissiondate.layoutY + txtadmissiondate.height + 5.0;
            if (txtadmissiondate.rawText != null) {
                var dat = txtadmissiondate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            }
            fxCalendar.visible = true;
            addateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
         }

    function btnsaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          if (event.code == KeyCode.VK_ENTER ) {
             save(0) ;
        }
        else{
            update(0);
            }
         }
   public function save(ss: Integer): Void {
       try{
       var i:Boolean = false;
       var sdf = new SimpleDateFormat("dd-MM-yyyy");
       var patDate = DateUtils.changeFormatDate(sdf.parse(txtdate.rawText));
       var check =clickValid(ss);
       var service= new DischargeModel();
       if (check == 0){
            var vitalModel : DischargeModel = new DischargeModel();
                    vitalModel.setDate(patDate);
                    vitalModel.setPatientName(txtPatientname.rawText.trim().replaceAll("'",""));
                    vitalModel.setCustcode(txtPatientcode.rawText.replaceAll("'",""));
                    vitalModel.setAge(txtPatientage.rawText.replaceAll("'",""));
                    vitalModel.setGender(txtgender.rawText.replaceAll("'",""));
                    vitalModel.setMobileno(txtmobile.rawText.replaceAll("'",""));
                    vitalModel.setAddate(txtadmissiondate.rawText.replaceAll("'",""));
                    vitalModel.setDisdate(txtdischargedate.rawText.replaceAll("'",""));
                    vitalModel.setDistype(txtdischargetype.rawText.replaceAll("'",""));
                    vitalModel.setDoctorName(txtdoctor.rawText.replaceAll("'",""));
                    vitalModel.setSymptoms(txtsymptoms.rawText.replaceAll("'",""));
                    vitalModel.setGenallergy(txtgenallergy.rawText.replaceAll("'",""));
                    vitalModel.setDrugallergy(txtdrugallergy.rawText.replaceAll("'",""));
                    vitalModel.setDiagnosis(txtdiagnosis.rawText.replaceAll("'",""));
                    vitalModel.setDrnote(txtdrnote.rawText.replaceAll("'",""));
                    vitalModel.setConsnote(txtconsnote.rawText.replaceAll("'",""));
                    vitalModel.setPatadvice(txtpatadvice.rawText.replaceAll("'",""));
                    vitalModel.setPrevcomplaints(txtprecomplaints.rawText.replaceAll("'",""));
                    vitalModel.setFamilyhis(txtfamilyhis.rawText.replaceAll("'",""));
                    vitalModel.setInvestigation(txtinvesstiagtion.rawText.replaceAll("'",""));
                    vitalModel.setDisadvice(txtdisadvice.rawText.replaceAll("'",""));
                    vitalModel.setFollowup(txtfollowup.rawText.replaceAll("'",""));
                    vitalModel.setMedication(txtmedication.rawText.replaceAll("'",""));
                    vitalModel.setNotes(txtnotes.rawText.replaceAll("'",""));
                    vitalModel.setPreparedby(txtprepared.rawText.replaceAll("'",""));
                    vitalModel.setDep(txtdep.rawText.replaceAll("'",""));
                    vitalModel.setSurgeon(txtsurgeon.rawText.replaceAll("'",""));

               service.setInsertType("save");

                var type="";
                var returnObject = new Object();
                returnObject = patientDetailsController.createRecordDischarge(vitalModel);

                var msgReturnModel: Boolean;
                 msgReturnModel = returnObject as Boolean;
                if(msgReturnModel)
                {
                    type="save";

                    if (ss == 1) {
                        var salesController : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
                        var prescNo = "";
                        if(service.getInsertType().equals("save")) {
                        prescNo = commonController.getQueryValue("select max(DischargeID) from dischargesummary");
                        //java.lang.System.out.println("print if save : {prescNo}");
                        }
                        else {
                       // prescNo = txtPrescriptionId.text;
                        prescNo = "";
                        }
                        type = "Print";

                        var reportSource: File = new File("printerfiles/DischargeSummaryPrint.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        var jasperPrint:JasperPrint = salesController.jasperPrint(prescNo, "Prescription",jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);
                    }
                    FXalert(0);
                    clear();
                }


       }

       }
       catch (ex: Exception)

        {
            var que = " Class: DischargeSummary Method: save Exception:{ex}";
            log.debug(que);
        }
   }
     public function update(chk: Integer): Void {
          try {
     // java.lang.System.out.println("inside update");
              var san: Integer = 0;
              var sdf = new SimpleDateFormat("dd-MM-yyyy");

              var patDate = DateUtils.changeFormatDate(sdf.parse(txtdate.rawText));
              var service= new DischargeModel();
              san = clickValid(chk);
              if (san == 0) {
               //   java.lang.System.out.println("inside update if");
                 var vitalModel : DischargeModel = new DischargeModel();
                     
                    vitalModel.setPatientName(txtPatientname.rawText.trim().replaceAll("'",""));
                    vitalModel.setCustcode(txtPatientcode.rawText.replaceAll("'",""));
                    vitalModel.setDate(patDate);
                    vitalModel.setAge(txtPatientage.rawText.replaceAll("'",""));
                    vitalModel.setGender(txtgender.rawText.replaceAll("'",""));
                    vitalModel.setMobileno(txtmobile.rawText.replaceAll("'",""));
                    vitalModel.setAddate(txtadmissiondate.rawText.replaceAll("'",""));
                    vitalModel.setDisdate(txtdischargedate.rawText.replaceAll("'",""));
                    vitalModel.setDistype(txtdischargetype.rawText.replaceAll("'",""));
                    vitalModel.setDoctorName(txtdoctor.rawText.replaceAll("'",""));
                    vitalModel.setSymptoms(txtsymptoms.rawText.replaceAll("'",""));
                    vitalModel.setGenallergy(txtgenallergy.rawText.replaceAll("'",""));
                    vitalModel.setDrugallergy(txtdrugallergy.rawText.replaceAll("'",""));
                    vitalModel.setDiagnosis(txtdiagnosis.rawText.replaceAll("'",""));
                    vitalModel.setDrnote(txtdrnote.rawText.replaceAll("'",""));
                    vitalModel.setConsnote(txtconsnote.rawText.replaceAll("'",""));
                    vitalModel.setPatadvice(txtpatadvice.rawText.replaceAll("'",""));
                    vitalModel.setPrevcomplaints(txtprecomplaints.rawText.replaceAll("'",""));
                    vitalModel.setFamilyhis(txtfamilyhis.rawText.replaceAll("'",""));
                    vitalModel.setInvestigation(txtinvesstiagtion.rawText.replaceAll("'",""));
                    vitalModel.setDisadvice(txtdisadvice.rawText.replaceAll("'",""));
                    vitalModel.setFollowup(txtfollowup.rawText.replaceAll("'",""));
                    vitalModel.setMedication(txtmedication.rawText.replaceAll("'",""));
                    vitalModel.setNotes(txtnotes.rawText.replaceAll("'",""));
                    vitalModel.setPreparedby(txtprepared.rawText.replaceAll("'",""));
                    vitalModel.setDep(txtdep.rawText.replaceAll("'",""));
                    vitalModel.setSurgeon(txtsurgeon.rawText.replaceAll("'",""));

                 var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "DischargeSummary Info");
                 var a = bind cn.staus;
                 service.setInsertType("save");

                var type="";
                var returnObject = new Object();
                returnObject = patientDetailsController.updatePatientDetailsRecord20(vitalModel);

                var msgReturnModel: Boolean;//sabarish MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as Boolean;
                if(msgReturnModel)
                {
                   // java.lang.System.out.println("print if");
                   type="save";

                    if (chk == 1) {
                       // java.lang.System.out.println("print if 2 ss==1");
                        var salesController : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
                        var prescNo = "";
                        if(service.getInsertType().equals("save")) {
                        prescNo = commonController.getQueryValue("select max(DischargeID) from dischargesummary");
                        //java.lang.System.out.println("print if save : {prescNo}");
                        }
                        else {
                       // prescNo = txtPrescriptionId.text;
                        prescNo = "";
                        }
                        type = "Print";
                       // java.lang.System.out.println("print: Print ");
                        var reportSource: File = new File("printerfiles/DischargeSummaryPrint.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        var jasperPrint:JasperPrint = salesController.jasperPrint(prescNo, "Prescription",jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);

                    }
                     FXalert(4);
                    clear();

                }
             }

          }catch (e: Exception) {
            var msg: String = "Class : DischargeSummary  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
     }

    function btnsaveActionAtShown(): Void {
         if(btnsave.text == "Save [F3]"){
            save(0);
        }
        else{
            update(0);
        }
         }

    function btnresetOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
             reset();
         }

    function imagedoctorOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            if(not listdoctorview.visible){
         //txtsearchpatient.style = mandatoryStyle;
         getDoctorList(1);
         listpatient.visible=false;
         }
         else{
             listdoctorview.visible = false;
         }
         }
         

    function txtdoctorOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
             getDoctorList(1);
        if (event.code == KeyCode.VK_DOWN) {
            listdoctorview.requestFocus();
            listdoctorview.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listdoctorview.visible = false;
            txtdoctor.requestFocus();
        }
         }

   function txtdoctorOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
             if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtsurgeon.requestFocus();
        }
        shortcut(event);
         }

function getDoctorList(con: Integer): Void {
       try
        {
        listdoctorview.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtdoctor, listdoctorview, "doctor", con);
        listW = txtdoctor.width;
        listdoctorview.layoutY = txtdoctor.layoutY + 22;
         var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                   // CashSalesTableObj.focusSet();
                   txtsurgeon.requestFocus();
                     if (listdoctorview.selectedItem != "New name...") {
            txtdoctor.text = "{listdoctorview.selectedItem}";
            txtsurgeon.requestFocus();
        } 
      }
    }
   }
    catch(ex:Exception) {
            var que = " Class : DischargeSummary   Method: getDoctorList() )    Exception : {ex}";
            log.debug(que);
        }
    }
function getSurgeonList(con: Integer): Void {
       try
        {
        listsurgeonview.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtsurgeon, listsurgeonview, "doctor", con);
        listW = txtsurgeon.width;
        listsurgeonview.layoutY = txtsurgeon.layoutY + 22;
         var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                   // CashSalesTableObj.focusSet();
                   txtdiagnosis.requestFocus();
                     if (listsurgeonview.selectedItem != "New name...") {
            txtsurgeon.text = "{listsurgeonview.selectedItem}";
            txtdiagnosis.requestFocus();
        }
      }
    }
   }
    catch(ex:Exception) {
            var que = " Class : DischargeSummary   Method: getDoctorList() )    Exception : {ex}";
            log.debug(que);
        }
    }


    function imagsearchpatnameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            if(not listpatient.visible){
         //txtsearchpatient.style = mandatoryStyle;
         getPatient(1);
         listdoctorview.visible=false;
         }
         else{
             listpatient.visible = false;
         }
         }

    function txtsearchpatientOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {       
             getPatient(1);
         if (event.code == KeyCode.VK_DOWN) {
            listpatient.requestFocus();
            listpatient.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listpatient.visible = false;
            txtsearchpatient.requestFocus();
        }
         }

    function txtsearchpatientOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPatientcode.requestFocus();
        
                shortcut(event);
         }
       }
         
    function getDateValue():Void {
          
        if (not dateFlag) {
            panelCalendar.layoutY = imgCalendar.layoutY + txtdate.height + 5.0;
            if (txtdate.rawText != null) {
                var dat = txtdate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            }
            fxCalendar.visible = true;
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }
  var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            cashBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtPatientname.requestFocus();
        }
    };
     function imgCalendarOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          getDateValue();
         }

    function imgCalendarOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
          getDateValue();
         }

    function txtdateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
           fxCalendar.visible = false ;
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
        shortcut(event);
    }

     public function getPatient(con: Integer): Void {
        try{
        listpatient.visible = false;
        listdoctorview.visible=false;
        var listControlObj: ListController = new ListController();
        if(btnsave.text=="Save [F3]"){
         System.out.println("Customer6");
        listH = listControlObj.listImageControlView(txtsearchpatient, listpatient, "Customer6", con);        
        listW = txtsearchpatient.width;
        listpatient.layoutY = txtsearchpatient.layoutY + 22;       
        var selS: String = bind listControlObj.selectedString on replace {
         if (selS.length() > 0) {
                    txtsearchpatient.requestFocus();
         if (listpatient.selectedItem != "New name...") {         
            txtsearchpatient.text = "{listpatient.selectedItem}";
            var customerDetails:List = commonController.getQueryValue("select cust_code,cust_name,age,gender,mobile_no from cust_information where concat(cust_name,' - ',mobile_no)='{txtsearchpatient.rawText.trim()}'", 5);
            txtPatientcode.text = customerDetails.get(0).toString();
            txtPatientname.text = customerDetails.get(1).toString();
            txtPatientage.text = customerDetails.get(2).toString();
            txtgender.text = customerDetails.get(3).toString();
            txtmobile.text = customerDetails.get(4).toString();
         }
         }}
         }
     else if(btnsave.text=="Update [F7]"){
           java.lang.System.out.println("Customer0703");
         listH = listControlObj.listImageControlView1(txtdate, txtsearchpatient, listpatient, "Customer0703", con);

        var selectString = bind listControlObj.selectedString on replace {
            if (selectString.length() > 0) {

                displayCustomer(selectString,txtdate.text);
                txtPatientname.requestFocus();
            }
     }
      }
     }
     
      catch(ex:Exception) {
            var que = " Class : DischargeSummary   Method: getPatient() )    Exception : {ex}";
            log.debug(que);
        }
    }
   public function displayCustomer(name: String, date: String): Void {
         var vitalModel  = new DischargeModel();
          vitalModel.setPatientName(name);
         System.out.println("Discharge UI");
         try{
            customerController = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
            System.out.println("view1: ");
            var vitalModel1 = commonController.viewRecord10(name,date) as DischargeModel;
            System.out.println("view2: ");
            var v=vitalModel1.getDate();;
            System.out.println(v);
            var v1=vitalModel1.getCustcode();
             System.out.println(v1);
            //txtdate.text = vitalModel1.getDate();
           // System.out.println("Date: ");
            txtPatientcode.text = vitalModel1.getCustcode();
            txtPatientname.text = vitalModel1.getPatientName();
            System.out.println("Name :");
            txtPatientage.text =vitalModel1.getAge();           
            txtgender.text = vitalModel1.getGender();
            txtmobile.text = vitalModel1.getMobileno();
            txtadmissiondate.text = vitalModel1.getAddate();
            txtdischargedate.text = vitalModel1.getDisdate();
            txtdischargetype.text = vitalModel1.getDistype();
            txtdoctor.text = vitalModel1.getDoctorName();            
            txtdiagnosis.text = vitalModel1.getDiagnosis();
            txtdrnote.text = vitalModel1.getDrnote();
            txtconsnote.text = vitalModel1.getConsnote();
            txtpatadvice.text = vitalModel1.getPatadvice();
            txtprecomplaints.text = vitalModel1.getPrevcomplaints();
            txtfamilyhis.text = vitalModel1.getFamilyhis();
            txtinvesstiagtion.text = vitalModel1.getInvestigation();
            txtdisadvice.text = vitalModel1.getDisadvice();
            txtfollowup.text = vitalModel1.getFollowup();
            txtmedication.text = vitalModel1.getMedication();
            txtnotes.text = vitalModel1.getNotes();
            txtprepared.text = vitalModel1.getPreparedby();
            txtdep.text = vitalModel1.getDep();
            txtsymptoms.text = vitalModel1.getSymptoms();
            txtgenallergy.text = vitalModel1.getGenallergy();
            txtdrugallergy.text = vitalModel1.getDrugallergy();
            txtsurgeon.text = vitalModel1.getSurgeon();
            System.out.println("Surgeon :");
            txtdate.text = vitalModel1.getDate();
         }
         catch (e: Exception) {
            var msg: String = "Class : DischargeSummary Method : displayCustomer()   = {e.getMessage()}";
            log.debug(msg);
        }
   }
def kr = KeyRegistry {};
      public function shortcut(event: javafx.scene.input.KeyEvent): Void {
           if (event.code == kr.save and btnsave.text == "Save [F3]" and not btnsave.disable) {
                save(0);
            }
            if (event.code == kr.edit and btnedit.text == "Edit [F6]" and not btnedit.disable) {
                edit();
            }
            if (event.code == kr.reset and btnreset.text == "Reset [F4]") {
                reset();
            }
            if (event.code == kr.update and btnsave.disable == false) {
                if (btnsave.text == "Update [F7]") { update(0); }
            }
            if (event.code == kr.del and btnedit.disable == false) {
                if (btnedit.text == "Delete [F5]") { del(); }
            }
           /* if (event.controlDown and event.code == kr.back) {
                if (btncancel.text == "Back [Ctrl+Left]") { back(); }
            }
            if (event.code == kr.cancel) {
                if (btncancel.text == "Cancel [F8]") { cancel(); }
            }*/
    }
      public function clear(): Void {        
        cashBillDate = DateUtils.now("dd-MM-yyyy");
        fxCalendar.visible = false;
        txtsearchpatient.text="";
        txtPatientcode.text="";
        txtPatientname.text="";
        txtPatientage.text="";
        txtgender.text="";
        txtmobile.text="";
        txtadmissiondate.text="";
        txtdischargedate.text="";
        txtdischargetype.text=""; 
        txtdoctor.text="";
        txtsymptoms.text="";
        txtgenallergy.text="";
        txtdrugallergy.text="";
        txtdiagnosis.text="";
        txtdrnote.text="";
        txtconsnote.text="";
        txtpatadvice.text="";
        txtprecomplaints.text="";
        txtfamilyhis.text="";
        txtinvesstiagtion.text="";
        txtdisadvice.text="";
        txtfollowup.text="";
        txtmedication.text="";
        txtnotes.text="";
        txtprepared.text="";
        txtdep.text="";
        txtsurgeon.text="";
        
    }
   public function reset(): Void {
        clear();
        listpatient.visible = false;
        txtsearchpatient.requestFocus();
    }

   function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Discharge Summary", type);
        showAlertbox();
    }

function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Discharge Summary", msg);
        showAlertbox();
    }
    
 function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Discharge Summary", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

 function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

 public function clickValid(ch: Integer): Integer {
        var patName = txtPatientname.rawText.replaceAll("'","");

        var cnt: Integer = 0;
        var val: Validation = new Validation();
        var st1: String;
        var st2: String[];
        var part1: String[];
       // java.lang.System.out.println("text date: {txtPatientDate.rawText}");
        var sdf = new SimpleDateFormat("dd-MM-yyyy");
        var patDate = DateUtils.changeFormatDate(sdf.parse(txtdate.rawText));
       // java.lang.System.out.println("patdate: {patDate}");
        st1=txtPatientname.rawText;
        st2=st1.split("-");
        part1 = st2[0];
       // java.lang.System.out.println("st2: {part1}");
       // java.lang.System.out.println("cname: {txtPatientName.rawText.trim().replaceAll("'","")}");
        //java.lang.System.out.println("dname: {txtDoctorName.rawText.trim().replaceAll("'","")}");

        var itemExists: String = commonController.getQueryValue("SELECT cust_name FROM dischargesummary d where status!=2 and Infodate='{patDate}' and cust_name='{part1}' and doctor_name='{txtdoctor.rawText.trim().replaceAll("'","")}'");
       // var itemExistsUpdate: String = commonController.getQueryValue("SELECT cust_name FROM dischargesummary d where status!=2 and Infodate='{patDate}' and cust_name='{txtPatientName.rawText.trim()}'");

        try {

           if(patName.length()<=0){
                cnt = 1;
                FXinfo("Please Enter the Patient Name", txtPatientname);
            } else if(btnsave.text == "Save [F3]" and itemExists!="") {
                FXinfo("The Same Customer already exists in DischargeSummary. Please check.");
                cnt = 1;
            }
            else {
                cnt = 0;
            }

        } catch (e: Exception) {
            var msg: String = "Class : DischargeSummary  Method : ClickValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }


public function StartUp(): Void {
         reset();
        fxCalendar.visible = false;
        panelCalendar.content = [fxCalendar,];
        fxCalendar.visible = false;
}

}
