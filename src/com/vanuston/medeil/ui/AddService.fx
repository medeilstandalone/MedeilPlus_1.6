package com.vanuston.medeil.ui;

import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import java.lang.Exception;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.lang.System;

public class AddService {

    var log: Logger = Logger.getLogger(AddService.class, "Utilities");
    public var formulation = "";
    def CustomAlert = CustomAlert {};
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_txtFormulation: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def txtFormulation: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 187.0
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtFormulation
        onKeyPressed: txtFormulationOnKeyPressed
    }
    
    public-read def vbox2: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 130.0
        layoutY: 60.0
        content: [ txtFormulation, ]
        spacing: 20.0
    }
    
    def __layoutInfo_textbox: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def textbox: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutInfo: __layoutInfo_textbox
        onKeyPressed: textboxOnKeyPressed
    }
    
    public-read def vbox5: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 130.0
        layoutY: 90.0
        content: [ textbox, ]
        spacing: 20.0
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 60.0
        layoutY: 210.0
        spacing: 6.0
    }
    
    def __layoutInfo_txtcategory: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def txtcategory: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutInfo: __layoutInfo_txtcategory
    }
    
    public-read def vbox8: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 130.0
        layoutY: 3.0
        content: [ txtcategory, ]
        spacing: 20.0
    }
    
    def __layoutInfo_gsttxtbox: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def gsttxtbox: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutInfo: __layoutInfo_gsttxtbox
        text: ""
    }
    
    public-read def vbox11: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 130.0
        layoutY: 120.0
        content: [ gsttxtbox, ]
        spacing: 20.0
    }
    
    def __layoutInfo_textsubctg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
    }
    public-read def textsubctg: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutInfo: __layoutInfo_textsubctg
    }
    
    public-read def vbox13: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 130.0
        layoutY: 30.0
        content: [ textsubctg, ]
        spacing: 6.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelLX
        layoutY: bind panelLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 12.0
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
    
    def __layoutInfo_label11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
        height: 26.0
    }
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label11
        text: "Add Service"
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
    
    def __layoutInfo_button2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 30.0
    }
    public-read def button2: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 100.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_button2
        effect: reflectionEffect
        text: "Cancel"
        font: Arial_Bold_14
        action: button2Action
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 30.0
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutInfo: __layoutInfo_button
        onKeyPressed: buttonOnKeyPressed
        effect: reflectionEffect
        text: "Save"
        font: Arial_Bold_14
        action: buttonAction
    }
    
    public-read def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 120.0
        layoutY: 160.0
        content: [ button, button2, ]
        spacing: 6.0
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
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
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def vbox14: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 112.0
        layoutY: 30.0
        content: [ label8, ]
        spacing: 18.0
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Sub category"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox12: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 30.0
        layoutY: 30.0
        content: [ label7, ]
        spacing: 20.0
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def vbox10: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 112.0
        layoutY: 120.0
        content: [ label6, ]
        spacing: 18.0
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "GST %"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox9: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 30.0
        layoutY: 120.0
        content: [ label5, ]
        spacing: 20.0
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox7: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 112.0
        layoutY: 3.0
        content: [ label4, ]
        spacing: 18.0
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Category"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox6: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 30.0
        layoutY: 3.0
        content: [ label3, ]
        spacing: 20.0
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def vbox4: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 112.0
        layoutY: 90.0
        content: [ label2, ]
        spacing: 18.0
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Amount"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox3: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 30.0
        layoutY: 90.0
        content: [ label, ]
        spacing: 20.0
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def vbox1: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 112.0
        layoutY: 60.0
        content: [ label20, ]
        spacing: 18.0
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        text: "Service"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 30.0
        layoutY: 60.0
        content: [ label9, ]
        spacing: 20.0
    }
    
    public-read def panelLicenceInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 0.0
        layoutY: 30.0
        content: [ vbox, vbox1, vbox2, vbox3, vbox4, vbox5, hbox, hbox2, vbox6, vbox7, vbox8, vbox9, vbox10, vbox11, vbox12, vbox13, vbox14, ]
    }
    
    public-read def RectTitle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        cursor: javafx.scene.Cursor.MOVE
        layoutX: 0.0
        layoutY: 0.0
        styleClass: ""
        onMouseDragged: RectTitleOnMouseDragged
        onMousePressed: RectTitleOnMousePressed
        fill: DarkGray
        stroke: null
        width: 410.0
        height: 26.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def Arial_Bold_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 30.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageMedeil: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageicon: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MenuAboutMedeil.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 8.0
        layoutY: 4.0
        image: imageicon
        fitWidth: 16.0
        fitHeight: 16.0
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 385.0
        layoutY: 0.0
        onMouseClicked: imgCloseOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: imageClose
    }
    
    public-read def imagevanuston: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Vanuston Logo.png"
    }
    
    public-read def Arial_Bold_13: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 13.0
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "DialogBox"
        effect: dropShadowEffect
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 4.0
        width: 410.0
        height: 250.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, RectTitle, panelLicenceInfo, label11, imageView2, imgClose, panelAlert, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        layoutX: bind panelLX
        layoutY: bind panelLY
        blocksMouse: false
        content: [ panelheader, ]
    }
    
    public-read def panelReturnNotes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        blocksMouse: false
        content: [ panel, ]
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 1.0
        startY: 0.0
        endX: 0.0
        proportional: true
        cycleMethod: javafx.scene.paint.CycleMethod.NO_CYCLE
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 0.2, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#93c028") }, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelReturnNotes, ]
    }
    // </editor-fold>//GEN-END:main

    function textboxOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            button.requestFocus();
        }

    }

    function buttonOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_ENTER) {
            saveformulation();
        }

    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Billing", msg);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function txtFormulationOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            textbox.requestFocus();
        }
    }

    function button2Action(): Void {
        System.out.println("ooooooooo");
        txtFormulation.text = "";
        Hide();
    }

    public function Setcategory(dia: String,subctg : String): Void {
        txtcategory.text = dia;
        textsubctg.text = subctg;
    }
    

    function buttonAction(): Void {
       
        saveformulation();
    }

    function saveformulation(): Void {
        try {
            System.out.println("Alert???????/??");
            //   var valObj: Validation = new Validation();
            var cs: String = txtcategory.rawText.trim();
            var subctg: String=  textsubctg.rawText.trim();
            var service: String = txtFormulation.rawText.trim();
           

            var amount: String = textbox.rawText.trim();
            var amountss: Double;
            if (not amount.equals("")) {
                amountss = Double.parseDouble(amount);//used to save
            //checking to avoid exception
            }
            var gst: String = gsttxtbox.rawText.trim();
            var gs: Double;
            if (not gst.equals("")) {
                gs = Double.parseDouble(gst);
            }
            if (cs == null or cs.equals("")) {
                System.out.println("Came Alert");
                FXinfo("Please Select Category ");
            } //         }else if (c<=0){
            //              FXinfo("Please Select Category ");
            //         }
             else if (subctg == null or subctg.equals("")) {
                FXinfo("Please Enter Subcategory");
            }
            else if (service == null or service.equals("")) {
                FXinfo("Please Enter Subcategory ");
            }

           else if (amount == null or amount.equals("")) {
                FXinfo("Please Enter Amount");
            } else if (gst == null or gst.equals("")) {
                FXinfo("Please Enter GST percent");
            } //       else if(m<=0){
            //           FXinfo("Please Enter Service ");
            //       }
            else {
             
                //var commonController:CommonImplements = new CommonController();
                var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                //sabarish var a= commonController.getAddFormulation(ms);
               
                var a = commonController.getAddService(cs, subctg,service, amountss,gs);
                if (a == 1) {
                    FXinfo("Service Already Exists.");
                    txtFormulation.requestFocus();
                } else if(a==2) {
                    formulation = txtFormulation.rawText;
                    txtFormulation.text = "";
                    txtcategory.text = "";
                    gsttxtbox.text = "";
                    textbox.text = "";
                    textsubctg.text="";
                    Hide();

                }
                else
                {
                    FXinfo("Please enter proper data");
                    }

            }
        } catch (e: Exception) {
            var msg: String = "Class : AddService  Method : saveformulation()   = {e.getMessage()}";
            log.debug(msg);
            e.getMessage();
            e.printStackTrace();
        }
    }

    var panelW = bind CommonDeclare.ScreenWidth;
    var panelH = bind CommonDeclare.ScreenHeight;
    var PanelOpacity: Number = 0.0;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX: Number = 150;
    var panelLY: Number = 50.0; //(panelH - 150) / 2;

    function RectTitleOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        var LX = e.screenX - panelStartLX;
        var LY = e.screenY - panelStartLY;
        if (LX > 0 and (LX + 25) < panelW)
            panelLX = e.screenX - panelStartLX;
        if (LY > 0 and (LY + 25) < panelH)
            panelLY = e.screenY - panelStartLY;
    }

    function RectTitleOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
    }

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Hide();
    }

    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
    }

    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
    }

    var opacClose = 0.5;
    var fadeClose = Timeline {
                keyFrames: [
                    at (0s) {opacClose => 0.2 tween Interpolator.LINEAR},
                    at (0.1s) {opacClose => 0.3 tween Interpolator.LINEAR},
                    at (0.2s) {opacClose => 0.4 tween Interpolator.LINEAR},
                    at (0.5s) {opacClose => 0.8 tween Interpolator.LINEAR},
                    at (0.8s) {opacClose => 1.0 tween Interpolator.LINEAR},
                ]
            };

    public function Hide(): Void {
        fadePanel.rate = -1.0;
        fadePanel.play();
        panel.visible = false;
    }

    public function Show(): Void {
       
        panel.visible = true;
        fadePanel.rate = 1.0;
        fadePanel.play();
    }

    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.1s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.3s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                ]
            };
}
