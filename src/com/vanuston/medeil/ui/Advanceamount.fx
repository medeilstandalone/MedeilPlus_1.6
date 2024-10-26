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
import java.lang.System;
import com.vanuston.medeil.util.DICOMToImageConverter;
import java.lang.Exception;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.KeyRegistry;
import java.util.List;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.DateUtils;

/**
 * @author Vanitha
 */
public class Advanceamount {

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
    
    public-read def amount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+150
        text: "Label"
    }
    
    def __layoutInfo_txtPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def txtPatientName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C3LX-80
        layoutY: 210.0
        layoutInfo: __layoutInfo_txtPatientName
        styleClass: "text-boxs"
        promptText: "patient name"
        columns: 15.0
    }
    
    def __layoutInfo_txtDrName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def txtDrName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX-80
        layoutY: 240.0
        layoutInfo: __layoutInfo_txtDrName
        styleClass: "text-boxs"
        effect: null
        text: ""
        promptText: "Doctor Name"
        lines: 5.0
    }
    
    def __layoutInfo_txtPatientAge: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtPatientAge: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C3LX-80
        layoutY: 270.0
        layoutInfo: __layoutInfo_txtPatientAge
        styleClass: "text-boxs"
    }
    
    def __layoutInfo_txtAdvanceamount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtAdvanceamount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX-80
        layoutInfo: __layoutInfo_txtAdvanceamount
    }
    
    def __layoutInfo_listPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listPatientName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 40.0
        layoutInfo: __layoutInfo_listPatientName
        items: [ "Item 1", "Item 2", "Item 3", ]
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
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 188.0
        layoutY: 54.0
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
    
    def __layoutInfo_txtDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX-80
        layoutY: 170.0
        layoutInfo: __layoutInfo_txtDate
        font: Arial_12
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    def __layoutInfo_uploadBtn: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def uploadBtn: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind C2LX+150+patientName.width
        layoutY: 300.0
        layoutInfo: __layoutInfo_uploadBtn
        onMouseClicked: uploadButtonOnCLick
        text: "Upload"
        font: Arial_Bold_14
    }
    
    public-read def ptnID: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-150
        layoutY: 130.0
        text: "uri234"
        font: Arial_Bold_14
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
    
    public-read def patientGender: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+150
        layoutY: 300.0
        text: "Gender"
        font: Arial_18
    }
    
    public-read def patientAge: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        opacity: 1.0
        layoutX: bind C2LX+150
        layoutY: 270.0
        text: "Age"
        font: Arial_18
    }
    
    public-read def patientName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+150
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
    
    def __layoutInfo_btnPatientEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPatientEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
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
        content: [ btnPatientReset, btnPatientEdit, btnPatientSave, btnPatientCancel, ]
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
    
    public-read def lbldate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+150
        layoutY: 170.0
        text: "Date"
        font: Arial_18
        textFill: DarkGray
    }
    
    public-read def doctorName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+150
        layoutY: 240.0
        text: "Doctor Name"
        font: Arial_18
        textFill: DarkGray
    }
    
    public-read def patientID: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        disable: false
        layoutX: bind C2LX+150
        layoutY: 140.0
        text: "Patient ID"
        font: Arial_18
        textFill: DarkGray
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
    
    public-read def rdoPatientFemale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C3LX
        layoutY: 300.0
        text: "Female"
        font: Arial_14
        toggleGroup: toggleGroup
    }
    
    public-read def rdoPatientMale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C3LX-80
        layoutY: 300.0
        text: "Male"
        font: Arial_14
        toggleGroup: toggleGroup
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDoctorName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: bind C3LX+170
        layoutY: 240.0
        image: imageDown
    }
    
    public-read def imgPatientName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C3LX+170
        layoutY: 210.0
        image: imageDown
    }
    
    public-read def imageCalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C3LX+txtDate.width-80
        layoutY: 170.0
        image: imageCalender
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectHeader, rectangle, lblTitle, lbl2AddNew, separator1, patientID, patientName, doctorName, patientAge, patientGender, amount, ptnID, txtPatientName, txtDrName, txtPatientAge, txtAdvanceamount, rdoPatientMale, rdoPatientFemale, uploadBtn, btnPanel, imgPatientName, listPatientName, listDoctorName, imgDoctorName, lbldate, txtDate, imgDate, panelCalender, ]
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
                            rectangle.stroke = Green;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.effect = lightingEffect;
                            lblTitle.text = "Advance Payment";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            lbl2AddNew.visible = true;
                            lbl2AddNew.layoutY = 65.0;
                            lbl2AddNew.text = "Add Advance Payment";
                            separator1.visible = true;
                            separator1.layoutX = 30.0;
                            separator1.layoutY = 90.0;
                            patientID.visible = false;
                            patientID.layoutY = 130.0;
                            patientName.visible = true;
                            patientName.font = Arial_12;
                            patientName.textFill = DarkGray;
                            doctorName.visible = true;
                            doctorName.font = Arial_12;
                            patientAge.visible = true;
                            patientAge.text = "Advance Amount";
                            patientAge.font = Arial_12;
                            patientAge.textFill = DarkGray;
                            patientGender.text = "Total Amount";
                            patientGender.font = Arial_12;
                            patientGender.textFill = DarkGray;
                            amount.visible = false;
                            amount.layoutY = 350.0;
                            amount.text = "Total Amount";
                            amount.font = Arial_12;
                            amount.textFill = DarkGray;
                            ptnID.visible = false;
                            ptnID.font = Arial_Bold_14;
                            txtPatientName.style = "-fx-border-width:2;";
                            txtPatientName.styleClass = "text-box";
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressed;
                            txtPatientName.onKeyReleased = txtPatientNameOnKeyReleased;
                            txtPatientName.columns = 10.0;
                            txtDrName.visible = true;
                            txtDrName.style = "-fx-border-width:2;";
                            txtDrName.styleClass = "text-box";
                            txtDrName.lines = 5.0;
                            txtPatientAge.styleClass = "text-box";
                            txtAdvanceamount.visible = true;
                            txtAdvanceamount.layoutY = 300.0;
                            __layoutInfo_txtAdvanceamount.width = 100.0;
                            rdoPatientMale.visible = false;
                            rdoPatientFemale.visible = false;
                            rdoPatientFemale.toggleGroup = toggleGroup;
                            uploadBtn.layoutY = 480.0;
                            uploadBtn.effect = null;
                            uploadBtn.text = "Save";
                            uploadBtn.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            btnPatientReset.visible = false;
                            btnPatientReset.layoutY = 0.0;
                            btnPatientEdit.visible = false;
                            btnPatientEdit.layoutY = 0.0;
                            btnPatientSave.visible = false;
                            btnPatientSave.layoutY = 0.0;
                            btnPatientCancel.visible = false;
                            btnPatientCancel.layoutY = 0.0;
                            btnPanel.visible = true;
                            imgPatientName.visible = true;
                            imgPatientName.onMouseClicked = patientNameDropDownOnClick;
                            imgPatientName.image = imageDown;
                            listPatientName.visible = false;
                            listPatientName.layoutY = 47.0;
                            listPatientName.items = [ "Item 1", "Item 2", "Item 3", ];
                            listDoctorName.visible = false;
                            listDoctorName.layoutY = 100.0;
                            imgDoctorName.visible = true;
                            imgDoctorName.onMouseClicked = onClickDoctorDownImage;
                            lbldate.visible = true;
                            lbldate.font = Arial_12;
                            txtDate.visible = true;
                            imgDate.onKeyPressed = onKeyPressedForDate;
                            imgDate.onMouseClicked = onKeyMouseClickedForDate;
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
                            rectHeader.stroke = Green;
                            rectangle.layoutX = 397.0;
                            rectangle.stroke = null;
                            lblTitle.layoutX = 549.0;
                            lblTitle.layoutY = 34.0;
                            lblTitle.effect = lightingEffect;
                            lblTitle.text = "X-Ray Information";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            lbl2AddNew.visible = true;
                            lbl2AddNew.layoutY = 80.0;
                            lbl2AddNew.text = "Label";
                            separator1.visible = true;
                            separator1.layoutX = 30.0;
                            separator1.layoutY = 115.0;
                            patientID.visible = false;
                            patientID.layoutY = 140.0;
                            patientName.visible = false;
                            patientName.font = Arial_18;
                            patientName.textFill = javafx.scene.paint.Color.BLACK;
                            doctorName.visible = false;
                            doctorName.font = Arial_18;
                            patientAge.visible = true;
                            patientAge.text = "Age";
                            patientAge.font = Arial_18;
                            patientAge.textFill = javafx.scene.paint.Color.BLACK;
                            patientGender.text = "Gender";
                            patientGender.font = Arial_18;
                            patientGender.textFill = javafx.scene.paint.Color.BLACK;
                            amount.visible = false;
                            amount.layoutY = 0.0;
                            amount.text = "Label";
                            amount.textFill = javafx.scene.paint.Color.BLACK;
                            ptnID.visible = false;
                            ptnID.font = Arial_Bold_14;
                            txtPatientName.style = "";
                            txtPatientName.styleClass = "text-boxs";
                            txtPatientName.columns = 15.0;
                            txtDrName.visible = false;
                            txtDrName.style = "";
                            txtDrName.styleClass = "text-boxs";
                            txtDrName.lines = 5.0;
                            txtPatientAge.styleClass = "text-boxs";
                            txtAdvanceamount.visible = false;
                            txtAdvanceamount.layoutY = 0.0;
                            rdoPatientMale.visible = true;
                            rdoPatientFemale.visible = true;
                            rdoPatientFemale.toggleGroup = toggleGroup;
                            uploadBtn.layoutY = 300.0;
                            uploadBtn.text = "Upload";
                            uploadBtn.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            btnPatientReset.visible = true;
                            btnPatientReset.layoutY = 520.0;
                            btnPatientEdit.visible = true;
                            btnPatientEdit.layoutY = 520.0;
                            btnPatientSave.visible = true;
                            btnPatientSave.layoutY = 520.0;
                            btnPatientCancel.visible = true;
                            btnPatientCancel.layoutY = 520.0;
                            btnPanel.visible = false;
                            imgPatientName.visible = false;
                            imgPatientName.image = imageDown;
                            listPatientName.visible = false;
                            listPatientName.layoutY = 40.0;
                            listPatientName.items = [ "Item 1", "Item 2", "Item 3", ];
                            listDoctorName.visible = false;
                            listDoctorName.layoutY = 0.0;
                            imgDoctorName.visible = true;
                            lbldate.visible = false;
                            lbldate.font = Arial_18;
                            txtDate.visible = false;
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

    function mouseClickOnSaveFunction(event: javafx.scene.input.MouseEvent): Void {
    //TODO
    }

    function mouseClickFunctionOnTag(event: javafx.scene.input.MouseEvent): Void {
    //TODO
    }

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
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    public var value: Integer;
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(XRayInformation.class, "XRayInformation");
    var style = {
                "-fx-border-width:2;"
                "-fx-border-color:#666666;"
//                "-fx-background-color: white ;"
            }

    function uploadButtonOnCLick(event: javafx.scene.input.MouseEvent): Void {
//        //TODO
//        uploadFile();
//    }

//    public function uploadFile(): Void {
//        var fc = new JFileChooser();
//        fc.setMultiSelectionEnabled(true);
//        fc.setFileFilter(new FileNameExtensionFilter("DICOM Files", "dcm"));
//        var returnVal: Integer = fc.showOpenDialog(null);
//        if (returnVal == JFileChooser.APPROVE_OPTION) {
//            var files: File[] = fc.getSelectedFiles(); // Get the selected files
//            if (files != null) {
//                //for (var file: File in files) {
//                var dicom = new DICOMToImageConverter();
//                dicom.displayMultipleDICOMFiles(files);
//
//            } else {
//                System.out.println("There is no dcm file");
//            }
//
//        }
//
//    }
}









    function patientNameDropDownOnClick(event: javafx.scene.input.MouseEvent): Void {
        //TODO

        if (not listPatientName.visible) {
            txtPatientName.style = mandatoryStyle;
            System.out.println("1");
            getPatientList();
            System.out.println("2");
        } else {
            listPatientName.visible = false;
        }
    }

    function onClickDoctorDownImage(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        if (not listDoctorName.visible) {
            txtDrName.style = mandatoryStyle;
            getDoctorList();
        } else {
            listDoctorName.visible = false;
        }

    }

    function onKeyPressedForDate(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        getDateValue();
    }

    function onKeyMouseClickedForDate(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        getDateValue();
    }

    function txtPatientNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtPatientName.style = mandatoryStyle;

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        } shortcut(event);
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

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
    //        if (event.code == kr.save and btnSave.text == "Save [F3]") {
    //            save(1);
    //        }
    //        if (event.code == kr.edit and btnEdit.text == "Edit [F6]") {
    //            edit();
    //        }
    //        if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
    //            reset();
    //        }

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
                    if (listPatientName.selectedItem != "New name...") {
                        txtPatientName.text = "{listPatientName.selectedItem}";
                        var customerDetails: List = commonController.getQueryValue("select age,gender from cust_information where concat(cust_name,' - ',mobile_no)='{txtPatientName.rawText.trim()}'", 2);
                       // txtPatientAge.text = customerDetails.get(0).toString();
//                        if (customerDetails.get(1).toString().equalsIgnoreCase("Male")) {
//                            rdoPatientMale.selected = true;
//                        } else {
//                            rdoPatientFemale.selected = true;
//                        }
//
                        listPatientName.visible = false;
                        txtDrName.requestFocus();
                    } else {
                        listPatientName.visible = false;
                       
                    }
                }
            }
        } catch (ex: Exception) {
            var que = " Class : Appointment   Method: getPatientList    Exception : {ex.getMessage()}";
            log.debug(que);
            System.out.println(que);
            ex.printStackTrace();
        }
    }

    function getDoctorList(): Void {
        try {
            var listControlObj: ListController = new ListController();
            listDoctorName.visible = true;
            System.out.println("1");
            listPatientName.visible = false;
            listH = 0.0;
            System.out.println("2");
            listDoctorName.layoutX = txtDrName.layoutX;
            System.out.println("3");
            listDoctorName.layoutY = txtDrName.layoutY + txtDrName.height + 5;
            System.out.println("4");
            listH = listControlObj.listImageControlView(txtDrName, listDoctorName, "doctor", 1);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {

                    if (listDoctorName.selectedItem != "New name...") {
                        txtDrName.text = "{listDoctorName.selectedItem}";
                        listDoctorName.visible = false;
                        patientAge.requestFocus();
                    //                        lblDisplayDetails.text = "Appointment Details for Doctor : {txtDoctorName.text}  on  Date : {txtDate.text}";
                    //                        var appointModel = new AppointmentModel();
                    //                        appointModel.setDoctorName(txtDoctorName.rawText.trim());
                    //                        appointModel.setAppointmentDate(Date.valueOf (DateUtils.changeFormatDate(txtDate.rawText)));
                    //                        appointModel.setUpdatedBy("doctorName");
                    //                        appointmentTable.loadAppointmentTable(appointModel);
                    //                        loadAppointmentChart("06:00 AM", "11:30 PM");
                    //                        txtAppointmentId.text=appointmentController.selectQry("SELECT coalesce(max((appoint_no+0)),0)+1 as appointNumber FROM AppointmentModel where appointment_date='{DateUtils.changeFormatDate(txtDate.rawText)}' and doctor_name='{txtDoctorName.rawText.trim()}'",0,"hql");
                    //                        var appDuration:String=appointmentController.selectQry("SELECT appointmentDuration FROM AppointmentModel where doctor_name='{txtDoctorName.rawText.trim()}' order by created_on desc",1,"hql");
                    //                        if(appDuration.equals("null")) {
                    //                            txtDuration.text="";
                    //                        }
                    //                        else {
                    //                            txtDuration.text=appDuration;
                    //                        }
                    //                        txtPatientName.requestFocus();
                    } else {
                        listDoctorName.visible = false;
                    }
                }
            }
        } catch (ex: Exception) {
            var que = " Class : Appointment   Method: getDoctorList    Exception : {ex.getMessage()}";
            log.debug(que);
            System.out.println("1");
            System.out.println(que);
        }
    }

    function getDateValue(): Void {
        System.out.println("1");
        txtDate.style = mandatoryStyle;
        System.out.println("2");
   
            if (not dateFlag) {
                System.out.println("3");
                panelCalender.layoutX=imgDate.layoutX ;
                panelCalender.layoutY = imgDate.layoutY + txtDate.height + 5.0;
                System.out.println("4");
                if (txtDate.rawText != null) {
                    var dat = txtDate.rawText.split("-");
                    var d = Integer.parseInt(dat[0]);
                    var m = Integer.parseInt(dat[1]) - 1;
                    var y = Integer.parseInt(dat[2]);
                    System.out.println("5");
                    fxCalendar.set(y, m, d);
                } else {
                    System.out.println("6");
                    var dat = DateUtils.now("dd-MM-yyyy").split("-");
                    var d = Integer.parseInt(dat[0]);
                    var m = Integer.parseInt(dat[1]) - 1;
                    var y = Integer.parseInt(dat[2]);
                    fxCalendar.set(y, m, d);
                    System.out.println("7");
                }
                fxCalendar.visible = true;
                dateFlag = true;
            }
            else {
                fxCalendar.visible = false;
//                throw new Exception("Date flag is false, calendar visibility toggled off");

                System.out.println("error");
            }
       
    }

    function btnDoctorResetActionAtShown(): Void {

    }

    public function Startup(): Void {
       fxCalendar.visible = false;
        panel.visible = true;
        currentState.actual = currentState.findIndex("Shown");
         panelCalender.content = [fxCalendar,];
        panel.content = [rectangle, rectHeader, lblTitle, lbl2AddNew, separator1, patientID, patientName, doctorName, patientAge, patientGender, txtPatientName, ptnID, txtDrName, txtPatientAge, rdoPatientFemale, rdoPatientMale, uploadBtn, btnPanel, imgPatientName, imgDoctorName, listPatientName,
                    listDoctorName, lbldate, txtDate, imgDate, panelCalender,amount,txtAdvanceamount];
        btnPanel.content = [btnPatientReset, btnPatientEdit, btnPatientSave, btnPatientCancel];
    }

}













