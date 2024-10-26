///////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////  MEDEIL-Pharmacy Management System  ////////////////////
///////////////////////////////////////////////////////////////////////////////////////
package com.vanuston.medeil.ui;
import java.lang.*;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.image.Image;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.shape.Rectangle;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.control.Separator;
import javafx.stage.StageStyle;
import javafx.stage.*;
import javafx.scene.*;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import javafx.geometry.HPos;
import com.vanuston.medeil.util.Tools;
import com.vanuston.medeil.util.CommonDeclare;
import java.awt.event.ActionListener;
import java.awt.PopupMenu;
import java.awt.SystemTray;
import java.awt.event.ActionEvent;
import java.awt.MenuItem;
import java.awt.Toolkit;
import java.awt.TrayIcon;
import javax.swing.UIManager;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.MouseEvent;
import com.vanuston.medeil.util.GetUserInfo;
import java.awt.event.*;
import javax.swing.*;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.util.GetProductInfo;
import com.vanuston.medeil.server.ServerSkeletonFactory;
import com.vanuston.medeil.util.Autobackup;
import com.vanuston.medeil.util.ActivationProcess;
import com.vanuston.medeil.util.GetCompanyInfo;
import com.vanuston.medeil.util.LogReg;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import javafx.scene.paint.Color;

var ScreenWidth: Number = Toolkit.getDefaultToolkit().getScreenSize().width on replace {
    CommonDeclare.ScreenWidth = ScreenWidth;    
}
var ScreenHeight: Number = Toolkit.getDefaultToolkit().getScreenSize().height on replace {
    CommonDeclare.ScreenHeight = ScreenHeight;
}
public var Sw = Toolkit.getDefaultToolkit().getScreenSize().width;
public var Sh = Toolkit.getDefaultToolkit().getScreenSize().height;
var ScreenX = Screen.primary.visualBounds.minX;
var ScreenY = Screen.primary.visualBounds.minY;
var minimizable: Boolean = false;
var style: String = "{__DIR__}{CommonDeclare.ThemeType}.css";

public class Main {

 //var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
 var commonController : CommonImplements;
 var  getUserInfo = new GetUserInfo();
 var log: Logger = Logger.getLogger(Main.class, "Main");
 var expiryDruugName:String="";
 public var LoggedUser: String = bind CommonDeclare.user on replace {
 if(CommonDeclare.user.length() > 1) {
    Apply_Theme(getUserInfo.getThemeType(CommonDeclare.user));
 }
    expiryDruugName=commonController.getExpiryDrugNames();
    panelMaster.requestFocus();
}
var rectMenuWidth = 140.0;
var getPro:GetProductInfo=new GetProductInfo();
var productType:String=commonController.getProductType();


    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def imageMenuExit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuExit.png"}
    }
    
    public-read def imageMenuCalculator: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuCalculator.png"}
    }
    
    public-read def imageMenuNotepad: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuNotepad.png"}
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuSettings.png"}
    }
    
    public-read def imagePrintSetup: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuPrinter.png"}
    }
    
    public-read def imagePrintSetup1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuPrinter.png"}
    }
    
    public-read def separator10: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def imageMenuUserInfo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuUser.png"}
    }
    
    public-read def separator8: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/Hospital.png"}
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuMaintenanceCost.png"}
    }
    
    public-read def separator9: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def imageMenuDefaultTheme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuDefaultTheme.png"}
    }
    
    public-read def imageMenuBlueTheme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuBlueTheme.png"}
    }
    
    public-read def imageGreenTheme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuGreenTheme.png"}
    }
    
    public-read def imageOrange_Theme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuOrangeTheme.png"}
    }
    
    public-read def imagePurple_Theme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuPurpleTheme.png"}
    }
    
    public-read def imageWhite_Theme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuWhiteTheme.png"}
    }
    
    public-read def imageTheme: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuColorPalette.png"}
    }
    
    public-read def imageMenuManual: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuHelp.png"}
    }
    
    public-read def separator5: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def imageMenuTips: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuTroubleshootingTips.png"}
    }
    
    public-read def imageMenuSupport: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuHelpDask.png"}
    }
    
    public-read def separator6: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def imageMenuUpdate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuUpdate.png"}
    }
    
    public-read def imageMenuActivation: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/sample.png"}
    }
    
    public-read def separator7: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def imageMenuAbout: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: Image {url: "{__DIR__}images/MenuAboutMedeil.png"}
    }
    
    public-read def panelHomePage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 228.0
    }
    
    public-read def panelForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        disable: bind CloseForm
        layoutX: 228.0
        layoutY: -1.0
    }
    
    public-read def panelLeftMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 1.0
        layoutY: 1.0
        styleClass: "linear-gradient"
    }
    
    public-read def rectDock: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: 230.5
        layoutY: -3.0
        styleClass: "BottomTaskBar"
        onMouseClicked: imageViewOnMouseClicked
        onMouseEntered: imageViewDockOnMouseEntered
        width: 10.0
        height: bind sidebarH+25
        arcWidth: 0.0
        arcHeight: 0.0
    }
    
    public-read def imageViewDock: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: bind imageViewDockVisible
        layoutX: 230.5
        layoutY: bind (sidebarH-22)/2
    }
    
    public-read def panelMenuBar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind ScreenWidth-125
        layoutY: 30.0
    }
    
    def __layoutInfo_panelReminder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
        height: 0.0
    }
    public-read def panelReminder: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind PanelReminderLX
        layoutY: bind PanelReminderLY
        layoutInfo: __layoutInfo_panelReminder
    }
    
    public-read def panelLoginPage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
    }
    
    public-read def panelFrm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind (ScreenWidth-500)/2
        layoutY: bind (ScreenHeight-200)/2
    }
    
    public-read def Verdena_Bold_10: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Verdena Bold"
        size: 11.0
        oblique: false
    }
    
    public-read def verdena12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Verdena"
    }
    
    public-read def aboutMedilMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuAbout
        text: "About MEDEIL+"
        font: verdena12
        action: aboutMedilMenuItemAction
    }
    
    public-read def softwareActivationMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        disable: false
        graphic: imageMenuActivation
        text: "Product Activation"
        font: verdena12
        action: softwareActivationMenuItemAction
    }
    
    public-read def checkForupdatesMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        disable: false
        graphic: imageMenuUpdate
        text: "Check For Updates"
        font: verdena12
        action: checkForupdatesMenuItemAction
    }
    
    public-read def technicalsupportMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        disable: false
        graphic: imageMenuSupport
        text: "Technical Support"
        font: verdena12
        action: technicalsupportMenuItemAction
    }
    
    public-read def troubleshootingTipsMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        disable: false
        graphic: imageMenuTips
        text: "FAQs & Troubleshooting"
        font: verdena12
        accelerator: null
        action: troubleshootingTipsMenuItemAction
    }
    
    public-read def manualMenu: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuManual
        text: "User Manual"
        font: verdena12
        action: englishManualMenuItemAction
    }
    
    public-read def WhiteThemeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageWhite_Theme
        text: " White Theme"
        font: verdena12
        action: WhiteThemeMenuItemAction
    }
    
    public-read def PurpleThemeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imagePurple_Theme
        text: " Purple Theme"
        font: verdena12
        action: PurpleThemeMenuItemAction
    }
    
    public-read def OrangeThemeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        opacity: 1.0
        graphic: imageOrange_Theme
        text: " Orange Theme"
        font: verdena12
        action: OrangeThemeMenuItemAction
    }
    
    public-read def greenThemeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        opacity: 1.0
        graphic: imageGreenTheme
        text: " Green Theme"
        font: verdena12
        action: greenThemeMenuItemAction
    }
    
    public-read def BlueThemeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuBlueTheme
        text: " Blue Theme"
        font: verdena12
        action: BlueThemeMenuItemAction
    }
    
    public-read def defaultThemeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuDefaultTheme
        text: " Default Theme"
        font: verdena12
        action: defaultThemeMenuItemAction
    }
    
    public-read def themesMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        disable: false
        graphic: imageTheme
        text: "Themes"
        font: verdena12
        items: [ defaultThemeMenuItem, BlueThemeMenuItem, greenThemeMenuItem, OrangeThemeMenuItem, PurpleThemeMenuItem, WhiteThemeMenuItem, ]
    }
    
    public-read def maintananceCostMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageView5
        text: "Maintenance Cost"
        font: verdena12
        action: maintananceCostMenuItemAction
    }
    
    public-read def shopInformationMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageView4
        text: "Hospital Information"
        font: verdena12
        action: shopInformationMenuItemAction
    }
    
    public-read def userInformationMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuUserInfo
        text: "User Information"
        font: verdena12
        action: userInformationMenuItemAction
    }
    
    public-read def barcodeReportmenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imagePrintSetup1
        text: "Barcode Print Settings"
        font: verdena12
        action: barcodeReportmenuItemAction
    }
    
    public-read def PrintSetupmenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        disable: false
        graphic: imagePrintSetup
        text: "Print Settings"
        font: verdena12
        action: PrintSetupmenuItemAction
    }
    
    public-read def menuItemSettings: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageView
        text: "Configuration"
        font: verdena12
        action: menuItemSettingsAction
    }
    
    public-read def notepadMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuNotepad
        text: "   Notepad"
        font: verdena12
        action: notepadMenuItemAction
    }
    
    public-read def calculatorMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuCalculator
        text: "  Calculator"
        font: verdena12
        action: calculatorMenuItemAction
    }
    
    public-read def exitMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        graphic: imageMenuExit
        text: "Exit"
        font: verdena12
        action: exitMenuItemAction
    }
    
    def __layoutInfo_labelMarq1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CommonDeclare.marqContent.length()*9
    }
    public-read def labelMarq1: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: bind ScreenHeight-18
        layoutInfo: __layoutInfo_labelMarq1
        text: bind CommonDeclare.marqContent
        font: verdena12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def settingsMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        cursor: javafx.scene.Cursor.HAND
        managed: true
        onKeyPressed: panelMasterOnKeyPressed
        onMouseClicked: settingsMenuOnMouseClicked
        focusTraversable: false
        text: "Settings"
        font: Arial_Bold_12
        items: [ menuItemSettings, PrintSetupmenuItem, barcodeReportmenuItem, separator10, userInformationMenuItem, separator8, shopInformationMenuItem, maintananceCostMenuItem, separator9, themesMenu, ]
    }
    
    public-read def toolsMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        cursor: javafx.scene.Cursor.HAND
        onKeyPressed: panelMasterOnKeyPressed
        onMouseClicked: toolsMenuOnMouseClicked
        focusTraversable: false
        text: "Tools"
        font: Arial_Bold_12
        items: [ calculatorMenuItem, notepadMenuItem, ]
    }
    
    public-read def fileMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        cursor: javafx.scene.Cursor.HAND
        managed: false
        onKeyPressed: panelMasterOnKeyPressed
        onMouseClicked: fileMenuOnMouseClicked
        focusTraversable: false
        text: "File"
        font: Arial_Bold_12
        accelerator: null
        items: [ exitMenuItem, ]
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 14.0
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
        oblique: false
        embolden: false
        autoKern: false
        ligatures: false
        position: javafx.scene.text.FontPosition.REGULAR
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 30.0
        oblique: false
        embolden: false
        autoKern: false
        ligatures: false
        position: javafx.scene.text.FontPosition.REGULAR
    }
    
    public-read def Arial_Bold_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 25.0
    }
    
    public-read def Arial_Bold_32: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 32.0
        oblique: false
        embolden: false
        autoKern: false
        letterSpacing: 0.03
        ligatures: false
        position: javafx.scene.text.FontPosition.REGULAR
    }
    
    public-read def Arial_Bold_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 30.0
    }
    
    public-read def Arial_Bold_40: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 40.0
    }
    
    public-read def MasterMenu: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial bold"
        size: 14.0
        oblique: false
        embolden: false
        letterSpacing: 0.0
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.019607844
        green: 0.5019608
        blue: 0.7647059
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    def __layoutInfo_lblTopPharmacyName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ScreenWidth
        height: 36.0
        hfill: false
    }
    public-read def lblTopPharmacyName: javafx.scene.control.Label = javafx.scene.control.Label {
        disable: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_lblTopPharmacyName
        effect: null
        text: bind hospitalName
        font: Arial_Bold_30
        hpos: javafx.geometry.HPos.CENTER
        vpos: javafx.geometry.VPos.CENTER
        textFill: DarkGray
    }
    
    public-read def rectBottomTaskBar: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: bind ScreenHeight-20
        styleClass: "BottomTaskBar"
        fill: DarkGray
        width: bind ScreenWidth
        height: 20.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectbgTopMenus: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: 3.0
        layoutY: 70.0
        styleClass: "linear-gradient"
        fill: null
        stroke: DarkGray
        strokeWidth: 2.0
        width: bind ScreenWidth-6
        height: 100.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.9137255
        green: 0.9098039
        blue: 0.8862745
    }
    
    public-read def orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def labelServer: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind ScreenWidth-200
        layoutY: 45.0
        text: "Server"
        font: Arial_Bold_14
        textFill: orange
    }
    
    public-read def green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4117647
        green: 0.56078434
        blue: 0.0
    }
    
    public-read def LeftMenuGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#eaeaea") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#ebedd8") }, ]
    }
    
    public-read def formBgGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startY: 0.6
        proportional: false
        cycleMethod: javafx.scene.paint.CycleMethod.REFLECT
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#e2eef4") }, ]
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startY: 0.0
        endX: 0.0
        endY: 1.0
        cycleMethod: javafx.scene.paint.CycleMethod.REFLECT
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#fcfcfc") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#333333") }, ]
    }
    
    public-read def sidebar: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 4.0
        layoutY: bind sidebarLY
        styleClass: "leftmenuBar"
        effect: null
        fill: linearGradient
        smooth: true
        stroke: green
        strokeWidth: 4.0
        x: 2.0
        width: bind sidebarW
        height: bind sidebarH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectMenuReports: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuReportsOpacity
        cursor: null
        managed: true
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectMenuFinancial: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuCRMOpacity
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectMenuSalesInve: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuFinancialOpacity
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectMenuPractises: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuInventoryOpacity
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectMenuAppoints: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuSalesOpacity
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectMenuMasters: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuMastersOpacity
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectMenuHome: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: bind rectMenuHomeOpacity
        layoutX: bind MenuRectLX
        layoutY: 0.0
        styleClass: "rectMenuBg"
        fill: linearGradient
        stroke: orange
        strokeWidth: 3.0
        width: bind rectMenuWidth
        height: bind MenuRectH
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def Date: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Background.jpg"
    }
    
    public-read def imageLogo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageViewMedilLogo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutY: -4.0
        image: imageLogo
        fitWidth: bind imgLogoW
        fitHeight: bind imgLogoH
    }
    
    public-read def imageFrmClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/FrmClose.png"
    }
    
    public-read def imageMsgInfo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MsgInfo.png"
    }
    
    public-read def linearGradientTitlebar: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 0.0
        startY: 0.0
        endX: 0.0
        endY: 1.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectTitlebar: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        cursor: javafx.scene.Cursor.MOVE
        layoutX: 4.0
        layoutY: 3.0
        styleClass: "rectTitlebar"
        onMouseClicked: rectTitlebarOnMouseClicked
        onMouseDragged: rectTitlebarOnMouseDragged
        onMousePressed: rectTitlebarOnMousePressed
        fill: linearGradientTitlebar
        smooth: true
        width: bind ScreenWidth-4
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageHome: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/h4.png"
    }
    
    public-read def imgHome: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind MenuImgLX
        layoutY: 7.0
        image: imageHome
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelHome: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuHomeLX
        onMouseClicked: panelHomeOnMouseClicked
        onMouseEntered: panelHomeOnMouseEntered
        onMouseExited: panelHomeOnMouseExited
        blocksMouse: true
        content: [ rectMenuHome, imgHome, ]
    }
    
    public-read def imageSales: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/a3.png"
        backgroundLoading: false
    }
    
    public-read def imgScheduler: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: null
        layoutX: bind MenuImgLX
        layoutY: 7.0
        image: imageSales
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelAppoints: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuAppointsLX
        onMouseClicked: panelAppointsOnMouseClicked
        onMouseEntered: panelAppointsOnMouseEntered
        onMouseExited: panelAppointsOnMouseExited
        content: [ rectMenuAppoints, imgScheduler, ]
    }
    
    public-read def imagePractises: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/p3.png"
    }
    
    public-read def imgPractise: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuImgLX
        layoutY: 7.0
        image: imagePractises
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelPractises: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuPractisesLX
        onMouseClicked: panelPractisesOnMouseClicked
        onMouseEntered: panelPractisesOnMouseEntered
        onMouseExited: panelPractisesOnMouseExited
        blocksMouse: true
        content: [ rectMenuPractises, imgPractise, ]
    }
    
    public-read def imageSalesInventory: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/l6.png"
    }
    
    public-read def imgFinancial: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind MenuImgLX
        layoutY: 7.0
        image: imageSalesInventory
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelFinance: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        disable: false
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuCRMLX
        onMouseClicked: panelFinanceOnMouseClicked
        onMouseEntered: panelFinanceOnMouseEntered
        onMouseExited: panelFinanceOnMouseExited
        blocksMouse: true
        content: [ rectMenuFinancial, imgFinancial, ]
    }
    
    public-read def imageFinancial: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/b4.png"
    }
    
    public-read def imgSalesInventory: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind MenuImgLX
        layoutY: 7.0
        image: imageFinancial
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelSalesInve: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        disable: false
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuFinanceLX
        onMouseClicked: panelSalesInveOnMouseClicked
        onMouseEntered: panelSalesInveOnMouseEntered
        onMouseExited: panelSalesInveOnMouseExited
        blocksMouse: true
        content: [ rectMenuSalesInve, imgSalesInventory, ]
    }
    
    public-read def imageMasters: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/m3.png"
    }
    
    public-read def imgMaster: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind MenuImgLX
        layoutY: 7.0
        image: imageMasters
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelMasters: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        disable: false
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuMasterLX
        onMouseClicked: panelMastersOnMouseClicked
        onMouseEntered: panelMastersOnMouseEntered
        onMouseExited: panelMastersOnMouseExited
        blocksMouse: true
        content: [ rectMenuMasters, imgMaster, ]
    }
    
    public-read def imageReports: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/r2.png"
    }
    
    public-read def imgReports: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuImgLX
        layoutY: 7.0
        effect: null
        image: imageReports
        fitWidth: bind imgMenuW
        fitHeight: bind imgMenuH
    }
    
    public-read def panelReports: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        disable: true
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind MenuReportsLX
        onMouseEntered: panelReportsOnMouseEntered
        onMouseExited: panelReportsOnMouseExited
        blocksMouse: true
        effect: null
        content: [ rectMenuReports, imgReports, ]
    }
    
    public-read def imageUpdate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Update.png"
    }
    
    public-read def imgUpdate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: 1.0
        cursor: javafx.scene.Cursor.HAND
        layoutX: 40.0
        layoutY: 0.0
        onMouseClicked: imgUpdateOnMouseClicked
        pickOnBounds: true
        image: imageUpdate
        fitWidth: 26.0
        fitHeight: 26.0
    }
    
    public-read def groupUpdate: javafx.scene.Group = javafx.scene.Group {
        cursor: javafx.scene.Cursor.HAND
        layoutY: -2.0
        content: [ imgUpdate, ]
    }
    
    public-read def imageLogout: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Logout.png"
    }
    
    public-read def imgLogout: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: javafx.scene.Cursor.HAND
        layoutX: 40.0
        onMouseClicked: imgLogoutOnMouseClicked
        image: imageLogout
        fitWidth: 26.0
        fitHeight: 26.0
    }
    
    public-read def groupLogout: javafx.scene.Group = javafx.scene.Group {
        cursor: javafx.scene.Cursor.HAND
        content: [ imgLogout, ]
    }
    
    public-read def imageHelp: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Help.png"
    }
    
    public-read def imgHelp: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: javafx.scene.Cursor.HAND
        layoutX: 40.0
        onMouseClicked: imgHelpOnMouseClicked
        pickOnBounds: true
        image: imageHelp
        fitWidth: 26.0
        fitHeight: 26.0
    }
    
    public-read def groupHelp: javafx.scene.Group = javafx.scene.Group {
        cursor: javafx.scene.Cursor.HAND
        content: [ imgHelp, ]
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: bind ScreenWidth-80
        layoutY: -8.0
        content: [ groupLogout, groupUpdate, groupHelp, ]
        spacing: 0.0
    }
    
    public-read def panelHighlightMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 72.5
        content: [ panelHome, panelMasters, panelAppoints, panelPractises, panelSalesInve, panelFinance, panelReports, vbox, ]
    }
    
    public-read def imageMinimize: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowMinimize.png"
    }
    
    public-read def imageMaximize: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowMaximize.png"
    }
    
    public-read def imageRestore: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowRestore.png"
    }
    
    public-read def imgRestore: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind imgRestoreOpacity
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: bind ScreenWidth-60
        layoutY: 4.0
        onMouseClicked: imgRestoreOnMouseClicked
        onMouseEntered: imgRestoreOnMouseEntered
        onMouseExited: imgRestoreOnMouseExited
        image: imageRestore
    }
    
    def __layoutInfo_panelControlButtons: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ScreenWidth
        height: 32.0
    }
    public-read def panelControlButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        cursor: null
        layoutInfo: __layoutInfo_panelControlButtons
        content: [ imgRestore, ]
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/WindowClose.png"
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
        topOffset: -5.0
        topOpacity: 0.16
        bottomOpacity: 0.09
        fraction: 0.55
    }
    
    public-read def imageDock: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Dock.png"
    }
    
    public-read def imageDock1: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Dock1.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgFormClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        opacity: bind opacFormClose
        layoutX: bind ScreenWidth+205
        onMouseClicked: imgFormCloseOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        image: image2
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ScreenWidth
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: -230.0
        layoutY: bind panelLY
        layoutInfo: __layoutInfo_panel
        content: [ sidebar, panelHomePage, panelForm, panelLeftMenu, rectDock, imageViewDock, imgFormClose, ]
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def Arial_Italic_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Italic"
    }
    
    public-read def Arial_Bold_Italic_7: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold Italic"
        size: 7.0
    }
    
    public-read def Arial_Bold_Italic_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold Italic"
    }
    
    public-read def imageShort: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/shortcut.png"
    }
    
    public-read def ShortCutImage: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageShort
    }
    
    public-read def shortCutMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        layoutX: 131.0
        layoutY: 35.0
        graphic: ShortCutImage
        text: "Short Cut Keys"
        font: verdena12
        action: shortCutMenuItemAction
    }
    
    public-read def helpMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        cursor: javafx.scene.Cursor.HAND
        onKeyPressed: panelMasterOnKeyPressed
        onMouseClicked: helpMenuOnMouseClicked
        focusTraversable: false
        text: "Help"
        font: Arial_Bold_12
        items: [ manualMenu, shortCutMenuItem, separator5, troubleshootingTipsMenuItem, technicalsupportMenuItem, separator6, checkForupdatesMenuItem, softwareActivationMenuItem, separator7, aboutMedilMenuItem, ]
    }
    
    def __layoutInfo_menuBar: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 16.0
    }
    public-read def menuBar: com.javafx.preview.control.MenuBar = com.javafx.preview.control.MenuBar {
        visible: true
        disable: false
        opacity: 1.0
        cursor: javafx.scene.Cursor.HAND
        layoutX: 30.0
        layoutY: 45.0
        layoutInfo: __layoutInfo_menuBar
        style: ""
        styleClass: ""
        onMouseClicked: menuBarOnMouseClicked
        effect: null
        menus: [ fileMenu, toolsMenu, settingsMenu, helpMenu, ]
    }
    
    public-read def serverImage: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/server.png"
    }
    
    public-read def serverImg: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ScreenWidth-220
        layoutY: 40.0
        image: serverImage
    }
    
    public-read def editionColor: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.51
        green: 0.78
        blue: 0.83
    }
    
    public-read def edColor2: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.4392157
        blue: 0.5019608
    }
    
    public-read def lblEdition: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 4.0
        layoutY: 5.0
        graphic: imageViewMedilLogo
        text: ""
        font: Arial_Bold_14
        textFill: edColor2
    }
    
    public-read def panelTitleBar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectTitlebar, lblTopPharmacyName, lblEdition, ]
    }
    
    public-read def lblLoggedBy: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind ScreenWidth-600
        layoutY: 45.0
        text: "Current User :   "
        font: Arial_Bold_14
        textFill: edColor2
    }
    
    public-read def panelMainpageComponents: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectbgTopMenus, rectBottomTaskBar, labelMarq1, menuBar, panelHighlightMenu, lblLoggedBy, panel, panelTitleBar, panelMenuBar, serverImg, labelServer, ]
    }
    
    public-read def panelMaster: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        disable: bind panelMasterDisable
        onKeyPressed: panelMasterOnKeyPressed
        onKeyReleased: panelMasterOnKeyReleased
        onMouseClicked: panelMasterOnMouseClicked
        focusTraversable: true
        content: [ panelMainpageComponents, panelReminder, panelLoginPage, panelFrm, panelControlButtons, ]
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        content: getDesignRootNodes ()
        camera: null
        fill: null
        stylesheets: bind MedeilStyle
    }
    
    public-read def Main: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public-read def sidebarState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "Hidden", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        values: [
                            sidebar.opacity => sidebar.opacity tween javafx.animation.Interpolator.DISCRETE,
                            panel.opacity => panel.opacity tween javafx.animation.Interpolator.DISCRETE,
                            panel.layoutX => panel.layoutX tween javafx.animation.Interpolator.DISCRETE,
                        ]
                        action: function() {
                            rectbgTopMenus.layoutX = 3.0;
                            rectbgTopMenus.styleClass = "ImageToolbarBg";
                            rectbgTopMenus.stroke = DarkGray;
                            rectbgTopMenus.arcWidth = 10.0;
                            rectbgTopMenus.arcHeight = 10.0;
                            rectBottomTaskBar.fill = DarkGray;
                            PrintSetupmenuItem.opacity = 1.0;
                            troubleshootingTipsMenuItem.opacity = 1.0;
                            technicalsupportMenuItem.visible = true;
                            technicalsupportMenuItem.opacity = 1.0;
                            checkForupdatesMenuItem.opacity = 1.0;
                            softwareActivationMenuItem.disable = false;
                            aboutMedilMenuItem.opacity = 1.0;
                            menuBar.layoutY = 45.0;
                            menuBar.effect = null;
                            rectMenuHome.styleClass = "rectMenuBg";
                            panelHome.visible = true;
                            rectMenuMasters.styleClass = "rectMenuBg";
                            rectMenuAppoints.styleClass = "rectMenuBg";
                            rectMenuPractises.styleClass = "rectMenuBg";
                            rectMenuSalesInve.styleClass = "rectMenuBg";
                            imgSalesInventory.image = imageFinancial;
                            panelSalesInve.disable = false;
                            rectMenuFinancial.styleClass = "rectMenuBg";
                            imgFinancial.image = imageSalesInventory;
                            panelFinance.disable = false;
                            panelFinance.onMouseClicked = panelFinanceOnMouseClickedAtShown;
                            rectMenuReports.styleClass = "rectMenuBg";
                            panelReports.disable = true;
                            panelHighlightMenu.layoutY = 72.5;
                            lblLoggedBy.font = Arial_Bold_14;
                            sidebar.layoutX = 4.0;
                            panelForm.opacity = 1.0;
                            panelForm.layoutX = 228.0;
                            panelForm.styleClass = "";
                            panelLeftMenu.opacity = 1.0;
                            rectDock.cursor = javafx.scene.Cursor.HAND;
                            rectDock.fill = DarkGray;
                            imageViewDock.opacity = 1.0;
                            imageViewDock.image = imageDock;
                            imgFormClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgFormClose.onMouseExited = imgCloseOnMouseExited;
                            panel.styleClass = "";
                            lblTopPharmacyName.effect = null;
                            panelMainpageComponents.visible = true;
                            panelMsgBox.styleClass = "";
                        }
                    }
                    javafx.animation.KeyFrame {
                        time: 100ms
                        values: [
                            sidebar.opacity => 1.0 tween javafx.animation.Interpolator.EASEIN,
                            panel.opacity => 1.0 tween javafx.animation.Interpolator.EASEIN,
                            panel.layoutX => 0.0 tween javafx.animation.Interpolator.EASEIN,
                        ]
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        values: [
                            sidebar.opacity => sidebar.opacity tween javafx.animation.Interpolator.DISCRETE,
                            panel.opacity => panel.opacity tween javafx.animation.Interpolator.DISCRETE,
                            panel.layoutX => panel.layoutX tween javafx.animation.Interpolator.DISCRETE,
                        ]
                        action: function() {
                            rectbgTopMenus.layoutX = 3.0;
                            rectbgTopMenus.styleClass = "linear-gradient";
                            rectbgTopMenus.stroke = DarkGray;
                            rectbgTopMenus.arcWidth = 5.0;
                            rectbgTopMenus.arcHeight = 5.0;
                            rectBottomTaskBar.fill = DarkGray;
                            PrintSetupmenuItem.opacity = 1.0;
                            troubleshootingTipsMenuItem.opacity = 1.0;
                            technicalsupportMenuItem.visible = true;
                            technicalsupportMenuItem.opacity = 1.0;
                            checkForupdatesMenuItem.opacity = 1.0;
                            softwareActivationMenuItem.disable = false;
                            aboutMedilMenuItem.opacity = 1.0;
                            menuBar.layoutY = 45.0;
                            menuBar.effect = null;
                            rectMenuHome.styleClass = "rectMenuBg";
                            panelHome.visible = true;
                            rectMenuMasters.styleClass = "rectMenuBg";
                            rectMenuAppoints.styleClass = "rectMenuBg";
                            rectMenuPractises.styleClass = "rectMenuBg";
                            rectMenuSalesInve.styleClass = "rectMenuBg";
                            imgSalesInventory.image = imageFinancial;
                            panelSalesInve.disable = false;
                            rectMenuFinancial.styleClass = "rectMenuBg";
                            imgFinancial.image = imageSalesInventory;
                            panelFinance.disable = false;
                            panelFinance.onMouseClicked = panelFinanceOnMouseClicked;
                            rectMenuReports.styleClass = "rectMenuBg";
                            panelReports.disable = true;
                            panelHighlightMenu.layoutY = 72.5;
                            lblLoggedBy.font = Arial_Bold_14;
                            sidebar.layoutX = 1.0;
                            panelForm.opacity = 1.0;
                            panelForm.layoutX = 232.0;
                            panelForm.styleClass = "linear-gradient";
                            panelLeftMenu.opacity = 1.0;
                            rectDock.fill = DarkGray;
                            imageViewDock.opacity = 1.0;
                            imageViewDock.image = imageDock1;
                            imgFormClose.onMouseEntered = imgFormCloseOnMouseEntered;
                            imgFormClose.onMouseExited = imgFormCloseOnMouseExited;
                            panel.styleClass = "linear-gradient";
                            lblTopPharmacyName.effect = null;
                            panelMainpageComponents.visible = true;
                            panelMsgBox.styleClass = "linear-gradient";
                        }
                    }
                    javafx.animation.KeyFrame {
                        time: 100ms
                        values: [
                            sidebar.opacity => 0.5 tween javafx.animation.Interpolator.EASEOUT,
                            panel.opacity => 1.0 tween javafx.animation.Interpolator.EASEOUT,
                            panel.layoutX => -230.0 tween javafx.animation.Interpolator.EASEOUT,
                        ]
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelMaster, panelMsgBox, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        scene
    }
    // </editor-fold>//GEN-END:main


    function panelFinanceOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        showEhr();
         }

   

    function barcodeReportmenuItemAction(): Void {
           if (userType.equals("Admin") or userType.equals("SuperAdmin")) {
           def ReportBarcodePrint=ReportBarCodePrint{};
            sidebarStatus = 1;
            HideForm();
            imgFormClose.visible = true;
            insert ReportBarcodePrint.getDesignRootNodes() into panelForm.content;
            ReportBarcodePrint.Startup();
        } else {
            Msgbox("Information", "Access Security: Current user does not have enough privilege to access Bill Print Setup. ");
      }
    }

    function panelSalesInveOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 5) {
            fadeopacFinancial.rate = -1.0;
            fadeopacFinancial.play();
       }
     }

    function panelSalesInveOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacFinancial.rate = 1.0;
        fadeopacFinancial.play();
    }

    function panelSalesInveOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
             ShowBilling();
    }

    function panelFinanceOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
       if (currModule != 6) {
            fadeopacCRM.rate = -1.0;
            fadeopacCRM.play();
       }
    }

    function panelFinanceOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacCRM.rate = 1.0;
        fadeopacCRM.play();
    }

    function panelFinanceOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
//            ShowFinancial();
        showEhr();
    }

    function panelMastersOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
          ShowMasters();
    }

    function panelPractisesOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
       if (currModule != 3) {
            fadeopacInventory.rate = -1.0;
            fadeopacInventory.play();
        }
    }

    function panelPractisesOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacInventory.rate = 1.0;
        fadeopacInventory.play();
    }

    function panelPractisesOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
         ShowPractice();
    }

    function panelAppointsOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 2) {
            fadeopacSales.rate = -1.0;
            fadeopacSales.play();
        }
     }

    function panelAppointsOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacSales.rate = 1.0;
        fadeopacSales.play();
     }

    function panelAppointsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
         ShowAppointment();
    }
	
    var  SubMenuHome : SubMenuHome ;
    var MessageBox : MessageBox ;
    var HomePage : HomePage ;
//    var SubMenuCRM : SubMenuCRM ;
    var hi : HospitalInformation ;
    var LoginPage : Login ;
    var SubMenuMasters : SubMenuMasters ;
      var SubMenuBilling : SubMenuBilling ;
        var SubMenuEhr : SubMenuEhr ;
    var SubMenuPractice : SubMenuPractice ;
    var SubMenuAppointment : SubMenuAppointment ;
    var MaintananceCost : MaintananceCost ;
	
    var MedeilStyle: String[] = bind style;	
//    var ExitfromSubmenuHome: Boolean = bind SubMenuHome.exit on replace {
//        if (ExitfromSubmenuHome == true) {
//            stageVisible = false;
//        }
//    }
    public var stageVisible: Boolean= true ;
    
    var sidebarW = 225.0;
    def MenulblLX = 0;
    def MenuRectLX = 0;
    def MenuRectH = 95;
    var MenuImgLX = 25;
    var MenuWidth = 130.0;
    var flag_alt=true; //-
    var MenuHomeLX = bind (2.32 * ScreenWidth / 100);
    var MenuMasterLX = bind (15.79 * ScreenWidth / 100);
    var MenuAppointsLX = bind (29.27 * ScreenWidth / 100);
    var MenuPractisesLX = bind (42.65 * ScreenWidth / 100);
    var MenuFinanceLX = bind (56.12 * ScreenWidth / 100);
    var MenuCRMLX = bind (69.6 * ScreenWidth / 100);
    var MenuReportsLX = bind (82.98 * ScreenWidth / 100);
    var MenulblHpos = HPos.CENTER;
    var currModule = 0 on replace {
        CommonDeclare.currModule = currModule;
        /*StopPlayTimer();*/
    }
    var panelReminderOpacity: Number = 0.0;
    var PanelReminderLX = bind ScreenWidth - 355.0;
    var PanelReminderLY = bind ScreenHeight - 170.0;
    var CloseForm = false;
    var opacClose = 0.25;
    var opacRes = 0.25;
    var opacMin = 0.25;
    var imageViewDockVisible: Boolean = true;
    var panelMasterDisable: Boolean = bind ExitMedeil;
    var ExitMedeil: Boolean = false on replace {
        if (ExitMedeil == true) {
            log.debug("ExitMedeil Memory Free:{Runtime.getRuntime().freeMemory()/(1024*1024)}, Total:{Runtime.getRuntime().totalMemory()/(1024*1024)}, Max:{Runtime.getRuntime().maxMemory()/(1024*1024)}");
            log.debug("Bye!");
            Msgbox("Confirm",CommonDeclare.exit_msg);
            ExitMedeil == false;
        }
    }
    var msgOutput: Integer = bind MessageBox.msgboxOutput on replace {
        if (msgOutput == 1 and ExitMedeil == true) {
            logout(1);
        }
        if (msgOutput == 1 and imgFormClose.visible == true and CloseForm == true) {
            delete  panelForm.content;
            imgFormClose.visible = false;
        }
        ExitMedeil = false;
        CloseForm = false;
    }
    public var userType: String = bind CommonDeclare.userType;
    var ses = bind LoginPage.ses_id;
    var hospitalName: String ;
    var hName:String = bind hi.hospitalName  on replace {
        hospitalName = hName;
    } 

	var temp = bind CommonDeclare.temp on replace {
        if (temp > 0) {
            HideSubmenu();
        } }

    function HideSubmenu(): Void {
        sidebarState.actual = -1;
        sidebarState.actual = sidebarState.findIndex("Hidden");
        CommonDeclare.DockWidth = 8;
    }

    var stageDragInitialX: Number;
    var stageDragInitialY: Number;
//Alignments
    var panelW = bind ScreenWidth;
    var panelH = bind ScreenHeight - 192;
    public def panelLY = 172;
    var sidebarH = bind panelH;
    var sidebarLY = 0;
    var sidebarStatus = 0;
//Variable Declarations
    var imgCloseOpacity: Number = bind opacClose;
    var imgRestoreOpacity: Number = bind opacRes;
    var imgMinimizeOpacity: Number = bind opacMin;
    var rectMenuHomeOpacity: Number = 0.0;
    var rectMenuSalesOpacity: Number = 0.0;
    var rectMenuInventoryOpacity: Number = 0.0;
    var rectMenuMastersOpacity: Number = 0.0;
    var rectMenuFinancialOpacity: Number = 0.0;
    var rectMenuCRMOpacity: Number = 0.0;
    var rectMenuReportsOpacity: Number = 0.0;
    var flagmaximize = 0;
    var imgLogoW = bind CommonDeclare.imgLogoW - 20;
    var imgLogoH = bind CommonDeclare.imgLogoH - 7;
    var imgMenuW = 80.0;
    var imgMenuH = 56.0;
    var MainPageFrm = bind CommonDeclare.MainPageForm on replace {
        if (CommonDeclare.MainPageForm.equals("Calculator")) {
            panelMaster.requestFocus();
        } else if (CommonDeclare.MainPageForm.trim().equals("")) {
            imgFormClose.visible = false;
        } }
		
	function InitForms(): Void {
	SubMenuHome = new SubMenuHome() ;
        SubMenuAppointment = new SubMenuAppointment() ;
        SubMenuPractice = new SubMenuPractice() ;
        MessageBox = new MessageBox() ;
        HomePage = new HomePage() ;
        hi = new HospitalInformation ();
        LoginPage = new Login() ;
        SubMenuMasters = new SubMenuMasters() ;
         SubMenuBilling = new SubMenuBilling() ;
          SubMenuEhr = new SubMenuEhr() ;
        MaintananceCost = new MaintananceCost() ;
	}			
//End of Variable Declarations
    function Msgbox(type: String, Message: String): Void {
        panelMsgBox.visible = true;
        MessageBox.MsgBox("Medeil+", type, Message);
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }

    function panelMasterOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

    }

    function rectTitlebarOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
            if(event.clickCount==2){
            imgRestoreOnMouseClicked(event);
         }
         }
    function panelMasterOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panelMaster.requestFocus();
    }
function panelMasterOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
    flag_alt=true;
    MenuWidth=130.0;
}

 function callMenus(sel): Void {

                  if (sel.equals("HELP")) {
		 Tools.Help();
		}/*else if (sel.equals("CASH")) {
		ShowSales();
		SubMenuSales.salesCash();
		}else if (sel.equals("COUNTER")) {
		ShowSales();SubMenuSales.salesCounter();		 
		}else if (sel.equals("RETURN")) {
		ShowSales();SubMenuSales.salesReturn();		
		}else if (sel.equals("MAINTENANCE")) {
		ShowSales();SubMenuSales.salesMaintain();
		} else if (sel.equals("PAYMENT")) {
                  ShowFinancial();SubMenuFinancial.loadPayment();
                } else if (sel.equals("RECEIPT")) {
                  ShowFinancial();SubMenuFinancial.loadReceipt();
                } else if (sel.equals("CREDITNOTE")) {
                  ShowFinancial();SubMenuFinancial.loadCredit();
                 }else if (sel.equals("DEBITNOTE")) {
                  ShowFinancial();SubMenuFinancial.loadDebitNote();
                 }else if (sel.equals("DAILYCASH")) {
                 ShowFinancial();SubMenuFinancial.loadDailyCashBook();
                }else if (sel.equals("APPOINTMENT")) {
		ShowAppointment();SubMenuAppointment.appointment();
                }else if (sel.equals("MANAGEAPP")) {
		ShowAppointment();SubMenuAppointment.manageAppointment();
                }else if (sel.equals("BANKACCOUNT")) {
                ShowFinancial();SubMenuFinancial.loadBankDetails();
                  } else if (sel.equals("BANKBOOK")) {
                    ShowFinancial();SubMenuFinancial.loadBankBook();
                 } else if (sel.equals("CHEQUEBOOK")) {
                 ShowFinancial();SubMenuFinancial.loadChequeBook();
                   }else if (sel.equals("CHEQUETXN")) {
                 ShowFinancial();SubMenuFinancial.loadChequeTxn();
                 }else if (sel.equals("VATREPORT")) {
                ShowFinancial();SubMenuFinancial.loadVatRegister();
               }else if (sel.equals("PRACTICE")) {
                ShowPractice();SubMenuPractice.showPrescrption();*/
              /*else if (sel.equals("ORDER")) {
                 ShowSales();SubMenuSales.purchaseOrderLoad();
            } else if (sel.equals("INVOICE")) {
                 ShowSales();SubMenuSales.purchaseLoad();
        } else if (sel.equals("PRETURN")) {
            ShowSales();SubMenuSales.purchaseReturnLoad();
        }else if (sel.equals("STOCK")) {
            ShowSales();SubMenuSales.stockLoad();
        }else if (sel.equals("SENDPO")) {
                 ShowPractice();SubMenuPractice.sendPurchaseOrderReturnLoad();
        }else if (sel.equals("EXPIRYRETURN")) {
                ShowPractice();SubMenuPractice.expiryReturnLoad();
        }else if (sel.equals("DAMAGESTOCK")) {
                 ShowPractice();SubMenuPractice.damageStockLoad();
        }*/
               ///CRM SHORTCUT CALLS
               else if (sel.equals("CUSTOMERDET")) {
                ShowMasters();SubMenuMasters.customerLoad();
             } /*else if (sel.equals("CUSTOMERALERT")) {
                 ShowCRM();SubMenuCRM.customerAlerts();
                  } else if (sel.equals("COMPLAINTREG")) {
                ShowCRM();SubMenuCRM.complaintRegister();
           } */ else if (sel.equals("DOCTORDETAILS")) {
             ShowMasters();SubMenuMasters.Load_DoctorInformation();
        }else if (sel.equals("DRUGDETAILS")) {
            ShowMasters();SubMenuMasters.Load_DrugInformation();
        } else if (sel.equals("EMPINFO")) {
            ShowMasters();SubMenuMasters.Load_EmployeeInformation();
        }/*else if (sel.equals("EMPSAL")) {
        ShowMasters();SubMenuMasters.Load_EmployeeSalaary();
        }*/else if (sel.equals("SUBHOME")) {
            ShowHome();
        }else if (sel.equals("SUBMASTERS")) {
        ShowMasters();
        }else if (sel.equals("SUBREPORT")) {
        ShowReports();
        }
    }
    public function logout(val: Integer): Void {
        try {
			if(lblEdition.text.length() > 1){
				style = "{__DIR__}MedilTheme/DefaultTheme.css";
			}
            if (not LoggedUser.trim().equals("")) {
                AsyncTask { run: function() {
                        new Autobackup().usingDump();
                     } }.start();
            }
            TopMenuOpacity0(0);
            HideForm();
            CommonDeclare.form= [0, 0, 0, 0, 0, 0, 0];
            delete  panelLoginPage.content;
            log.debug("Logout Memory Free:{Runtime.getRuntime().freeMemory()/(1024*1024)}, Total:{Runtime.getRuntime().totalMemory()/(1024*1024)}, Max:{Runtime.getRuntime().maxMemory()/(1024*1024)}");
            LoginPage.callLogin();
            insert LoginPage.getDesignRootNodes() into panelLoginPage.content;
            panelLoginPage.visible = true;
            LoginPage.panel.visible = true;
            LoginPage.status = "";

            var s = ses;
            if (not s.equals("") or s.trim().length() > 0) {
                log.debug("Class:Main Medthod : Logout()  Logout Called..");
                var query = "CALL pro_userLogout('{s}');";
             //   DBData.queryExecution(query);
            }
            if (val == 1) {
                javafx.lang.FX.exit();
            }
        } catch (e: Exception) {
            log.debug("Class:Main  Medthod : Logout() Logout Error  Exceptiion : {e}");
            javafx.lang.FX.exit();
        }
    }

    function rectTitlebarOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        stageDragInitialX = e.screenX - ScreenX;
        stageDragInitialY = e.screenY - ScreenY;
    }

    function rectTitlebarOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        ScreenX = e.screenX - stageDragInitialX;
        ScreenY = e.screenY - stageDragInitialY;
    }

    function imgRestoreOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        fadePanelReminder.rate = 1.0;
        fadePanelReminder.play();
        if (flagmaximize == 0) {
            ScreenWidth = 1024;
            ScreenHeight = Screen.primary.visualBounds.height;
            ScreenX = (Sw - ScreenWidth) / 2;
            ScreenY = Screen.primary.visualBounds.minY;
            flagmaximize = 1;
            imgRestore.image = Image { url: "{__DIR__}images/WindowMaximize.png" };
        } else {
            ScreenWidth = Sw;
            ScreenHeight = Sh;
            ScreenX = Screen.primary.visualBounds.minX;
            ScreenY = Screen.primary.visualBounds.minY;
            flagmaximize = 0;
            imgRestore.image = Image { url: "{__DIR__}images/WindowRestore.png" };
        }
    }

    function imgLogoutOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        logout(0);
    }

    function imgUpdateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        checkForupdatesMenuItemAction();
    }

    function imgHelpOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Tools.Help();
    }

    //Minimize  Button
    function imgMinimizeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (minimizable)
            minimizable = false;
        minimizable = true;
    }
//Close Button

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
      //-saran  stageVisible = false;
       ExitMedeil = true;
    }
    //Minimize,Close button Fade
    function imgMinimizeOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeMinimize.rate = -1.0;
        fadeMinimize.play();
    }
    function imgMinimizeOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeMinimize.rate = 1.0;
        fadeMinimize.play();
    }
    function imgRestoreOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeRestore.rate = -1.0;
        fadeRestore.play();
    }
    function imgRestoreOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeRestore.rate = 1.0;
        fadeRestore.play();
    }
    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
    }
    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
    }
    var fadeClose = Timeline {
                keyFrames: [
                    at (0s) {opacClose => 0.25 tween Interpolator.LINEAR},
                    at (0.1s) {opacClose => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var fadeRestore = Timeline {
                keyFrames: [
                    at (0s) {opacRes => 0.25 tween Interpolator.LINEAR},
                    at (0.1s) {opacRes => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var fadeMinimize = Timeline {
                keyFrames: [
                    at (0s) {opacMin => 0.25 tween Interpolator.LINEAR},
                    at (0.1s) {opacMin => 1.0 tween Interpolator.LINEAR},
                ]
            };

 function imgFormCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        CloseForm = true;
        Msgbox("Confirm",CommonDeclare.exitForm_msg);
   }
//Minimize,Close button Fade

    function WhiteThemeMenuItemAction(): Void {
        Apply_Theme("WhiteTheme");
    }
    function PurpleThemeMenuItemAction(): Void {
        Apply_Theme("PurpleTheme");
    }
    function OrangeThemeMenuItemAction(): Void {
        Apply_Theme("OrangeTheme");
    }

    function greenThemeMenuItemAction(): Void {
        Apply_Theme("GreenTheme");
    }

    function BlueThemeMenuItemAction(): Void {
        Apply_Theme("BlueTheme");
    }

    function defaultThemeMenuItemAction(): Void {
        Apply_Theme("DefaultTheme");
    }

    function Apply_Theme(theme_medeil: String): Void {        
      //  Theme.ApplyTheme("{theme_medeil}");
        getUserInfo.setThemeType(CommonDeclare.user, theme_medeil);
        style = "{__DIR__}MedilTheme/{theme_medeil}.css";		
    }

    function helpMenuOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    //        HideMsgbox
    }

    function settingsMenuOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    //        HideMsgbox
    }

    function toolsMenuOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    //        HideMsgbox
    }

    function fileMenuOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    //        HideMsgbox
    }

    function menuBarOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    }

    function notepadMenuItemAction(): Void {
        sidebarStatus = 1;
        HideForm();
        imgFormClose.visible = true;
        def Notepad = Notepad {};
         insert Notepad.getDesignRootNodes() into panelForm.content;
    }

    function calculatorMenuItemAction(): Void {
        delete  panelFrm.content;
        def Calculator = Calculator {};
        Calculator.Show();
        CommonDeclare.MainPageForm = "Calculator";
        insert Calculator.getDesignRootNodes() into panelFrm.content;
        panelFrm.visible = true;
    }
//Settings Menu

    function menuItemSettingsAction(): Void {
        if (userType.equals("Admin") or userType.equals("SuperAdmin")) {
            HideForm();
            sidebarStatus = 1;
            def settings= Settings {};
           settings.Startup();
           imgFormClose.visible = true;
             insert settings.getDesignRootNodes() into panelForm.content;
        } else {
            Msgbox("Information", "Access Security: Current user does not have enough privilege to access Settings. ");
        }
    }
    function PrintSetupmenuItemAction(): Void {
        if (userType.equals("Admin") or userType.equals("SuperAdmin")) {
           def BillPrintSetup=NewbillFormat{};
            sidebarStatus = 1;
            HideForm();
            imgFormClose.visible = true;
             BillPrintSetup.Startup();
            insert BillPrintSetup.getDesignRootNodes() into panelForm.content;
        } else {
            Msgbox("Information", "Access Security: Current user does not have enough privilege to access Bill Print Setup. ");
        }

       
    }
    function userInformationMenuItemAction(): Void {
        if(productType.equals("Free")){
       Msgbox("Information", CommonDeclare.edition_msg);
         }
       else if(not productType.equals("Free")){
        if (userType.equals("Admin") or userType.equals("SuperAdmin")) {
            def userInformation = UserInformation {};
            sidebarStatus = 1;
            HideForm();
            imgFormClose.visible = true;
            insert userInformation.getDesignRootNodes() into panelForm.content;
        } else {
            Msgbox("Information", "Access Security: Current user does not have enough privilege to access User Information. ");
        }
    }
    }

    function shopInformationMenuItemAction(): Void {
        if (userType.equals("Admin") or userType.equals("SuperAdmin")) {
            sidebarStatus = 1;
            HideForm();
            imgFormClose.visible = true;
            hi.Startup();
            insert hi.getDesignRootNodes() into panelForm.content;
        } else {
            Msgbox("Information", "Access Security: Current user does not have enough privilege to access Shop Information. ");
        }
    }

    function maintananceCostMenuItemAction(): Void {
     if(productType.equals("Lite") or productType.equals("Free")){
       Msgbox("Information", CommonDeclare.edition_msg);
        }else{             
	sidebarStatus = 1;
        currModule = 8;
        HideForm();
        imgFormClose.visible = true;
        MaintananceCost.StartUp();
        insert MaintananceCost.getDesignRootNodes() into panelForm.content;
        }
    }

//  help Menu
    function englishManualMenuItemAction(): Void {
        Tools.EnglishManual();
    }

    function aboutMedilMenuItemAction(): Void {
        def About = About {};
        About.Show();
        delete  panelFrm.content;
        insert About.getDesignRootNodes() into panelFrm.content;
        panelFrm.visible = true;
    }

    function technicalsupportMenuItemAction(): Void {
        def Support = TechnicalSupport {};
        Support.Show();
        delete  panelFrm.content;
        insert Support.getDesignRootNodes() into panelFrm.content;
        panelFrm.visible = true;
    }
 function shortCutMenuItemAction(): Void {
       Tools.ShortCutLoader();
         }
    function troubleshootingTipsMenuItemAction(): Void {
        Tools.Tips();
    }

    function checkForupdatesMenuItemAction(): Void {
        if(productType.equalsIgnoreCase("Free")) {
		Tools.LaunchActivator(1);
	   }
	  else {
      	Tools.CheckUpdate();
	  }
	   
    }

    function softwareActivationMenuItemAction(): Void {
        Tools.LaunchActivator(1);
    }

    function exitMenuItemAction(): Void {
        ExitMedeil = true;
    }

////Menu--Reports                                                                                            
    function panelReportsOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 7) {
            fadeopacReports.rate = -1.0;
            fadeopacReports.play();
        }
    }

    function panelReportsOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacReports.rate = 1.0;
        fadeopacReports.play();
    }

    function panelReportsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ShowReports();
    }
////Menu--CRM
    function panelCRMOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 6) {
            fadeopacCRM.rate = -1.0;
            fadeopacCRM.play();
        } }
    function panelCRMOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacCRM.rate = 1.0;
        fadeopacCRM.play();
    }

    ////Menu--Financial
    function panelFinancialOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 5) {
            fadeopacFinancial.rate = -1.0;
            fadeopacFinancial.play();
        // StateShow();
        } }

    function panelFinancialOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacFinancial.rate = 1.0;
        fadeopacFinancial.play();
    }


////Menu--MenuMasters

    function panelMastersOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
           if (currModule != 4) {
            fadeopacMasters.rate = -1.0;
            fadeopacMasters.play();
          }
    }

    function panelMastersOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacMasters.rate = 1.0;
        fadeopacMasters.play();
    }

    ////Menu--Inventory
    function panelInventoryOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacInventory.rate = 1.0;
        fadeopacInventory.play();
    }

    function panelInventoryOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 3) {
            fadeopacInventory.rate = -1.0;
            fadeopacInventory.play();
        } }


    ////Menu--Sales

    function panelSalesOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 2) {
            fadeopacSales.rate = -1.0;
            fadeopacSales.play();
        }
    }
    function panelSalesOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacSales.rate = 1.0;
        fadeopacSales.play();
    }
//end Menu Sales    //Menu--Home
    function panelHomeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ShowHome();
    }

    function panelHomeOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if (currModule != 1) {
            fadeopacHome.rate = -1.0;
            fadeopacHome.play();
        } }

    function panelHomeOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeopacHome.rate = 1.0;
        fadeopacHome.play();
    }
//end Home menu

    //Show and Hide Left Dock
    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (sidebarState.actual <= 0) {
            sidebarState.actual = sidebarState.findIndex("Hidden");
            CommonDeclare.DockWidth = 8;
        } else {
            if (sidebarStatus == 0) {
                if (currModule != 0) {
                    sidebarState.actual = sidebarState.findIndex("Shown");
                    CommonDeclare.DockWidth = 237;
                } } }
    }

    function imageViewDockOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        if (sidebarStatus == 0) {
            if (currModule != 0) {
                sidebarState.actual = sidebarState.findIndex("Shown");
                CommonDeclare.DockWidth = 237;
            } }
    }

    //********** Functions **********//
    function HideForm(): Void {
        delete  panelFrm.content;
        panelFrm.visible = false;
        delete  panelForm.content;
        delete  panelLeftMenu.content;
        HideSubmenu();
    }

    function deleteSubmenu(): Void {
        CommonDeclare.DockWidth = 237;
        CommonDeclare.temp = 0;
        delete  panelLeftMenu.content;
        delete  panelForm.content;
        sidebarState.actual = sidebarState.findIndex("Shown");
    }

    var CurrentForm = bind CommonDeclare.form;
  //Display side menus
var ModuleRestrict_Msg="Sorry! Access Denied :Current user does not have permission to open this module";
    function ShowHome(): Void {
        TopMenuOpacity0(1);
        insert SubMenuHome.getDesignRootNodes() into panelLeftMenu.content;
        rectMenuHomeOpacity = 0.5;
    }

    function ShowAppointment() {
       if(getUserInfo.getPriv("appointment",LoggedUser)==false) {
            Msgbox("Information", ModuleRestrict_Msg);
        }
        else{
        TopMenuOpacity0(2);
        insert SubMenuAppointment.getDesignRootNodes() into panelLeftMenu.content;
        rectMenuSalesOpacity = 0.5;
        }
   }

    function ShowMasters() {
        if(getUserInfo.getPriv("masters",LoggedUser)==false){
        Msgbox("Information", ModuleRestrict_Msg);}
        else{
        TopMenuOpacity0(4);
        insert SubMenuMasters.getDesignRootNodes() into panelLeftMenu.content;
        rectMenuMastersOpacity = 0.5;     
    }}

    function ShowBilling(){
        System.out.println("Billing");
         if(getUserInfo.getPriv("billing",LoggedUser)==false){
             System.out.println("Billing2");
        Msgbox("Information", ModuleRestrict_Msg);}
        else{
            System.out.println("Billing3");
        TopMenuOpacity0(5);
        insert SubMenuBilling.getDesignRootNodes() into panelLeftMenu.content;
        rectMenuFinancialOpacity = 0.5;
    }
        }

        function showEhr(){
        if(getUserInfo.getPriv("ehr",LoggedUser)==false){
        Msgbox("Information", ModuleRestrict_Msg);}
        else{
        TopMenuOpacity0(6);
        insert SubMenuEhr.getDesignRootNodes() into panelLeftMenu.content;
        rectMenuCRMOpacity = 0.5;
    }
        }

    function ShowPractice() {
        if(getUserInfo.getPriv("practice",LoggedUser)==false){
        Msgbox("Information", ModuleRestrict_Msg);}
        else{
        TopMenuOpacity0(3);
        insert SubMenuPractice.getDesignRootNodes() into panelLeftMenu.content;
        rectMenuInventoryOpacity = 0.5;
    }
    }

    function ShowReports() {
        TopMenuOpacity0(0);
        if (getUserInfo.getPriv("reports", LoggedUser) == false) {
            Msgbox("Information", ModuleRestrict_Msg); } else {
            if (Tools.LaunchMedeil_Reports()) {
                Msgbox("Information", "Another instance of Report is running. Please try again later");
            } else {
                //                TopMenuOpacity0(7);
                HideForm();
                rectMenuReportsOpacity = 0.5;
            }
         }
    }
//All Top Menu opacity zero

    function TopMenuOpacity0(i: Integer): Void {
        imgFormClose.visible = false;
        sidebarStatus = 0;
        deleteSubmenu();
        currModule = i;
        rectMenuHomeOpacity = rectMenuSalesOpacity = rectMenuInventoryOpacity = rectMenuMastersOpacity = rectMenuFinancialOpacity = rectMenuCRMOpacity = rectMenuReportsOpacity = 0.0;
	//  rectMenuHomeOpacity = rectMenuSalesOpacity = rectMenuInventoryOpacity = rectMenuMastersOpacity =  rectMenuCRMOpacity = rectMenuReportsOpacity = 0.0;
    }

    function imgFormCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeFormClose.rate = -1.0;
        fadeFormClose.play();
    }

    function imgFormCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeFormClose.rate = 1.0;
        fadeFormClose.play();
    }

    var opacFormClose = 0.5;
    var fadeFormClose = Timeline {
                keyFrames: [
                    at (0s) {opacFormClose => 0.5 tween Interpolator.LINEAR},
                    at (0.1s) {opacFormClose => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacHome = Timeline {
                keyFrames: [
                    at (0s) {rectMenuHomeOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuHomeOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuHomeOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacSales = Timeline {
                keyFrames: [
                    at (0s) {rectMenuSalesOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuSalesOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuSalesOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacInventory = Timeline {
                keyFrames: [
                    at (0s) {rectMenuInventoryOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuInventoryOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuInventoryOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacMasters = Timeline {
                keyFrames: [
                    at (0s) {rectMenuMastersOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuMastersOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuMastersOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacFinancial = Timeline {
                keyFrames: [
                    at (0s) {rectMenuFinancialOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuFinancialOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuFinancialOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacCRM = Timeline {
                keyFrames: [
                    at (0s) {rectMenuCRMOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuCRMOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuCRMOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadeopacReports = Timeline {
                keyFrames: [
                    at (0s) {rectMenuReportsOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.15s) {rectMenuReportsOpacity => 0.25 tween Interpolator.LINEAR},
                    at (0.3s) {rectMenuReportsOpacity => 0.5 tween Interpolator.LINEAR},
                ]
            };
    var fadePanelReminder = Timeline {
                keyFrames: [
                    at (0s) {panelReminderOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.2s) {panelReminderOpacity => 1.0 tween Interpolator.LINEAR},
                ]
            };

    function LaunchError(msg: String): Void {
//        MessageBox.MsgBox("Login", "Error", msg);
        MessageBox.MsgBox("Login", "Confirm", msg);
        delete  panelMaster.content;
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;        
        log.debug("Class:Main  Method : LaunchError  Unable to Launch MEDEIL+ !");
    }
    
    function MenuBarConfig() : JMenuBar {
		var jMenuBar = new JMenuBar();	
        var handler = ActionListener {
            public override function actionPerformed(e: ActionEvent) {
                try {
                    if( LoginPage.panel.visible ){
                       LoginPage.txtUser.requestFocus();
                    } else {
                        callMenus("{e.getActionCommand()}");
                    }
                } catch(ex:Exception){
                    log.debug("Main Actionlisttener MenuInit:{ex.getMessage()}");
                    ex.printStackTrace();
                }
            }
        };        
        // HOME MENU SHORT CUT MENU SET//
        var menu = new JMenu("HOME");
        jMenuBar.add(menu);
        var menuItem = new JMenuItem("GSEARCH");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_G, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("APPOINTMENT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("MANAGEAPP");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_M, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("BACKUP");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_K, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menu = new JMenu("Manual");
        jMenuBar.add(menu);
        menuItem = new JMenuItem("HELP");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_F1, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menu = new JMenu("MenuShortcutr");
        jMenuBar.add(menu);
        menuItem = new JMenuItem("SUBHOME");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_1, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SUBSALES");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_2, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SUBINVEN");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_3, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SUBMASTERS");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_4, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SUBFINANCE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_5, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SUBCRM");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_6, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SUBREPORT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_7, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("SALESPURCHASE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_W, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        // SALES MENU SHORTCUT SET
        menu = new JMenu("SALES");
        jMenuBar.add(menu);
        menuItem = new JMenuItem("CASH");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("COUNTER");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("RETURN");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_R, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("MAINTENANCE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_M, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menu = new JMenu("FINANCE");
        jMenuBar.add(menu);
        menuItem = new JMenuItem("PAYMENT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("RECEIPT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("CREDITNOTE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_N, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("DEBITNOTE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_B, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("DAILYCASH");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_K, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        /*menuItem = new JMenuItem("BANKACCOUNT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("BANKBOOK");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_J, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("CHEQUEBOOK");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Q, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("CHEQUETXN");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_W, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);*/
        menuItem = new JMenuItem("VATREPORT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_V, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        // CRM ShrtCut Keys
        menu = new JMenu("CRM");
        jMenuBar.add(menu);
        menuItem = new JMenuItem("CUSTOMERDET");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_C, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        /*menuItem = new JMenuItem("CUSTOMERALERT");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_A, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("COMPLAINTREG");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_L, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menu = new JMenu("PURCHASE");
        jMenuBar.add(menu);*/

        menuItem = new JMenuItem("ORDER");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("PRACTICE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_P, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("INVOICE");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_I, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("PRETURN");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_U, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("STOCK");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_T, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        /*menuItem = new JMenuItem("SENDPO");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_H, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("EXPIRYRETURN");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_X, ActionEvent.CTRL_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);*/

///MASTER MENU SHORTCUT
        menu = new JMenu("MASTER");
        //-    menu.setMnemonic(KeyEvent.VK_2);
        jMenuBar.add(menu);

        menuItem = new JMenuItem("DRUGDETAILS");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_D, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("HOSPITALDETAILS");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_H, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("DISTDETAILS");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_S, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
        menuItem = new JMenuItem("DOCTORDETAILS");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_O, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("EMPINFO");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_E, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);

        menuItem = new JMenuItem("EMPSAL");
        menuItem.setAccelerator(KeyStroke.getKeyStroke(KeyEvent.VK_Y, ActionEvent.ALT_MASK));
        menuItem.addActionListener(handler);
        menu.add(menuItem);
		
		return jMenuBar;
	}	
	
    //********** Functions **********//
    var activationProcess ;
    init {
		commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
		log.debug("Init : starting");
        if (ScreenWidth < 1024 or ScreenHeight < 768) {
           LaunchError("Resolution Error: Minimum required screen resolution for running Medeil is 1024 X 768 ");
        }
        var logReg = new LogReg();
        var tt = logReg.temp();
        activationProcess = new ActivationProcess();
        if (tt.equals("Error")) {
            LaunchError("Sorry! Medeil application doesn't connect with database. Please get a support from www.medeil.com . ");
        } else {
            var temp = 0;
            try {
                var activateStatus: String = activationProcess.getActivationStatus();
                if (not activateStatus.equals("Free") and not activateStatus.equals("Trial")) {
                    if (activateStatus.equals("expiry") or activateStatus.equals("expiryWarning")) {
                        ShowExpiryAlert();
                    } else if (activateStatus.equals("crash")) {
                        LaunchError("Error: Medeil+ has been crashed.Please re-install Medeil+ or contact  www.medeilplus.com ");
                        Tools.LaunchActivator(0);
                    } else if (activateStatus.equals("configuration")) {
                        LaunchError("System Configuration has been changed.Please Contact www.medeilplus.com");
                        Tools.LaunchActivator(0);
                    }
                }
            } catch (e: Exception) {
                log.debug("Class : Main   NullPoint Exception {e.getMessage()}");
                LaunchError("Class:Main Unable to launch Medeil+. Please contact us www.medeilplus.com");
                temp = 1;
            }
        }
        

        var fxMenuBar: SwingComponent = SwingComponent.wrap(MenuBarConfig());
        fxMenuBar.layoutX = 0;
        fxMenuBar.layoutY = 0;
        fxMenuBar.styleClass = "menu";
        fxMenuBar.font = Arial_Bold_12;
        fxMenuBar.visible = false;

        if (temp == 0) {			
			MenuInit();
            /*shop = " {commonController.ShopName()}";
            lblEdition.text = "{activationProcess.Version} Edition";
            LoginPage.lblEdition.text = HomePage.lblEdition.text = lblEdition.text;

            try {
                new GetCompanyInfo().get();
            } catch (e) {
                log.debug("Class:Main  Exception at medeil main StartUp() unable to get Company Information: {e.getMessage()}");
            }*/
            def imgMinimize = ImageView {
                        opacity: bind imgMinimizeOpacity
                        cursor: javafx.scene.Cursor.DEFAULT
                        layoutX: bind ScreenWidth - 90
                        layoutY: 4.0
                        onMouseClicked: imgMinimizeOnMouseClicked
                        onMouseEntered: imgMinimizeOnMouseEntered
                        onMouseExited: imgMinimizeOnMouseExited
                        image: imageMinimize
                    }
            def imgClose = ImageView {
                        opacity: bind imgCloseOpacity
                        cursor: javafx.scene.Cursor.DEFAULT
                        layoutX: bind ScreenWidth - 30
                        layoutY: 4.0
                        onMouseClicked: imgCloseOnMouseClicked
                        onMouseEntered: imgCloseOnMouseEntered
                        onMouseExited: imgCloseOnMouseExited
                        image: imageClose
                    }
            panelControlButtons.content = [imgMinimize, imgRestore, imgClose,];
            def imgCorner = ImageView {
                        opacity: 1.0
                        cursor: javafx.scene.Cursor.SE_RESIZE
                        layoutX: bind ScreenWidth - 22
                        layoutY: bind ScreenHeight - 22
                        image: Image { url: "{__DIR__}images/CornerDotted.png" }
                    }
                   
            var lblUserName = Label {
                        width: 200.0
                        height: 23.0
                        layoutX: bind lblLoggedBy.layoutX + lblLoggedBy.width + 20.0
                        layoutY: 45.0
                        text: bind LoggedUser
                        font: Arial_Bold_18
                        textFill: javafx.scene.paint.Color.GREEN
                    }
            def lblTM: javafx.scene.control.Label = javafx.scene.control.Label {
                        layoutY: -8.0
                        text: "TM"
                        font: Arial_Bold_Italic_7
                        textFill: javafx.scene.paint.Color.WHITE
                    }
            def lblVanuston: javafx.scene.control.Label = javafx.scene.control.Label {
                        graphic: lblTM
                        text: "Vanuston"
                        font: Arial_Bold_Italic_12
                        graphicHPos: javafx.geometry.HPos.RIGHT
                        textFill: javafx.scene.paint.Color.WHITE
                    }
            def lblCompanyName: javafx.scene.control.Label = javafx.scene.control.Label {
                        layoutX: 15.0
                        layoutY: bind ScreenHeight - 18
                        graphic: lblVanuston
                        text: "Powered by"
                        font: Arial_Italic_12
                        graphicHPos: javafx.geometry.HPos.RIGHT
                        textFill: javafx.scene.paint.Color.WHITE
                    } 				
            var dx;
            var dy;
            def rectBackgroundMain: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
                        visible: true
                        opacity: 1.0
                        cursor: null
                        layoutX: 2.0
                        layoutY: 1.0
                        styleClass: "linear-gradient"
                        stroke: DarkGray
                        strokeWidth: 4.0
                        width: bind ScreenWidth - 4
                        height: bind ScreenHeight - 4
                        arcWidth: 5.0
                        arcHeight: 5.0

                        onMouseMoved: function(e: javafx.scene.input.MouseEvent): Void {
                            var dxx = ScreenWidth - e.x;
                            var dyy = ScreenHeight - e.y;
                            if (dxx < 20 and dyy < 20) {
                                rectBackgroundMain.cursor = Cursor.SE_RESIZE;
                            } else if (dxx < 10 and dyy > 10) {
                                rectBackgroundMain.cursor = Cursor.H_RESIZE;
                            } else if (dxx > 10 and dyy < 10) {
                                rectBackgroundMain.cursor = Cursor.V_RESIZE;
                            } else {
                                rectBackgroundMain.cursor = Cursor.DEFAULT;
                            }
                        }
                        onMousePressed: function(e: javafx.scene.input.MouseEvent): Void {
                            dx = ScreenWidth - e.x;
                            dy = ScreenHeight - e.y;
                        }
                        onMouseDragged: function(e: javafx.scene.input.MouseEvent): Void {
                            if (dx < 20 and dy < 20) {
                                ScreenWidth = e.x + dx;
                                ScreenHeight = e.y + dy;
                            } else if (dx < 10 and dy > 10) {
                                ScreenWidth = e.x + dx;
                            } else if (dx > 10 and dy < 10) {
                                ScreenHeight = e.y + dy;
                            }
                            if (ScreenWidth <= 1024) { ScreenWidth = 1024 }
                            if (ScreenHeight <= 734) { ScreenHeight = 734 }
                        }
                    }
            def rectF = for (i in [0..6]) Rectangle {
                            opacity: 0.5;
                            layoutX: rectMenuWidth-20.0;
                            layoutY: 75.0;
                            styleClass: "rectMenuBg"
                            strokeWidth: 3.0;
                            width: 20.0;
                            height: 20.0;
                            arcWidth: 5.0;
                            arcHeight: 5.0;
                            visible: bind flag_alt;
                        };
            def labelFtext: String[] = ["1", "3", "4", "2",  "5", "6", "7"];
            var labelF = for (i in [0..6]) Label {
                            layoutY: 76.0
                            layoutX: rectMenuWidth-15.0
                            width: 20.0
                            height: 20.0
                            text: bind labelFtext[i]
                            textFill: DarkGray
                            font: Arial_Bold_18
                            hpos: javafx.geometry.HPos.CENTER
                            vpos: javafx.geometry.VPos.CENTER
                            visible: bind flag_alt;
                        }
            def lblMainMenutext: String[] = ["HOME",  "APPOINTMENT", "PRACTICE MGT", "MASTERS", "BILLING", "EHR", "REPORTS"];
            def lblMainMenu = for (i in [0..6]) Label {
                            cursor: javafx.scene.Cursor.HAND
                            layoutX: bind MenulblLX
                            layoutY: 75.0
                            width: bind MenuWidth
                            text: bind lblMainMenutext[i]
                            font: MasterMenu
                            hpos: bind MenulblHpos
                        }
            def tooltipContent: String[] = [" LogOut ", "Update ", "Help "];
            def tooltip = for (i in [0..2]) javafx.scene.control.Tooltip {
                            text: bind tooltipContent[i]
                            font: Arial_Bold_12
                        }
            def textbox = for (i in [0..2]) TextBox {
                            opacity: 0.0
                            layoutX: 0.0
                            layoutY: 0.0
                            width: 15.0
                            height: 15.0
                            focusTraversable: false
                            tooltip: tooltip[i]
                        }
            groupLogout.content = [textbox[0], imgLogout,];
            groupUpdate.content = [textbox[1], imgUpdate,];
            groupHelp.content = [textbox[2], imgHelp,];

            panelHome.content = [rectMenuHome, imgHome, lblMainMenu[0], rectF[0], labelF[0]];
            panelAppoints.content = [rectMenuAppoints, imgScheduler, lblMainMenu[1], rectF[1], labelF[1]];
            panelPractises.content = [rectMenuPractises, imgPractise, lblMainMenu[2], rectF[2], labelF[2]];
            panelMasters.content = [rectMenuMasters, imgMaster, lblMainMenu[3], rectF[3], labelF[3]];
            panelSalesInve.content = [rectMenuSalesInve, imgSalesInventory, lblMainMenu[4], rectF[4], labelF[4]];
            panelFinance.content = [rectMenuFinancial, imgFinancial, lblMainMenu[5], rectF[5], labelF[5]];
            panelReports.content = [rectMenuReports, imgReports, lblMainMenu[6], rectF[6], labelF[6]];

//        var txtWeidth=expiryDruugName.length()*4.5;
//        var textScrollerObj = TextScroll {
//                text: bind expiryDruugName;
//                width: 1000.00 //bind (ScreenWidth-200.0) ;
//                height: 250;
//             //   stroke: Color.BLUE
//              //  strokeWidth: 2.0
//             //  styleClass: "marquees"
//
//            // style : "font-family:Arial;font-size: 8pt; color:WHITE;"
//            }
//
//        textScrollerObj.scrollUp(txtWeidth);
            if (productType.equalsIgnoreCase("Free")) {
                checkForupdatesMenuItem.text = "Upgrade Edition";
            } else {
                checkForupdatesMenuItem.text = "Check For Updates";
            }



            panelMainpageComponents.content = [rectBackgroundMain, rectbgTopMenus, rectBottomTaskBar, lblUserName, imgCorner, menuBar, lblLoggedBy, lblCompanyName, panel, panelTitleBar, panelHighlightMenu, panelMenuBar, fxMenuBar, labelServer, serverImg];
            /*panelMainpageComponents.content = [rectBackgroundMain, rectbgTopMenus, rectBottomTaskBar, imgCorner, menuBar, panel, panelTitleBar, panelHighlightMenu, panelMenuBar, fxMenuBar, labelServer, serverImg,labelMarq];*/
            TopMenuOpacity0(0);
            HideSubmenu();
			
            delete  panelHomePage.content;
            HomePage.Show();
            insert HomePage.getDesignRootNodes() into panelHomePage.content;

            delete  panelMenuBar.content;
            def Date = Date {};
            Date.Startup();
            insert Date.getDesignRootNodes() into panelMenuBar.content;

            delete  panelLoginPage.content;
			LoginPage.callLogin();
            LoginPage.txtUser.requestFocus();
            LoginPage.Startup();
            insert LoginPage.getDesignRootNodes() into panelLoginPage.content;

            Tools.Reset_Reports_Launch();

        /*StopPlayTimer();*/
        } else {
            Tools.LaunchActivator(0);
        }
		log.debug("Init : End");

    }
	function ShowExpiryAlert(): Void {
            def ProductExpiryAlert = ProductExpiryAlert {};
            ProductExpiryAlert.Show();
			//delete  panelMaster.content;
            delete  panelMsgBox.content;
            insert ProductExpiryAlert.getDesignRootNodes() into panelMaster.content;
		}
    	function MenuInit () : Void {
            InitForms();
            //Apply_Theme("DefaultTheme");
            productType=getPro.getStatus();
            hospitalName = " {commonController.HospitalName()}";
            lblEdition.text = "{activationProcess.Version} Edition";
            LoginPage.lblEdition.text = HomePage.lblEdition.text = lblEdition.text;
            try {
                new GetCompanyInfo().get();
            } catch (e) {
                log.debug("Class:Main  Exception at medeil main StartUp() unable to get Company Information: {e.getMessage()}");
            }
	}
		
    public function StartUp(): Void {
      log.debug("StartUp() : starting");
      println("Welcome to MEDEIL+ !");
	  org.apache.log4j.PropertyConfigurator.configure("log4j.properties");
      log.debug("Welcome to MEDEIL+ !");
        try {
//            UIManager.setLookAndFeel("com.vanuston.medeil.util.plaf.MintLookAndFeel");
            UIManager.setLookAndFeel("javax.swing.plaf.metal.MetalLookAndFeel");
        } catch (e) {
			e.printStackTrace();
            log.debug("Class:Main Exception at medeil main StartUp():{e.getMessage()}");
        }

         var tray: SystemTray = SystemTray.getSystemTray();
        var trayIcon: TrayIcon;
        var popup: PopupMenu = new PopupMenu();
        var mItem1: MenuItem = new MenuItem("Open Medeil");
        var mItem2: MenuItem = new MenuItem("Quit");
        var img = Toolkit.getDefaultToolkit().getImage(getClass().getResource("images/LogoMedil.png"));
        popup.add(mItem1);
        popup.add(mItem2);
         trayIcon = new TrayIcon(img, "Medeil+", popup);
         tray.add(trayIcon);
         trayIcon.setImageAutoSize(true);

        mItem1.addActionListener(ActionListener {
            public override function actionPerformed(e: ActionEvent) {
                // Place Maximize Coding Here.
                minimizable = false;
                stageVisible = true;
            }
        });

        mItem2.addActionListener(ActionListener {
            public override function actionPerformed(e: ActionEvent) {
                //Place Process Exit Coding Here.
                minimizable = false;
                stageVisible = true;
                ExitMedeil = true;
            }
        });

        trayIcon.addActionListener(ActionListener {
            public override function actionPerformed(e: ActionEvent) {
                // Place Maximize Coding Here.
                minimizable = false;
                stageVisible = true;
            }
        });
    }                                ////////////////////////  Medeil Initial Running Stage    ///////////////////////
}

function run (): Void {
	Logger.getLogger(Main.class, "Main").debug("run() : bf Server startup");
	ServerSkeletonFactory.run(RegistryFactory.serverPort);
	Logger.getLogger(Main.class, "Main").debug("run() : Server successfully started...");	
    var design = new Main ();
    design.StartUp();
    
    javafx.stage.Stage {
    title:"Medeil+";
    style: StageStyle.TRANSPARENT
    x: bind ScreenX;
    y: bind ScreenY;
    visible: bind design.stageVisible;
    width: bind ScreenWidth ;
    height: bind ScreenHeight;
    iconified: bind minimizable with inverse;
    icons: [Image {url: "{__DIR__}images/LogoMedil.png"}];
    scene: design.getDesignScene ();
public override function close() : Void{
        design.logout(1);
    }
}
}
