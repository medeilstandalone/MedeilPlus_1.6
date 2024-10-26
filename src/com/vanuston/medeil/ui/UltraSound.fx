/*
 * DoctorNewInformation.fx
 *
 * Created on 7 Aug, 2024, 6:33:08 PM
 */
package com.vanuston.medeil.ui;

import java.io.File;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javax.swing.JFileChooser;
import javax.swing.filechooser.FileNameExtensionFilter;
import javafx.scene.image.*;
import java.lang.*;
import com.vanuston.medeil.util.DICOMToImageConverter;
import java.lang.Exception;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.KeyRegistry;
import java.sql.Date;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.DateUtils;
import java.text.SimpleDateFormat;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.implementation.DicomImplementation;
import com.vanuston.medeil.controller.DicomController;
import com.vanuston.medeil.uitables.RadiologyTable;
import java.awt.Dimension;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.model.DicomModel;
import com.vanuston.medeil.util.ViewDicomFiles;
import com.vanuston.medeil.uitables.ViewAllDicomFileTable;
import java.awt.print.PrinterException;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 * @author Vanitha
 */
public class UltraSound {

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
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
        layoutX: bind C2LX+patientName.width+20+100
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
        layoutX: bind button1LX
        layoutInfo: __layoutInfo_btnPatientReport
        text: "Button"
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        width: bind TableW
        height: bind TableH
    }
    
    public-read def panelTableForView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
    }
    
    def __layoutInfo_btnAddNew: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAddNew: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind separator1.width-80
        layoutInfo: __layoutInfo_btnAddNew
        text: "Button"
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
        text: "Ultrasound Information"
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
        layoutX: bind C2LX+100
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
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 397.0
        styleClass: "form-background"
        stroke: Green
        width: bind panelW
        height: bind panelH
    }
    
    public-read def red: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.6
        green: 0.6
        blue: 1.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        stroke: Green
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
        layoutX: bind button5LX
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
        layoutX: bind button2LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnPatientSave
        effect: reflectionEffect
        text: "Save"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPatientEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button3LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnPatientEdit
        effect: reflectionEffect
        text: "Edit"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPatientReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button4LX
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
        content: [ btnPatientReset, btnPatientEdit, btnPatientSave, btnPatientCancel, btnPatientReport, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectHeader, rectangle, lblTitle, lbl2AddNew, separator1, patientName, txtPatientName, btnPanel, panelAlert, panelTable, rectTableBorder, panelTableForView, btnAddNew, ]
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
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
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
                            rectHeader.opacity = 0.25;
                            rectangle.layoutX = 10.0;
                            rectangle.fill = javafx.scene.paint.Color.BLACK;
                            rectangle.stroke = Green;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.text = "Ultrasound Information";
                            lblTitle.font = Arial_25;
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            lbl2AddNew.visible = true;
                            lbl2AddNew.layoutY = 65.0;
                            lbl2AddNew.text = "Add New  Ultrasound  Files";
                            lbl2AddNew.font = Arial_18;
                            separator1.visible = true;
                            separator1.layoutX = 30.0;
                            separator1.layoutY = 90.0;
                            patientName.visible = true;
                            patientName.layoutY = 140.0;
                            patientName.font = Arial_14;
                            patientName.textFill = DarkGray;
                            txtPatientName.layoutY = 136.0;
                            __layoutInfo_txtPatientName.width = 300.0;
                            __layoutInfo_txtPatientName.height = 30.0;
                            txtPatientName.style = "-fx-border-width:2;";
                            txtPatientName.styleClass = "text-box";
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressed;
                            txtPatientName.onKeyReleased = txtPatientNameOnKeyReleased;
                            txtPatientName.promptText = "Enter Patient Name or Phone No. or UHID";
                            txtPatientName.columns = 10.0;
                            txtPatientName.font = Arial_14;
                            btnPatientReset.visible = true;
                            btnPatientReset.layoutY = 0.0;
                            btnPatientReset.action = getActionForRestButton;
                            btnPatientEdit.layoutY = 0.0;
                            btnPatientEdit.text = "Edit";
                            btnPatientEdit.action = actionForTriggerEdit;
                            btnPatientSave.visible = true;
                            btnPatientSave.layoutY = 0.0;
                            btnPatientSave.text = "Upload";
                            btnPatientSave.action = actionForUpload;
                            btnPatientCancel.layoutY = 0.0;
                            btnPatientCancel.font = Arial_Bold_14;
                            btnPatientCancel.action = addFunctionForCAncel;
                            btnPatientReport.visible = false;
                            btnPatientReport.text = "Button";
                            btnPanel.visible = true;
                            panelAlert.visible = false;
                            panelAlert.onMouseClicked = panelAllertOnClick;
                            panelTable.visible = true;
                            panelTable.layoutY = 200.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 200.0;
                            rectTableBorder.styleClass = "rectTableBorder";
                            panelTableForView.visible = false;
                            panelTableForView.layoutY = 0.0;
                            btnAddNew.visible = true;
                            btnAddNew.layoutY = 63.0;
                            __layoutInfo_btnAddNew.width = 100.0;
                            __layoutInfo_btnAddNew.height = 30.0;
                            btnAddNew.style = "";
                            btnAddNew.text = "View All";
                            btnAddNew.font = Arial_18;
                            btnAddNew.action = actionForViewAllFunction;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectHeader.opacity = 0.25;
                            rectangle.layoutX = 10.0;
                            rectangle.fill = javafx.scene.paint.Color.BLACK;
                            rectangle.stroke = Green;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.text = "Ultrasound Information";
                            lblTitle.font = Arial_25;
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            lbl2AddNew.visible = true;
                            lbl2AddNew.layoutY = 65.0;
                            lbl2AddNew.text = "View All Ultrasound ";
                            lbl2AddNew.font = Arial_18;
                            separator1.visible = true;
                            separator1.layoutX = 30.0;
                            separator1.layoutY = 90.0;
                            patientName.visible = true;
                            patientName.layoutY = 140.0;
                            patientName.font = Arial_14;
                            patientName.textFill = DarkGray;
                            txtPatientName.layoutY = 137.0;
                            __layoutInfo_txtPatientName.width = 300.0;
                            __layoutInfo_txtPatientName.height = 30.0;
                            txtPatientName.style = "-fx-border-width:2;";
                            txtPatientName.styleClass = "text-box";
                            txtPatientName.onKeyPressed = onKeyPressedForViewFromSale;
                            txtPatientName.onKeyReleased = onKeyPressedForFromSales;
                            txtPatientName.promptText = "enter patient name or doctor name or patient mobile number";
                            txtPatientName.columns = 15.0;
                            txtPatientName.font = Arial_14;
                            btnPatientReset.visible = true;
                            btnPatientReset.layoutY = 0.0;
                            btnPatientReset.action = onActionForFromSaleView;
                            btnPatientEdit.layoutY = 0.0;
                            btnPatientEdit.onMouseClicked = onClickForReportButton;
                            btnPatientEdit.text = "Report";
                            btnPatientEdit.action = onClickForReportAction;
                            btnPatientSave.visible = true;
                            btnPatientSave.layoutY = 0.0;
                            btnPatientSave.onMouseClicked = toSaveUltraSoundDetailsOnCLick;
                            btnPatientSave.text = "Viewer";
                            btnPatientSave.action = toViewFulldetailsinViewerAction;
                            btnPatientCancel.layoutY = 0.0;
                            btnPatientCancel.font = Arial_Bold_14;
                            btnPatientCancel.action = addFunctionForCAncel;
                            btnPatientReport.visible = true;
                            btnPatientReport.text = "Generate Report";
                            btnPatientReport.font = Arial_Bold_14;
                            btnPatientReport.action = onActionForGenerateReport;
                            btnPanel.visible = true;
                            panelAlert.visible = true;
                            panelTable.visible = true;
                            panelTable.layoutY = 200.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 200.0;
                            rectTableBorder.styleClass = "rectTableBorder";
                            panelTableForView.visible = true;
                            panelTableForView.layoutY = 200.0;
                            btnAddNew.visible = true;
                            btnAddNew.layoutY = 65.0;
                            __layoutInfo_btnAddNew.width = 100.0;
                            __layoutInfo_btnAddNew.height = 27.0;
                            btnAddNew.style = "-fx-border-radius: 30;";
                            btnAddNew.text = "Back";
                            btnAddNew.font = Arial_18;
                            btnAddNew.action = anActionForAddNewFile;
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

    def kr = KeyRegistry {};
    var mandatory = CommonDeclare.presc_textbox_mandatory();
    var seperatorW = bind CommonDeclare.seperatorW;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var panelH = bind CommonDeclare.panelFormH;
    var panelW = bind CommonDeclare.panelFormW;
    var TableH = 192.0 on replace {
        changeTableSize(TableW, TableH);
    };
    var TableW = bind ((95.29860229 * panelW) / 100) on replace {
        changeTableSize(TableW, TableH);
    };
    var radioViewTable = new RadiologyTable();
    var viewAllFileTable = new ViewAllDicomFileTable();
    var panelTableLX = bind (panelW - TableW) / 2;
    var radioTable = radioViewTable.createTable();
    var xrayTable = SwingComponent.wrap(radioViewTable.getScrollTable(radioTable));
    var rowNo = 9;
    //                              0                    1          2           3        4             5     6       7      8     9       10
    var colNames: Object[] = ["Patient Code", "Doctor Name", "Patient Name", "Patient Type", "Radiology Type", "Sub - Type", "Date", "Payment", "ID"];
// column Type
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.sql.Date.class, java.lang.String.class, java.lang.Integer.class];
// column Editable
    var colEditable: Boolean[] = [false, false, false, false, false, false, false, false, false];
    var colWidth: Integer[] = [60, 100, 180, 100, 100, 100, 60, 60, 0];
    var xRayViewTable = viewAllFileTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var viewTable = SwingComponent.wrap(viewAllFileTable.getScrollTable(xRayViewTable));
//

    function changeTableSize(i: Integer, j: Integer): Void {
        xrayTable.getJComponent().setPreferredSize(new Dimension(i, j));
        viewTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var panelButtonsLY = bind CommonDeclare.panelButtonsLY + 10;
    var button1LX = bind CommonDeclare.botton51LX;
    var button2LX = bind CommonDeclare.botton52LX;
    var button3LX = bind CommonDeclare.botton53LX;
    var button4LX = bind CommonDeclare.botton54LX;
    var button5LX = bind CommonDeclare.botton55LX;
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
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var dicomImPController: DicomImplementation;
    public var value: Integer;
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var checkEditReguest: Boolean = false;
    var log: Logger = Logger.getLogger(UltraSound.class, "UltraSound");
    var style = {
                "-fx-border-width:2;"
                "-fx-border-color:#666666;"
            }

    function viewTableLayout(): Void {
        xrayTable.layoutX = 0;
        xrayTable.layoutY = 0;
        TableH = 275.0;

    }

    function viewTableLayoutForView(): Void {
        viewTable.layoutX = 0;
        viewTable.layoutY = 0;
        TableH = 270.0;

    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Ultrasound Information", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Ultrasound Information", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Ultrasound Information", msg);
        showAlertbox();
        err_txtbox.style = error;
        err_txtbox.requestFocus();
    }

    function toViewFulldetailsinViewerAction(): Void {
        //TODO
        if (btnPatientSave.text == "Viewer") {
            select();
        }
    }

    function txtPatientNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        txtPatientName.style = null;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
    }

    function txtPatientNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        txtPatientName.requestFocus();

        if (checkEditReguest) {
            radioViewTable.searchDicomInfoForEdit(txtPatientName.rawText.trim(), 2);

        } else {
            getPatientOrDoctorList();
        }

        if (event.code == KeyCode.VK_DOWN) {
            radioTable.requestFocus();
            xrayTable.requestFocus();

        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {

            txtPatientName.requestFocus();
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

    }

    public function getPatientOrDoctorList(): Void {

        radioViewTable.searchDicomInfo(txtPatientName.rawText.trim(), 2);

    }

    public function getPatientOrDoctorListForView(): Void {

        viewAllFileTable.searchDicomInfoForView(txtPatientName.rawText.trim(), 2);

    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            getDate(0);
        }
    };

    function getActionForRestButton(): Void {
        //TODO
        reset();
    }

    function toSaveUltraSoundDetailsOnCLick(
            event: javafx.scene.input.MouseEvent): Void {
        if (btnPatientSave.text == "Viewer") {
            select();
        }
    }

    function onActionForFromSaleView(): Void {
        //TODO
        resetForView();
    }

    function actionForUpload(): Void {
        //TODO
        if (btnPatientSave.text == "Upload") {
            edit();
        } else if (btnPatientSave.text == "Back") {
            btnPatientSave.text = "Upload";
            btnPatientEdit.text = "Edit";
            Startup();
        } else if (checkEditReguest) {
            btnPatientSave.text = "Upload";
            btnPatientEdit.text = "Edit";
            Startup();
        }
    }

    function onClickForReportAction(): Void {
        //TODO
        if (btnPatientEdit.text == "Report") {
            reportGenerate();
        }
    }

    function onClickForReportButton(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        if (btnPatientEdit.text == "Report") {
            reportGenerate();
        }

    }

    function actionForViewAllFunction(): Void {
        //TODO
        reset();
        panel.visible = true;
        currentState.actual = currentState.findIndex("FromSales");
        panelTable.visible = false;

        panelTableForView.content = [viewTable,];
        viewTableLayoutForView();
        viewAllFileTable.loadViewRadioInformation(2);
        TableH = 300.0;

        txtPatientName.style = mandatory;
        panel.content = [rectangle, rectHeader, lblTitle, lbl2AddNew, separator1, patientName, txtPatientName, btnPanel, panelTableForView, rectTableBorder, btnAddNew,
                    panelAlert];

        btnPanel.content = [btnPatientReset, btnPatientEdit, btnPatientSave, btnPatientCancel, btnPatientReport];

    }

    function onKeyPressedForFromSales(event: javafx.scene.input.KeyEvent): Void {
        //TODO

        txtPatientName.requestFocus();

        getPatientOrDoctorListForView();

        if (event.code == KeyCode.VK_DOWN) {
            viewTable.requestFocus();
            viewTable.requestFocus();

        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {

            txtPatientName.requestFocus();
        }
    }

    function panelAllertOnClick(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        listFalse();
    }

    function onKeyPressedForViewFromSale(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        txtPatientName.style = null;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
    }

    function actionForTriggerEdit(): Void {
        //TODO
        checkEditReguest = true;

        if (btnPatientEdit.text == "Edit") {
            setButtonName();
        } else if (btnPatientEdit.text == "Upload") {

            getFullDetails();
        }
    }

    function setButtonName(): Void {
        viewTableLayout();
        radioViewTable.loadAllFile(2);
        if (checkEditReguest) {
            btnPatientEdit.text = "Upload";
            btnPatientSave.text = "Back";

        }
    }

    function getFullDetails(): Void {

        try {
            if (radioViewTable.dicomSetId != -1) {
                System.out.println(radioViewTable.dicomSetId);
                currentState.actual = currentState.findIndex("Shown");
                selectItem(radioViewTable.dicomSetId);

            } else {
                FXinfo("Please select patient details");
            }

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : getFullDetails()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function onActionForGenerateReport(): Void {
        //TODO
        try {

            if (viewAllFileTable.dicomSetId != -1) {
                currentState.actual = currentState.findIndex("FromSales");
                dicomImPController = new DicomController();
                var reportSource: File = new File("printerfiles/ultrasoundreport.jasper");
                var jasperReport: JasperReport = JRLoader.loadObject(reportSource) as JasperReport;
                var jasperPrint: JasperPrint = dicomImPController.jasperPrint(viewAllFileTable.dicomSetId, 2, jasperReport);
                //System.out.println(jasperPrint.toString());
                try {
                    JasperPrintManager.printReport(jasperPrint, false);
                    FXinfo("The Ultrasound report has been printed sucessfully");
                } catch (ex: PrinterException) {
                       FXinfo("The Ultrasound report has been not  printed sucessfully");
                    var que: String = "Class : Ultrasound  Method : onActionForGenerateReport()   = {ex.getMessage()}";
                    log.debug(que);
                    ex.printStackTrace();
                }
            } else {
                FXinfo("Please select patient details");
            }

        } catch (ex: Exception) {
            var que: String = "Class : Ultrasound  Method : onActionForGenerateReport()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function getTodayDate(): Date {
        var date = DateUtils.now("dd-MM-yyyy");
        var dateFormats: SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy"); // Define the expected date format
        var parsedDates: java.util.Date = dateFormats.parse(date);
        var sqlDates: Date = new Date(parsedDates.getTime());
        return sqlDates;
    }

    function selectItem(num: Integer): Void {
        try {

            dicomImPController = new DicomController();

            var dcmModel = new DicomModel();

            dcmModel.setPassValue(4);

            dcmModel.setId(num);

            dcmModel = dicomImPController.viewRecord(dcmModel) as DicomModel;

            var sqlDates: Date = getTodayDate();
            var viewDcmFile = new ViewDicomFiles();
            viewDcmFile.displayMultipleDICOMFiles(dcmModel, sqlDates, 1);

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : selectItem()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function edit(): Void {

        try {
            if (radioViewTable.dicomSetId != -1) {
                System.out.println(radioViewTable.dicomSetId);
                currentState.actual = currentState.findIndex("Shown");
                displayItem(radioViewTable.dicomSetId);

            } else {
                FXinfo("Please select patient details");
            }

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : edit()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function setTableLay(): Void {
        xrayTable.layoutX = 0;
        xrayTable.layoutY = 0;

        TableH = 300.0;
        radioViewTable.dicomSetId = -1;
        radioViewTable.addBasicRows();
        radioViewTable.loadRadioInformatio(2);
        txtPatientName.requestFocus();

    }

    function setTableLayFoeView(): Void {
        viewTable.layoutX = 0;
        viewTable.layoutY = 0;

        TableH = 300.0;
        viewAllFileTable.dicomSetId = -1;
        viewAllFileTable.addBasicRows();
        viewAllFileTable.loadViewRadioInformation(2);

        txtPatientName.requestFocus();

    }

    public function displayItem(num: Integer): Void {
        try {
            dicomImPController = new DicomController();
            var dcmModel = new DicomModel();
            dcmModel.setPassValue(2);
            dcmModel.setDicomId(num);
            dcmModel = dicomImPController.viewRecord(dcmModel) as DicomModel;

            var fc = new JFileChooser();

            fc.setFileFilter(new FileNameExtensionFilter("DICOM Files", "dcm"));
            var returnVal: Integer = fc.showOpenDialog(null);
            if (returnVal == JFileChooser.APPROVE_OPTION) {
                var files: File[] = fc.getSelectedFile(); // Get the selected files
                if (files != null) {

                    System.out.println(files);
                    var dicom = new DICOMToImageConverter();
                    var sqlDates: Date = getTodayDate();
                    dicom.displayMultipleDICOMFiles(files, dcmModel, sqlDates);
                }
            }

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : displayItem()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function reset(): Void {

        txtPatientName.text = "";
        btnPatientEdit.text = "Edit";
        btnPatientSave.text = "Upload";
        txtPatientName.style = mandatory;
        checkEditReguest = false;
        setTableLay();

        txtPatientName.requestFocus();

    }

    function resetForView(): Void {

        txtPatientName.text = "";

        txtPatientName.style = mandatory;

        setTableLayFoeView();

        txtPatientName.requestFocus();

    }

    function select(): Void {

        try {
            if (viewAllFileTable.dicomSetId != -1) {

                currentState.actual = currentState.findIndex("FromSales");

                displayItemForView(viewAllFileTable.dicomSetId);

            } else {
                FXinfo("Please select patient details");
            }

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : select()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function getDate(i: Integer) {
        if (i == 0) {

            dateFlag = false;
            txtPatientName.requestFocus();
        }
    }

    function anActionForAddNewFile(): Void {
        //TODO

        Startup();
    }

    function reportGenerate(): Void {

        try {
            if (viewAllFileTable.dicomSetId != -1) {

                currentState.actual = currentState.findIndex("FromSales");
                if (btnPatientEdit.text == "Report") {
                    displayReport(viewAllFileTable.dicomSetId);
                }

            } else {
                FXinfo("Please select patient details");
            }

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : reportGenerate()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    public function displayReport(num: Integer): Void {
        try {

            dicomImPController = new DicomController();

            var dcmModel = new DicomModel();
            dcmModel.setPassValue(4);
            dcmModel.setId(num);
            dcmModel = dicomImPController.viewRecord(dcmModel) as DicomModel;

            var sqlDates: Date = getTodayDate();
            var viewDcmFile = new ViewDicomFiles();
            viewDcmFile.openReportDialogBox(dcmModel, 2, sqlDates);
            System.out.println("Success");
        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : displayReport()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    public function displayItemForView(num: Integer): Void {
        try {

            dicomImPController = new DicomController();

            var dcmModel = new DicomModel();

            dcmModel.setPassValue(4);

            dcmModel.setId(num);

            dcmModel = dicomImPController.viewRecord(dcmModel) as DicomModel;

            var sqlDates: Date = getTodayDate();
            var viewDcmFile = new ViewDicomFiles();
            viewDcmFile.displayMultipleDICOMFiles(dcmModel, sqlDates, 0);

        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : displayItemForView()   = {ex.getMessage()}";
            log.debug(que);
            ex.printStackTrace();
        }

    }

    function listFalse(): Void {
    }

    function updateValues(): Void {
        listFalse();
    }

    public function cancel(): Void {
        try {
            empty();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[3] = 0;
        } catch (ex: Exception) {
            var que: String = "Class : UltraSound  Method : cancel()   = {ex.getMessage()}";
            log.debug(que);
        }
    }

    function empty(): Void {

        txtPatientName.text = "";

    }

    public function Startup(): Void {
        panel.visible = true;
        currentState.actual = currentState.findIndex("Shown");

        panelTable.content = [xrayTable,];
        viewTableLayout();
        radioViewTable.loadRadioInformatio(2);
        TableH = 300.0;
        txtPatientName.style = mandatory;
        panelTableForView.visible = false;
        panel.content = [rectangle, rectHeader, lblTitle, lbl2AddNew, separator1, patientName, txtPatientName, btnPanel, panelTable, panelTableForView, rectTableBorder, btnAddNew, panelAlert];

        btnPanel.content = [btnPatientReset, btnPatientEdit, btnPatientSave, btnPatientCancel];

    }

}













