package com.vanuston.medeil.ui;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
//package com.vanuston.medeil.ui;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
var MasterModule: Integer = 0 on replace {
    CommonDeclare.form[3] = MasterModule;
}

public class SubMenuMasters {

   def DrugInformation = DrugInformation {};
    var user = bind CommonDeclare.user on replace {
        setPrivillages(user);
    }
    def rectMenuWidth = 219.5;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
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
        layoutX: 11.0
        layoutY: 164.0
        width: bind rectMenuWidth
        height: 50.0
    }

    def __layoutInfo_lblMenu2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 63.0
        layoutY: 157.0
        layoutInfo: __layoutInfo_lblMenu2
        text: "Label"
    }

    public-read def rectMenu3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 27.0
        layoutY: 375.0
        width: bind rectMenuWidth
        height: 50.0
    }

    def __layoutInfo_lblMenu3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 70.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_lblMenu3
        text: "Label"
    }

    public-read def rectMenu6: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 28.0
        layoutY: 308.0
        width: bind rectMenuWidth
        height: 50.0
    }

    def __layoutInfo_lblMenu6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 252.0
        layoutInfo: __layoutInfo_lblMenu6
        text: "Label"
    }

    public-read def rectMenu5: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 17.0
        layoutY: 237.0
        width: bind rectMenuWidth
        height: 50.0
    }

    def __layoutInfo_lblMenu5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 201.0
        layoutInfo: __layoutInfo_lblMenu5
        text: "Label"
    }

    public-read def panelMastersForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 226.0
        layoutY: 0.0
    }

    public-read def rectMenu8: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 15.0
        layoutY: 200.0
        width: bind rectMenuWidth
        height: 50.0
    }

    def __layoutInfo_lblMenu8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 70.0
        layoutY: 220.0
        layoutInfo: __layoutInfo_lblMenu8
        text: "Label"
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

    public-read def imageDrug: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Drug.png"
    }

    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: imageDrug
    }

    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[0]!=true
        disable: bind DisableMast[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }

    public-read def imageDoctor: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Doctor.png"
    }

    public-read def imgMenu8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 15.0
        layoutY: 220.0
        image: imageDoctor
    }

    public-read def group8: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[6]!=true
        disable: bind DisableMast[6]
        layoutX: 0.0
        layoutY: bind group7.layoutY+rectMenuY[5]
        content: [ rectMenu8, lblMenu8, imgMenu8, ]
    }

    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: imageDoctor
    }

    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[1]!=true
        disable: bind DisableMast[1]
        layoutY: bind group1.layoutY+rectMenuY[1]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }

    public-read def imgEmpSal: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/EmployeeSalary.png"
    }

    public-read def imgMenu5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 207.0
        image: imgEmpSal
    }

    public-read def group7: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[5]!=true
        disable: bind DisableMast[5]
        layoutY: bind group6.layoutY+rectMenuY[4]
        content: [ rectMenu5, lblMenu5, imgMenu5, ]
    }

    public-read def imageEmployee: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Employee.png"
    }

    public-read def imgMenu6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 252.0
        image: imageEmployee
    }

    public-read def group6: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[4]!=true
        disable: bind DisableMast[4]
        layoutY: bind group3.layoutY+rectMenuY[3]
        content: [ rectMenu6, lblMenu6, imgMenu6, ]
    }

    public-read def imageEmpSalary: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Customer.png"
    }

    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 300.0
        image: imageEmpSalary
    }

    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[2]!=true
        disable: bind DisableMast[2]
        layoutY: bind group2.layoutY+rectMenuY[2]
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
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

    public-read def panelMastersSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, group6, group7, panelMastersForm, imgClose, group8, ]
    }

    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelMastersSubMenu, panelMsgBox, ]
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
                            lblMenu1.text = "             Drug Details";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 12.0;
                            imgMenu1.layoutY = 3.5;
                            imgMenu1.image = imageDrug;
                            group1.layoutX = 8.0;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 0.0;
                            rectMenu2.layoutY = 0.0;
                            rectMenu2.styleClass = "LeftmenuHighlight";
                            rectMenu2.onMouseClicked = rectMenu2OnMouseClickedAtSubMenu;
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
                            lblMenu2.text = "             Doctor Details";
                            lblMenu2.font = Left_Menu;
                            lblMenu2.textFill = DarkGray;
                            imgMenu2.visible = true;
                            imgMenu2.layoutX = 12.0;
                            imgMenu2.layoutY = 3.5;
                            group2.layoutX = 8.0;
                            rectMenu3.visible = true;
                            rectMenu3.opacity = 1.0;
                            rectMenu3.layoutX = 0.0;
                            rectMenu3.layoutY = 0.0;
                            rectMenu3.styleClass = "LeftmenuHighlight";
                            rectMenu3.onMouseClicked = rectMenu3OnMouseClickedAtSubMenu;
                            rectMenu3.fill = Sandal;
                            rectMenu3.stroke = DarkGray;
                            rectMenu3.strokeWidth = 2.0;
                            rectMenu3.height = 45.0;
                            rectMenu3.arcWidth = 10.0;
                            rectMenu3.arcHeight = 10.0;
                            lblMenu3.visible = true;
                            lblMenu3.layoutX = 0.0;
                            lblMenu3.layoutY = 0.0;
                            __layoutInfo_lblMenu3.width = 220.0;
                            __layoutInfo_lblMenu3.height = 45.0;
                            lblMenu3.text = "             Patient Details";
                            lblMenu3.font = Left_Menu;
                            lblMenu3.textFill = DarkGray;
                            imgMenu3.visible = true;
                            imgMenu3.layoutX = 12.0;
                            imgMenu3.layoutY = 3.5;
                            imgMenu3.image = imageEmpSalary;
                            group3.layoutX = 8.0;
                            rectMenu6.visible = true;
                            rectMenu6.opacity = 1.0;
                            rectMenu6.layoutX = 0.0;
                            rectMenu6.layoutY = 0.0;
                            rectMenu6.styleClass = "LeftmenuHighlight";
                            rectMenu6.onMouseClicked = rectMenu6OnMouseClickedAtSubMenu;
                            rectMenu6.fill = Sandal;
                            rectMenu6.stroke = DarkGray;
                            rectMenu6.strokeWidth = 2.0;
                            rectMenu6.height = 45.0;
                            rectMenu6.arcWidth = 10.0;
                            rectMenu6.arcHeight = 10.0;
                            lblMenu6.visible = true;
                            lblMenu6.layoutX = 0.0;
                            lblMenu6.layoutY = 0.0;
                            __layoutInfo_lblMenu6.width = 220.0;
                            __layoutInfo_lblMenu6.height = 45.0;
                            lblMenu6.text = "             Employee Details";
                            lblMenu6.font = Left_Menu;
                            lblMenu6.textFill = DarkGray;
                            imgMenu6.visible = true;
                            imgMenu6.layoutX = 12.0;
                            imgMenu6.layoutY = 3.5;
                            group6.layoutX = 8.0;
                            rectMenu5.visible = true;
                            rectMenu5.opacity = 1.0;
                            rectMenu5.layoutX = 0.0;
                            rectMenu5.layoutY = 0.0;
                            rectMenu5.styleClass = "LeftmenuHighlight";
                            rectMenu5.onMouseClicked = rectMenu5OnMouseClickedAtSubMenu;
                            rectMenu5.fill = Sandal;
                            rectMenu5.stroke = DarkGray;
                            rectMenu5.strokeWidth = 2.0;
                            rectMenu5.height = 45.0;
                            rectMenu5.arcWidth = 10.0;
                            rectMenu5.arcHeight = 10.0;
                            lblMenu5.visible = true;
                            lblMenu5.layoutX = 0.0;
                            lblMenu5.layoutY = 0.0;
                            __layoutInfo_lblMenu5.width = 220.0;
                            __layoutInfo_lblMenu5.height = 45.0;
                            lblMenu5.text = "             Employee Salary";
                            lblMenu5.font = Left_Menu;
                            lblMenu5.textFill = DarkGray;
                            imgMenu5.visible = true;
                            imgMenu5.layoutX = 12.0;
                            imgMenu5.layoutY = 3.5;
                            imgMenu5.image = imgEmpSal;
                            group7.layoutX = 8.0;
                            panelMastersForm.visible = true;
                            panelMastersForm.layoutX = 232.0;
                            panelMastersForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            rectMenu8.layoutX = 0.0;
                            rectMenu8.layoutY = 0.0;
                            rectMenu8.styleClass = "LeftmenuHighlight";
                            rectMenu8.onMouseClicked = rectMenu70nMouseClickedAtSubMenu;
                            rectMenu8.fill = Sandal;
                            rectMenu8.stroke = DarkGray;
                            rectMenu8.strokeWidth = 2.0;
                            rectMenu8.height = 45.0;
                            rectMenu8.arcWidth = 10.0;
                            rectMenu8.arcHeight = 10.0;
                            lblMenu8.layoutX = 0.0;
                            lblMenu8.layoutY = 0.0;
                            __layoutInfo_lblMenu8.width = 220.0;
                            __layoutInfo_lblMenu8.height = 45.0;
                            lblMenu8.text = "            Dicom Viewer";
                            lblMenu8.font = Left_Menu;
                            lblMenu8.textFill = DarkGray;
                            imgMenu8.layoutX = 12.0;
                            imgMenu8.layoutY = 3.5;
                            group8.layoutX = 8.0;
                            panelMastersSubMenu.visible = true;
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
    // </editor-fold>
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var rectMenuY: Number[];
    var DisableMasters: Boolean[];
    var DisableMast: Boolean[];
    var Mastersform = bind CommonDeclare.form[3] on replace {
        if (Mastersform == 0) {
            imgClose.visible = false;
            delete  panelMastersForm.content;
        } }
    var imgCancelLX = bind CommonDeclare.panelFormW + 207;
    var panelMsgBoxLX = bind ((CommonDeclare.panelFormW - 500) / 2) + 207;
    var panelMsgBoxLY = bind ((CommonDeclare.panelFormH - 150) / 2) - 100;
    def MessageBox = MessageBox {};
    var CloseForm: Boolean;

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        CloseForm = true;
        MessageBox.MsgBox("Medeil", "Confirm", CommonDeclare.exitForm_msg);
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
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 4) {
            delete  panelMastersForm.content;
            imgClose.visible = false;
            CommonDeclare.form[3] = 0;
        }
        CloseForm = false;
    }

    function rectMenu6OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
         Load_EmployeeInformation();
    }
    function rectMenu70nMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
         Load_DoctorNewInformation();
//Load_EmployeeInformation()
    }

    public function customerLoad(): Void {
     deleteForm(3);
     def EchoInformation = EchoInformation {};
     EchoInformation.Startup();
     insert EchoInformation.getDesignRootNodes() into panelMastersForm.content;
    }

    function rectMenu5OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_EmployeeSalary();
    }

    public function Load_EmployeeInformation(): Void {
        deleteForm(4);
        def EmployeeInformation = EmployeeInformation {};
        EmployeeInformation.StartUp();
        insert EmployeeInformation.getDesignRootNodes() into panelMastersForm.content;
    }

    public function Load_EmployeeSalary(): Void {
       deleteForm(5);
       def EmployeeSalary = EmployeeSalary {};
       EmployeeSalary.StartUp();
       insert EmployeeSalary.getDesignRootNodes() into panelMastersForm.content;
    }
	 public function Load_DoctorNewInformation(): Void {
        deleteForm(6);
        def DoctorNewInformation = DoctorNewInformation {};
        DoctorNewInformation.Startup();
        insert DoctorNewInformation.getDesignRootNodes() into panelMastersForm.content;
    }
    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       customerLoad();
    }

    public function Load_DoctorInformation(): Void {
	deleteForm(2);
        def UltraSound = UltraSound {};
        UltraSound.Startup();
        insert UltraSound.getDesignRootNodes() into panelMastersForm.content;
    }

    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_DoctorInformation();
    }

    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       Load_DrugInformation();
    }

    public function Load_DrugInformation(): Void {
        deleteForm(1);
        def XRayInformation=XRayInformation{};
        XRayInformation.Startup();
        insert XRayInformation.getDesignRootNodes() into panelMastersForm.content;
    }

//Remove contents from Form Panel
    public function deleteForm(i: Integer): Void {
        MasterModule = i;
        delete  panelMastersForm.content;
        imgClose.visible = true;
    }

    function setPrivillages(u: String): Void {
    var uname = u;
    var userType = GetUserInfo.getUserType(uname);
    if (userType.equals("User") or userType.equals("Admin") or userType.equals("SuperAdmin")) {
        var access = getPrivillages(uname);
        for (i in [0..<access.size()]) {
            if (commonController.getProductType().equals("Free")) {
                if (i == 5) {
                    DisableMast[5] = true;
                } else {
                    DisableMast[5] = false;
                }

                if (Integer.parseInt(access[i]) == 0) {
                    DisableMasters[i] = true;
                    rectMenuY[i] = 0.0;
                } else {
                    DisableMasters[i] = false;
                    rectMenuY[i] = 48.0;
                }
            } else {
                if (Integer.parseInt(access[i]) == 0) {
                    DisableMasters[i] = true;
                    DisableMast[i] = true;
                    rectMenuY[i] = 0.0;
                } else {
                    DisableMasters[i] = false;
                    rectMenuY[i] = 48.0;
                    DisableMast[i] = false;
                }
            }

        }
    } else {
        for (i in [0..<5]) {
            rectMenuY[i] = 48.0;
            DisableMasters[i] = false;
        }
    }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var comObj: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

        if (not GetUserInfo.checkName(uname)) {
            var access: String = comObj.getPrivileges("masters", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}


import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
//var MasterModule: Integer = 0 on replace {
//    CommonDeclare.form[3] = MasterModule;
//}

public class SubMenuMasters {

   def DrugInformation = DrugInformation {};
    var user = bind CommonDeclare.user on replace {
        setPrivillages(user);
    }
    def rectMenuWidth = 219.5;
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
        layoutX: 11.0
        layoutY: 164.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 63.0
        layoutY: 157.0
        layoutInfo: __layoutInfo_lblMenu2
        text: "Label"
    }
    
    public-read def rectMenu3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 27.0
        layoutY: 375.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 70.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_lblMenu3
        text: "Label"
    }
    
    public-read def rectMenu6: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 28.0
        layoutY: 308.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 252.0
        layoutInfo: __layoutInfo_lblMenu6
        text: "Label"
    }
    
    public-read def rectMenu5: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 17.0
        layoutY: 237.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 201.0
        layoutInfo: __layoutInfo_lblMenu5
        text: "Label"
    }
    
    public-read def panelMastersForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 226.0
        layoutY: 0.0
    }
    
    public-read def rectMenu8: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 15.0
        layoutY: 200.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 70.0
        layoutY: 220.0
        layoutInfo: __layoutInfo_lblMenu8
        text: "Label"
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
    
    public-read def imageDrug: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Drug.png"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: imageDrug
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[0]!=true
        disable: bind DisableMast[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def imageDoctor: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Doctor.png"
    }
    
    public-read def imgMenu8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 15.0
        layoutY: 220.0
        image: imageDoctor
    }
    
    public-read def group8: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[6]!=true
        disable: bind DisableMast[6]
        layoutX: 0.0
        layoutY: bind group7.layoutY+rectMenuY[5]
        content: [ rectMenu8, lblMenu8, imgMenu8, ]
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: imageDoctor
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[1]!=true
        disable: bind DisableMast[1]
        layoutY: bind group1.layoutY+rectMenuY[1]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def imgEmpSal: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/EmployeeSalary.png"
    }
    
    public-read def imgMenu5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 207.0
        image: imgEmpSal
    }
    
    public-read def group7: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[5]!=true
        disable: bind DisableMast[5]
        layoutY: bind group6.layoutY+rectMenuY[4]
        content: [ rectMenu5, lblMenu5, imgMenu5, ]
    }
    
    public-read def imageEmployee: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Employee.png"
    }
    
    public-read def imgMenu6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 252.0
        image: imageEmployee
    }
    
    public-read def group6: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[4]!=true
        disable: bind DisableMast[4]
        layoutY: bind group3.layoutY+rectMenuY[3]
        content: [ rectMenu6, lblMenu6, imgMenu6, ]
    }
    
    public-read def imageEmpSalary: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Customer.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 300.0
        image: imageEmpSalary
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[2]!=true
        disable: bind DisableMast[2]
        layoutY: bind group2.layoutY+rectMenuY[2]
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
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
    
    public-read def panelMastersSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, group6, group7, panelMastersForm, imgClose, group8, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelMastersSubMenu, panelMsgBox, ]
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
                            lblMenu1.text = "             Drug Details";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 12.0;
                            imgMenu1.layoutY = 3.5;
                            imgMenu1.image = imageDrug;
                            group1.layoutX = 8.0;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 0.0;
                            rectMenu2.layoutY = 0.0;
                            rectMenu2.styleClass = "LeftmenuHighlight";
                            rectMenu2.onMouseClicked = rectMenu2OnMouseClickedAtSubMenu;
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
                            lblMenu2.text = "             Doctor Details";
                            lblMenu2.font = Left_Menu;
                            lblMenu2.textFill = DarkGray;
                            imgMenu2.visible = true;
                            imgMenu2.layoutX = 12.0;
                            imgMenu2.layoutY = 3.5;
                            group2.layoutX = 8.0;
                            rectMenu3.visible = true;
                            rectMenu3.opacity = 1.0;
                            rectMenu3.layoutX = 0.0;
                            rectMenu3.layoutY = 0.0;
                            rectMenu3.styleClass = "LeftmenuHighlight";
                            rectMenu3.onMouseClicked = rectMenu3OnMouseClickedAtSubMenu;
                            rectMenu3.fill = Sandal;
                            rectMenu3.stroke = DarkGray;
                            rectMenu3.strokeWidth = 2.0;
                            rectMenu3.height = 45.0;
                            rectMenu3.arcWidth = 10.0;
                            rectMenu3.arcHeight = 10.0;
                            lblMenu3.visible = true;
                            lblMenu3.layoutX = 0.0;
                            lblMenu3.layoutY = 0.0;
                            __layoutInfo_lblMenu3.width = 220.0;
                            __layoutInfo_lblMenu3.height = 45.0;
                            lblMenu3.text = "             Patient Details";
                            lblMenu3.font = Left_Menu;
                            lblMenu3.textFill = DarkGray;
                            imgMenu3.visible = true;
                            imgMenu3.layoutX = 12.0;
                            imgMenu3.layoutY = 3.5;
                            imgMenu3.image = imageEmpSalary;
                            group3.layoutX = 8.0;
                            rectMenu6.visible = true;
                            rectMenu6.opacity = 1.0;
                            rectMenu6.layoutX = 0.0;
                            rectMenu6.layoutY = 0.0;
                            rectMenu6.styleClass = "LeftmenuHighlight";
                            rectMenu6.onMouseClicked = rectMenu6OnMouseClickedAtSubMenu;
                            rectMenu6.fill = Sandal;
                            rectMenu6.stroke = DarkGray;
                            rectMenu6.strokeWidth = 2.0;
                            rectMenu6.height = 45.0;
                            rectMenu6.arcWidth = 10.0;
                            rectMenu6.arcHeight = 10.0;
                            lblMenu6.visible = true;
                            lblMenu6.layoutX = 0.0;
                            lblMenu6.layoutY = 0.0;
                            __layoutInfo_lblMenu6.width = 220.0;
                            __layoutInfo_lblMenu6.height = 45.0;
                            lblMenu6.text = "             Employee Details";
                            lblMenu6.font = Left_Menu;
                            lblMenu6.textFill = DarkGray;
                            imgMenu6.visible = true;
                            imgMenu6.layoutX = 12.0;
                            imgMenu6.layoutY = 3.5;
                            group6.layoutX = 8.0;
                            rectMenu5.visible = true;
                            rectMenu5.opacity = 1.0;
                            rectMenu5.layoutX = 0.0;
                            rectMenu5.layoutY = 0.0;
                            rectMenu5.styleClass = "LeftmenuHighlight";
                            rectMenu5.onMouseClicked = rectMenu5OnMouseClickedAtSubMenu;
                            rectMenu5.fill = Sandal;
                            rectMenu5.stroke = DarkGray;
                            rectMenu5.strokeWidth = 2.0;
                            rectMenu5.height = 45.0;
                            rectMenu5.arcWidth = 10.0;
                            rectMenu5.arcHeight = 10.0;
                            lblMenu5.visible = true;
                            lblMenu5.layoutX = 0.0;
                            lblMenu5.layoutY = 0.0;
                            __layoutInfo_lblMenu5.width = 220.0;
                            __layoutInfo_lblMenu5.height = 45.0;
                            lblMenu5.text = "             Employee Salary";
                            lblMenu5.font = Left_Menu;
                            lblMenu5.textFill = DarkGray;
                            imgMenu5.visible = true;
                            imgMenu5.layoutX = 12.0;
                            imgMenu5.layoutY = 3.5;
                            imgMenu5.image = imgEmpSal;
                            group7.layoutX = 8.0;
                            panelMastersForm.visible = true;
                            panelMastersForm.layoutX = 232.0;
                            panelMastersForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            rectMenu8.visible = false;
                            rectMenu8.layoutX = 0.0;
                            rectMenu8.layoutY = 0.0;
                            rectMenu8.styleClass = "LeftmenuHighlight";
                            rectMenu8.onMouseClicked = rectMenu70nMouseClickedAtSubMenu;
                            rectMenu8.fill = Sandal;
                            rectMenu8.stroke = DarkGray;
                            rectMenu8.strokeWidth = 2.0;
                            rectMenu8.height = 45.0;
                            rectMenu8.arcWidth = 10.0;
                            rectMenu8.arcHeight = 10.0;
                            lblMenu8.visible = false;
                            lblMenu8.layoutX = 0.0;
                            lblMenu8.layoutY = 0.0;
                            __layoutInfo_lblMenu8.width = 220.0;
                            __layoutInfo_lblMenu8.height = 45.0;
                            lblMenu8.text = "            Dicom Viewer";
                            lblMenu8.font = Left_Menu;
                            lblMenu8.textFill = DarkGray;
                            imgMenu8.visible = false;
                            imgMenu8.layoutX = 12.0;
                            imgMenu8.layoutY = 3.5;
                            group8.layoutX = 8.0;
                            panelMastersSubMenu.visible = true;
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
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var rectMenuY: Number[];
    var DisableMasters: Boolean[];
    var DisableMast: Boolean[];
    var Mastersform = bind CommonDeclare.form[3] on replace {
        if (Mastersform == 0) {
            imgClose.visible = false;
            delete  panelMastersForm.content;
        } }
    var imgCancelLX = bind CommonDeclare.panelFormW + 207;
    var panelMsgBoxLX = bind ((CommonDeclare.panelFormW - 500) / 2) + 207;
    var panelMsgBoxLY = bind ((CommonDeclare.panelFormH - 150) / 2) - 100;
    def MessageBox = MessageBox {};
    var CloseForm: Boolean;

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        CloseForm = true;
        MessageBox.MsgBox("Medeil", "Confirm", CommonDeclare.exitForm_msg);
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
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 4) {
            delete  panelMastersForm.content;
            imgClose.visible = false;
            CommonDeclare.form[3] = 0;
        }
        CloseForm = false;
    }

    function rectMenu6OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
         Load_EmployeeInformation();
    }
    function rectMenu70nMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
         Load_DoctorNewInformation();
//Load_EmployeeInformation()
    }

    public function customerLoad(): Void {
     deleteForm(3);
     def EchoInformation = EchoInformation {};
     EchoInformation.Startup();
     insert EchoInformation.getDesignRootNodes() into panelMastersForm.content;
    }

    function rectMenu5OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_EmployeeSalary();
    }
   
    public function Load_EmployeeInformation(): Void {
        deleteForm(4);
        def MriInfo = MriInfo {};
        MriInfo.Startup();
        insert MriInfo.getDesignRootNodes() into panelMastersForm.content;
    }
    
    public function Load_EmployeeSalary(): Void {
       deleteForm(5);
       def EmployeeSalary = EmployeeSalary {};
       EmployeeSalary.StartUp();
       insert EmployeeSalary.getDesignRootNodes() into panelMastersForm.content;
    }
	 public function Load_DoctorNewInformation(): Void {
        deleteForm(6);
        def DoctorNewInformation = DoctorNewInformation {};
        DoctorNewInformation.Startup();
        insert DoctorNewInformation.getDesignRootNodes() into panelMastersForm.content;
    }
    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       customerLoad();
    }

    public function Load_DoctorInformation(): Void {
	deleteForm(2);
        def UltraSound = UltraSound {};
        UltraSound.Startup();
        insert UltraSound.getDesignRootNodes() into panelMastersForm.content;
    }
	
    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_DoctorInformation();
    }

    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       Load_DrugInformation();
    }

    public function Load_DrugInformation(): Void {
        deleteForm(1);
        def XRayInformation=XRayInformation{};
        XRayInformation.Startup();
        insert XRayInformation.getDesignRootNodes() into panelMastersForm.content;
    }

//Remove contents from Form Panel
    public function deleteForm(i: Integer): Void {
        MasterModule = i;
        delete  panelMastersForm.content;
        imgClose.visible = true;
    }

    function setPrivillages(u: String): Void {
    var uname = u;
    var userType = GetUserInfo.getUserType(uname);
    if (userType.equals("User") or userType.equals("Admin") or userType.equals("SuperAdmin")) {
        var access = getPrivillages(uname);
        for (i in [0..<access.size()]) {
            if (commonController.getProductType().equals("Free")) {
                if (i == 5) {
                    DisableMast[5] = true;
                } else {
                    DisableMast[5] = false;
                }

                if (Integer.parseInt(access[i]) == 0) {
                    DisableMasters[i] = true;
                    rectMenuY[i] = 0.0;
                } else {
                    DisableMasters[i] = false;
                    rectMenuY[i] = 48.0;
                }
            } else {
                if (Integer.parseInt(access[i]) == 0) {
                    DisableMasters[i] = true;
                    DisableMast[i] = true;
                    rectMenuY[i] = 0.0;
                } else {
                    DisableMasters[i] = false;
                    rectMenuY[i] = 48.0;
                    DisableMast[i] = false;
                }
            }

        }
    } else {
        for (i in [0..<5]) {
            rectMenuY[i] = 48.0;
            DisableMasters[i] = false;
        }
    }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var comObj: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

        if (not GetUserInfo.checkName(uname)) {
            var access: String = comObj.getPrivileges("masters", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}

