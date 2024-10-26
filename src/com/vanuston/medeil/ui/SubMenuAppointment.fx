package com.vanuston.medeil.ui;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;

public class SubMenuAppointment {

   def appointmentClass = AddAppointment {};
   def manAppointment = ManageAppointment {};
   def rectMenuWidth = 219.5;
   var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
   var saleModule: Integer = 0 on replace {
        CommonDeclare.form[1] = saleModule;
    }
    var Salesform= bind CommonDeclare.form[1] on replace {
         if(Salesform==0 ){
        imgCloseVisible=false;
        delete panelSalesForm.content;
    }
    if(Salesform==1 ){
        imgCloseVisible=false;
        }
    }
    var imgCloseVisible=false;
    var log = 0;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectSubMenuBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        width: 100.0
        height: 50.0
    }
    
    public-read def rectMenu2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 18.0
        layoutY: 99.0
        styleClass: "LeftmenuHighlight"
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 103.0
        layoutInfo: __layoutInfo_lblMenu2
        text: "Label"
    }
    
    public-read def rectMenu3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 11.0
        layoutY: 164.0
        styleClass: "LeftmenuHighlight"
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 63.0
        layoutY: 157.0
        layoutInfo: __layoutInfo_lblMenu3
        text: "Label"
    }
    
    public-read def panelSalesForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 226.0
        layoutY: 0.0
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelMsgBoxLX
        layoutY: bind panelMsgBoxLY
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ede9d9") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f4eccc") }, ]
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def Sandal: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.4
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def Left_Menu: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 18.0
    }
    
    public-read def Left_Menu1: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def imageSalesReturn: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Sales Return.png"
    }
    
    public-read def imageCash: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Appointment.png"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 109.0
        image: imageCash
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableSales[0]!=true
        disable: bind DisableSal[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def imageCounter: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/ManageApp.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: imageCounter
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableSales[1]!=true
        disable: bind DisableSal[1]
        layoutY: bind group2.layoutY+rectMenuY[1]
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
    }
    
    public-read def imageCredit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Credit.png"
    }
    
    public-read def imageCard: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Card.png"
    }
    
    public-read def imagePartial: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/PPayment.png"
    }
    
    public-read def imageDummy: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Dummy Bill.png"
    }
    
    public-read def imageMaintanance: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Sales maintanance.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: bind imgCloseVisible
        opacity: bind opacClose
        layoutX: bind imgCancelLX
        image: image
    }
    
    public-read def panelSalesSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ rectSubMenuBg, group2, group3, panelSalesForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelSalesSubMenu, panelMsgBox, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "SubMenu", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectSubMenuBg.visible = false;
                            rectSubMenuBg.fill = linearGradient;
                            rectSubMenuBg.stroke = Green;
                            rectSubMenuBg.strokeWidth = 3.0;
                            rectSubMenuBg.width = 225.0;
                            rectSubMenuBg.height = 574.0;
                            rectSubMenuBg.arcWidth = 5.0;
                            rectSubMenuBg.arcHeight = 5.0;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 4.0;
                            rectMenu2.layoutY = 0.0;
                            rectMenu2.onMouseClicked = rectMenu2OnMouseClickedAtSubMenu;
                            rectMenu2.fill = Sandal;
                            rectMenu2.stroke = DarkGray;
                            rectMenu2.strokeWidth = 2.0;
                            rectMenu2.height = 45.0;
                            rectMenu2.arcWidth = 10.0;
                            rectMenu2.arcHeight = 10.0;
                            lblMenu2.visible = true;
                            lblMenu2.layoutX = 4.0;
                            lblMenu2.layoutY = 0.0;
                            __layoutInfo_lblMenu2.width = 220.0;
                            __layoutInfo_lblMenu2.height = 45.0;
                            lblMenu2.text = "            Add Appointment";
                            lblMenu2.font = Left_Menu;
                            lblMenu2.textFill = DarkGray;
                            imgMenu2.visible = true;
                            imgMenu2.layoutX = 16.0;
                            imgMenu2.layoutY = 3.5;
                            imgMenu2.image = imageCash;
                            group2.layoutX = 4.0;
                            rectMenu3.visible = true;
                            rectMenu3.opacity = 1.0;
                            rectMenu3.layoutX = 4.0;
                            rectMenu3.layoutY = 0.0;
                            rectMenu3.onMouseClicked = rectMenu3OnMouseClickedAtSubMenu;
                            rectMenu3.fill = Sandal;
                            rectMenu3.stroke = DarkGray;
                            rectMenu3.strokeWidth = 2.0;
                            rectMenu3.height = 45.0;
                            rectMenu3.arcWidth = 10.0;
                            rectMenu3.arcHeight = 10.0;
                            lblMenu3.visible = true;
                            lblMenu3.layoutX = 4.0;
                            lblMenu3.layoutY = 0.0;
                            __layoutInfo_lblMenu3.width = 220.0;
                            __layoutInfo_lblMenu3.height = 45.0;
                            lblMenu3.text = "          Manage Appointment";
                            lblMenu3.font = Left_Menu;
                            lblMenu3.textFill = DarkGray;
                            imgMenu3.visible = true;
                            imgMenu3.layoutX = 16.0;
                            imgMenu3.layoutY = 3.5;
                            group3.layoutX = 4.0;
                            panelSalesForm.visible = true;
                            panelSalesForm.layoutX = 232.0;
                            panelSalesForm.layoutY = -2.0;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelSalesSubMenu.visible = true;
                            panelMsgBox.visible = true;
                            panel.visible = true;
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
    var rectMenuY:Number[];
    var DisableSales:Boolean[];
    var DisableSal:Boolean[];
    var imgCancelLX=bind CommonDeclare.panelFormW+207;
    var panelMsgBoxLX= bind ((CommonDeclare.panelFormW-500)/2)+207;
    var panelMsgBoxLY= bind ((CommonDeclare.panelFormH-150)/2)-100;
    def MessageBox=MessageBox{};
    var CloseForm:Boolean;

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        CloseForm=true;
        MessageBox.MsgBox("Medeil","Confirm","Are you sure you want to close current form?");
        delete panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }
    
    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
         }
    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
         }
    var opacClose=0.5;
    var fadeClose = Timeline {
    keyFrames: [
                at(0s) { opacClose => 0.5 tween Interpolator.LINEAR },
                at(0.1s) { opacClose => 1.0 tween Interpolator.LINEAR },
                ]
    };
    var msgOutput:Integer=bind MessageBox.msgboxOutput  on replace{
       if(msgOutput==1 and CloseForm==true and CommonDeclare.currModule==2){
        delete panelSalesForm.content;
        imgCloseVisible=false;
        CommonDeclare.form[1]=0;
     }
        CloseForm=false;
    }

    var user = bind CommonDeclare.user on replace {
        log = 1;
        setPrivillages(user);
    };

    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        manageAppointment();
    }

    public function editionAlert(): Void {
            MessageBox.MsgBox("Medeil","Information",CommonDeclare.edition_msg);
            delete panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }

    public function manageAppointment():Void {
        if(commonController.getProductType().equals("Free")) {
        editionAlert();
        }
        else {
	deleteForm(2);
        manAppointment.startUp();
        insert manAppointment.getDesignRootNodes() into panelSalesForm.content;
	}
        }
	
	public function appointment():Void{
        deleteForm(1);
        appointmentClass.StartUp();
        insert appointmentClass.getDesignRootNodes() into panelSalesForm.content;
	}

    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
           appointment();
    }

    public function deleteForm(i:Integer): Void {
        delete  panelSalesForm.content;
        if(i==1){
        imgCloseVisible=false;}
        else {
        imgCloseVisible=true;}
        saleModule = i;
    }

    // Prakash Oct 12 Modified ******* Start ***********
    function setPrivillages(u: String): Void {
        var uname = u;
        var userType = GetUserInfo.getUserType(uname);
        if ((userType.equals("User") or userType.equals("Admin") or userType.equals("SuperAdmin"))) {
            var access = getPrivillages(uname);
            for (i in [0..<access.size()]) {
             if(commonController.getProductType().equals("Free")) {
             if(i==1 or i==2){
                  DisableSal[i]=true;
             }else{
                 DisableSal[i]=false;
             }
             if (Integer.parseInt(access[i]) == 0) {
                    DisableSales[i]=true;
                    rectMenuY[i]=0.0;
             } else {
                    DisableSales[i]=false;
                    rectMenuY[i]=48.0;
                }
             }else{
                   if (Integer.parseInt(access[i]) == 0) {
                    DisableSales[i]=true;
                    DisableSal[i]=true;
                    rectMenuY[i]=0.0;
                } else {
                    DisableSales[i]=false;
                    rectMenuY[i]=48.0;
                    DisableSal[i]=false;
                }
              }
            }
        } 
        else {
            for (i in [0..<2]) {
                rectMenuY[i]=48.0;
                DisableSales[i]=false;
                DisableSal[i]=false;
            }
        }
    }
    
    function getPrivillages(uname: String): String[] {
        var priv: String[];
        def comObj : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (not GetUserInfo.checkName(uname)) {
                var access: String = comObj.getPrivileges("appointment", uname);
                priv = access.split(",");
        }
        return priv;
    }
    
    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
    }
