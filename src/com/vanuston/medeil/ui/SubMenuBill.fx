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

public class SubMenuBill {

    var invModule: Integer = 0 on replace {
        CommonDeclare.form[2] = invModule;
    }
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var user = bind CommonDeclare.user on replace {
        setPrivillages(user);
    }
    def rectMenuWidth = 219.5;
    def PrescriptionFormat = PrescriptionFormat {};
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectMenu1: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 0.0
        layoutY: 36.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu1: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_lblMenu1
        text: "Label"
    }
    
    public-read def rectMenu2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu2
        text: "Label"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[1]!=true
        disable: bind DisableInventory[1]
        layoutY: bind group1.layoutY+rectMenuY[1]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def panelInvForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.01
        green: 0.5
        blue: 0.76
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
    
    public-read def image1: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Purchase Order.png"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: image1
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[0]!=true
        disable: bind DisableInventory[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Purchase1.png"
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/PurchaseReturn.png"
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Stock.png"
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/DamageStock.png"
    }
    
    public-read def image6: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Expiry Return.png"
    }
    
    public-read def image7: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Send Purchase Order.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        opacity: bind opacClose
        layoutX: bind imgCancelLX
        image: image
    }
    
    public-read def panelInventorySubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, panelInvForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelInventorySubMenu, panelMsgBox, ]
    }
    
    public-read def imgDrugSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Backup.png"
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
                            rectMenu1.visible = true;
                            rectMenu1.opacity = 1.0;
                            rectMenu1.layoutX = 0.0;
                            rectMenu1.layoutY = 0.0;
                            rectMenu1.styleClass = "LeftmenuHighlight";
                            rectMenu1.onMouseClicked = rectMenu1OnMouseClickedAtSubMenu;
                            rectMenu1.fill = Sandal;
                            rectMenu1.stroke = DarkGray;
                            rectMenu1.strokeWidth = 2.0;
                            rectMenu1.height = 45.0;
                            rectMenu1.arcWidth = 10.0;
                            rectMenu1.arcHeight = 10.0;
                            lblMenu1.visible = true;
                            lblMenu1.layoutX = 0.0;
                            lblMenu1.layoutY = 0.0;
                            __layoutInfo_lblMenu1.width = 220.0;
                            __layoutInfo_lblMenu1.height = 45.0;
                            lblMenu1.text = "             Practice Mgmt";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 12.0;
                            imgMenu1.layoutY = 3.5;
                            imgMenu1.image = Image {url: "{__DIR__}images/Doctor.png"};
                            group1.layoutX = 8.0;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 0.0;
                            rectMenu2.layoutY = 0.0;
                            rectMenu2.styleClass = "LeftmenuHighlight";
                            rectMenu2.fill = Sandal;
                            rectMenu2.stroke = DarkGray;
                            rectMenu2.strokeWidth = 2.0;
                            rectMenu2.height = 45.0;
                            rectMenu2.arcWidth = 10.0;
                            rectMenu2.arcHeight = 10.0;
                            lblMenu2.visible = true;
                            lblMenu2.layoutX = 0.0;
                            lblMenu2.layoutY = 0.0;
                            __layoutInfo_lblMenu2.width = 220.0;
                            __layoutInfo_lblMenu2.height = 45.0;
                            lblMenu2.text = "             Drug Search";
                            lblMenu2.font = Left_Menu;
                            lblMenu2.textFill = DarkGray;
                            imgMenu2.visible = true;
                            imgMenu2.layoutX = 12.0;
                            imgMenu2.layoutY = 3.5;
                            imgMenu2.image = imgDrugSearch;
                            group2.layoutX = 8.0;
                            group2.onMouseClicked = group2OnMouseClickedAtSubMenu;
                            panelInvForm.visible = true;
                            panelInvForm.layoutX = 232.0;
                            panelInvForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelInventorySubMenu.visible = true;
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

    function group2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        showGSearch();
    }

    public function showGSearch() : Void {
       deleteForm(1);
       def GenericSearch=GenericSearch{};
       insert GenericSearch.getDesignRootNodes() into panelInvForm.content;
       GenericSearch.StartUp();
    }

    var rectMenuY: Number[];
    var DisableInv: Boolean[];
    var DisableInventory: Boolean[];

    var imgCancelLX = bind CommonDeclare.panelFormW + 207;
    var panelMsgBoxLX = bind ((CommonDeclare.panelFormW - 500) / 2) + 207;
    var panelMsgBoxLY = bind ((CommonDeclare.panelFormH - 150) / 2) - 100;
    def MessageBox = MessageBox {};
    var CloseForm: Boolean;
    var Invform = bind CommonDeclare.form[2] on replace {
        closeVisible(Invform);
    }

    public function Msgbox(): Void {
        MessageBox.MsgBox("Medeil", "Information", CommonDeclare.access_deny_msg);
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }
    public function editionAlert(): Void {
            MessageBox.MsgBox("Medeil","Information",CommonDeclare.edition_msg);
            delete panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
        }
    function closeVisible(i: Integer): Void {

        if (i == 0) {
            imgClose.visible = false;
            delete  panelInvForm.content;
        } else {
            imgClose.visible = true;
        }
    }

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        CloseForm = true;
        MessageBox.MsgBox("Medeil", "Confirm", "Are you sure you want to close current form?");
        delete  panelMsgBox.content;
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

    var opacClose = 0.5;
    var fadeClose = Timeline {
                keyFrames: [
                    at (0s) {opacClose => 0.5 tween Interpolator.LINEAR},
                    at (0.1s) {opacClose => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var msgOutput: Integer = bind MessageBox.msgboxOutput on replace {
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 3) {
            delete  panelInvForm.content;
            imgClose.visible = false;
            CommonDeclare.form[2] = 0;
        }
        CloseForm = false;
    }

    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
      showPrescrption();
    }

        public function showPrescrption() : Void {
         if(DisableInv[0]){
            Msgbox();
        }else{
            deleteForm(2);
            PrescriptionFormat.MainPanel.disable = false;
            insert PrescriptionFormat.getDesignRootNodes() into panelInvForm.content;
            PrescriptionFormat.StartUp();
        }
       }
    
    public function deleteForm(i: Integer): Void {
        invModule = i;
        delete  panelInvForm.content;
        delete  panelMsgBox.content;
        imgClose.visible = true;
    }
    
    function setPrivillages(u: String): Void {
        var uname = u;
        var userType = GetUserInfo.getUserType(uname);
        if (userType.equals("User") or userType.equals("Admin") or userType.equals("SuperAdmin")) {
                var access = getPrivillages(uname);
                for (i in [0..<access.size()]) {
                    if (Integer.parseInt(access[i]) == 0) {
                        DisableInv[i] = true;
                        rectMenuY[i] = 0.0;
                        DisableInventory[i] = true;
                    } else {
                        DisableInv[i] = false;
                        rectMenuY[i] = 48.0;
                        DisableInventory[i] = false;
                    }
            }
        } else {
            for (i in [0..<2]) {
                rectMenuY[i] = 48.0;
                DisableInv[i] = false;
            }
        }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (not GetUserInfo.checkName(uname)) {
            var access: String = commonController.getPrivileges("billing", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}
