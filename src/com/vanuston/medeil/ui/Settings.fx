package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.TextBox;
import javafx.scene.Group;
import com.vanuston.medeil.model.SettingsModel;
import com.vanuston.medeil.model.MsgReturnModel;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import javafx.stage.Alert;
import com.vanuston.medeil.util.Value;

 
var BackOpac = 0.5;
var NextOpac = 0.5;
var rectScrollBgH = 1530.0;

public class Settings {

     var log: Logger = Logger.getLogger(Settings.class, "Settings");
     var settingsController: com.vanuston.medeil.implementation.Settings;
     var serverPort=30602;
	   
	   
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind panelW
        height: 50.0
    }
    
    public-read def rectScrollBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: bind rectScrollBgH
    }
    
    def __layoutInfo_scrollView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def scrollView: javafx.scene.control.ScrollView = javafx.scene.control.ScrollView {
        visible: false
        layoutX: bind scrollLX
        layoutInfo: __layoutInfo_scrollView
        node: rectScrollBg
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 470.0
        height: 2.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 20.0
        layoutY: 69.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 187.0
        layoutY: 110.0
        text: "Label"
    }
    
    def __layoutInfo_chkMaintaincost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def chkMaintaincost: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 270.0
        layoutY: 110.0
        layoutInfo: __layoutInfo_chkMaintaincost
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 417.0
        layoutY: 110.0
        text: "Label"
    }
    
    def __layoutInfo_separator6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 450.0
        height: 6.0
    }
    public-read def separator6: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 24.0
        layoutY: 119.0
        layoutInfo: __layoutInfo_separator6
    }
    
    public-read def rdoRemDisSMS: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 219.0
        layoutY: 85.0
        text: "Disable"
    }
    
    def __layoutInfo_txtServerAddress: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtServerAddress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtServerAddress
    }
    
    def __layoutInfo_txtServerPORT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtServerPORT: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtServerPORT
    }
    
    def __layoutInfo_txtMobileNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
        height: 25.0
    }
    public-read def txtMobileNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 155.0
        layoutY: 118.0
        layoutInfo: __layoutInfo_txtMobileNo
    }
    
    def __layoutInfo_chkServiceProvider: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def chkServiceProvider: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 542.0
        layoutY: 47.0
        layoutInfo: __layoutInfo_chkServiceProvider
    }
    
    def __layoutInfo_separator9: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def separator9: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 455.0
        layoutY: 72.0
        layoutInfo: __layoutInfo_separator9
    }
    
    def __layoutInfo_txt160by2user: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txt160by2user: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 468.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_txt160by2user
    }
    
    public-read def rdoway2sms: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 185.0
        layoutY: 45.0
        text: "Radio Button"
    }
    
    public-read def rdo160by2: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 593.0
        layoutY: 39.0
        text: "Radio Button"
    }
    
    def __layoutInfo_pwd160by2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def pwd160by2: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 404.0
        layoutY: 104.0
        layoutInfo: __layoutInfo_pwd160by2
    }
    
    def __layoutInfo_pwdway2sms: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def pwdway2sms: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 303.0
        layoutY: 104.0
        layoutInfo: __layoutInfo_pwdway2sms
    }
    
    def __layoutInfo_txtApiKey: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtApiKey: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtApiKey
    }
    
    def __layoutInfo_txtApiKey2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtApiKey2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtApiKey2
    }
    
    def __layoutInfo_txtway2smsuser: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtway2smsuser: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: -443.0
        layoutY: 607.0
        layoutInfo: __layoutInfo_txtway2smsuser
    }
    
    def __layoutInfo_choiceEverday: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 185.0
        height: 25.0
    }
    public-read def choiceEverday: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 61.0
        layoutY: 95.0
        layoutInfo: __layoutInfo_choiceEverday
    }
    
    def __layoutInfo_choicesession: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 25.0
    }
    public-read def choicesession: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 384.0
        layoutY: 95.0
        layoutInfo: __layoutInfo_choicesession
    }
    
    def __layoutInfo_choicehour: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 25.0
    }
    public-read def choicehour: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 291.0
        layoutY: 95.0
        layoutInfo: __layoutInfo_choicehour
    }
    
    public-read def rectPrescription: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def labelprescription: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def txtConsultationFee: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
    }
    
    public-read def lblConsultationFee: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def lblFollowup: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def txtFollowup: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
    }
    
    public-read def lblFollowupDays: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def txtFollowupDays: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
    }
    
    def __layoutInfo_panelPrescription: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelPrescription: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutInfo: __layoutInfo_panelPrescription
        content: [ rectPrescription, labelprescription, txtConsultationFee, lblConsultationFee, lblFollowup, txtFollowup, lblFollowupDays, txtFollowupDays, ]
    }
    
    public-read def lblappointment: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def lblapntemplate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtapntemplate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtapntemplate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 196.0
        layoutY: 959.0
        layoutInfo: __layoutInfo_txtapntemplate
    }
    
    public-read def panelAppointmentTemp: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ lblappointment, rectangle2, lblapntemplate, txtapntemplate, ]
    }
    
    public-read def rectSalesInvoice: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def lblSalesInvoice: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def lblAlert: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_rdoDrugInteractionAlert: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rdoDrugInteractionAlert: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutInfo: __layoutInfo_rdoDrugInteractionAlert
        text: "Radio Button"
    }
    
    public-read def panelSalesInvoice: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectSalesInvoice, lblSalesInvoice, lblAlert, rdoDrugInteractionAlert, ]
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
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
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        fill: linearGradient
        stroke: Violet
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 256.0
        layoutY: 101.0
        text: "at"
        font: Arial_12
    }
    
    public-read def rdmanualupdate: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 25.0
        layoutY: 157.0
        text: "Manual Update"
        font: Arial_12
    }
    
    public-read def rdautoupdate: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 25.0
        layoutY: 59.0
        text: "Automatic Update"
        font: Arial_12
    }
    
    public-read def rdoRemEnEmail: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 112.0
        layoutY: 170.0
        text: "Enable"
        font: Arial_12
    }
    
    public-read def rdoRemDisEmail: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 219.0
        layoutY: 170.0
        text: "Disable"
        font: Arial_12
    }
    
    public-read def rdoRemEnSMS: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 112.0
        layoutY: 85.0
        text: "Enable"
        font: Arial_12
        toggleGroup: null
    }
    
    public-read def rdoEnableAll: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 128.0
        layoutY: 45.0
        text: "Enable Alerts"
        font: Arial_12
    }
    
    public-read def rdoDisableAll: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 239.0
        layoutY: 45.0
        onMouseExited: rdoDisableAllOnMouseExited
        text: "Disable Alerts"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    def __layoutInfo_txtAlterpwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
        height: 25.0
    }
    public-read def txtAlterpwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: 284.0
        layoutY: 169.0
        layoutInfo: __layoutInfo_txtAlterpwd
        promptText: "Password"
        font: Arial_14
    }
    
    def __layoutInfo_txtAlertnateUN: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 230.0
        height: 25.0
    }
    public-read def txtAlertnateUN: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 20.0
        layoutY: 169.0
        layoutInfo: __layoutInfo_txtAlertnateUN
        promptText: "Username"
        font: Arial_14
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 19.0
        layoutY: 133.0
        text: "Alternate  Email"
        font: Arial_14
    }
    
    def __layoutInfo_pwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
        height: 25.0
    }
    public-read def pwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: 284.0
        layoutY: 80.0
        layoutInfo: __layoutInfo_pwd
        promptText: "Password"
        font: Arial_14
    }
    
    def __layoutInfo_txtusername: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 230.0
        height: 25.0
    }
    public-read def txtusername: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 20.0
        layoutY: 80.0
        layoutInfo: __layoutInfo_txtusername
        promptText: "Username"
        font: Arial_14
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind buttonLX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_button
        graphic: imageView
        text: "Apply"
        font: Arial_Bold_14
        action: buttonAction
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
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 10.0
        text: "Update"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 10.0
        layoutY: 0.0
        text: "SMS"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        managed: true
        layoutX: 10.0
        layoutY: 0.0
        text: "Reminder"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 10.0
        layoutY: 0.0
        text: "Alerts"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_labelHeader: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 25.0
    }
    public-read def labelHeader: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 25.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_labelHeader
        text: "Email"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
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
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_label4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 30.0
        height: 30.0
    }
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 940.0
        layoutY: 2.0
        layoutInfo: __layoutInfo_label4
        text: "2"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_label3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 30.0
        height: 30.0
    }
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 900.0
        layoutY: 2.0
        layoutInfo: __layoutInfo_label3
        text: "1"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def rectState2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.5
        layoutX: 940.0
        layoutY: 2.0
        fill: DarkGray
        stroke: Violet
        strokeWidth: 2.0
        width: 30.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectState1: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        layoutX: 900.0
        layoutY: 2.0
        fill: DarkGray
        stroke: Violet
        strokeWidth: 2.0
        width: 30.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectUpdateBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutY: 27.0
        fill: linearGradient
        stroke: DarkGray
        width: 500.0
        height: 200.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 47.0
        layoutY: 145.0
        text: "Service Provider"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 47.0
        layoutY: 125.0
        text: "Mobile Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle5: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutY: 28.0
        fill: linearGradient
        stroke: DarkGray
        width: 500.0
        height: 200.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 135.0
        text: "Sending  Reminders by email"
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 24.0
        layoutY: 52.0
        text: "Sending Reminders by SMS"
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def rectRemBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 27.0
        fill: linearGradient
        stroke: DarkGray
        width: 500.0
        height: 200.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 20.0
        layoutY: 44.0
        text: "Default  Email"
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def rectemailBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 28.0
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 1.0
        width: 500.0
        height: 200.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.6
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
        layoutY: 20.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Settings"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/NavigationBack.png"
    }
    
    public-read def imgBack: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind BackOpac
        cursor: javafx.scene.Cursor.HAND
        layoutX: 860.0
        layoutY: 0.0
        onMouseClicked: imgBackOnMouseClickedAtSetting2
        onMouseEntered: imgBackOnMouseEntered
        onMouseExited: imgBackOnMouseExited
        image: image
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/NavigationNext.png"
    }
    
    public-read def imgNext: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        disable: false
        opacity: bind NextOpac
        cursor: javafx.scene.Cursor.HAND
        layoutX: 975.0
        layoutY: 0.0
        onMouseClicked: imgNextOnMouseClickedAtSettings1
        onMouseEntered: imgNextOnMouseEntered
        onMouseExited: imgNextOnMouseExited
        image: image2
    }
    
    public-read def panelStateNavigation: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutY: 534.0
        content: [ rectState1, rectState2, imgNext, imgBack, label3, label4, ]
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def rectUpdateHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        fill: Gray
        stroke: DarkGray
        width: 500.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_panelUpdate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelUpdate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: -510.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_panelUpdate
        content: [ rectUpdateBg, rectUpdateHeader, label10, rdautoupdate, rdmanualupdate, label11, choiceEverday, choicesession, choicehour, ]
    }
    
    public-read def rectangle6: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        fill: Gray
        stroke: DarkGray
        width: 500.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_panelSMS: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelSMS: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 514.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_panelSMS
        content: [ rectangle5, rectangle6, label7, label9, label22, txtMobileNo, chkServiceProvider, separator9, txt160by2user, rdoway2sms, rdo160by2, pwd160by2, pwdway2sms, txtApiKey, txtApiKey2, txtway2smsuser, ]
    }
    
    public-read def rectRemHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        fill: Gray
        stroke: DarkGray
        width: 500.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_panelReminder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelReminder: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 9.0
        layoutY: 63.0
        layoutInfo: __layoutInfo_panelReminder
        content: [ rectRemHeader, rectRemBg, label19, separator6, rdoRemEnSMS, rdoRemDisSMS, rdoRemDisEmail, rdoRemEnEmail, label20, label21, txtServerAddress, txtServerPORT, ]
    }
    
    public-read def rectAlertsHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 0.0
        fill: Gray
        stroke: DarkGray
        width: 500.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_panelAlerts: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelAlerts: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: -510.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_panelAlerts
        content: [ rectAlertsHeader, label16, rdoDisableAll, rdoEnableAll, label23, chkMaintaincost, label24, ]
    }
    
    public-read def rectEmailHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 0.0
        fill: Gray
        stroke: DarkGray
        strokeWidth: 1.0
        width: 500.0
        height: 30.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_panelEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelEmail: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 10.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_panelEmail
        content: [ rectemailBg, rectEmailHeader, labelHeader, label2, txtusername, pwd, separator, label8, txtAlertnateUN, txtAlterpwd, ]
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: false
        content: [ panelEmail, panelAlerts, panelReminder, panelSMS, panelUpdate, panelPrescription, panelAppointmentTemp, panelSalesInvoice, ]
        spacing: 6.0
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutInfo: __layoutInfo_panel
        content: [ rectangle, rectHeader, label, scrollView, vbox, button, panelStateNavigation, panelAlert, ]
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroup3: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroup4: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroup5: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroup6: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def imageApply: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Apply.png"
    }
    
    public-read def toggleGroup7: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroupSMS: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def toggleGroupSalesDisc: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def ToggleRndValue: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Settings1", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.layoutX = 1.0;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = true;
                            label.layoutY = 1.0;
                            rectScrollBg.visible = true;
                            rectScrollBg.styleClass = "linear-gradient";
                            rectScrollBg.fill = linearGradient;
                            rectScrollBg.width = 924.0;
                            scrollView.visible = true;
                            scrollView.layoutY = 55.0;
                            __layoutInfo_scrollView.width = 824.0;
                            __layoutInfo_scrollView.height = 435.0;
                            scrollView.blocksMouse = false;
                            scrollView.hbarPolicy = javafx.scene.control.ScrollBarPolicy.NEVER;
                            rectemailBg.visible = false;
                            rectEmailHeader.layoutY = 25.0;
                            rectEmailHeader.stroke = Gray;
                            rectEmailHeader.width = 774.0;
                            rectEmailHeader.height = 1.0;
                            labelHeader.textFill = Green;
                            txtusername.onKeyPressed = txtusernameOnKeyPressedAtSettings1;
                            pwd.layoutX = 20.0;
                            pwd.layoutY = 111.0;
                            __layoutInfo_pwd.width = 225.0;
                            pwd.onKeyPressed = pwdOnKeyPressedAtSettings1;
                            pwd.blocksMouse = true;
                            __layoutInfo_separator.width = 750.0;
                            separator.blocksMouse = false;
                            label8.layoutX = 449.0;
                            label8.layoutY = 44.0;
                            txtAlertnateUN.layoutX = 437.0;
                            txtAlertnateUN.layoutY = 80.0;
                            txtAlertnateUN.onKeyPressed = txtAlertnateUNOnKeyPressedAtSettings1;
                            txtAlertnateUN.blocksMouse = true;
                            txtAlterpwd.layoutX = 437.0;
                            txtAlterpwd.layoutY = 111.0;
                            __layoutInfo_txtAlterpwd.width = 230.0;
                            txtAlterpwd.onKeyPressed = txtAlterpwdOnKeyPressedAtSettings1;
                            txtAlterpwd.blocksMouse = true;
                            panelEmail.visible = true;
                            panelEmail.layoutX = 514.0;
                            panelEmail.layoutY = 60.0;
                            __layoutInfo_panelEmail.height = 180.0;
                            rectAlertsHeader.opacity = 1.0;
                            rectAlertsHeader.layoutY = 25.0;
                            rectAlertsHeader.stroke = Gray;
                            rectAlertsHeader.width = 774.0;
                            rectAlertsHeader.height = 1.0;
                            label16.text = "Maintanance Cost Alerts";
                            label16.textFill = Green;
                            rdoDisableAll.layoutX = 400.0;
                            rdoDisableAll.layoutY = 40.0;
                            rdoDisableAll.onMouseClicked = rdoDisableAllOnMouseClickedAtSettings1;
                            rdoDisableAll.blocksMouse = false;
                            rdoDisableAll.text = "Disable";
                            rdoDisableAll.font = Arial_12;
                            rdoDisableAll.toggleGroup = toggleGroup;
                            rdoEnableAll.layoutX = 240.0;
                            rdoEnableAll.blocksMouse = false;
                            rdoEnableAll.text = "Enable ";
                            rdoEnableAll.font = Arial_12;
                            rdoEnableAll.toggleGroup = toggleGroup;
                            label23.visible = true;
                            label23.text = "Alert me before";
                            label23.font = Arial_12;
                            chkMaintaincost.visible = true;
                            chkMaintaincost.layoutX = 319.0;
                            chkMaintaincost.layoutY = 110.0;
                            __layoutInfo_chkMaintaincost.width = 60.0;
                            chkMaintaincost.blocksMouse = false;
                            label24.visible = true;
                            label24.layoutX = 390.0;
                            label24.layoutY = 116.0;
                            label24.text = "days";
                            label24.font = Arial_12;
                            panelAlerts.visible = true;
                            panelAlerts.layoutX = 0.0;
                            panelAlerts.layoutY = 0.0;
                            __layoutInfo_panelAlerts.height = 160.0;
                            rectRemHeader.layoutY = 25.0;
                            rectRemHeader.stroke = Gray;
                            rectRemHeader.width = 774.0;
                            rectRemHeader.height = 1.0;
                            rectRemBg.visible = false;
                            label19.text = "Server Settings";
                            label19.textFill = Green;
                            separator6.layoutX = 359.0;
                            separator6.layoutY = 60.0;
                            __layoutInfo_separator6.width = 12.0;
                            __layoutInfo_separator6.height = 75.0;
                            separator6.blocksMouse = false;
                            separator6.vertical = true;
                            rdoRemEnSMS.visible = false;
                            rdoRemEnSMS.managed = false;
                            rdoRemEnSMS.layoutX = 131.0;
                            rdoRemEnSMS.layoutY = 83.0;
                            rdoRemEnSMS.blocksMouse = false;
                            rdoRemEnSMS.toggleGroup = toggleGroup4;
                            rdoRemEnSMS.selected = true;
                            rdoRemDisSMS.visible = false;
                            rdoRemDisSMS.layoutX = 232.0;
                            rdoRemDisSMS.layoutY = 83.0;
                            rdoRemDisSMS.blocksMouse = false;
                            rdoRemDisSMS.font = Arial_12;
                            rdoRemDisSMS.toggleGroup = toggleGroup4;
                            rdoRemDisEmail.visible = false;
                            rdoRemDisEmail.layoutX = 597.0;
                            rdoRemDisEmail.layoutY = 83.0;
                            rdoRemDisEmail.blocksMouse = false;
                            rdoRemDisEmail.toggleGroup = toggleGroup5;
                            rdoRemEnEmail.visible = false;
                            rdoRemEnEmail.layoutX = 518.0;
                            rdoRemEnEmail.layoutY = 83.0;
                            rdoRemEnEmail.blocksMouse = false;
                            rdoRemEnEmail.toggleGroup = toggleGroup5;
                            label20.text = "Server Address";
                            label21.layoutX = 422.0;
                            label21.layoutY = 49.0;
                            label21.text = "Server PORT";
                            txtServerAddress.visible = true;
                            txtServerAddress.layoutX = 120.0;
                            txtServerAddress.layoutY = 90.0;
                            __layoutInfo_txtServerAddress.width = 200.0;
                            __layoutInfo_txtServerAddress.height = 25.0;
                            txtServerAddress.blocksMouse = false;
                            txtServerAddress.editable = false;
                            txtServerPORT.visible = true;
                            txtServerPORT.layoutX = 510.0;
                            txtServerPORT.layoutY = 90.0;
                            __layoutInfo_txtServerPORT.width = 200.0;
                            __layoutInfo_txtServerPORT.height = 25.0;
                            txtServerPORT.blocksMouse = false;
                            panelReminder.visible = true;
                            panelReminder.layoutY = 790.0;
                            __layoutInfo_panelReminder.height = 120.0;
                            rectangle5.visible = false;
                            rectangle6.layoutY = 25.0;
                            rectangle6.stroke = Gray;
                            rectangle6.width = 774.0;
                            rectangle6.height = 1.0;
                            label7.textFill = Green;
                            label9.layoutX = 396.0;
                            label9.layoutY = 45.0;
                            label9.text = "Vanuston SMS Server 2";
                            label22.visible = true;
                            label22.layoutX = 25.0;
                            label22.layoutY = 45.0;
                            label22.text = "Vanuston SMS Server 1";
                            txtMobileNo.visible = false;
                            txtMobileNo.layoutX = 37.0;
                            txtMobileNo.layoutY = 73.0;
                            txtMobileNo.blocksMouse = false;
                            txtMobileNo.font = Arial_14;
                            chkServiceProvider.visible = false;
                            chkServiceProvider.layoutX = 134.0;
                            chkServiceProvider.layoutY = 66.0;
                            __layoutInfo_chkServiceProvider.width = 197.0;
                            chkServiceProvider.blocksMouse = false;
                            separator9.visible = true;
                            separator9.layoutX = 360.0;
                            separator9.layoutY = 55.0;
                            __layoutInfo_separator9.width = 12.0;
                            __layoutInfo_separator9.height = 80.0;
                            separator9.blocksMouse = false;
                            separator9.vertical = true;
                            txt160by2user.visible = true;
                            txt160by2user.layoutX = 397.0;
                            txt160by2user.layoutY = 73.0;
                            __layoutInfo_txt160by2user.width = 250.0;
                            __layoutInfo_txt160by2user.height = 25.0;
                            txt160by2user.onKeyPressed = txt160by2userOnKeyPressedAtSettings1;
                            txt160by2user.blocksMouse = true;
                            txt160by2user.promptText = "Username";
                            txt160by2user.font = Arial_14;
                            rdoway2sms.visible = true;
                            rdoway2sms.layoutX = 116.0;
                            rdoway2sms.layoutY = 165.0;
                            rdoway2sms.blocksMouse = false;
                            rdoway2sms.text = "Set Vanuston SMS Server 1 as Default";
                            rdoway2sms.font = Arial_12;
                            rdoway2sms.toggleGroup = toggleGroupSMS;
                            rdo160by2.visible = true;
                            rdo160by2.layoutX = 506.0;
                            rdo160by2.layoutY = 165.0;
                            rdo160by2.blocksMouse = false;
                            rdo160by2.text = "Set Vanuston SMS Server 2 as Default";
                            rdo160by2.font = Arial_12;
                            rdo160by2.toggleGroup = toggleGroupSMS;
                            pwd160by2.visible = true;
                            pwd160by2.layoutX = 397.0;
                            pwd160by2.layoutY = 104.0;
                            __layoutInfo_pwd160by2.width = 250.0;
                            __layoutInfo_pwd160by2.height = 25.0;
                            pwd160by2.onKeyPressed = pwd160by2OnKeyPressedAtSettings1;
                            pwd160by2.blocksMouse = true;
                            pwd160by2.promptText = "Password";
                            pwd160by2.font = Arial_14;
                            pwdway2sms.visible = true;
                            pwdway2sms.layoutX = 37.0;
                            pwdway2sms.layoutY = 104.0;
                            __layoutInfo_pwdway2sms.width = 250.0;
                            __layoutInfo_pwdway2sms.height = 25.0;
                            pwdway2sms.blocksMouse = true;
                            pwdway2sms.promptText = "Password";
                            pwdway2sms.font = Arial_14;
                            txtApiKey.visible = true;
                            txtApiKey.layoutX = 37.0;
                            txtApiKey.layoutY = 134.0;
                            __layoutInfo_txtApiKey.width = 250.0;
                            __layoutInfo_txtApiKey.height = 25.0;
                            txtApiKey.promptText = "API Key";
                            txtApiKey.font = Arial_14;
                            txtApiKey2.visible = true;
                            txtApiKey2.layoutX = 397.0;
                            txtApiKey2.layoutY = 134.0;
                            __layoutInfo_txtApiKey2.width = 250.0;
                            __layoutInfo_txtApiKey2.height = 25.0;
                            txtApiKey2.promptText = "API Key";
                            txtApiKey2.font = Arial_14;
                            txtway2smsuser.visible = true;
                            txtway2smsuser.layoutX = 37.0;
                            txtway2smsuser.layoutY = 73.0;
                            __layoutInfo_txtway2smsuser.width = 250.0;
                            __layoutInfo_txtway2smsuser.height = 25.0;
                            txtway2smsuser.blocksMouse = true;
                            txtway2smsuser.promptText = "Username";
                            txtway2smsuser.font = Arial_14;
                            panelSMS.visible = true;
                            panelSMS.layoutX = 0.0;
                            panelSMS.layoutY = 950.0;
                            __layoutInfo_panelSMS.width = 0.0;
                            __layoutInfo_panelSMS.height = 200.0;
                            rectUpdateBg.visible = false;
                            rectUpdateBg.width = 100.0;
                            rectUpdateBg.height = 120.0;
                            rectUpdateHeader.layoutY = 25.0;
                            rectUpdateHeader.stroke = Gray;
                            rectUpdateHeader.width = 774.0;
                            rectUpdateHeader.height = 1.0;
                            label10.textFill = Green;
                            rdautoupdate.blocksMouse = false;
                            rdautoupdate.toggleGroup = toggleGroup6;
                            rdmanualupdate.layoutX = 580.0;
                            rdmanualupdate.layoutY = 59.0;
                            rdmanualupdate.blocksMouse = false;
                            rdmanualupdate.toggleGroup = toggleGroup6;
                            choiceEverday.blocksMouse = false;
                            choicesession.blocksMouse = false;
                            choicehour.blocksMouse = false;
                            panelUpdate.visible = true;
                            panelUpdate.layoutX = 0.0;
                            panelUpdate.layoutY = 1085.0;
                            __layoutInfo_panelUpdate.height = 150.0;
                            rectPrescription.visible = true;
                            rectPrescription.layoutY = 25.0;
                            rectPrescription.fill = Gray;
                            rectPrescription.stroke = Gray;
                            rectPrescription.width = 774.0;
                            rectPrescription.height = 1.0;
                            rectPrescription.arcWidth = 5.0;
                            rectPrescription.arcHeight = 5.0;
                            labelprescription.visible = true;
                            labelprescription.layoutX = 10.0;
                            labelprescription.text = "Prescription Fees Settings";
                            labelprescription.font = Arial_18;
                            labelprescription.textFill = Green;
                            txtConsultationFee.visible = true;
                            txtConsultationFee.layoutX = 150.0;
                            txtConsultationFee.layoutY = 50.0;
                            txtConsultationFee.font = Arial_12;
                            lblConsultationFee.visible = true;
                            lblConsultationFee.layoutX = 25.0;
                            lblConsultationFee.layoutY = 50.0;
                            lblConsultationFee.text = "Consultation Fees";
                            lblConsultationFee.font = Arial_12;
                            lblFollowup.visible = true;
                            lblFollowup.layoutX = 260.0;
                            lblFollowup.layoutY = 50.0;
                            lblFollowup.text = "Followup Visit Fees";
                            lblFollowup.font = Arial_12;
                            txtFollowup.visible = true;
                            txtFollowup.layoutX = 400.0;
                            txtFollowup.layoutY = 50.0;
                            txtFollowup.font = Arial_12;
                            lblFollowupDays.visible = true;
                            lblFollowupDays.layoutX = 520.0;
                            lblFollowupDays.layoutY = 50.0;
                            lblFollowupDays.text = "Followup Days";
                            lblFollowupDays.font = Arial_12;
                            txtFollowupDays.visible = true;
                            txtFollowupDays.layoutX = 620.0;
                            txtFollowupDays.layoutY = 50.0;
                            txtFollowupDays.font = Arial_12;
                            panelPrescription.visible = true;
                            panelPrescription.layoutX = 0.0;
                            panelPrescription.layoutY = 800.0;
                            __layoutInfo_panelPrescription.height = 110.0;
                            lblappointment.visible = true;
                            lblappointment.layoutX = 10.0;
                            lblappointment.text = "Appointment SMS Template";
                            lblappointment.font = Arial_18;
                            lblappointment.textFill = Green;
                            rectangle2.visible = true;
                            rectangle2.layoutY = 25.0;
                            rectangle2.fill = Gray;
                            rectangle2.stroke = Gray;
                            rectangle2.width = 774.0;
                            rectangle2.height = 1.0;
                            lblapntemplate.visible = true;
                            lblapntemplate.layoutX = 25.0;
                            lblapntemplate.layoutY = 45.0;
                            lblapntemplate.text = "  Appointment Template";
                            lblapntemplate.font = Arial_12;
                            txtapntemplate.visible = true;
                            txtapntemplate.layoutY = 45.0;
                            __layoutInfo_txtapntemplate.width = 450.0;
                            txtapntemplate.font = Arial_12;
                            panelAppointmentTemp.visible = true;
                            rectSalesInvoice.visible = true;
                            rectSalesInvoice.layoutY = 85.0;
                            rectSalesInvoice.fill = Gray;
                            rectSalesInvoice.stroke = Gray;
                            rectSalesInvoice.width = 774.0;
                            rectSalesInvoice.height = 1.0;
                            rectSalesInvoice.arcWidth = 5.0;
                            rectSalesInvoice.arcHeight = 5.0;
                            lblSalesInvoice.visible = true;
                            lblSalesInvoice.layoutX = 10.0;
                            lblSalesInvoice.layoutY = 60.0;
                            lblSalesInvoice.text = "Sales Invoice Settings";
                            lblSalesInvoice.font = Arial_18;
                            lblSalesInvoice.textFill = Green;
                            lblAlert.visible = true;
                            lblAlert.layoutX = 25.0;
                            lblAlert.layoutY = 95.0;
                            lblAlert.text = "Select the option that you need in Sales Invoice ?";
                            lblAlert.font = Arial_12;
                            rdoDrugInteractionAlert.visible = true;
                            rdoDrugInteractionAlert.layoutX = 220.0;
                            rdoDrugInteractionAlert.layoutY = 115.0;
                            __layoutInfo_rdoDrugInteractionAlert.width = 170.0;
                            rdoDrugInteractionAlert.text = "Drug-Drug Interaction Alert";
                            rdoDrugInteractionAlert.font = Arial_12;
                            rdoDrugInteractionAlert.toggleGroup = toggleGroupSalesDisc;
                            panelSalesInvoice.visible = false;
                            panelSalesInvoice.disable = true;
                            vbox.visible = true;
                            vbox.layoutX = 20.0;
                            vbox.spacing = 0.0;
                            imageView.visible = true;
                            imageView.image = imageApply;
                            button.visible = true;
                            button.effect = reflectionEffect;
                            panelStateNavigation.visible = false;
                            panelAlert.visible = true;
                            panel.visible = true;
                            __layoutInfo_panel.height = 1600.0;
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

  function pwd160by2OnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            rdautoupdate.requestFocus();
        }
    }

    function txt160by2userOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            pwd160by2.requestFocus();
        }
    }

    function pwdway2smsOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txt160by2user.requestFocus();
        }
    }

    function txtway2smsuserOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            pwdway2sms.requestFocus();
        }
    }

    function txtAlterpwdOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
         //   txtLoyal1.requestFocus();
        }
    }

    function txtAlertnateUNOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtAlterpwd.requestFocus();
        }
    }

    function pwdOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtAlertnateUN.requestFocus();
        }
    }

    function txtusernameOnKeyPressedAtSettings1(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            pwd.requestFocus();
        }
    }

    var panelW = bind CommonDeclare.ScreenWidth - 4;
    var panelH = bind CommonDeclare.panelFormH;
    var scrollLX = bind (panelW - 824) / 2;
    var buttonLX = bind CommonDeclare.botton12LX;
    var buttonLY = bind CommonDeclare.panelButtonsLY;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Settings", type);
        showAlertbox();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Settings", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Settings", msg);
        showAlertbox();
        err_txtbox.requestFocus();
    }

   
    function rdoDisableAllOnMouseClickedAtSettings1(event: javafx.scene.input.MouseEvent): Void {
        if (rdoDisableAll.selected == true) {
        }
    }

 
    function rdoDisableAllOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (rdoDisableAll.selected == true) {
        }
    }
                                    
    function Validate () : Boolean {
       var serverPort : Integer = 30602;
       var serverHostIP: String = "" ;
        var val = new Validation();
        var valid : Boolean = false ;
        var portNoVal : Integer = val.getNumberValid(txtServerPORT.rawText, 4, 5) ;
        var ipVal : Integer = 10;
        try {
            if (txtServerAddress.rawText.length() <= 0) {
                FXinfo ("Please Enter Server Address",txtServerAddress) ;
            } else if (ipVal != 10 ) {
                FXinfo ("Please Enter Valid IP for Server Address",txtServerAddress) ;
            } else if (txtServerPORT.rawText.length() <= 0) {
                FXinfo ("Please Enter Port Address") ;
                txtServerPORT.requestFocus();
            } else if (portNoVal == 0) {
                FXinfo ("Server Port can contain only Numbers") ;
                txtServerPORT.requestFocus();
            } else if (portNoVal == 1) {
                FXinfo ("Server Port Cannot Exceed More Than 5 digits") ;
                txtServerPORT.requestFocus();
            } else if (portNoVal == 11) {
                FXinfo ("Server Port can contain minimum of 4 digits") ;
                txtServerPORT.requestFocus();
            } else if ( (serverPort = Integer.parseInt (txtServerPORT.rawText)) <= 1024) {
                FXinfo ("Server Port can contain only Numbers above 1024") ;
            } else {
                valid = true ;

            }
        } catch (ne : java.lang.NumberFormatException) {
            log.debug("Please Enter valid Numbers for Port Address") ;
        }
        return valid ;
    }

    function prescriptionValidate () : Boolean {
        var valid : Boolean = false ;
        var validation:Validation = new Validation();
        if(txtConsultationFee.rawText.trim()!="" and validation.getDecimalValid(txtConsultationFee.rawText.trim(),0,6)!=10) {
            FXinfo ("The value in consultation fee is invalid") ;
            txtConsultationFee.requestFocus();
        }
        else if(txtFollowup.rawText.trim()!="" and validation.getDecimalValid(txtFollowup.rawText.trim(),0,6)!=10) {
            FXinfo ("The value in Followup fee is invalid") ;
            txtFollowup.requestFocus();
        }
        else if(txtFollowupDays.rawText.trim()!="" and validation.getNumberValid(txtFollowupDays.rawText.trim(),0,6)!=10) {
            FXinfo ("The value in Followup days is invalid") ;
            txtFollowupDays.requestFocus();
        }
        else {
            valid=true;
        }
        return valid;

    }


    public function setPrescriptionSettings(settingsSaveModel:SettingsModel) : Void {
         if(txtConsultationFee.rawText.trim()!=""){
            settingsSaveModel.setConsultationFee(Double.parseDouble(txtConsultationFee.rawText.trim()));
         }
         else {
            settingsSaveModel.setConsultationFee(Double.parseDouble("0.00"));
         }
         if(txtFollowup.rawText.trim()!="") {
            settingsSaveModel.setFollowupVisitFee(Double.parseDouble(txtFollowup.rawText.trim()));
         }
         else {
            settingsSaveModel.setFollowupVisitFee(Double.parseDouble("0.00"));
         }
         if(txtFollowupDays.rawText.trim()!="") {
            settingsSaveModel.setFollowupDays(Integer.parseInt(txtFollowupDays.rawText.trim()));
         }
         else {
            settingsSaveModel.setFollowupDays(0);
         }
    }


    function buttonAction(): Void {
        try {
            settingsController =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            var settingsSaveModel = new SettingsModel();
        
            settingsSaveModel.setReminder_sms("0"); if (rdoRemEnSMS.selected) { settingsSaveModel.setReminder_sms("1"); }
            settingsSaveModel.setReminder_email("0"); if (rdoRemEnEmail.selected) { settingsSaveModel.setReminder_email("1"); }
            settingsSaveModel.setUpdateAutomatic("0");
            settingsSaveModel.setUpdateManual("0");
            settingsSaveModel.setUpdateDay("0");
            settingsSaveModel.setUpdateTime("0");
            settingsSaveModel.setUpdateSession("0");
            
            if (rdmanualupdate.selected == true) {
                settingsSaveModel.setUpdateAutomatic("0");
                settingsSaveModel.setUpdateManual("1");
                settingsSaveModel.setUpdateDay(String.valueOf(choiceEverday.selectedItem));
                settingsSaveModel.setUpdateTime(String.valueOf(choicehour.selectedItem));
                settingsSaveModel.setUpdateSession(String.valueOf(choicesession.selectedItem));
            } else {
                settingsSaveModel.setUpdateAutomatic("1");
                settingsSaveModel.setUpdateManual("0");
                settingsSaveModel.setUpdateDay("0");
                settingsSaveModel.setUpdateTime("0");
                settingsSaveModel.setUpdateSession("0");
            }
            settingsSaveModel.setEmial_user_name(txtusername.rawText.trim());
            //println("txtusername.rawText:{txtusername.rawText.trim()}");
            settingsSaveModel.setEmail_user_password(pwd.rawText.trim());
            settingsSaveModel.setSms_mobile_no(txtMobileNo.rawText.trim());
            settingsSaveModel.setAlternateUserName(txtAlertnateUN.rawText.trim());
            settingsSaveModel.setAlternatePassword(txtAlterpwd.text.trim());
            settingsSaveModel.setWays2smsUserName(txtway2smsuser.rawText);
            settingsSaveModel.setWay2smsPassword(pwdway2sms.rawText);
            settingsSaveModel.setSmsGateway1api(txtApiKey.rawText.trim());
            settingsSaveModel.setSmsGateway2api(txtApiKey2.rawText.trim());
            settingsSaveModel.setOne60UserName(txt160by2user.rawText);
            settingsSaveModel.setOne160Password(pwd160by2.rawText);
            settingsSaveModel.setDefault_sms_gw("0");
            if (rdo160by2.selected == true) {
                settingsSaveModel.setDefault_sms_gw("1");
            }
            var val: Validation = new Validation();
            settingsSaveModel.setMaintenance_cost_alert("0");
            settingsSaveModel.setMaintenance_cost_days("0");
            
            if (rdoEnableAll.selected == true) {
                settingsSaveModel.setMaintenance_cost_alert("1");
                settingsSaveModel.setMaintenance_cost_days(String.valueOf(chkMaintaincost.selectedItem.toString()));
            }
            if (settingsSaveModel.getMaintenance_cost_days() == null or settingsSaveModel.getMaintenance_cost_days() == "" or settingsSaveModel.getMaintenance_cost_days().trim().length() == 0) {
                settingsSaveModel.setMaintenance_cost_days("0");
            }
            if (settingsSaveModel.getEmial_user_name() == null or settingsSaveModel.getEmial_user_name() == "" or settingsSaveModel.getEmial_user_name().trim().length() < 10) {
                FXinfo("Email ID cannot be empty or less than 10 characters");
                txtusername.requestFocus();
            } else if (val.getEmailIdValid(settingsSaveModel.getEmial_user_name(), 0, 40) != 10) {
                FXinfo("Please enter valid Email ID", txtusername);
            } else if (settingsSaveModel.getEmail_user_password() == null or settingsSaveModel.getEmail_user_password() == "") {
                FXinfo("Please Enter Password ");
                pwd.requestFocus();
            } else if (settingsSaveModel.getAlternateUserName() != null and settingsSaveModel.getAlternateUserName().trim().length() > 0 and settingsSaveModel.getAlternateUserName().trim().length() < 10) {
                FXinfo("Please Enter Valid Alternate Email ID ", txtAlertnateUN);
            } else if (settingsSaveModel.getAlternateUserName() != null and settingsSaveModel.getAlternateUserName().trim().length() > 0 and val.getEmailIdValid(settingsSaveModel.getAlternateUserName(), 0, 40) != 10) {
                FXinfo("Email ID cannot be empty or less than 10 characters", txtAlertnateUN);
            } else if (settingsSaveModel.getAlternateUserName() != null and settingsSaveModel.getAlternateUserName().trim().length() > 0 and (settingsSaveModel.getAlternatePassword() == null or settingsSaveModel.getAlternatePassword().trim().length() <= 0 or settingsSaveModel.getAlternatePassword() == "null")) {
                FXinfo("Please Enter Valid Alternate Password ");
                txtAlterpwd.requestFocus();
            } else if(not prescriptionValidate()) {

            }
                else if(not Validate ()){
            } else {
             setPrescriptionSettings(settingsSaveModel);
             LoadappointmentTemplate(settingsSaveModel);
             settingsSaveModel.setServerAddress(txtServerAddress.rawText.trim());
             settingsSaveModel.setServerPort(txtServerPORT.rawText.trim());
             settingsSaveModel.setAppointmentTemplate(txtapntemplate.rawText.trim());
                var returnObject = new Object();
                returnObject = settingsController.createRecord(settingsSaveModel); // controller call                
                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as MsgReturnModel;
                if (msgReturnModel.getReturnMessage() == "0") {
                    if(serverPort==Integer.parseInt(txtServerPORT.rawText.trim())){
                    FXalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                    }else{
                          var a =bind Alert.confirm("Medeil Settings has been changed.Restart Medeil Application Again");
                            if(a){
                            javafx.lang.FX.exit();
                            }
                            else {
                                 javafx.lang.FX.exit();
                            }
                    }
                  
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }

            }
        } catch (e: Exception) {
            var msg: String = "Class : Settings  Method : buttonAction()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function imgBackOnMouseClickedAtSetting2(event: javafx.scene.input.MouseEvent): Void {
        try {
            currentState.actual = currentState.findIndex("Settings1");
        } catch (e) {
            var msg: String = "Class : Settings  Method : buttonAction()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function imgNextOnMouseClickedAtSettings1(event: javafx.scene.input.MouseEvent): Void {

    }

    function imgNextOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeNextOpac.rate = -1.0;
        fadeNextOpac.play();
    }

    function imgNextOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeNextOpac.rate = 1.0;
        fadeNextOpac.play();
    }

    function imgBackOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeBackOpac.rate = -1.0;
        fadeBackOpac.play();
    }

    function imgBackOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeBackOpac.rate = 1.0;
        fadeBackOpac.play();
    }

    var fadeBackOpac = Timeline {
                keyFrames: [
                    at (0s) {BackOpac => 0.5 tween Interpolator.LINEAR},
                    at (0.2s) {BackOpac => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var fadeNextOpac = Timeline {
                keyFrames: [
                    at (0s) {NextOpac => 0.5 tween Interpolator.LINEAR},
                    at (0.2s) {NextOpac => 1.0 tween Interpolator.LINEAR},
                ]
            };

    
    function loadMaintenanceCostValues(setModel: SettingsModel): Void {
        try {
            var maintain_cost_days: String = setModel.getMaintenance_cost_days();
            var maintain_cost_alert: String = setModel.getMaintenance_cost_alert();
            if (maintain_cost_alert == "0" or maintain_cost_alert == "") {
                rdoEnableAll.selected = false;
                rdoDisableAll.selected = true;
                chkMaintaincost.items = ["", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31",];
            } else {
                rdoEnableAll.selected = true;
                rdoDisableAll.selected = false;
                chkMaintaincost.items = [maintain_cost_days, "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31",];
            }
            chkMaintaincost.select(0);
        } catch (e: Exception) {
            var msg: String = "Class : Settings  Method : btnNextButton()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function loadDefaultValues(setModel: SettingsModel): Void {
        try {
            var uopdate_automatic: String = setModel.getUpdateAutomatic();
            var updateday: String = setModel.getUpdateDay();
            var updatetime: String = setModel.getUpdateTime();
            var updatesession: String = setModel.getUpdateSession();
            var day: String[] = null;
            var sess: String[] = null;
            var tim: String[] = null;
            uopdate_automatic = uopdate_automatic.trim();
            if (uopdate_automatic == "1") {
                rdmanualupdate.selected = true;
                rdautoupdate.selected = false;
                day = [updateday, 'EveryDay', 'Every Monday', 'Every Tuesday', 'Every Wednesday', 'Every Thursday', 'Every friday', 'Every Saturday', 'Every Sunday'];
                tim = [updatetime, '1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00'];
                sess = [updatesession, 'AM', 'PM'];
            } else {
                rdautoupdate.selected = true;
                rdmanualupdate.selected = false;
                day = null;
                day = ['EveryDay', 'Every Monday', 'Every Tuesday', 'Every Wednesday', 'Every Thursday', 'Every friday', 'Every Saturday', 'Every Sunday'];
                tim = null;
                tim = ['1:00', '2:00', '3:00', '4:00', '5:00', '6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00'];
                sess = null;
                sess = ['AM', 'PM'];
            }
            choiceEverday.items = day;
            choicesession.items = sess;
            choicehour.items = tim;
            choiceEverday.select(0);
            choicehour.select(0);
            choicesession.select(0);
            txtConsultationFee.text = setModel.getConsultationFee().toString();
            txtFollowup.text = setModel.getFollowupVisitFee().toString();
            txtFollowupDays.text = setModel.getFollowupDays().toString();
        } catch (e: Exception) {
            var msg: String = "Class : Settings  Method : buttonAction()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function SettingSMSValues(setModel: SettingsModel): Void {
        var sar = 0;
        try {
            chkServiceProvider.items = null;
            txtway2smsuser.text = setModel.getWays2smsUserName();
            pwdway2sms.text = setModel.getWay2smsPassword();
            txtApiKey.text = setModel.getSmsGateway1api();
            txt160by2user.text = setModel.getOne60UserName();
            pwd160by2.text = setModel.getOne160Password();
            txtApiKey2.text = setModel.getSmsGateway2api();
            txtusername.text = setModel.getEmial_user_name();
            //println("txtusername.Text:{txtusername.text}");
            pwd.text = setModel.getEmail_user_password();
            txtMobileNo.text = setModel.getSms_mobile_no();
            txtAlertnateUN.text = setModel.getAlternateUserName();
            txtAlterpwd.text = setModel.getAlternatePassword();
            sar = Integer.parseInt(setModel.getDefault_sms_gw());
            if (sar == 0) {
                rdoway2sms.selected = true;
            } else {
                rdo160by2.selected = true;
            }
        } catch (e: Exception) {
            java.lang.System.out.println("Exception in general smsm {e}");
        }
    }

   function LoadappointmentTemplate(setModel: SettingsModel): Void {

        try {
            if(setModel.getAppointmentTemplate() != null)
            {
            txtapntemplate.text = setModel.getAppointmentTemplate();
            }
            else{
                 txtapntemplate.text = "";
            }

        } catch (e: Exception) {

            log.debug("Exception class: Setting Method : LoadappointmentTemplate Exception : {e}" );
        }
    }

    function SettingReminderValues(setModel: SettingsModel): Void {
        try {
            var email: String = setModel.getReminder_email();
            var sms: String = setModel.getReminder_sms();
            if (sms == "1") {
                rdoRemEnSMS.selected = true;
                rdoRemDisSMS.selected = false;
            } else {
                rdoRemDisSMS.selected = true;
            }
            if (email == "1") {
                rdoRemEnEmail.selected = true;
            } else {
                rdoRemDisEmail.selected = true;
            }


            txtServerAddress.text= RegistryFactory.serverHostIP;  //setModel.getServerAddress();            
            txtServerPORT.text = RegistryFactory.serverPort.toString();
            log.debug("server addrsss=  {RegistryFactory.serverHostIP}");
           // txtServerPORT.text=setModel.getServerPort();
            serverPort=Integer.parseInt(setModel.getServerPort());            
        } catch (e: Exception) {
            var msg: String = "Class : Settings  Method : buttonAction()   = {e.getMessage()}";
            log.debug(msg);
        }
    }
        


    public function Startup(): Void {
        panel.content = [rectangle, rectHeader, label, scrollView, button, vbox, panelAlert];
        scrollView.node = Group { content: [rectScrollBg, vbox] };

        try {
            settingsController =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            var settingsModel = settingsController.displaySettingValues();// Controller Call
            loadDefaultValues(settingsModel);
            SettingSMSValues(settingsModel);          
            loadMaintenanceCostValues(settingsModel);
            SettingReminderValues(settingsModel);
            LoadappointmentTemplate(settingsModel);
            setPrescriptionSettings(settingsModel);
           
        } catch (e: Exception) {
            var msg: String = "Class : Settings  Method : buttonAction()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

}

