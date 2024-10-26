package com.vanuston.medeil.ui;

import javafx.scene.image.Image;
import javafx.ext.swing.SwingComponent;
import java.text.SimpleDateFormat;
import java.awt.Dimension;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.TextBox;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;

import java.awt.event.MouseAdapter;
import java.lang.Exception;
import com.vanuston.medeil.uitables.ManageAppointmentTable;
import com.vanuston.medeil.model.AppointmentModel;
import java.sql.Date;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.util.Validation;
import java.util.List;
import com.vanuston.medeil.util.RegistryConstants;

public class ManageAppointment {
    var appointmentController : com.vanuston.medeil.implementation.Appointment ;
    var sdf = new SimpleDateFormat("dd-MM-yyyy");    
    var manageAppointmentTable = new ManageAppointmentTable();
    var table = manageAppointmentTable.createViewTable();
    var AppointLoad = SwingComponent.wrap(manageAppointmentTable.getScrollTable(table));
    var dateFlag: Boolean = false;
    var dateFlag1: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(ManageAppointment.class, "Manage Appointment");
    var listH = 0.0;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var one = bind CommonDeclare.one;
    var two = bind CommonDeclare.two;
    var five = bind CommonDeclare.five;
    var ten = bind CommonDeclare.ten;
    var hundred = bind CommonDeclare.hundred;
    var twoHund = bind CommonDeclare.twoHund;
    var eighty = bind (8 * ten);
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton51LX - 8;
    var botton2LX = bind CommonDeclare.botton52LX - 15;
    var botton3LX = bind CommonDeclare.botton53LX - 22;
    var botton4LX = bind CommonDeclare.botton54LX - 1;
    var botton5LX = bind CommonDeclare.botton55LX - 5;
    var botton41LX = bind CommonDeclare.botton41LX;
    var botton42LX = bind CommonDeclare.botton42LX;
    var bottonLY = 0.0;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var Type5TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var SearchTextboxLX = bind (15.37484117 * panelW / 100);
    var labelSearchLX = bind (41.93138501 * panelW / 100);
    var ChoiceSearchLX = bind (50.44472681 * panelW / 100);
    var ChoiceSearchW = bind (12.7064803 * panelW / 100);
    var buttonSearchLX = bind (69.63151207 * panelW / 100);
    var buttonReportLX = bind (85.51461245 * panelW / 100);
    var panelQuickNavigationLX = bind (8.132147395 * panelW / 100);
    public var modText: String;
    public var modVal: Integer;
    public var modClick: Boolean = false;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 175.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW, TableH);
    };
    var TableH = 160.0 on replace {
        changeTableSize(TableW, TableH);
    };
    var RemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX;
    var BottomC4LX = bind CommonDeclare.BottomC4LX;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var panelCardLX = bind panelW - 100;
    var panelCardLY = 87.0;
    var panelCardDetailsLX = bind panelCardLX - (Type2TextboxW + 155);
    var panelCardDetailsLY = bind panelCardLY + 7;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    var commonController:CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var val: Validation = new Validation();
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        blocksMouse: true
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnUpdate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnUpdate: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton41LX
        layoutY: bind bottonLY
        layoutInfo: __layoutInfo_btnUpdate
        graphic: imgEdit
        text: "Edit [F6]"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton42LX
        layoutInfo: __layoutInfo_btnCancel
        graphic: imageView4
        text: "Button"
    }
    
    public-read def panelButton: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnUpdate, btnCancel, ]
    }
    
    public-read def rdoDateSearch: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-18
        layoutY: 50.0
        text: "Radio Button"
    }
    
    public-read def rdoPatientSearch: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-18
        layoutY: 50.0
        text: "Radio Button"
    }
    
    def __layoutInfo_txtDoctorSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDoctorSearch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+80
        layoutInfo: __layoutInfo_txtDoctorSearch
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind 2 * ten
        layoutY: 55.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind Type2TextboxW + 2
        layoutY: 0.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 439.0
        text: "Label"
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 468.0
        text: "Label"
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 429.0
        text: "Label"
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 448.0
        text: "Label"
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 116.0
        layoutY: 179.0
        text: "Label"
    }
    
    public-read def panelLblColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC1LX
        content: [ label8, label9, label11, label12, label19, ]
    }
    
    public-read def imageDown2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind BottomC2LX+Type1TextboxW+30
    }
    
    public-read def imageDown3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind BottomC2LX+Type1TextboxW+30
    }
    
    def __layoutInfo_txtAppointmentFromTime: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtAppointmentFromTime: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtAppointmentFromTime
    }
    
    public-read def cboFromTime: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_txtAppointmentToTime: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtAppointmentToTime: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtAppointmentToTime
    }
    
    public-read def cboToTime: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def imageDate1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind BottomC2LX+Type4TextboxW+30
    }
    
    def __layoutInfo_listDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listDoctorName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listDoctorName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listPatientName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listPatientName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 225.0
        layoutY: 408.0
        text: "Label"
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 415.0
        layoutY: 415.0
        text: "Amt. Paid"
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 397.0
        layoutY: 439.0
        text: "Label"
    }
    
    public-read def panelLblColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX+20
        content: [ label10, label13, label14, ]
    }
    
    def __layoutInfo_txtAppointmentDuration: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtAppointmentDuration: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 342.0
        layoutY: 187.0
        layoutInfo: __layoutInfo_txtAppointmentDuration
    }
    
    public-read def imageCustDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 121.0
    }
    
    public-read def imageDoctorDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+Type1TextboxW
        layoutY: 150.0
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 161.0
        layoutY: 175.0
    }
    
    def __layoutInfo_listName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listName
        items: [ "Item 1", "Item 2", "Item 3", ]
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
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtAppointmentReason: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtAppointmentReason: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 460.0
        layoutY: 439.0
        layoutInfo: __layoutInfo_txtAppointmentReason
        font: Arial_12
    }
    
    def __layoutInfo_txtEmergencyLevel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmergencyLevel: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutInfo: __layoutInfo_txtEmergencyLevel
        font: Arial_12
    }
    
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC4LX-10
        content: [ txtEmergencyLevel, txtAppointmentReason, txtAppointmentDuration, ]
    }
    
    def __layoutInfo_txtPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPatientName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 285.0
        layoutY: 454.0
        layoutInfo: __layoutInfo_txtPatientName
        font: Arial_12
    }
    
    def __layoutInfo_txtPhysician: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPhysician: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutY: 429.0
        layoutInfo: __layoutInfo_txtPhysician
        font: Arial_12
    }
    
    def __layoutInfo_txtAppointmentDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtAppointmentDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 115.0
        layoutY: 460.0
        layoutInfo: __layoutInfo_txtAppointmentDate
        font: Arial_12
    }
    
    def __layoutInfo_txtAppointmentId: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtAppointmentId: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 115.0
        layoutY: 433.0
        layoutInfo: __layoutInfo_txtAppointmentId
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        content: [ txtAppointmentId, txtAppointmentDate, txtPhysician, imageDown2, txtPatientName, imageDown3, txtAppointmentFromTime, cboFromTime, txtAppointmentToTime, cboToTime, imageDate1, listDoctorName, listPatientName, ]
    }
    
    def __layoutInfo_txtSearchDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSearchDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtSearchDate
        onKeyPressed: txtSearchDateOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtPatientSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPatientSearch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind Type3TextboxW+20
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtPatientSearch
        text: ""
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    public-read def panelSearch: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C2LX
        layoutY: 100.0
        content: [ txtPatientSearch, ]
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
    
    def __layoutInfo_btnSaleMnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
    }
    public-read def btnSaleMnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind Type2TextboxW +30
        layoutY: 143.0
        layoutInfo: __layoutInfo_btnSaleMnSearch
        onKeyPressed: btnSaleMnSearchOnKeyPressed
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Search"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_panelDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelDate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C2LX
        layoutY: 150.0
        layoutInfo: __layoutInfo_panelDate
        content: [ txtSearchDate, imageDate, btnSaleMnSearch, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoDoctorSearch: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C1LX-18
        layoutY: 70.0
        text: "Search by Doctor Name"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def labelSearch_By_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 150.0
        text: "Search By Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelSearch_By: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 100.0
        text: "Search By"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind 3 * ten
        layoutY: 31.0
        text: "Edit or cancel Appointment"
        font: Arial_18
        textFill: Green
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Manage Appointment"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradient2
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectangle2, label, rectTableBorder, panelTable, panelButton, labelSearch_By, labelSearch_By_Date, rdoDateSearch, label15, rdoPatientSearch, rdoDoctorSearch, txtDoctorSearch, separator, panelSearch, panelDate, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, imageCustDown, imageDoctorDown, panelCalender, listName, panelAlert, ]
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imageBillCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillCancel.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageUpdate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageCard: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Card1.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
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
                            rectangle.blocksMouse = true;
                            rectangle.stroke = DarkGray;
                            rectangle2.layoutX = 0.0;
                            rectangle2.height = 32.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            label.layoutY = 1.0;
                            label.text = "Manage Appointment - Alt+M";
                            rectTableBorder.visible = true;
                            rectTableBorder.disable = false;
                            rectTableBorder.fill = null;
                            panelTable.visible = true;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnUpdate.visible = true;
                            btnUpdate.onMouseClicked = btnUpdateOnMouseClickedAtShown;
                            btnUpdate.effect = reflectionEffect;
                            btnUpdate.text = "Update [F7]";
                            btnUpdate.font = Arial_Bold_14;
                            imageView4.visible = true;
                            imageView4.image = imageCancel;
                            btnCancel.visible = true;
                            btnCancel.onKeyPressed = btnCancelOnKeyPressedAtShown;
                            btnCancel.effect = reflectionEffect;
                            btnCancel.text = "Cancel [F8]";
                            btnCancel.font = Arial_Bold_14;
                            btnCancel.action = btnCancelActionAtShown;
                            panelButton.visible = true;
                            labelSearch_By.visible = true;
                            labelSearch_By.layoutY = 102.0;
                            labelSearch_By.text = "Search By Patient name";
                            labelSearch_By.font = Arial_12;
                            labelSearch_By_Date.visible = true;
                            labelSearch_By_Date.layoutY = 145.0;
                            rdoDateSearch.visible = true;
                            rdoDateSearch.layoutY = 143.0;
                            rdoDateSearch.onMouseClicked = rdoDateSearchOnMouseClickedAtShown;
                            rdoDateSearch.text = "";
                            rdoDateSearch.font = Arial_14;
                            rdoDateSearch.toggleGroup = toggleGroup;
                            label15.text = "Edit or Cancel Appointment";
                            rdoPatientSearch.visible = true;
                            rdoPatientSearch.layoutY = 100.0;
                            rdoPatientSearch.onMouseClicked = rdoPatientSearchOnMouseClickedAtShown;
                            rdoPatientSearch.text = "";
                            rdoPatientSearch.font = Arial_14;
                            rdoPatientSearch.toggleGroup = toggleGroup;
                            rdoPatientSearch.selected = false;
                            rdoDoctorSearch.onMouseClicked = rdoDoctorSearchOnMouseClickedAtShown;
                            rdoDoctorSearch.selected = true;
                            txtDoctorSearch.visible = true;
                            txtDoctorSearch.layoutY = 70.0;
                            txtDoctorSearch.onKeyPressed = txtDoctorSearchOnKeyPressedAtShown;
                            txtPatientSearch.onKeyPressed = txtPatientSearchKeyPressedAtShown;
                            txtPatientSearch.editable = true;
                            panelSearch.layoutY = 105.0;
                            panelSearch.focusTraversable = true;
                            txtSearchDate.onKeyPressed = txtSearchDateOnKeyPressed;
                            txtSearchDate.editable = false;
                            imageDate.visible = true;
                            imageDate.layoutY = 1.0;
                            imageDate.onMouseClicked = imageDateOnMouseClickedAtShown;
                            imageDate.blocksMouse = true;
                            imageView.visible = true;
                            imageView.image = imageSearch;
                            btnSaleMnSearch.visible = true;
                            btnSaleMnSearch.layoutY = -2.0;
                            __layoutInfo_btnSaleMnSearch.height = 25.0;
                            btnSaleMnSearch.effect = null;
                            btnSaleMnSearch.action = btnSaleMnSearchActionAtShown;
                            panelDate.layoutY = 140.0;
                            __layoutInfo_panelDate.width = 200.0;
                            __layoutInfo_panelDate.height = 0.0;
                            panelDate.blocksMouse = false;
                            panelDate.focusTraversable = true;
                            label8.visible = true;
                            label8.layoutX = 30.0;
                            label8.layoutY = 0.0;
                            label8.text = "Appointment Number";
                            label8.font = Arial_12;
                            label9.visible = true;
                            label9.layoutX = 30.0;
                            label9.layoutY = 30.0;
                            label9.text = "Appointment Date";
                            label9.font = Arial_12;
                            label11.visible = true;
                            label11.layoutX = 30.0;
                            label11.layoutY = 60.0;
                            label11.text = "Physician";
                            label11.font = Arial_12;
                            label12.visible = true;
                            label12.layoutX = 30.0;
                            label12.layoutY = 90.0;
                            label12.text = "Patient Name";
                            label12.font = Arial_12;
                            label19.visible = true;
                            label19.layoutX = 30.0;
                            label19.layoutY = 120.0;
                            label19.text = "Appointment Time";
                            label19.font = Arial_12;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 350.0;
                            txtAppointmentId.visible = true;
                            txtAppointmentId.layoutX = 160.0;
                            txtAppointmentId.layoutY = 0.0;
                            txtAppointmentId.editable = false;
                            txtAppointmentDate.visible = true;
                            txtAppointmentDate.layoutX = 160.0;
                            txtAppointmentDate.layoutY = 30.0;
                            txtPhysician.visible = true;
                            txtPhysician.layoutX = 160.0;
                            txtPhysician.layoutY = 60.0;
                            txtPhysician.onKeyPressed = txtPhysicianOnKeyPressedAtShown;
                            txtPhysician.onKeyReleased = txtPhysicianOnKeyReleasedAtShown;
                            imageDown2.visible = true;
                            imageDown2.layoutY = 60.0;
                            imageDown2.onMouseClicked = imageDown2OnMouseClickedAtShown;
                            imageDown2.image = imageDown;
                            txtPatientName.visible = true;
                            txtPatientName.layoutX = 160.0;
                            txtPatientName.layoutY = 90.0;
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressedAtShown;
                            txtPatientName.onKeyReleased = txtPatientNameOnKeyReleasedAtShown;
                            imageDown3.visible = true;
                            imageDown3.layoutY = 90.0;
                            imageDown3.onMouseClicked = imageDown3OnMouseClickedAtShown;
                            imageDown3.image = imageDown;
                            txtAppointmentFromTime.visible = true;
                            txtAppointmentFromTime.layoutX = 160.0;
                            txtAppointmentFromTime.layoutY = 120.0;
                            txtAppointmentFromTime.onKeyPressed = txtAppointmentFromTimeOnKeyPressedAtShown;
                            txtAppointmentFromTime.font = Arial_12;
                            cboFromTime.visible = true;
                            cboFromTime.layoutX = 280.0;
                            cboFromTime.layoutY = 120.0;
                            cboFromTime.onKeyPressed = cboFromTimeOnKeyPressedAtShown;
                            cboFromTime.onKeyReleased = cboFromTimeOnKeyReleasedAtShown;
                            cboFromTime.items = [ "AM", "PM", ];
                            txtAppointmentToTime.visible = true;
                            txtAppointmentToTime.layoutX = 360.0;
                            txtAppointmentToTime.layoutY = 120.0;
                            txtAppointmentToTime.onKeyPressed = txtAppointmentToTimeOnKeyPressedAtShown;
                            txtAppointmentToTime.font = Arial_12;
                            cboToTime.visible = true;
                            cboToTime.layoutX = 480.0;
                            cboToTime.layoutY = 120.0;
                            cboToTime.onKeyPressed = cboToTimeOnKeyPressedAtShown;
                            cboToTime.items = [ "AM", "PM", ];
                            imageDate1.visible = true;
                            imageDate1.layoutY = 30.0;
                            imageDate1.onKeyPressed = imageDate1OnKeyPressedAtShown;
                            imageDate1.onMouseClicked = imageDate1OnMouseClickedAtShown;
                            imageDate1.image = null;
                            listDoctorName.visible = false;
                            listDoctorName.items = null;
                            listPatientName.visible = false;
                            listPatientName.items = null;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 350.0;
                            label10.visible = true;
                            label10.layoutX = 370.0;
                            label10.layoutY = 0.0;
                            label10.text = "Emergency level";
                            label10.font = Arial_12;
                            label13.visible = true;
                            label13.layoutX = 370.0;
                            label13.layoutY = 30.0;
                            label13.text = "Appointment Reason";
                            label13.font = Arial_12;
                            label14.visible = true;
                            label14.layoutX = 370.0;
                            label14.layoutY = 60.0;
                            label14.text = "Appointment Duration";
                            label14.font = Arial_12;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 350.0;
                            txtEmergencyLevel.visible = true;
                            txtEmergencyLevel.layoutX = 500.0;
                            txtEmergencyLevel.onKeyPressed = txtEmergencyLevelOnKeyPressedAtShown;
                            txtAppointmentReason.visible = true;
                            txtAppointmentReason.layoutX = 500.0;
                            txtAppointmentReason.layoutY = 30.0;
                            txtAppointmentReason.onKeyPressed = txtAppointmentReasonOnKeyPressedAtShown;
                            txtAppointmentDuration.visible = true;
                            txtAppointmentDuration.layoutX = 500.0;
                            txtAppointmentDuration.layoutY = 60.0;
                            txtAppointmentDuration.onKeyPressed = txtAppointmentDurationOnKeyPressedAtShown;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 350.0;
                            panelCalender.visible = true;
                            panelCalender.layoutX = 166.0;
                            panelCalender.layoutY = 180.0;
                            panelCalender.blocksMouse = true;
                            listName.onKeyPressed = listNameOnKeyPressedAtShown;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function txtDoctorSearchOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorSearch.style = mandatoryStyle;
        shortcut(event);
         }

    public function checkAppointment():Integer {
        var fromTime = new SimpleDateFormat("hh:mm a").parse("{txtAppointmentFromTime.rawText.trim()} {cboFromTime.selectedItem.toString()}");
        var toTime = new SimpleDateFormat("hh:mm a").parse("{txtAppointmentToTime.rawText.trim()} {cboToTime.selectedItem.toString()}");
        var appointModel = new AppointmentModel();
        appointModel.setDoctorName(txtPhysician.rawText.trim());
        appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtAppointmentDate.rawText)));
        appointModel.setUpdatedBy("doctorNameUpdate");
        appointModel.setId(Integer.parseInt(manageAppointmentTable.jtable.getModel().getValueAt(manageAppointmentTable.jtable.getSelectedRow(), 6).toString()));
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
        var dName = txtPhysician.rawText.trim();
        var date = txtAppointmentDate.rawText.trim();
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
                FXinfo("Doctor Name should not be empty", txtPhysician);
            }
            else if(txtAppointmentId.rawText.trim().equals("")) {
                FXinfo("Appointment number should not be empty. Select the row in table to edit.");
                manageAppointmentTable.jtable.requestFocus();
            }
            else if(dName.length() > 100) {
                FXinfo("Doctor Name length should not be more than 100 characters", txtPhysician);
            }
            else if (date.length() <= 0) {
                FXinfo("Please Select the Date.", txtAppointmentDate);
            }
            else if (eLevel.length() > 45) {
                FXinfo("Emergency level cannot be greater than 45 characters");
                txtEmergencyLevel.requestFocus();
            }
            else if(not txtAppointmentDuration.rawText.trim().equals("") and val.getNumberValid(txtAppointmentDuration.rawText.trim(), 0, 3)!=10) {
                FXinfo("Appointment duration value is incorrect");
                txtAppointmentDuration.requestFocus();
            }
            else if(checkFromTime("saveBtn")==1 ) {
                FXinfo("Incorrect from time value",txtAppointmentFromTime);
            }
            else if( checkToTime()==1) {
                FXinfo("Incorrect to time value",txtAppointmentToTime);
            }
            else if(txtAppointmentFromTime.rawText.trim().equals(txtAppointmentToTime.rawText.trim())) {
                FXinfo("From and To time should not be same",txtAppointmentFromTime);
            }
            else if(checkAppointment()==2) {
                 FXinfo("To time should not be less than from time",txtAppointmentToTime);
            }
//            else if(not commonController.GetCustomerList("").contains(patientName.trim())) {
//                 FXinfo("Patient name is not available in Patient Details Masters",txtPatientName);
//            }
            else if(not commonController.getDoctorName("").contains(txtPhysician.rawText.trim())) {
                 FXinfo("Doctor name is not available in Doctor information Masters",txtPhysician);
            }
            else if(checkAppointment()==1) {
                 FXinfo("Appointment already exists in the specified time",txtAppointmentToTime);
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

    function btnUpdateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        save();
    }

    function save(): Void {
        try {
            //Controller Instance
            appointmentController = RegistryFactory.getClientStub(RegistryConstants.Appointment) as com.vanuston.medeil.implementation.Appointment;
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                var appointmentModel = new AppointmentModel () ;
                appointmentModel.setId(Integer.parseInt(manageAppointmentTable.jtable.getModel().getValueAt(manageAppointmentTable.jtable.getSelectedRow(), 6).toString()));
                appointmentModel.setAppointmentDate (Date.valueOf (DateUtils.changeFormatDate (txtAppointmentDate.rawText))) ;
                appointmentModel.setAppointmentId (txtAppointmentId.rawText.trim()) ;
                appointmentModel.setPatientName(txtPatientName.rawText.trim()) ;
                appointmentModel.setDoctorName (txtPhysician.rawText.trim()) ;
                appointmentModel.setAppointmentFromTime("{txtAppointmentFromTime.rawText.trim()} {cboFromTime.selectedItem.toString()}") ;
                appointmentModel.setAppointmentToTime("{txtAppointmentToTime.rawText.trim()} {cboToTime.selectedItem.toString()}") ;
                appointmentModel.setAppointmentReason(txtAppointmentReason.rawText.trim()) ;
                appointmentModel.setEmergencylevel(txtEmergencyLevel.rawText.trim());
                appointmentModel.setAppointmentDuration(txtAppointmentDuration.rawText.trim());
                appointmentModel.setCreatedBy("");
                appointmentModel.setCreatedOn(DateUtils.currTime("yyyy-MM-dd HH:mm:ss"));
                appointmentModel.setUpdatedBy("");
                        var custName:String = appointmentController.selectQry("select patientName from AppointmentModel where id!='{appointmentModel.getId()}' and patient_name= '{txtPatientName.rawText.trim()}' and doctor_name='{txtPhysician.rawText.trim()}' and appointment_date='{DateUtils.changeFormatDate(txtAppointmentDate.rawText)}'",0,"hql");
                        if(not (custName.equals("") or custName.equals("null"))) {
                            var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Appointment","<html> The customer already has appointment <br> in the specified date. <br> Do you want to update? </html>");
                            var a =bind cn.staus;
                            if (a) {
                                appointmentController.updateRecord(appointmentModel);
                                FXalert(0);
                                loadTodayAppointment();
                                txtDoctorSearch.text = "";
                                txtPatientSearch.text = "";
                                txtSearchDate.text = "";
                                clear();
                            }
                        }
                        else {
                            var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Appointment");
                            var a =bind cn.staus;
                            if (a) {
                                appointmentController.updateRecord (appointmentModel);
                                FXalert(0);
                                loadTodayAppointment();
                                txtDoctorSearch.text = "";
                                txtPatientSearch.text = "";
                                txtSearchDate.text = "";
                                clear();
                            }
                        }
            }
        } catch (e: Exception) {
            e.printStackTrace();
            var msg: String = "Class : Appointment  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function mandatory() {
        txtAppointmentId.style = mandatoryStyle;
        txtPatientName.style = mandatoryStyle;
        txtAppointmentFromTime.style = mandatoryStyle;
        txtAppointmentToTime.style = mandatoryStyle;
        txtAppointmentDate.style = mandatoryStyle;
        txtPhysician.style=mandatoryStyle;
    }

    function txtAppointmentDurationOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        btnUpdate.requestFocus();
        }
        shortcut(event);
         }

    function txtAppointmentReasonOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtAppointmentDuration.requestFocus();
        } shortcut(event);
         }

    function txtEmergencyLevelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtAppointmentReason.requestFocus();
        } shortcut(event);
         }

    function cboFromTimeOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(not txtAppointmentToTime.rawText.trim().equals("12:00"))
        cboToTime.select(cboFromTime.selectedIndex);
         }

    function cboFromTimeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          if (event.code == KeyCode.VK_TAB) {
            txtAppointmentToTime.requestFocus();
        } shortcut(event);
         }

    function cboToTimeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtEmergencyLevel.requestFocus();
         } shortcut(event);
         }
        
        function checkToTime():Integer {
         var retVal=0;
         try {
            if(txtAppointmentToTime.rawText.trim().length() == 4) {
                var hours:String = txtAppointmentToTime.rawText.trim().substring(0,2);
                var mins:String = txtAppointmentToTime.rawText.trim().substring(2,4);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtAppointmentToTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(hours) ==0 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtAppointmentToTime);
                    retVal=1;
                }
                else {
                    txtAppointmentToTime.text = "{txtAppointmentToTime.rawText.trim().substring(0,2)}:{txtAppointmentToTime.rawText.trim().substring(2,4)}";
                    cboToTime.requestFocus();
                }
            }
            else if(txtAppointmentToTime.rawText.trim().length() == 5 and txtAppointmentToTime.rawText.trim().contains(":")) {
                var hours:String = txtAppointmentToTime.rawText.trim().substring(0,2);
                var mins:String = txtAppointmentToTime.rawText.trim().substring(3,5);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtAppointmentToTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtAppointmentToTime);
                    retVal=1;
                }
                else {
                    cboToTime.requestFocus();
                }
            }
            else {
                FXinfo("Time should contain minimum of 4 digits",txtAppointmentToTime);
                retVal=1;
            }
        }
        catch(ex:Exception) {
            ex.printStackTrace();
        }
        return retVal;
    }


   function txtAppointmentToTimeOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        txtAppointmentToTime.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            checkToTime();
        } shortcut(event);
    }

    function txtAppointmentFromTimeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtAppointmentFromTime.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            checkFromTime("txtBox");
        } shortcut(event);
         }

    function checkFromTime(type:String):Integer {
         var retVal=0;
         try {
            if(txtAppointmentFromTime.rawText.trim().length() == 4) {
                var hours:String = txtAppointmentFromTime.rawText.trim().substring(0,2);
                var mins:String = txtAppointmentFromTime.rawText.trim().substring(2,4);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtAppointmentFromTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtAppointmentFromTime);
                    retVal=1;
                }
                else {
                    txtAppointmentFromTime.text = "{txtAppointmentFromTime.rawText.trim().substring(0,2)}:{txtAppointmentFromTime.rawText.trim().substring(2,4)}";
                    cboFromTime.requestFocus();
                    if(not txtAppointmentDuration.rawText.trim().equals("") and val.getNumberValid(txtAppointmentDuration.rawText.trim(), 0, 3)==10 and type.equals("txtBox")) {
                        txtAppointmentToTime.text = DateUtils.calculateTime(txtAppointmentFromTime.rawText.trim(),txtAppointmentDuration.rawText.trim());
                    }
                }
            }
            else if(txtAppointmentFromTime.rawText.trim().length() == 5 and txtAppointmentFromTime.rawText.trim().contains(":")) {
                cboFromTime.requestFocus();
                var hours:String = txtAppointmentFromTime.rawText.trim().substring(0,2);
                var mins:String = txtAppointmentFromTime.rawText.trim().substring(3,5);
                if(val.getNumberValid(hours,1,2)!=10 or (val.getNumberValid(mins,1,2)!=10)) {
                    FXinfo("Incorrect time value",txtAppointmentFromTime);
                    retVal=1;
                }
                else if(Integer.parseInt(hours) > 12 or Integer.parseInt(hours) ==0 or Integer.parseInt(mins) > 59) {
                    FXinfo("Incorrect time value",txtAppointmentFromTime);
                    retVal=1;
                }
                else {
                    if(not txtAppointmentDuration.rawText.trim().equals("") and val.getNumberValid(txtAppointmentDuration.rawText.trim(), 0, 3)==10 and type.equals("txtBox")) {
                        txtAppointmentToTime.text = DateUtils.calculateTime(txtAppointmentFromTime.rawText.trim(),txtAppointmentDuration.rawText.trim());
                    }
                }
            }
            else {
                FXinfo("Time should contain minimum of 4 digits",txtAppointmentFromTime);
                retVal=1;
            }
        }
        catch(ex:Exception) {
            ex.printStackTrace();
        }
        return retVal;
    }


    function txtPatientNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
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
        txtPatientName.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
         }

    function txtPhysicianOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getDoctorList();
        if (event.code == KeyCode.VK_DOWN) {
            listDoctorName.requestFocus();
            listDoctorName.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listDoctorName.visible = false;
            txtPhysician.requestFocus();
        }
     }

    function txtPhysicianOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         txtPhysician.style=mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPatientName.requestFocus();
        }
        shortcut(event);
     }

    function imageDown3OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtPatientName.style = mandatoryStyle;
        getPatientList();
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
                        txtAppointmentFromTime.requestFocus();
                    } else {
                        listPatientName.visible = false;
                    }
               }
         }
    }
    catch(ex:Exception) {
       var que = " Class : ManageAppointment   Method: getPatientList    Exception : {ex.getMessage()}";
       log.debug(que);
    }
    }

    function imageDown2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtPhysician.style=mandatoryStyle;
        getDoctorList();
         }


    function getDoctorList(): Void {
        try {
        var listControlObj: ListController = new ListController();
        listDoctorName.visible = true;
        listPatientName.visible = false;
        listH = 0.0;
        listDoctorName.layoutX = txtPhysician.layoutX;
        listDoctorName.layoutY = txtPhysician.layoutY + txtPhysician.height + 5;
        listH = listControlObj.listImageControlView(txtPhysician, listDoctorName, "doctor", 1);
        var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    imageDate1.requestFocus();
                    if (listDoctorName.selectedItem != "New name...") {
                        txtPhysician.text = "{listDoctorName.selectedItem}";
                        listDoctorName.visible = false;
                        txtPatientName.requestFocus();
                    } else {
                        listDoctorName.visible = false;
                    }
                }
        }
        }
        catch(ex:Exception) {
            var que = " Class : ManageAppointment   Method: getDoctorList    Exception : {ex.getMessage()}";
            log.debug(que);
        }
    }

    function imageDate1OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getDateValue();
         }

    function imageDate1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getDateValue();
         }

    function getDateValue():Void {
        txtAppointmentDate.style = mandatoryStyle;
        if (not dateFlag1) {
            panelCalender.layoutY = imageDate1.layoutY + txtAppointmentDate.height + 5.0;
            if (txtAppointmentDate.rawText != null) {
                var dat = txtAppointmentDate.rawText.split("-");
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
            dateFlag1 = true;
        } else {
            fxCalendar.visible = false;
        }
    }

     function rdoDoctorSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtDoctorSearch.style = mandatoryStyle;
        txtDoctorSearch.editable = true;
        txtPatientSearch.style = "";
        txtPatientSearch.editable = false;
        txtPatientSearch.text = "";
        txtSearchDate.style = "";
        txtSearchDate.text = "";
     }
            
    function rdoDateSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtPatientSearch.text = "";
        txtSearchDate.style = mandatoryStyle;
        txtPatientSearch.style = "";
        txtPatientSearch.editable = false;
        txtDoctorSearch.style = "";
        txtDoctorSearch.text = "";
        txtDoctorSearch.editable = false;
    }

    function rdoPatientSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSearchDate.text = "";
        txtPatientSearch.style = mandatoryStyle;
        txtSearchDate.style = "";
        txtPatientSearch.editable = true;
        txtDoctorSearch.style = "";
        txtDoctorSearch.text = "";
        txtDoctorSearch.editable = false;
    }

   

      
    function txtSearchDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
    }

    function changeTableSize(i: Integer, j: Integer): Void {
        AppointLoad.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    function btnCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       if (event.code == KeyCode.VK_ENTER) {
       cancel();
       }
    }

    
    function cancel(): Void {
        if(txtAppointmentId.rawText.trim().equals("")) {
            FXinfo("Appointment number should not be empty. Select the row in table to Cancel.");
            manageAppointmentTable.jtable.requestFocus();
        }
        else {
            var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Appointment","<html> Are you sure to cancel this appointment? </html>");
            appointmentController = RegistryFactory.getClientStub(RegistryConstants.Appointment) as com.vanuston.medeil.implementation.Appointment;
            var a =bind cn.staus;
            if (a) {
                var b = appointmentController.insertQry("update medp_appointment_mt set is_active=1,app_status=2,status='Cancel' where id='{manageAppointmentTable.jtable.getModel().getValueAt(manageAppointmentTable.jtable.getSelectedRow(), 6).toString()}'");
                if(b!=0)
                FXalert(0);
                clear();
                txtDoctorSearch.text = "";
                txtPatientSearch.text = "";
                txtSearchDate.text = "";
                loadTodayAppointment();
            }
        }
    }

    function btnCancelActionAtShown(): Void {
        cancel();
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        listName.visible = false;
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Manage Appointment", type);
        showAlertbox();
    }

   function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Manage Appointment", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Manage Appointment", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function listNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listName.selectFirstRow();
        }
    }

   

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 8) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {        
        if (event.code == kr.cancel) {
            cancel();
        }
        else if (event.code == kr.update) {
            save();
        }
               
    }

    function txtPatientSearchKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPatientSearch.style = mandatoryStyle;
        shortcut(event);
    }  
     
    public function reset(): Void {
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 175.0;
        TableH = 160.0;
        AppointLoad.visible = true;
        clear();
    }

    public function clear() {
        txtAppointmentDate.text = DateUtils.now("dd-MM-yyyy");
        txtAppointmentId.text = "";
        txtPhysician.text = "";
        txtPatientName.text = "";
        txtAppointmentFromTime.text = "";
        txtAppointmentToTime.text = "";
        txtEmergencyLevel.text = "";
        txtAppointmentReason.text = "";
        txtAppointmentDuration.text = "";        
        mandatory();
    }
     

    function btnSaleMnSearchActionAtShown(): Void {
        clear();
        fxCalendar.visible = false;
        if(rdoDateSearch.selected == true) {
            if (txtSearchDate.text != null) {
                var appointModel = new AppointmentModel();
                appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtSearchDate.rawText)));
                appointModel.setUpdatedBy("date");
                manageAppointmentTable.loadAppointmentTable(appointModel);
            } else {
                txtSearchDate.style = mandatoryStyle;
                FXinfo("Please Enter Date to View the Records.", txtSearchDate);
            }
        }
        else if(rdoPatientSearch.selected == true) {
            if (txtPatientSearch.text != null) {
                var appointModel = new AppointmentModel();
                appointModel.setPatientName(txtPatientSearch.rawText.trim());
                appointModel.setUpdatedBy("patientName");
                manageAppointmentTable.loadAppointmentTable(appointModel);
            } else {
                txtPatientSearch.style = mandatoryStyle;
                FXinfo("Please enter Customer name or mobile number to search.", txtPatientSearch);
            }
        }
        else if(rdoDoctorSearch.selected == true) {
            if (txtDoctorSearch.text != null) {
                var appointModel = new AppointmentModel();
                appointModel.setDoctorName(txtDoctorSearch.rawText.trim());
                appointModel.setUpdatedBy("doctorNameSearch");
                manageAppointmentTable.loadAppointmentTable(appointModel);
            } else {
                txtDoctorSearch.style = mandatoryStyle;
                FXinfo("Please enter Doctor Name to search.", txtDoctorSearch);
            }
        }
    }

    function btnSaleMnSearchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (txtSearchDate.text != null) {
                var cdate: String = DateUtils.changeFormatDate(sdf.parse(txtSearchDate.text));                
            } else {
                txtSearchDate.style = mandatoryStyle;
                FXinfo("Please Enter Date to View the Records.", txtSearchDate);
            }
        }
        shortcut(event);
    }

    

    public function imageDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = true;
        txtSearchDate.style = mandatoryStyle;
        if (not dateFlag) {
            if (txtSearchDate.text != null) {
                var dat = txtSearchDate.rawText.split("-");
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
            getDate(0);
        }
    };

    var visit1 = bind fxCalendar.visible on replace {
        if (dateFlag1 and not visit1) {
            getDate(1);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtSearchDate.text = fxCalendar.getSelectedDate();
            dateFlag = false;
            btnSaleMnSearch.requestFocus();
        }
        else {
            txtAppointmentDate.text = fxCalendar.getSelectedDate();
            dateFlag1 = false;
            txtPhysician.requestFocus();
        }

    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            def priv = commonController.getPrivileges("appointment", uname);
            def ss = priv.split(",");
            def val = Integer.parseInt(ss[1]);
            if ((val == 0) or (val == 1)) {
                // This Code is for No Access or Read Access
                btnUpdate.disable = true;
            }else{
                btnUpdate.disable = false;
            }
        }else{
            btnUpdate.disable = false;
        }
    }

    def logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    //updateValues();
    }

//    var rdo: Boolean = bind rdoPatientSearch.selected on replace {
//        if (rdo) {
//            txtSearchDate.disable = true;
//            btnSaleMnSearch.disable = true;
//            imageDate.disable = true;
//            txtPatientSearch.disable = true;
//        } else {
//            txtSearchDate.disable = false;
//            btnSaleMnSearch.disable = false;
//            imageDate.disable = false;
//            txtPatientSearch.disable = true;
//        }
//      }
   
    
    public function loadTodayAppointment(): Void {
        var appointModel = new AppointmentModel();
        appointModel.setAppointmentDate(Date.valueOf(DateUtils.changeFormatDate(DateUtils.now("dd-MM-yyyy"))));
        appointModel.setUpdatedBy("date");
        manageAppointmentTable.loadAppointmentTable(appointModel);
    }

    public function loadAppointmentValues() : Void {
                clear();
                var i:Integer = manageAppointmentTable.jtable.getSelectedRow();
                if (manageAppointmentTable.jtable.getModel().getValueAt(i, 0) != null and manageAppointmentTable.jtable.getModel().getValueAt(i, 1) != null) {
                    txtAppointmentId.text = manageAppointmentTable.jtable.getModel().getValueAt(i, 0).toString();
                    var appointmentList = commonController.getQueryValue("select emergency_level,appoint_reason,appoint_duration from medp_appointment_mt where id = {manageAppointmentTable.jtable.getModel().getValueAt(i, 6).toString()} and is_active=0 ",3);
                    txtAppointmentDate.text = manageAppointmentTable.jtable.getModel().getValueAt(i,1).toString();
                    txtPhysician.text = manageAppointmentTable.jtable.getModel().getValueAt(i,3).toString();
                    txtPatientName.text = manageAppointmentTable.jtable.getModel().getValueAt(i,2).toString();
                    txtAppointmentFromTime.text = manageAppointmentTable.jtable.getModel().getValueAt(i,4).toString().split(" ")[0];
                    if(manageAppointmentTable.jtable.getModel().getValueAt(i,4).toString().split(" ")[1].equals("AM")) {
                        cboFromTime.select(0);
                    }
                    else {
                        cboFromTime.select(1);
                    }
                    txtAppointmentToTime.text = manageAppointmentTable.jtable.getModel().getValueAt(i,5).toString().split(" ")[0];
                    if(manageAppointmentTable.jtable.getModel().getValueAt(i,5).toString().split(" ")[1].equals("AM")) {
                        cboToTime.select(0);
                    }
                    else {
                        cboToTime.select(1);
                    }
                    if(appointmentList.size() > 0) {
                        txtEmergencyLevel.text = appointmentList.get(0).toString();
                        txtAppointmentReason.text = appointmentList.get(1).toString();
                        txtAppointmentDuration.text = appointmentList.get(2).toString();
                    }
                }
    }


    public function startUp(): Void {

        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                loadAppointmentValues();
            }            
        });

        (table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                loadAppointmentValues();
            }            
        });                
        panel.visible = true;
        panelTableLY = 175.0;
        TableH = 160.0;
        //panel.content = [rectangle, rectangle2, label, panelTable, rdoPatientSearch, rdoDateSearch, panelEditTable, rectTableBorder, panelButton, labelSearch_By, labelSearch_By_Date, label15, label16, lblSaleMnLastMonth, separator, panelSearch, panelDate, separator3, label2, label3, label4, label5, txtSaleMnBillNo, txtSaleMnCName, label6, label7, txtSearchDateEdit, txtSaleMnDoctorName, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmt, imageCustDown, imageDoctorDown, groupRemoveRow, panelCalender, listName, panelAlert, panelCardDetails,employee_id];
        currentState.actual = currentState.findIndex("Shown");
        AppointLoad.layoutX = 0;
        AppointLoad.layoutY = 0;
        AppointLoad.visible = true;
        txtDoctorSearch.style = mandatoryStyle;
        txtAppointmentDate.text = DateUtils.now("dd-MM-yyyy");        
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        imageDate1.image = Image { url: "{__DIR__}images/Calender.png" };
        fxCalendar.visible = false;
        panelTable.content = [AppointLoad];
        panelCalender.content = [fxCalendar,];        
        clear();
        mandatory();
        loadTodayAppointment();
    }
}