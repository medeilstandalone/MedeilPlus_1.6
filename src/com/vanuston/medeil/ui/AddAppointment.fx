package com.vanuston.medeil.ui;

import javafx.scene.input.KeyCode;
import java.lang.* ;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.model.AppointmentModel;
import java.sql.Date;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.AppointmentTable;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.HashMap;
import com.vanuston.medeil.util.SmsSender;

public class AddAppointment {
    //Controller Reference
    var appointmentController : com.vanuston.medeil.implementation.Appointment ;
    var commonController : com.vanuston.medeil.implementation.CommonImplements ;
//    var commonController:CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var appointmentTable : AppointmentTable =new AppointmentTable() ;
    var rowNo = 10;
    var colNames: Object[] = ["Appoint No.", "Patient Name", "Appointment From ", "Appointment To"];
    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class];
    var colEditable: Boolean[] = [false, false, false, false];
    var colWidth: Integer[] = [125, 200, 200, 180] ;
    var table = appointmentTable.createViewTable(rowNo, colNames, colType, colEditable, colWidth) ;
    var ShowAppointment = SwingComponent.wrap(appointmentTable.getScrollTable(table)) ;
    var log: Logger = Logger.getLogger(AddAppointment.class, "Appointment");
    var listH = 0.0;    
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW-40;
    var bottonH = bind CommonDeclare.bottonH-20;
    var CancelW = bottonW;
    var TableW = bind (95.29860229 * (panelW/2)) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 225.0 on replace { changeTableSize(TableW, TableH); };
    var panelTableLX = bind ((panelW/2) - TableW) / 2;
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    function changeTableSize(i: Integer, j: Integer): Void {
        ShowAppointment.getJComponent().setPreferredSize(new Dimension(i, j));
    }
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var val: Validation = new Validation();
    def RepViewer = ReportViewer {};

    var hi : HospitalInformation ;
    var hospitalName: String ;
    var hName:String = bind hi.hospitalName  on replace {
        hospitalName = hName;
    }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: 265.0
    }
    
    public-read def panelReport: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C3LX
        layoutY: 265.0
    }
    
    public-read def rectReportBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind C3LX
        layoutY: 185.0
        styleClass: "rectTableBorder"
        width: bind TableW-40
        height: bind TableH
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: 265.0
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def cboFromTime: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX+90
        layoutY: 120.0
        onKeyPressed: cboFromTimeOnKeyPressed
        onKeyReleased: cboFromTimeOnKeyReleased
        items: [ "AM", "PM", ]
    }
    
    public-read def cboToTime: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX+310
        layoutY: 120.0
        onKeyPressed: cboToTimeOnKeyPressed
        items: [ "AM", "PM", ]
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 5.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 37.0
        layoutY: 148.0
        layoutInfo: __layoutInfo_separator2
    }
    
    public-read def cboFilterFromTime: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX+30
        layoutY: 190.0
        onKeyPressed: cboFilterFromTimeOnKeyPressed
        onKeyReleased: cboFilterFromTimeOnKeyReleased
        items: [ "AM", "PM", ]
    }
    
    public-read def cboFilterToTime: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX+240
        layoutY: 190.0
        onKeyPressed: cboFilterToTimeOnKeyPressed
        items: [ "AM", "PM", ]
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 188.0
        layoutY: 54.0
        blocksMouse: true
    }
    
    def __layoutInfo_listPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listPatientName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 47.0
        layoutInfo: __layoutInfo_listPatientName
        items: null
    }
    
    def __layoutInfo_listDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listDoctorName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 74.0
        layoutInfo: __layoutInfo_listDoctorName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listVisitHours: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtVisitingHours.width
        height: bind listH
    }
    public-read def listVisitHours: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C4LX
        layoutY: 210.0
        layoutInfo: __layoutInfo_listVisitHours
        items: null
    }
    
    public-read def pcodes: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+90
        layoutY: 110.0
        text: ""
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtVisitingHours: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtVisitingHours: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 190.0
        layoutInfo: __layoutInfo_txtVisitingHours
        onKeyReleased: txtVisitingHoursOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_btnVisitHours: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 20.0
    }
    public-read def btnVisitHours: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind C2LX+50
        layoutY: 220.0
        layoutInfo: __layoutInfo_btnVisitHours
        onMouseClicked: btnVisitHoursOnMouseClicked
        text: "Set as Visitng Hours[F2]"
        font: Arial_12
    }
    
    def __layoutInfo_btnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 20.0
    }
    public-read def btnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        disable: true
        layoutX: bind C2LX-60
        layoutY: 220.0
        layoutInfo: __layoutInfo_btnSearch
        onKeyPressed: btnSearchOnKeyPressed
        onMouseClicked: btnSearchOnMouseClicked
        text: "Search [F9]"
        font: Arial_12
    }
    
    def __layoutInfo_txtFilterToTime: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtFilterToTime: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+150
        layoutY: 190.0
        layoutInfo: __layoutInfo_txtFilterToTime
        onKeyPressed: txtFilterToTimeOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtFilterFromTime: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtFilterFromTime: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX-60
        layoutY: 190.0
        layoutInfo: __layoutInfo_txtFilterFromTime
        onKeyPressed: txtFilterFromTimeOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtEmergencyLevel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmergencyLevel: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtEmergencyLevel
        styleClass: "text-box"
        onKeyPressed: txtEmergencyLevelOnKeyPressed
        text: ""
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtReason: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: 55.0
    }
    public-read def txtReason: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 30.0
        layoutInfo: __layoutInfo_txtReason
        onKeyPressed: txtReasonOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 30.0
        layoutInfo: __layoutInfo_txtDate
        onKeyPressed: txtDateOnKeyPressed
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW+20
    }
    public-read def txtDoctorName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtDoctorName
        onKeyPressed: txtDoctorNameOnKeyPressed
        onKeyReleased: txtDoctorNameOnKeyReleased
        text: ""
        promptText: "Doctor Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW+20
    }
    public-read def txtPatientName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 90.0
        layoutInfo: __layoutInfo_txtPatientName
        styleClass: "text-box"
        onKeyPressed: txtPatientNameOnKeyPressed
        onKeyReleased: txtPatientNameOnKeyReleased
        text: "Patientname or Mobile No or Patient UHID(Ex UHID0002057)"
        promptText: "Patientname or MobileNo or Patient UHID(UHID0000001)"
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtDuration: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtDuration: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C4LX
        layoutY: 90.0
        layoutInfo: __layoutInfo_txtDuration
        onKeyPressed: txtDurationOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtAppointmentId: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW+20
    }
    public-read def txtAppointmentId: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtAppointmentId
        styleClass: "text-box"
        onKeyPressed: txtAppointmentIdOnKeyPressed
        onKeyReleased: txtAppointmentIdOnKeyReleased
        text: ""
        editable: false
        columns: 10.0
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    def __layoutInfo_btnsms: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnsms: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind C4LX
        layoutY: 120.0
        layoutInfo: __layoutInfo_btnsms
        text: "SMS"
        font: Arial_Bold_12
        action: btnsmsAction
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    def __layoutInfo_txtFromTime: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtFromTime: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 120.0
        layoutInfo: __layoutInfo_txtFromTime
        onKeyPressed: txtFromTimeOnKeyPressed
        text: ""
        promptText: "hh:mm"
        font: Arial_Bold_14
    }
    
    def __layoutInfo_txtToTime: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtToTime: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+220
        layoutY: 120.0
        layoutInfo: __layoutInfo_txtToTime
        onKeyPressed: txtToTimeOnKeyPressed
        promptText: "hh:mm"
        font: Arial_Bold_14
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
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind C3LX
        layoutY: 120.0
        layoutInfo: __layoutInfo_btnSave
        onKeyPressed: btnSaveOnKeyPressed
        effect: reflectionEffect
        text: "Save [F3]"
        font: Arial_Bold_12
        action: btnSaveAction
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind C4LX+bottonW+50
        layoutY: 120.0
        layoutInfo: __layoutInfo_btnReset
        onKeyPressed: btnResetOnKeyPressed
        effect: reflectionEffect
        text: "Reset [F4]"
        font: Arial_Bold_12
        action: btnResetAction
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label
        text: "APPOINTMENT - Alt+A"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def pcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        disable: false
        layoutX: bind C4LX+90
        layoutY: 100.0
        text: "Pcode"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblVisitingHours: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 190.0
        text: "Visiting Hours"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblFilterTo: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+110
        layoutY: 190.0
        text: "To"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblFilterFrom: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 190.0
        text: "Enter Time Period"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblFilter: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind C1LX-30
        layoutY: 160.0
        text: "View Appointment Schedule by Time"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def lblMins: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind C4LX+90
        layoutY: 90.0
        text: "In Mins"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDuration: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 90.0
        text: "Appointment Duration"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelReason: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 30.0
        text: "Appointment Reason"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelEmergencyLevel: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 0.0
        text: "Emergency Level"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblAppointmentTo: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+180
        layoutY: 120.0
        text: "To"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblAppointmentFrom: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX
        layoutY: 108.0
        text: "From"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAppointmentTime: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 120.0
        text: "Appointment Time"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAppointmentDate: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 0.9
        layoutX: bind C1LX
        layoutY: 30.0
        text: "Appointment Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDcoctorName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 60.0
        text: "Physician"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelPatientName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 90.0
        text: "Patient Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAppointmentId: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Appointment Id"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: DarkGray
        stroke: null
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, ]
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def lblDisplayDetails: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 245.0
        text: ""
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+Type3TextboxW
        layoutY: 30.0
        onKeyPressed: imgDateOnKeyPressed
        onMouseClicked: imgDateOnMouseClicked
        image: imageCalendar
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnEdit
        onKeyPressed: btnEditOnKeyPressed
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F6]"
        font: Arial_Bold_14
        action: btnEditAction
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_btnCancel
        onKeyPressed: btnCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        action: btnCancelAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: bind panelButtonsLY
        content: [ btnEdit, btnCancel, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageclickdown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgVisit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C4LX+txtVisitingHours.width-20
        layoutY: 190.0
        onMouseClicked: imgVisitOnMouseClicked
        image: imageclickdown
    }
    
    public-read def imgDoctorName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+txtDoctorName.width-20
        layoutY: 60.0
        onMouseClicked: imgDoctorNameOnMouseClicked
        image: imageclickdown
    }
    
    public-read def imgPatientName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+txtPatientName.width-20
        layoutY: 90.0
        onMouseClicked: imgPatientNameOnMouseClicked
        image: imageclickdown
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 787.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 50.0
        layoutInfo: __layoutInfo_panelpage
        content: [ panelTable, panelReport, rectReportBorder, rectTableBorder, txtAppointmentId, labelAppointmentId, labelPatientName, labelDcoctorName, labelAppointmentDate, labelAppointmentTime, lblAppointmentFrom, lblAppointmentTo, labelEmergencyLevel, labelReason, labelDuration, lblMins, txtDuration, txtToTime, txtFromTime, cboFromTime, cboToTime, txtPatientName, txtDoctorName, txtDate, txtReason, txtEmergencyLevel, separator2, lblFilter, lblDisplayDetails, imgDate, imgPatientName, imgDoctorName, lblFilterFrom, txtFilterFromTime, cboFilterFromTime, lblFilterTo, txtFilterToTime, cboFilterToTime, btnSearch, btnVisitHours, lblVisitingHours, txtVisitingHours, imgVisit, panelCalender, listPatientName, listDoctorName, listVisitHours, btnReset, btnSave, btnsms, pcode, pcodes, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panelheader, panelpage, panelButtons, panelAlert, ]
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function btnsmsAction(): Void {
           save(2);
         }

    function txtVisitingHoursOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {        
          getVisitHours(event.code,txtVisitingHours.rawText.trim());
            if (event.code == KeyCode.VK_DOWN) {
                listVisitHours.requestFocus();
                listVisitHours.selectFirstRow();
            }
            else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB)
            {
                listVisitHours.visible = false;
            }
      }

    function imgVisitOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(not listVisitHours.visible){
        getVisitHours(KeyCode.VK_DOWN,"");
        }
        else {
            listVisitHours.visible = false ;
        }
    }

    function getVisitTime() {
        var dispTime = txtVisitingHours.text.split(" ");
        txtFilterFromTime.text = dispTime[0];
        txtFilterToTime.text = dispTime[3];
        if(dispTime[1].equals("AM")) {
            cboFilterFromTime.select(0);
        }
        else {
            cboFilterFromTime.select(1);
        }
        if(dispTime[4].equals("AM")) {
            cboFilterToTime.select(0);
        }
        else {
            cboFilterToTime.select(1);
        }
    }

    function getVisitHours(kcode: javafx.scene.input.KeyCode,cname:String) {
        listVisitHours.visible = true;
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as com.vanuston.medeil.implementation.CommonImplements;
        var custName =  commonController.getVisitingHours(cname,txtDoctorName.rawText.trim()).toArray();
        listVisitHours.clearSelection();
        listVisitHours.items = custName;
        var size =  listVisitHours.items.size();
        listVisitHours.onKeyPressed = function(e) {
        if (e.code == KeyCode.VK_ENTER) {
            txtVisitingHours.text = "{listVisitHours.selectedItem}";
            getVisitTime();
            searchResult();
            listVisitHours.visible = false;
        }
        else if (e.code == KeyCode.VK_DOWN) {
            if (listVisitHours.selectedIndex == 0) {
                listVisitHours.selectFirstRow();
            }
        }
        else if (e.code == KeyCode.VK_ESCAPE) {
            listVisitHours.visible = false;
            txtVisitingHours.requestFocus();
        }
        };
        listVisitHours.onMouseClicked = function(e) {
            txtVisitingHours.text = "{listVisitHours.selectedItem}";
            getVisitTime();
            searchResult();
            listVisitHours.visible = false;
        }
        if(size<12) {
            listH=size*25;
            if(size>5)
                listH-=5;
            if(size == 0)
                listVisitHours.visible=false;
        } 
        else {
             listH = 295;
        }
        if (kcode == KeyCode.VK_ESCAPE or kcode == KeyCode.VK_TAB) {
            listVisitHours.visible = false;
            txtVisitingHours.requestFocus();
        }
    }


    function displayVisitHours() {
        var query:String = "select visit_hours from medp_visithours_mt where visit_hours='{txtFilterFromTime.rawText.trim()} {cboFilterFromTime.selectedItem.toString()} To {txtFilterToTime.rawText.trim()} {cboFilterToTime.selectedItem.toString()}' order by id desc";
        if(txtDoctorName.rawText.trim().equals("")) {
            FXinfo("Please enter the doctor name");
        }
        else if(checkFilterTime(txtFilterFromTime)==1 or checkFilterTime(txtFilterToTime)==1) {
        }
        else if(not appointmentController.selectQry(query, 0, "sql").equals("")) {
            FXinfo("The entered time has already been set as visiting Hours");
        }
        else {
        var i:Integer = appointmentController.insertQry("insert into medp_visithours_mt(doctor_name, visit_hours) values('{txtDoctorName.rawText.trim()}','{txtFilterFromTime.rawText.trim()} {cboFilterFromTime.selectedItem.toString()} To {txtFilterToTime.rawText.trim()} {cboFilterToTime.selectedItem.toString()}')");
        if(i > 0) {
            FXinfo("Search Time set as Doctor visiting hours");
        }
        }
     }

    function btnVisitHoursOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       displayVisitHours();
    }

    function searchResult() : Void {
        if(checkFilterTime(txtFilterFromTime)==1 or checkFilterTime(txtFilterToTime)==1) {
        }        
        else {
            loadAppointmentChart("{txtFilterFromTime.rawText.trim()} {cboFilterFromTime.selectedItem.toString()}", "{txtFilterToTime.rawText.trim()} {cboFilterToTime.selectedItem.toString()}");
            var appointModel = new AppointmentModel();
            appointModel.setDoctorName(txtDoctorName.rawText.trim());
            appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtDate.rawText)));
            appointModel.setIsActive(0);
            appointModel.setUpdatedBy("time");
            appointModel.setAppointmentFromTime("{txtFilterFromTime.rawText.trim()} {cboFilterFromTime.selectedItem.toString()}");
            appointModel.setAppointmentToTime("{txtFilterToTime.rawText.trim()} {cboFilterToTime.selectedItem.toString()}");
            appointmentTable.loadAppointmentTable(appointModel);
        }
    }

    function btnSearchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            searchResult();
            txtVisitingHours.text = "";
        } shortcutSearch(event);
      }

    function btnSearchOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
            searchResult();
            txtVisitingHours.text = "";
    }

    function cboFilterFromTimeOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        cboFilterToTime.select(cboFilterFromTime.selectedIndex);
         }

    function cboFilterToTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnSearch.requestFocus();
        } shortcutSearch(event);
        }

    function cboFilterFromTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtFilterToTime.requestFocus();
        } shortcutSearch(event);
      }

   function checkFilterTime(txtBox: javafx.scene.control.TextBox):Integer {
         var retVal=0;
         try {
            if(txtBox.rawText.trim().length() == 4) {
                var hours:String = txtBox.rawText.trim().substring(0,2);
                var mins:String = txtBox.rawText.trim().substring(2,4);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value");
                    txtBox.requestFocus();
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(hours) ==0 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value");
                    txtBox.requestFocus();
                    retVal=1;
                }
                else {
                    txtBox.text = "{txtBox.rawText.trim().substring(0,2)}:{txtBox.rawText.trim().substring(2,4)}";
                    if(txtBox == txtFilterFromTime) {
                    cboFilterFromTime.requestFocus();
                    }
                    else if(txtBox == txtFilterToTime) {
                    cboFilterToTime.requestFocus();
                    }
                }
            }
            else if(txtBox.rawText.trim().length() == 5 and txtBox.rawText.trim().contains(":")) {
                var hours:String = txtBox.rawText.trim().substring(0,2);
                var mins:String = txtBox.rawText.trim().substring(3,5);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value");
                    txtBox.requestFocus();
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value");
                    txtBox.requestFocus();
                    retVal=1;
                }
                else {
                    if(txtBox == txtFilterFromTime) {
                    cboFilterFromTime.requestFocus();
                    }
                    else if(txtBox == txtFilterToTime) {
                    cboFilterToTime.requestFocus();
                    }
                }
            }
            else {
                FXinfo("Time should contain minimum of 4 digits");
                txtBox.requestFocus();
                retVal=1;
            }
        }
        catch(ex:Exception) {
            ex.printStackTrace();
        }
        return retVal;
    }
    
    function txtFilterFromTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        checkFilterTime(txtFilterFromTime);
        } shortcutSearch(event);
    }

    function txtFilterToTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        checkFilterTime(txtFilterToTime);
        } shortcutSearch(event);
    }
       
    function insRep(): Void {
        delete  panelReport.content;
        insert RepViewer.getDesignRootNodes() into panelReport.content;
    }
    
    function loadAppointmentChart(startTime:String,endtime:String) {
        insRep();
        panelReport.visible = true;
        var params1 = new HashMap();
        params1.put("doctorname", txtDoctorName.rawText.trim());
        params1.put("appdate", DateUtils.changeFormatDate(txtDate.rawText));
        params1.put("starttime", startTime);
        params1.put("endtime", endtime);
        RepViewer.showReport("/reportfiles/appointment.jasper", params1,TableW-40,TableH);
    }

    function txtDurationOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        btnSave.requestFocus();
        }
        shortcut(event);
     }

    function cboFromTimeOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if(not txtToTime.rawText.trim().equals("12:00"))
        cboToTime.select(cboFromTime.selectedIndex);        
     }

    function cboToTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_TAB) {
            txtEmergencyLevel.requestFocus();
         } shortcut(event);
         }

    function cboFromTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtToTime.requestFocus();
        } shortcut(event);
     }
      
       
     function checkFromTime(type:String):Integer {
         var retVal=0;
         try {
            if(txtFromTime.rawText.trim().length() == 4) {
                var hours:String = txtFromTime.rawText.trim().substring(0,2);
                var mins:String = txtFromTime.rawText.trim().substring(2,4);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtFromTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtFromTime);
                    retVal=1;
                }
                else {
                    txtFromTime.text = "{txtFromTime.rawText.trim().substring(0,2)}:{txtFromTime.rawText.trim().substring(2,4)}";                    
                    cboFromTime.requestFocus();
                    if(not txtDuration.rawText.trim().equals("") and val.getNumberValid(txtDuration.rawText.trim(), 0, 3)==10 and type.equals("txtBox")) {
                        txtToTime.text = DateUtils.calculateTime(txtFromTime.rawText.trim(),txtDuration.rawText.trim());
                    }
                }
            }
            else if(txtFromTime.rawText.trim().length() == 5 and txtFromTime.rawText.trim().contains(":")) {
                cboFromTime.requestFocus();
                var hours:String = txtFromTime.rawText.trim().substring(0,2);
                var mins:String = txtFromTime.rawText.trim().substring(3,5);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtFromTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(hours) ==0 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtFromTime);
                    retVal=1;
                }
                else {
                    if(not txtDuration.rawText.trim().equals("") and val.getNumberValid(txtDuration.rawText.trim(), 0, 3)==10 and type.equals("txtBox")) {
                        txtToTime.text = DateUtils.calculateTime(txtFromTime.rawText.trim(),txtDuration.rawText.trim());
                    }
                }
            }
            else {
                FXinfo("Time should contain minimum of 4 digits",txtFromTime);
                retVal=1;
            }
        }
        catch(ex:Exception) {
            ex.printStackTrace();
        }
        return retVal;
    }

function txtFromTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtFromTime.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        checkFromTime("txtBox");
        } shortcut(event);
    }
    
     function checkToTime():Integer {
         var retVal=0;
         try {
            if(txtToTime.rawText.trim().length() == 4) {
                var hours:String = txtToTime.rawText.trim().substring(0,2);
                var mins:String = txtToTime.rawText.trim().substring(2,4);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtToTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(hours) ==0 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtToTime);
                    retVal=1;
                }
                else {
                    txtToTime.text = "{txtToTime.rawText.trim().substring(0,2)}:{txtToTime.rawText.trim().substring(2,4)}";
                    cboToTime.requestFocus();
                }
            }
            else if(txtToTime.rawText.trim().length() == 5 and txtToTime.rawText.trim().contains(":")) {
                var hours:String = txtToTime.rawText.trim().substring(0,2);
                var mins:String = txtToTime.rawText.trim().substring(3,5);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtToTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtToTime);
                    retVal=1;
                }
                else {
                    cboToTime.requestFocus();
                }
            }
            else {
                FXinfo("Time should contain minimum of 4 digits",txtToTime);
                retVal=1;
            }
        }
        catch(ex:Exception) {
            ex.printStackTrace();
        }
        return retVal;
    }


  function txtToTimeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtToTime.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            checkToTime();
        } shortcut(event);
        }
        
    function getDateValue():Void {
          txtDate.style = mandatoryStyle;
        if (not dateFlag) {
            panelCalender.layoutY = imgDate.layoutY + txtDate.height + 5.0;
            if (txtDate.rawText != null) {
                var dat = txtDate.rawText.split("-");
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
    function imgDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
      getDateValue();      
    }
    
    function imgDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
      getDateValue();
    }

    function imgDoctorNameOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
         if(not listDoctorName.visible){
            txtDoctorName.style=mandatoryStyle;
            getDoctorList();
         }
         else{
            listDoctorName.visible = false ;
         }
    }

    function imgPatientNameOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
         if(not listPatientName.visible){
         txtPatientName.style = mandatoryStyle;
         getPatientList();
         }
         else{
             listPatientName.visible = false;
         }
    }

    function txtPatientNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
         getPatientList();
         if (event.code == KeyCode.VK_DOWN) {
            listPatientName.requestFocus();
            listPatientName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listPatientName.visible = false;
            txtPatientName.requestFocus();
        }
        }

    function txtDoctorNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getDoctorList();
        if (event.code == KeyCode.VK_DOWN) {
            listDoctorName.requestFocus();
            listDoctorName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listDoctorName.visible = false;
            txtDoctorName.requestFocus();
        }
     }

    function txtDoctorNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorName.style=mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPatientName.requestFocus();
        }
        shortcut(event);
         }

    function getDoctorList(): Void {
        try {
        var listControlObj: ListController = new ListController();
        listDoctorName.visible = true;
        listPatientName.visible = false;
        listH = 0.0;
        listDoctorName.layoutX = txtDoctorName.layoutX;
        listDoctorName.layoutY = txtDoctorName.layoutY + txtDoctorName.height + 5;
        listH = listControlObj.listImageControlView(txtDoctorName, listDoctorName, "doctor", 1);
        var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    imgDate.requestFocus();
                    if (listDoctorName.selectedItem != "New name...") {
                        txtDoctorName.text = "{listDoctorName.selectedItem}";
                        listDoctorName.visible = false;
                        lblDisplayDetails.text = "Appointment Details for Doctor : {txtDoctorName.text}  on  Date : {txtDate.text}";
                        var appointModel = new AppointmentModel();
                        appointModel.setDoctorName(txtDoctorName.rawText.trim());
                        appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtDate.rawText)));
                        appointModel.setUpdatedBy("doctorName");
                        appointmentTable.loadAppointmentTable(appointModel);
                        loadAppointmentChart("06:00 AM", "11:30 PM");
                        txtAppointmentId.text=appointmentController.selectQry("SELECT coalesce(max((appoint_no+0)),0)+1 as appointNumber FROM AppointmentModel where appointment_date='{DateUtils.changeFormatDate(txtDate.rawText)}' and doctor_name='{txtDoctorName.rawText.trim()}'",0,"hql");
                        var appDuration:String=appointmentController.selectQry("SELECT appointmentDuration FROM AppointmentModel where doctor_name='{txtDoctorName.rawText.trim()}' order by created_on desc",1,"hql");
                        if(appDuration.equals("null")) {
                            txtDuration.text="";
                        }
                        else {
                            txtDuration.text=appDuration;
                        }
                        txtPatientName.requestFocus();
                    } else {
                        listDoctorName.visible = false;
                    }
                }
        }
        }
        catch(ex:Exception) {
            var que = " Class : Appointment   Method: getDoctorList    Exception : {ex.getMessage()}";
            log.debug(que);
        }
    }


    public function getPatientList(): Void {
        try {
        var listControlObj: ListController = new ListController();
        listPatientName.visible = true;
        listDoctorName.visible = false;
        listH = 0.0;
        listPatientName.layoutX = txtPatientName.layoutX;
        listPatientName.layoutY = txtPatientName.layoutY + txtPatientName.height + 5;
        listH = listControlObj.listImageControlView(txtPatientName, listPatientName, "Customer", 1);
         var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    if (listPatientName.selectedItem != "New name...") {                                                                       
                        txtPatientName.text = "{listPatientName.selectedItem}";
                        listPatientName.visible = false;
                        txtFromTime.requestFocus();
                    } else {
                        listPatientName.visible = false;
                    }
               }
         }
    }
    catch(ex:Exception) {
       var que = " Class : Appointment   Method: getPatientList    Exception : {ex.getMessage()}";
       log.debug(que);
    }
    }
    
    

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtDate.text = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtAppointmentId.text=appointmentController.selectQry("SELECT coalesce(max((appoint_no+0)),0)+1 as appointNumber FROM AppointmentModel where appointment_date='{DateUtils.changeFormatDate(txtDate.rawText)}' and doctor_name='{txtDoctorName.rawText.trim()}'",0,"hql");
            var appointModel = new AppointmentModel();
            appointModel.setDoctorName(txtDoctorName.rawText.trim());
            appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtDate.rawText)));
            appointModel.setUpdatedBy("doctorName");
            appointmentTable.loadAppointmentTable(appointModel);
            loadAppointmentChart("06:00 AM", "11:30 PM");
            txtFromTime.requestFocus();
        }
    }

    function txtAppointmentIdOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 6) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.save and btnSave.text == "Save [F3]") {
            save(1);
        }
        if (event.code == kr.edit and btnEdit.text == "Edit [F6]") {
            edit();
        }
        if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
            reset();
        }
        /*if (event.code == kr.update and btnSave.disable == false) {
            if (btnSave.text == "Update [F7]") { save(); }
        }
        if (event.code == kr.del and btnEdit.disable == false) {
            if (btnEdit.text == "Delete [F5]") { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") {
                delete  panel.content;
                panel.visible = false;
                CommonDeclare.form[4] = 0;
            }
        }*/


    }

    public function shortcutSearch(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_F9) {
            searchResult();
        }
        else if(event.code == KeyCode.VK_F2) {
            displayVisitHours();
        }
    }


    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Appointment", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Appointment", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Appointment", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function btnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCancel.text == "Back [Ctrl+Left]") {
                back();
            } else {
                delete  panel.content;
                panel.visible = false;
                CommonDeclare.form[4] = 0;
            }
        }
    }

    function btnCancelAction(): Void {
        if (btnCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[4] = 0;
        }
    }

    function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            reset();
        }
    }

    function btnResetAction(): Void {
        reset();
    }

    function btnEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnEdit.text == "Delete [F5]") {
                del();
            } else {
                edit();
            }
        }
    }

    function btnEditAction(): Void {
        if (btnEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            save(1);
        }
    }

    function btnSaveAction(): Void {
        save(1);
    }

    function txtReasonOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDuration.requestFocus();
        } shortcut(event);
    }

    function txtEmergencyLevelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtReason.requestFocus();
        } shortcut(event);
    }    
 
    function txtDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false ;
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
        shortcut(event);
    }
  
    function txtPatientNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtPatientName.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
    }

    function txtAppointmentIdOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtAppointmentId.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPatientName.requestFocus();
        } shortcut(event);
    }

    function SplitMobileNo(Custname :String):String{
        var mobile = "";
        var custMobile : String[] = Custname.split("-");
        if(custMobile.size()>1)
        {
            mobile = custMobile[1];
        }
        return mobile.trim();
    }


    function save(stype : Integer): Void {
        try {
            //Controller Instance
            appointmentController = RegistryFactory.getClientStub(RegistryConstants.Appointment) as com.vanuston.medeil.implementation.Appointment;
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                var appointmentModel = new AppointmentModel () ;
                appointmentModel.setAppointmentDate (Date.valueOf (DateUtils.changeFormatDate (txtDate.rawText))) ;
                appointmentModel.setAppointmentId (txtAppointmentId.rawText.trim()) ;
                appointmentModel.setPatientName(txtPatientName.rawText.trim()) ;
                appointmentModel.setDoctorName (txtDoctorName.rawText.trim()) ;
                appointmentModel.setAppointmentFromTime("{txtFromTime.rawText.trim()} {cboFromTime.selectedItem.toString()}") ;
                appointmentModel.setAppointmentToTime("{txtToTime.rawText.trim()} {cboToTime.selectedItem.toString()}") ;
                appointmentModel.setAppointmentReason(txtReason.rawText.trim()) ;
                appointmentModel.setEmergencylevel(txtEmergencyLevel.rawText.trim());
                appointmentModel.setAppointmentDuration(txtDuration.rawText.trim());
                appointmentModel.setCreatedBy("");
                appointmentModel.setApp_status(0);

                appointmentModel.setStatus("YET To MEET");
                appointmentModel.setCreatedOn(DateUtils.currTime("yyyy-MM-dd HH:mm:ss"));
                appointmentModel.setUpdatedBy("");
//                System.out.println();
                 //var custidd:Integer = appointmentController.selectQrys("SELECT cust_code FROM cust_information WHERE cusname_mobno = '{txtPatientName.rawText.trim()}'");
               //  var custidd:Integer = appointmentController.selectQrys("SELECT cust_code FROM cust_information WHERE cusname_mobno = "+appointmentModel.getPatientName().trim());
         // Use var and handle potential null values
var patientNameOrMobNo = appointmentModel.getPatientName() ;

 System.out.println("jai");
 System.out.println(patientNameOrMobNo);
 
// Construct and execute the SQL query using var
//old//var query = String.format(
//    "SELECT cust_code FROM cust_information WHERE cusname_mobno = '{txtPatientName.rawText.trim()}'",);
   var customerDetails2:String = commonController.getCustomerCode(patientNameOrMobNo);
 //  "select c.cust_code  as Code,cust_name from medp_appointment_mt a INNER JOIN cust_information c on c.cusname_mobno=a.patient_name  where   c.cusname_mobno='{txtPatientName.rawText.trim()}'" ) ;

appointmentModel.setCust_code(customerDetails2);

   var patientNameOrMobNos = appointmentModel.getCust_code() ;
//    var patientNameOrMobNos = appointmentModel.setCust_code(pcode.text) ;
     System.out.println(customerDetails2);
     pcode.text=customerDetails2;

    // pcode.text =commonController.getCustomerCode(patientNameOrMobNo);
     System.out.println("customerDetails2");
     System.out.println(pcode.text);

      //System.out.println(cust_code);
     //  System.out.println(query);
//    "SELECT cust_code FROM cust_information WHERE cusname_mobno = '%s'",

//    patientNameOrMobNo

//var custidd = appointmentController.selectQrys(query);
//         System.out.println("SELECT cust_code FROM cust_information WHERE cusname_mobno = '{txtPatientName.rawText.trim()}'");
//              appointmentModel.setCust_code(String.valueOf(custidd));
//               System.out.println("custidd");
//  System.out.println(custidd);

//------------------------
 



//            
//               
//
//                // Set the customer code to the pcode text field
//                pcode.text = customerDetails
//            } else {
//                FXinfo("Customer code not found!")
//                return // Exit if customer code is not found
//            }code.text = customerDetails;
//            } else {
//                FXinfo("Customer code not found!")
//                return // Exit if customer code is not found
//            }
//                 var customerDetails:List = commonController.getQueryValue("SELECT * FROM `cust_information`" ) ;
//              //  appointmentModel.setCust_code(pcodes.rawText.trim());
               //  pcodes.text = customerDetails.get(0).toString();
                if (btnSave.text == "Save [F3]") {
                        var custName:String = appointmentController.selectQry("select patientName from AppointmentModel where patient_name= '{txtPatientName.rawText.trim()}' and doctor_name='{txtDoctorName.rawText.trim()}' and appointment_date='{DateUtils.changeFormatDate(txtDate.rawText)}'",0,"hql");
                        if(not (custName.equals("") or custName.equals("null"))) {
                            var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Appointment","<html> The customer already has appointment <br> in the specified date. <br> Do you want to continue saving? </html>");
                            var a =bind cn.staus;
                            if (a) {
                                appointmentController.createRecord (appointmentModel);
                                if(stype==2)
                                {
                                      commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as com.vanuston.medeil.implementation.CommonImplements;
                                      var qry ="SELECT coalesce(apmt_template,'')as template FROM medp_hosp_settings_config;";

                                      var PatientMobileNo = SplitMobileNo(txtPatientName.text.trim());
                                      var Header = hospitalName;
                                      var smsBody = "Apnmt No:{txtAppointmentId.rawText} \n DocName:{txtDoctorName.rawText} \n Apnmt Time:{txtFromTime.rawText} - {txtToTime.rawText}";
                                      var Footer = commonController.getQueryValue(qry);
                                      def smsG = new SmsSender();
                                      var status = smsG.SendSms(PatientMobileNo, Header, smsBody, Footer , "Trasactional");

                                      if(status.equals("sent"))
                                      {
                                      FXalert(8);
                                      }
                                      else if(status.equalsIgnoreCase("NC"))
                                      {
                                          FXinfo("SMS ID Not Configured !");
                                      }
                                      else if(status.equalsIgnoreCase("NI"))
                                      {
                                          FXinfo("Check Your Internet Connectiviry !");
                                      }
                                      back();
                                }
                                else
                                {
                                FXalert(0);
                                back();
                                }
                            }
                        }
                        else {
                            if (appointmentController.createRecord (appointmentModel) as Boolean) {
                                FXalert(0);
                                back();
                            }
                        }
                        appointmentModel.setUpdatedBy("doctorName");
                        appointmentTable.loadAppointmentTable(appointmentModel);
                        loadAppointmentChart("06:00 AM", "11:30 PM");
                } 
            }
        } catch (e: Exception) {
            e.printStackTrace();
            var msg: String = "Class : Appointment  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function del(): Void {
        try {
             var san: Integer = 0;
            san = clickValid();
            if (san == 10) {

                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Bank Details");
                var a =bind cn.staus;
                if (a) {
                    appointmentController = RegistryFactory.getClientStub (RegistryConstants.Appointment) as com.vanuston.medeil.implementation.Appointment;
                    appointmentController.deleteRecord (txtAppointmentId.rawText) ;
                    FXalert(5);
                    back();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Appointment  Method : Del()   = {e.getMessage()}";
            log.debug(msg);
        }
    }
    
    public function checkAppointment():Integer {
        var fromTime = new SimpleDateFormat("hh:mm a").parse("{txtFromTime.rawText.trim()} {cboFromTime.selectedItem.toString()}");
        var toTime = new SimpleDateFormat("hh:mm a").parse("{txtToTime.rawText.trim()} {cboToTime.selectedItem.toString()}");
        var appointModel = new AppointmentModel();
        appointModel.setDoctorName(txtDoctorName.rawText.trim());
        appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtDate.rawText)));
        appointModel.setUpdatedBy("doctorName");
        var appointList = appointmentController.viewRecord(appointModel) as List;
        var j=0;
        var appointmentModel;
        if(toTime.before(fromTime)) {
            j=2;
        }
        else if(appointList.size() > 0) {
        for(i in [0..<appointList.size()]) {
            appointmentModel = appointList.get(i) as AppointmentModel;
            var existFromTime = new SimpleDateFormat("hh:mm a").parse(appointmentModel.getAppointmentFromTime());
            var existToTime = new SimpleDateFormat("hh:mm a").parse(appointmentModel.getAppointmentToTime());
            if((fromTime.before(existFromTime) and toTime.after(existToTime)) or (fromTime.after(existFromTime) and toTime.before(existToTime)) or(fromTime.after(existFromTime) and fromTime.before(existToTime)) or(toTime.after(existFromTime) and toTime.before(existToTime)) or
            fromTime==existFromTime or toTime==existToTime) {
                j=1;
                break;
            }
        }
        }        
        return j;
    }

    public function clickValid(): Integer {
        var cnt: Integer = 0;
        var pName = txtPatientName.rawText.trim();
        var dName = txtDoctorName.rawText.trim();
        var date = txtDate.rawText.trim();        
        var eLevel = txtEmergencyLevel.rawText.trim();
        var patientName:String = txtPatientName.text.split("-")[0];
        appointmentController = RegistryFactory.getClientStub (RegistryConstants.Appointment) as com.vanuston.medeil.implementation.Appointment;
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as com.vanuston.medeil.implementation.CommonImplements;
        try {
            if(pName.equals("")) {
                FXinfo("Patient Name should not be empty", txtPatientName);
            }
            else if(pName.length() > 100) {
                FXinfo("Patient Name length should not be more than 100 characters", txtPatientName);
            }
            else if(dName.equals("")) {
                FXinfo("Doctor Name should not be empty", txtDoctorName);
            }
            else if(dName.length() > 100) {
                FXinfo("Doctor Name length should not be more than 100 characters", txtDoctorName);
            }
            else if (date.length() <= 0) {
                FXinfo("Please Select the Date.", txtDate);
            }
            else if (eLevel.length() > 45) {
                FXinfo("Emergency level cannot be greater than 45 characters");
                txtEmergencyLevel.requestFocus();
            }
//            else if(not txtDuration.rawText.trim().equals("") and val.getNumberValid(txtDuration.rawText.trim(), 0, 3)!=10) {
//                FXinfo("Appointment duration value is incorrect");
//                txtDuration.requestFocus();
//            }
//            else if(checkFromTime("saveBtn")==1 ) {
//                FXinfo("Incorrect from time value",txtFromTime);
//            }
//            else if( checkToTime()==1) {
//                FXinfo("Incorrect to time value",txtToTime);
//            }
//            else if(txtFromTime.rawText.trim().equals(txtToTime.rawText.trim())) {
//                FXinfo("From and To time should not be same",txtFromTime);
//            }
//            else if(checkAppointment()==2) {
//                 FXinfo("To time should not be less than from time",txtToTime);
//            }
//            else if(not commonController.GetCustomerList("").contains(pName.trim())) {
//                 FXinfo("Patient name is not available in Patient Details Masters",txtPatientName);
//            }
            else if(not commonController.getDoctorName("").contains(txtDoctorName.rawText.trim())) {
                 FXinfo("Doctor name is not available in Doctor information Masters",txtDoctorName);
            }
            else if(checkAppointment()==1) {
                 FXinfo("Appointment already exists in the specified time",txtToTime);
            }
            else {
                cnt = 10;
            }
        } catch (e: Exception) {
            e.printStackTrace();
            var msg: String = "Class : Appointment  Method : Clickvalid ()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    function edit(): Void {
        btnSave.text = "Update [F7]";
        btnEdit.text = "Delete [F5]";
        imgEdit.image = imageCancel;
        btnCancel.text = "Back [Ctrl+Left]";
        imgCancel.image = imageBack;
        CancelW = bottonW + 30;
        txtAppointmentId.editable = false;
        getDetails();
    }

    function getDetails(): Void {
        try {
        } catch (e: Exception) {
            var msg: String = "Class : Bank Details  Method : Edit()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function updateValues(): Void {
        if (btnSave.text == "Update [F7]" and btnEdit.text == "Delete [F5]") {
            getDetails();
        }
    }

    def logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    
    public function getPrivileges(u: String): Void {
        def uname = u;
        //CommonController Call
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as com.vanuston.medeil.implementation.CommonImplements;
        def utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            def priv = commonController.getPrivileges("appointment", uname);
            def ss = priv.split(",");
            def val = Integer.parseInt(ss[0]);
            if ((val == 0) or (val == 1)) {
                // This Code is for No Access or Read Access
                btnSave.disable = true;
                btnVisitHours.disable = true;
            }else{
                btnSave.disable = false;
                btnVisitHours.disable = false;
            }
        } else {
            btnSave.disable = false;
            btnVisitHours.disable = false;
        }
    }

    function reset(): Void {
        mandatory();
        txtPatientName.requestFocus();
        txtPatientName.text = "";
        txtFromTime.text = "";
        txtToTime.text = "";
        txtReason.text = "";
        txtEmergencyLevel.text = "";
        txtDuration.text = "";
        txtDoctorName.text="";
        txtFilterFromTime.text="";
        txtFilterToTime.text="";
       // txtAppointmentId.text=appointmentController.selectQry("SELECT coalesce(max((appoint_no+0)),0)+1 as appointNumber FROM AppointmentModel where appointment_date='{DateUtils.changeFormatDate(txtDate.rawText)}' and doctor_name='{txtDoctorName.rawText.trim()}'",0,"hql");
        //var appDuration:String=appointmentController.selectQry("SELECT appointmentDuration FROM AppointmentModel where doctor_name='{txtDoctorName.rawText.trim()}' order by created_on desc",1,"hql");
        listDoctorName.visible = false;
        listPatientName.visible = false;
        listVisitHours.visible = false ;
//        if(appDuration.equals("null")) {
//            txtDuration.text="";
//        }
//        else {
//            txtDuration.text=appDuration;
//        }
    }

    function back(): Void {
        txtFromTime.editable = true;
        btnSave.text = "Save [F3]";
        btnEdit.text = "Edit [F6]";
        imgEdit.image = imageEdit;
        btnCancel.text = "Cancel [F8]";
        CancelW = bottonW;
        imgCancel.image = imageCancel;
        txtAppointmentId.editable = true;
        btnSave.disable = false;
        btnEdit.disable = false;
        reset();
    }

    function mandatory() {
        txtAppointmentId.style = mandatoryStyle;
        txtPatientName.style = mandatoryStyle;
        txtFromTime.style = mandatoryStyle;
        txtToTime.style = mandatoryStyle;
        txtDate.style = mandatoryStyle;
        txtDoctorName.style=mandatoryStyle;
    }

    public function StartUp(): Void {
        appointmentController = RegistryFactory.getClientStub(RegistryConstants.Appointment) as com.vanuston.medeil.implementation.Appointment;
        panel.visible = true;
        txtDate.text = DateUtils.now("dd-MM-yyyy");
        txtAppointmentId.text=appointmentController.selectQry("SELECT coalesce(max((appoint_no+0)),0)+1 as appointNumber FROM AppointmentModel where appointment_date='{DateUtils.changeFormatDate(txtDate.text)}' and doctor_name='{txtDoctorName.rawText.trim()}' and is_active='0'",0,"hql");
        panel.content = [panelheader, panelpage, panelButtons, panelAlert,];
        panelCalender.content = [fxCalendar,]; fxCalendar.visible = false;
        panelTable.content = [ShowAppointment];
        //panelTable.visible=true;
        ShowAppointment.layoutX = 0;
        ShowAppointment.layoutY = 0;
        reset();
        loadAppointmentChart("06:00 AM", "11:30 PM");
        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
        });
        (table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                updateValues();
            }
        });
    }

}
