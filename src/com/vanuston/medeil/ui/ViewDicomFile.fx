/*
 * DoctorNewInformation.fx
 *
 * Created on 7 Aug, 2024, 6:33:08 PM
 */
package com.vanuston.medeil.ui;

import java.lang.*;
import java.sql.*;
import javafx.scene.input.*;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.image.*;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.KeyRegistry;
import java.util.List;
import java.sql.Date;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.DateUtils;
import java.text.SimpleDateFormat;
import javafx.scene.control.TextBox;
import java.awt.Frame;
import com.vanuston.medeil.implementation.DicomImplementation;
import com.vanuston.medeil.controller.DicomController;
import javax.swing.JLabel;
import com.vanuston.medeil.util.ViewDicomFiles;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import com.vanuston.medeil.model.DicomModel;
import com.vanuston.medeil.uitables.*;

/**
 * @author Vanitha
 */
public class ViewDicomFile {

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 397.0
        styleClass: "form-background"
        stroke: null
        width: bind panelW
        height: bind panelH
    }
    
    def __layoutInfo_separator1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator1: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: true
        layoutX: 30.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_separator1
    }
    
    def __layoutInfo_txtPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def txtPatientName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 210.0
        layoutInfo: __layoutInfo_txtPatientName
        styleClass: "text-boxs"
        promptText: "patient name"
        columns: 15.0
    }
    
    def __layoutInfo_btnPatientReport: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientReport: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnPatientReport
        text: "Button"
    }
    
    def __layoutInfo_listDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listDoctorName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 40.0
        layoutInfo: __layoutInfo_listDoctorName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
        layoutY: 54.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_typeChoiceBox: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
    }
    public-read def typeChoiceBox: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: true
        layoutX: bind C2LX
        layoutY: 150.0
        layoutInfo: __layoutInfo_typeChoiceBox
        items: bind custType
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
    }
    
    public-read def lblDrName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        text: "Label"
    }
    
    def __layoutInfo_txtDocName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtDocName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutInfo: __layoutInfo_txtDocName
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_lblTitle: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def lblTitle: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 549.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_lblTitle
        effect: lightingEffect
        text: "X-Ray Information"
        font: Arial_25
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 18.0
    }
    
    public-read def patientName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 210.0
        text: "Patient Name"
        font: Arial_18
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
        blue: 0.0
    }
    
    public-read def lbl2AddNew: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 35.0
        layoutY: 80.0
        text: "Label"
        font: Arial_18
        textFill: Green
    }
    
    public-read def red: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.6
        green: 0.6
        blue: 1.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 1.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        stroke: null
        width: bind panelW
        height: 32.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnPatientCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnPatientCancel
        effect: reflectionEffect
        text: "Cancel"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPatientSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnPatientSave
        effect: reflectionEffect
        text: "Save"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPatientReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnPatientReset
        effect: reflectionEffect
        text: "Reset"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def btnPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnPatientReset, btnPatientSave, btnPatientCancel, btnPatientReport, ]
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def reflectionEffect3: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def instance: javafx.scene.image.Image = javafx.scene.image.Image {
        url: ""
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def image6: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image7: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def imageCursor: javafx.scene.ImageCursor = javafx.scene.ImageCursor {
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 14.0
    }
    
    public-read def lbiType: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 330.0
        text: "Type"
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgPatientName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+200
        layoutY: 210.0
        image: imageDown
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectHeader, rectangle, lblTitle, lbl2AddNew, separator1, patientName, txtPatientName, btnPanel, imgPatientName, listDoctorName, panelCalender, panelAlert, lbiType, rectTableBorder, typeChoiceBox, panelTable, lblDrName, txtDocName, ]
    }
    
    public-read def imageCalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "FromSales", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.stroke = null;
                            rectangle.layoutX = 10.0;
                            rectangle.fill = javafx.scene.paint.Color.BLACK;
                            rectangle.stroke = Green;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.text = "View Radiology";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            lbl2AddNew.visible = true;
                            lbl2AddNew.layoutY = 65.0;
                            lbl2AddNew.text = "General Details";
                            lbl2AddNew.font = Arial_18;
                            separator1.visible = true;
                            separator1.layoutX = 30.0;
                            separator1.layoutY = 90.0;
                            patientName.visible = true;
                            patientName.layoutY = 150.0;
                            patientName.font = Arial_14;
                            patientName.textFill = DarkGray;
                            txtPatientName.layoutY = 150.0;
                            __layoutInfo_txtPatientName.width = 200.0;
                            txtPatientName.style = "-fx-border-width:2;";
                            txtPatientName.styleClass = "text-box";
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressed;
                            txtPatientName.onKeyReleased = txtPatientNameOnKeyReleased;
                            txtPatientName.columns = 10.0;
                            btnPatientReset.visible = true;
                            btnPatientReset.layoutY = 0.0;
                            btnPatientReset.action = getActionForRestButton;
                            btnPatientSave.visible = true;
                            btnPatientSave.layoutY = 0.0;
                            btnPatientSave.onMouseClicked = toSaveUltraSoundDetailsOnCLick;
                            btnPatientSave.text = "Viewer";
                            btnPatientCancel.layoutY = 0.0;
                            btnPatientCancel.font = Arial_Bold_14;
                            btnPatientCancel.action = addFunctionForCAncel;
                            btnPatientReport.visible = true;
                            btnPatientReport.onMouseClicked = onClickForReportButton;
                            btnPatientReport.effect = reflectionEffect;
                            btnPatientReport.text = "Report";
                            btnPatientReport.font = Arial_Bold_14;
                            btnPatientReport.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            btnPatientReport.action = onClickForReportAction;
                            btnPanel.visible = true;
                            imgPatientName.visible = false;
                            imgPatientName.layoutY = 120.0;
                            imgPatientName.onMouseClicked = patientNameDropDownOnClick;
                            imgPatientName.image = imageDown;
                            listDoctorName.visible = false;
                            listDoctorName.layoutY = 47.0;
                            listDoctorName.items = [ "Item 1", "Item 2", "Item 3", ];
                            panelCalender.visible = false;
                            panelAlert.visible = false;
                            panelAlert.onMouseClicked = panelAllertOnClick;
                            lbiType.layoutY = 120.0;
                            lbiType.text = "Dept/Category";
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 210.0;
                            rectTableBorder.styleClass = "rectTableBorder";
                            typeChoiceBox.visible = true;
                            typeChoiceBox.layoutY = 120.0;
                            typeChoiceBox.onKeyPressed = onKeyPressedForRadioType;
                            typeChoiceBox.onKeyReleased = onKeyReleaseForChiceBox;
                            typeChoiceBox.onMouseClicked = onClickForCheckBox;
                            panelTable.visible = true;
                            panelTable.layoutY = 210.0;
                            lblDrName.layoutY = 120.0;
                            lblDrName.text = "Doctor Name";
                            lblDrName.font = Arial_14;
                            lblDrName.textFill = DarkGray;
                            txtDocName.visible = true;
                            txtDocName.layoutY = 120.0;
                            __layoutInfo_txtDocName.width = 200.0;
                            txtDocName.onKeyPressed = txtDoctorKeyPressed;
                            txtDocName.onKeyReleased = onkeyPressByDoctor;
                            txtDocName.promptText = "enter doctor name";
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.stroke = null;
                            rectangle.layoutX = 397.0;
                            rectangle.fill = javafx.scene.paint.Color.BLACK;
                            rectangle.stroke = null;
                            lblTitle.layoutX = 549.0;
                            lblTitle.layoutY = 34.0;
                            lblTitle.text = "X-Ray Information";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            lbl2AddNew.visible = true;
                            lbl2AddNew.layoutY = 80.0;
                            lbl2AddNew.text = "Label";
                            lbl2AddNew.font = Arial_18;
                            separator1.visible = true;
                            separator1.layoutX = 30.0;
                            separator1.layoutY = 115.0;
                            patientName.visible = false;
                            patientName.layoutY = 210.0;
                            patientName.font = Arial_18;
                            patientName.textFill = javafx.scene.paint.Color.BLACK;
                            txtPatientName.layoutY = 210.0;
                            __layoutInfo_txtPatientName.width = 250.0;
                            txtPatientName.style = "";
                            txtPatientName.styleClass = "text-boxs";
                            txtPatientName.columns = 15.0;
                            btnPatientReset.visible = true;
                            btnPatientReset.layoutY = 520.0;
                            btnPatientSave.visible = true;
                            btnPatientSave.layoutY = 520.0;
                            btnPatientSave.text = "Save";
                            btnPatientCancel.layoutY = 520.0;
                            btnPatientCancel.font = Arial_Bold_14;
                            btnPatientReport.visible = false;
                            btnPatientReport.text = "Button";
                            btnPatientReport.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            btnPanel.visible = false;
                            imgPatientName.visible = false;
                            imgPatientName.layoutY = 210.0;
                            imgPatientName.image = imageDown;
                            listDoctorName.visible = false;
                            listDoctorName.layoutY = 40.0;
                            listDoctorName.items = [ "Item 1", "Item 2", "Item 3", ];
                            panelCalender.visible = true;
                            panelAlert.visible = true;
                            lbiType.layoutY = 330.0;
                            lbiType.text = "Type";
                            rectTableBorder.visible = false;
                            rectTableBorder.layoutY = 0.0;
                            rectTableBorder.styleClass = "";
                            typeChoiceBox.visible = true;
                            typeChoiceBox.layoutY = 150.0;
                            panelTable.visible = false;
                            panelTable.layoutY = 0.0;
                            lblDrName.layoutY = 0.0;
                            lblDrName.text = "Label";
                            lblDrName.textFill = javafx.scene.paint.Color.BLACK;
                            txtDocName.visible = false;
                            txtDocName.layoutY = 0.0;
                            txtDocName.promptText = null;
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

    function addFunctionForCAncel(): Void {
        //TODO
        cancel();
    }

    var mandatory = CommonDeclare.presc_textbox_mandatory();
    var listH = 0.0;
    def kr = KeyRegistry {};
    var seperatorW = bind CommonDeclare.seperatorW;
//        var seperatorW = bind CommonDeclare.seperatorW;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var panelH = bind CommonDeclare.panelFormH;
    var panelW = bind CommonDeclare.panelFormW;
//    var panelW = bind CommonDeclare.panelFormW on replace {
//        listDoctorName.visible = false;
//
//    }
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY + 10;
//    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
    var ImgDocSplArrow = bind C4LX + Type2TextboxW;
    var ImgCountryArrow = bind C2LX + Type2TextboxW;
    var ImgStateArrow = bind C2LX + Type2TextboxW;
    var ImgDocCodeArrow = bind C2LX + Type3TextboxW;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var error = CommonDeclare.textbox_error();
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var listW = Type2TextboxW;
    def CustomAlert = CustomAlert {};
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var dicomImPController: DicomImplementation;
    public var value: Integer;
    var custType: String[] = ["-Select-", "X - Ray", "Ultrasound", "Echo", "MRI Scan"];
    var checkEditReguest: Boolean = false;
    var log: Logger = Logger.getLogger(ViewDicomFile.class, "ViewDicomFile");
    var style = {
                "-fx-border-width:2;"
                "-fx-border-color:#666666;"

            }
    var TableH = 192.0 on replace {
        changeTableSize(TableW, TableH);
    };
    var TableW = bind ((95.29860229 * panelW) / 100) on replace {
        changeTableSize(TableW, TableH);
    };
    var viewAllFileTable = new ViewAllDicomFileTable();
    var panelTableLX = bind (panelW - TableW) / 2;
    var rowNo = 9;
    //                              0                    1          2           3        4             5     6       7      8     9       10
    var colNames: Object[] = ["Patient Code", "Doctor Name", "Patient Name", "Patient Type", "Radiology Type", "Sub - Type", "Date", "Payment", "ID"];
// column Type
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.sql.Date.class, java.lang.String.class, java.lang.Integer.class];
// column Editable
    var colEditable: Boolean[] = [false, false, false, false, false, false, false, false, false];
    var colWidth: Integer[] = [60, 180, 180, 80, 100, 100, 45, 45, 0];
    var radioTable = viewAllFileTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var xrayTable = SwingComponent.wrap(viewAllFileTable.getScrollTable(radioTable));

    function changeTableSize(i: Integer, j: Integer): Void {
        xrayTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    function select(): Void {

        try {
            if (viewAllFileTable.dicomSetId != -1) {
                System.out.println(viewAllFileTable.dicomSetId);
                currentState.actual = currentState.findIndex("Shown");

                displayItem(viewAllFileTable.dicomSetId);

            } else {
                FXinfo("Please select patient details");
            }

        } catch (ex: Exception) {
            var que: String = "Class : ViewDicomFile  Method : select()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function reportGenerate(): Void {

        try {
            if (viewAllFileTable.dicomSetId != -1) {
                System.out.println(viewAllFileTable.dicomSetId);
                currentState.actual = currentState.findIndex("Shown");

                displayReport(viewAllFileTable.dicomSetId);

            } else {
                FXinfo("Please select patient details.");
            }

        } catch (ex: Exception) {
            var que: String = "Class : ViewDicomFile  Method : reportGenerate()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    public function displayReport(num: Integer): Void {
        try {
            System.out.println("display item{num}");
            dicomImPController = new DicomController();

            var typeName = typeChoiceBox.selectedItem.toString();
            var dcmModel = new DicomModel();
            var number: Integer = 1;
            if (typeName.equals("X - Ray")) {
                dcmModel.setPassValue(3);
                number = 1;
            } else if (typeName.equals("Ultrasound")) {
                dcmModel.setPassValue(4);
                number = 2;
            } else if (typeName.equals("Echo")) {
                dcmModel.setPassValue(5);
                number = 4;
            } else if (typeName.equals("MRI Scan")) {
                dcmModel.setPassValue(6);
                number = 6;
            }
            dcmModel.setId(num);
            dcmModel = dicomImPController.viewRecord(dcmModel) as DicomModel;

            var sqlDates: Date = getTodayDate();
            var viewDcmFile = new ViewDicomFiles();
            viewDcmFile.openReportDialogBox(dcmModel, number, sqlDates);

        } catch (ex: Exception) {
            var que: String = "Class : ViewDicomFile  Method : displayReport()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    public function displayItem(num: Integer): Void {
        try {
            System.out.println("display item{num}");
            dicomImPController = new DicomController();

            var typeName = typeChoiceBox.selectedItem.toString();
            var dcmModel = new DicomModel();
            if (typeName.equals("X - Ray")) {
                dcmModel.setPassValue(3);
            } else if (typeName.equals("Ultrasound")) {
                dcmModel.setPassValue(4);
            } else if (typeName.equals("Echo")) {
                dcmModel.setPassValue(5);
            } else if (typeName.equals("MRI Scan")) {
                dcmModel.setPassValue(6);
            }
            dcmModel.setId(num);

            dcmModel = dicomImPController.viewRecord(dcmModel) as DicomModel;

            var sqlDates: Date = getTodayDate();
            var viewDcmFile = new ViewDicomFiles();
            viewDcmFile.displayMultipleDICOMFiles(dcmModel, sqlDates, 0);

        } catch (ex: Exception) {
            var que: String = "Class : ViewDicomFile  Method : displayItem()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("View Radiology", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("View Radiology", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("View Radiology", msg);
        showAlertbox();
        err_txtbox.style = error;
        err_txtbox.requestFocus();
    }

    function patientNameDropDownOnClick(event: javafx.scene.input.MouseEvent): Void {
        //TODO

        if (not listDoctorName.visible) {
            System.out.println("1111111");
            getDoctorList();

            System.out.println("2222222222221");
        } else {
            listDoctorName.visible = false;
        }

    }

    function onkeyPressByDoctor(event: javafx.scene.input.KeyEvent): Void {
        //TODO

        var typeName = typeChoiceBox.selectedItem.toString();
        if (typeName.equals("-Select-")) {
            viewAllFileTable.clearData();
            FXinfo("Please select type name.");
            typeChoiceBox.requestFocus();
        } else {
            txtDocName.style = mandatory;
            if (typeName.equals("X - Ray")) {

                viewAllFileTable.loadInformationWithDoctorName(1, txtDocName.rawText.trim());

            } else if (typeName.equals("Ultrasound")) {

                viewAllFileTable.loadInformationWithDoctorName(2, txtDocName.rawText.trim());
            } else if (typeName.equals("Echo")) {

                viewAllFileTable.loadInformationWithDoctorName(4, txtDocName.rawText.trim());
            } else if (typeName.equals("MRI Scan")) {

                viewAllFileTable.loadInformationWithDoctorName(6, txtDocName.rawText.trim());
            }
        //            getDoctorWithTypeList(txtDocName.rawText.trim());
        }
        if (event.code == KeyCode.VK_DOWN) {
            radioTable.requestFocus();
            xrayTable.requestFocus();

        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {

            txtPatientName.requestFocus();
        }
    }

    function txtDoctorKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
    }

    function txtPatientNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        txtPatientName.style = null;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
    }

    function txtPatientNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        txtPatientName.requestFocus();
        txtPatientName.style = mandatory;
        var typeName = typeChoiceBox.selectedItem.toString();
        if (typeName.equals("-Select-")) {
            viewAllFileTable.clearData();
            FXinfo("Please select type name.");
            typeChoiceBox.requestFocus();
        } else {
            getPatientListWithType(txtPatientName.rawText.trim());
        }
        if (event.code == KeyCode.VK_DOWN) {
            radioTable.requestFocus();
            xrayTable.requestFocus();

        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {

            txtPatientName.requestFocus();
        }

    }

    function onClickForCheckBox(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        custType = ["-Select-", "X - Ray", "Ultrasound", "Echo", "MRI Scan"];

        var ct = bind typeChoiceBox.selectedItem on replace {
            getSelectCheckBoxValue(typeChoiceBox.selectedItem.toString());
            txtDocName.requestFocus();
        }

    }

    function onKeyReleaseForChiceBox(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        var typeName = typeChoiceBox.selectedItem.toString();
        viewAllFileTable.clearData();
        getSelectCheckBoxValue(typeName);
    }

    function onKeyPressedForRadioType(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            System.out.println("on key pressed click");
            custType = ["-Select-", "X - Ray", "Ultrasound", "Echo", "MRI Scan"];
            //            typeChoiceBox.select(0);
            System.out.println(custType);
            txtPatientName.requestFocus();

        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

    }

    function getPatientListWithType(patientName: String): Void {
        var typeName = typeChoiceBox.selectedItem.toString();
        if (typeName.equals("X - Ray")) {

            viewAllFileTable.loadPatientWithTypeList(1, patientName, txtDocName.rawText.trim());

        } else if (typeName.equals("Ultrasound")) {

            viewAllFileTable.loadPatientWithTypeList(2, patientName, txtDocName.rawText.trim());
        } else if (typeName.equals("Echo")) {

            viewAllFileTable.loadPatientWithTypeList(4, patientName, txtDocName.rawText.trim());
        } else if (typeName.equals("MRI Scan")) {

            viewAllFileTable.loadPatientWithTypeList(6, patientName, txtDocName.rawText.trim());
        }
    }

    function getSelectCheckBoxValue(typeName: String): Void {

        if (typeName.equals("X - Ray")) {

            viewAllFileTable.loadViewRadioInformation(1);
        } else if (typeName.equals("Ultrasound")) {
            viewTableLayout();
            viewAllFileTable.loadViewRadioInformation(2);
        } else if (typeName.equals("Echo")) {
            viewTableLayout();
            viewAllFileTable.loadViewRadioInformation(4);
        } else if (typeName.equals("MRI Scan")) {
            viewTableLayout();
            viewAllFileTable.loadViewRadioInformation(6);
        }

    }

    function getDoctorWithTypeList(docName: String): Void {
        var typeName = typeChoiceBox.selectedItem.toString();
        if (typeName.equals("X - Ray")) {

            viewAllFileTable.loadInformationWithDoctorName(1, docName);

        } else if (typeName.equals("Ultrasound")) {

            viewAllFileTable.loadInformationWithDoctorName(2, docName);
        } else if (typeName.equals("Echo")) {

            viewAllFileTable.loadInformationWithDoctorName(4, docName);
        } else if (typeName.equals("MRI Scan")) {

            viewAllFileTable.loadInformationWithDoctorName(6, docName);
        }

    }

    function getActionForRestButton(): Void {
        //TODO
        reset();
    }

    function reset(): Void {

        txtPatientName.text = "";
        txtDocName.text = "";
        txtPatientName.style = mandatory;

        typeChoiceBox.requestFocus();
        custType = ["-Select-", "X - Ray", "Ultrasound", "Echo", "MRI Scan"];
        typeChoiceBox.select(1);
        viewAllFileTable.loadViewRadioInformation(1);

        listDoctorName.visible = false;

    }

    function panelAllertOnClick(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        listFalse();
    }

    function listFalse(): Void {

        listDoctorName.visible = false;

    }

    function getTodayDate(): Date {
        var date = DateUtils.now("dd-MM-yyyy");
        var dateFormats: SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy"); // Define the expected date format
        var parsedDates: java.util.Date = dateFormats.parse(date);
        var sqlDates: Date = new Date(parsedDates.getTime());
        return sqlDates;
    }

    public function cancel(): Void {
        try {
            empty();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[3] = 0;
        } catch (ex: Exception) {
            var que: String = "Class : ViewDicomFile  Method : cancel()   = {ex.getMessage()}";
            log.debug(que);
        }
    }

    function onClickForReportAction(): Void {
        //TODO
        reportGenerate();
    }

    function onClickForReportButton(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        reportGenerate();
    }

    function getDoctorList(): Void {
        try {
            var listControlObj: ListController = new ListController();

            listDoctorName.visible = true;

            listH = 0.0;
            txtDocName.style = null;
            listDoctorName.layoutX = txtDocName.layoutX;
            listW = txtDocName.width;
            listDoctorName.layoutY = txtDocName.layoutY + txtDocName.height + 5;

            var size = listDoctorName.items.size();
            if (not listDoctorName.items.isEmpty()) {
                for (i in [0..<size])
                    listDoctorName.items[i] = null;
            }

//            var patientName = txtPatientName.rawText.trim();
//
            listH = listControlObj.listImageControlView(txtDocName, listDoctorName, "doctor", 1);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {

                    if (listDoctorName.selectedItem != "New name...") {
                        txtDocName.text = "{listDoctorName.selectedItem}";
                        listDoctorName.visible = false;
                        txtDocName.requestFocus();

                    } else {
                        listDoctorName.visible = false;
                    }
                }
            }

        } catch (ex: Exception) {
            var que: String = "Class : ViewDicomFile  Method : getDoctorList()   = {ex.getMessage()}";
            log.debug(que);
            System.out.println(que);
        }
    }

    function empty(): Void {

        txtPatientName.text = "";

//        txtSubType.text = "";
        listDoctorName.visible = false;
    }

    function viewTableLayout(): Void {
        xrayTable.layoutX = 0;
        xrayTable.layoutY = 0;
        //        drugTable.getJComponent().setPreferredSize(new Dimension(712, 260));
        TableH = 200.0;

    }

    function toSaveUltraSoundDetailsOnCLick(
            event: javafx.scene.input.MouseEvent): Void {
        select();
    }

    public function Startup(): Void {
        //    xRayController = RegistryFactory.getClientStub(RegistryConstants.XRayImplements) as com.vanuston.medeil.implementation.XRayImplements;

        panel.visible = true;
        currentState.actual = currentState.findIndex("Shown");
        txtPatientName.style = mandatory;
        custType = ["-Select-", "X - Ray", "Ultrasound", "Echo", "MRI Scan"];
        typeChoiceBox.select(1);
        viewTableLayout();
        viewAllFileTable.loadViewRadioInformation(1);
        panelTable.content = [xrayTable,];
        panel.content = [rectangle, rectHeader, lblTitle, lbl2AddNew, separator1, patientName, lbiType, lblDrName, txtPatientName, txtDocName, imgPatientName, btnPanel, panelTable, rectTableBorder,
                    typeChoiceBox, listDoctorName, panelAlert];

        btnPanel.content = [btnPatientReset, btnPatientSave, btnPatientCancel, btnPatientReport];
    }

}













