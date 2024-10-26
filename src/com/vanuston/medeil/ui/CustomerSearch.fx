package com.vanuston.medeil.ui;
import javafx.scene.image.Image;
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
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.sql.ResultSet;
import java.lang.Class;
//sabarish  import com.vanuston.medeil.uitables.SalesMaintainLoadTable;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.uitables.customerSearch;
import javafx.ext.swing.SwingComponent;

public class CustomerSearch {
 //def  Consult = Consultation{};
    var sdf = new SimpleDateFormat("dd-MM-yyyy");
    var rowNo = 1;
    //sabarish var colNames: Object[] = ["S.No", "Customer Name", "Mobile", "City", "Last Visit", "Last billNo", "Credit Limit"];
    var colNames: Object[] = ["Customer Code", "Customer Name", "Mobile", "City", "Age"];//sabarish
   //sabarish var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Double.class];
   var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class];//sabarish
   //sabarish var colEditable: Boolean[] = [false, false, false, false, false, false, false, false];
    var colEditable: Boolean[] = [false, false, false, false, false];//sabarish
    //sabarish var colWidth: Integer[] = [100, 100, 100, 133, 100, 70, 50, 80];
    var colWidth: Integer[] = [
        100, 100, 100, 100, 100];//sabarish
    var SalesMaintainLoadTableold = new customerSearch();
    var table = SalesMaintainLoadTableold.createViewTable(rowNo, colNames, colType, colEditable, colWidth);
    var SalesLoad = SwingComponent.wrap(SalesMaintainLoadTableold.getScrollTable(table));
    var rs: ResultSet = null;
    var dateFlag: Boolean = false;
    var dateFlag1: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(CustomerSearch.class, "Sales");
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
    var botton31LX = bind CommonDeclare.botton31LX;
    var botton32LX = bind CommonDeclare.botton32LX;
    var botton33LX = bind CommonDeclare.botton33LX;
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
    var TableH = 310.0 on replace {
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
    var empCode:String[] = commonController.getEmployeeCode("").toArray() as String[];    
    var salesCnt:String;
    var salesTotal:String;    
    var Consult = Consultation{};
    var Medical= MedicalHistoryview{};
  

    var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelEditTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelTableLX
    }
    
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
    
    def __layoutInfo_btnSaleMnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+50
        height: bind bottonH
    }
    public-read def btnSaleMnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton31LX-40
        layoutY: bind bottonLY
        layoutInfo: __layoutInfo_btnSaleMnEdit
        graphic: imgEdit
        text: "Edit [F6]"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnReprint: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+60
        height: bind bottonH
    }
    public-read def btnSaleMnReprint: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton32LX
        layoutInfo: __layoutInfo_btnSaleMnReprint
        graphic: imageView5
        text: "Button"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnCancelForm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def btnSaleMnCancelForm: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton33LX+40
        layoutInfo: __layoutInfo_btnSaleMnCancelForm
        graphic: imageView4
        text: "Button"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnPrint: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnPrint: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton1LX
        layoutInfo: __layoutInfo_btnSaleMnPrint
        onKeyPressed: btnSaleMnPrintOnKeyPressed
        graphic: imageView3
        text: "Button"
    }
    
    public-read def imgUpdate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def lblCount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+45
        layoutY: bind panelH -50
        text: "Label"
    }
    
    def __layoutInfo_lblSalesCount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblSalesCount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX
        layoutY: bind panelH-50
        layoutInfo: __layoutInfo_lblSalesCount
        styleClass: "Borderless-text-box"
        text: bind salesCnt
    }
    
    def __layoutInfo_lblSalesTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+150
        layoutY: bind panelH-50
        layoutInfo: __layoutInfo_lblSalesTotal
        styleClass: "Borderless-text-box"
        text: bind salesTotal
    }
    
    public-read def rdoSearch2: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-18
        layoutY: 50.0
        text: "Radio Button"
        selected: false
    }
    
    public-read def rdoSearch: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-18
        layoutY: 50.0
        text: "Radio Button"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind 2 * ten
        layoutY: 85.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_optSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def optSearch: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_optSearch
        items: [ "Customer Name", "Mobile Number", "Customer Code", ]
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW+2
        layoutY: 0.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 36.0
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 613.0
        layoutY: 143.0
        layoutInfo: __layoutInfo_separator3
        vertical: true
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 540.0
        layoutY: 124.0
        text: "Label"
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 649.0
        layoutY: 124.0
        text: "Label"
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 100.0
        text: "Label"
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 120.0
        text: "Label"
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+10
        layoutY: 108.0
        text: "Label"
    }
    
    def __layoutInfo_label7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 134.0
        layoutInfo: __layoutInfo_label7
        text: "Label"
    }
    
    public-read def imgSaleMnDateEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+202
    }
    
    public-read def employee_id: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 0.0
        text: "Label"
    }
    
    public-read def cboEmp_code: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 0.0
        items: bind empCode
    }
    
    public-read def lblTotalMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX
        text: "Label"
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 69.0
        layoutY: 439.0
        text: "Label"
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 64.0
        layoutY: 468.0
        text: "Label"
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 225.0
        layoutY: 429.0
        text: "Label"
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 219.0
        layoutY: 448.0
        text: "Label"
    }
    
    public-read def panelLblColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC1LX
        content: [ label8, label9, label11, label12, ]
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
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 116.0
        layoutY: 179.0
        text: "Label"
    }
    
    public-read def panelLblColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX
        content: [ label10, label13, label14, label19, ]
    }
    
    def __layoutInfo_txtMaintaRoundof: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMaintaRoundof: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 342.0
        layoutY: 187.0
        layoutInfo: __layoutInfo_txtMaintaRoundof
    }
    
    def __layoutInfo_txtSaleMnNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtSaleMnNetPaid
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 633.0
        layoutY: 402.0
        text: "Label"
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
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
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
    
    public-read def panelCardDetails: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCardDetailsLX
        layoutY: bind panelCardDetailsLY
        blocksMouse: true
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
    
    def __layoutInfo_txtSaleMnTotAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSaleMnTotAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 589.0
        layoutY: 429.0
        layoutInfo: __layoutInfo_txtSaleMnTotAmt
        styleClass: "Borderless-text-box"
        font: Arial_12
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ txtSaleMnTotAmt, label17, ]
    }
    
    def __layoutInfo_txtSaleMnBal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnBal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 460.0
        layoutY: 439.0
        layoutInfo: __layoutInfo_txtSaleMnBal
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnSubTot: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnSubTot: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutInfo: __layoutInfo_txtSaleMnSubTot
        font: Arial_12
    }
    
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC4LX
        content: [ txtSaleMnSubTot, txtSaleMnBal, txtMaintaRoundof, txtSaleMnNetPaid, ]
    }
    
    def __layoutInfo_txtSaleMnTotVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnTotVAT: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 285.0
        layoutY: 454.0
        layoutInfo: __layoutInfo_txtSaleMnTotVAT
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnTotDis: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnTotDis: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutY: 429.0
        layoutInfo: __layoutInfo_txtSaleMnTotDis
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnTotQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSaleMnTotQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 115.0
        layoutY: 460.0
        layoutInfo: __layoutInfo_txtSaleMnTotQty
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnTotItem: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSaleMnTotItem: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 115.0
        layoutY: 433.0
        layoutInfo: __layoutInfo_txtSaleMnTotItem
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        content: [ txtSaleMnTotItem, txtSaleMnTotQty, txtSaleMnTotDis, txtSaleMnTotVAT, ]
    }
    
    def __layoutInfo_txtSaleMnDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSaleMnDoctorName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 132.0
        layoutInfo: __layoutInfo_txtSaleMnDoctorName
        promptText: "Enter Doctor Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnDateEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnDateEdit: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+100
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtSaleMnDateEdit
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnCName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSaleMnCName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtSaleMnCName
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSaleMnBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtSaleMnBillNo
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSaleMnDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtSaleMnDate
        onKeyPressed: txtSaleMnDateOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnKeyword: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSaleMnKeyword: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind Type3TextboxW+20
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtSaleMnKeyword
        text: ""
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    public-read def panelSearch: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C2LX
        layoutY: 100.0
        content: [ txtSaleMnKeyword, optSearch, ]
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def removeRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 603.0
        layoutY: 496.0
        text: "Label"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def groupRemoveRow: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind RemoveRowLX
        content: [ rectangle3, removeRow, ]
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
        visible: false
        layoutX: bind C2LX
        layoutY: 150.0
        layoutInfo: __layoutInfo_panelDate
        content: [ txtSaleMnDate, imageDate, btnSaleMnSearch, ]
    }
    
    def __layoutInfo_btnSaleMnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+25
        height: bind bottonH
    }
    public-read def btnSaleMnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton5LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSaleMnCancel
        onKeyPressed: btnSaleMnCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSaleMnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_btnSaleMnReset
        onKeyPressed: btnSaleMnResetOnKeyPressed
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSaleMnUpdate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnUpdate: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSaleMnUpdate
        effect: reflectionEffect
        graphic: imgUpdate
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
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
    
    public-read def lblSaleMnLastMonth: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 640.0
        layoutY: 164.0
        text: "Last Month"
        font: Arial_Bold_12
        textFill: DarkGray
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
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 540.0
        layoutY: 100.0
        text: "Quick Navigation"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind 3 * ten
        layoutY: 61.0
        text: "Bill History"
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
        text: "Customer Information - ctrl+M"
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
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: imageBillCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnCancelBill: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+20
        height: bind bottonH
    }
    public-read def btnSaleMnCancelBill: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton3LX
        layoutY: bind bottonLY
        layoutInfo: __layoutInfo_btnSaleMnCancelBill
        onKeyPressed: btnSaleMnCancelBillOnKeyPressed
        graphic: imageView2
        text: "Cancel Bill"
    }
    
    public-read def panelButton: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnSaleMnEdit, btnSaleMnReprint, btnSaleMnCancelForm, btnSaleMnPrint, btnSaleMnUpdate, btnSaleMnReset, btnSaleMnCancel, btnSaleMnCancelBill, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectangle2, label, panelEditTable, rectTableBorder, panelTable, panelButton, lblCount, lblSalesCount, lblSalesTotal, labelSearch_By, labelSearch_By_Date, rdoSearch2, label15, rdoSearch, label16, lblSaleMnLastMonth, separator, panelSearch, panelDate, separator3, label2, label3, label4, label5, txtSaleMnBillNo, txtSaleMnCName, label6, label7, txtSaleMnDateEdit, imgSaleMnDateEdit, txtSaleMnDoctorName, employee_id, cboEmp_code, lblTotalMargin, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmt, imageCustDown, imageDoctorDown, groupRemoveRow, panelCalender, listName, panelAlert, panelCardDetails, ]
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
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
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
                            rectangle.visible = true;
                            rectangle.blocksMouse = true;
                            rectangle.stroke = DarkGray;
                            rectangle2.visible = true;
                            rectangle2.layoutX = 0.0;
                            rectangle2.height = 32.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            label.layoutY = 1.0;
                            label.text = "Patient Information - ctrl+M";
                            panelEditTable.visible = false;
                            rectTableBorder.visible = true;
                            rectTableBorder.disable = false;
                            rectTableBorder.fill = null;
                            panelTable.visible = true;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnSaleMnEdit.visible = true;
                            btnSaleMnEdit.onKeyReleased = btnSaleMnEditOnKeyReleasedAtShown;
                            btnSaleMnEdit.onMouseClicked = btnSaleMnEditOnMouseClickedAtShown;
                            btnSaleMnEdit.effect = reflectionEffect;
                            btnSaleMnEdit.text = "Consultation View";
                            btnSaleMnEdit.font = Arial_Bold_14;
                            btnSaleMnEdit.action = btnSaleMnEditActionAtShown;
                            imageView5.visible = true;
                            imageView5.image = imageEdit;
                            btnSaleMnReprint.visible = true;
                            btnSaleMnReprint.cursor = null;
                            btnSaleMnReprint.layoutY = 0.0;
                            btnSaleMnReprint.onKeyPressed = btnSaleMnReprintOnKeyPressedAtShown;
                            btnSaleMnReprint.onMouseClicked = btnSaleMnReprintOnMouseClickedAtShown;
                            btnSaleMnReprint.effect = reflectionEffect;
                            btnSaleMnReprint.text = "Medical History View";
                            btnSaleMnReprint.font = Arial_Bold_14;
                            imageView4.visible = true;
                            imageView4.image = imageCancel;
                            btnSaleMnCancelForm.visible = true;
                            btnSaleMnCancelForm.onKeyPressed = btnSaleMnCancelFormOnKeyPressedAtShown;
                            btnSaleMnCancelForm.effect = reflectionEffect;
                            btnSaleMnCancelForm.text = "Cancel [F8]";
                            btnSaleMnCancelForm.font = Arial_Bold_14;
                            btnSaleMnCancelForm.action = btnSaleMnCancelFormActionAtShown;
                            imageView3.image = null;
                            btnSaleMnPrint.cursor = null;
                            btnSaleMnPrint.font = null;
                            btnSaleMnUpdate.visible = false;
                            btnSaleMnReset.visible = false;
                            btnSaleMnReset.text = "Edit [F4]";
                            imgCancel.image = null;
                            btnSaleMnCancel.visible = false;
                            imageView2.visible = true;
                            btnSaleMnCancelBill.visible = false;
                            btnSaleMnCancelBill.font = Arial_Bold_14;
                            panelButton.visible = true;
                            lblCount.visible = false;
                            lblCount.text = "Bill(s) Found";
                            lblCount.font = Arial_Bold_14;
                            lblSalesCount.visible = false;
                            __layoutInfo_lblSalesCount.width = 40.0;
                            lblSalesCount.styleClass = "Borderless-text-box";
                            lblSalesCount.editable = false;
                            lblSalesCount.font = Arial_Bold_14;
                            lblSalesTotal.visible = true;
                            lblSalesTotal.styleClass = "Borderless-text-box";
                            lblSalesTotal.editable = false;
                            lblSalesTotal.font = Arial_Bold_16;
                            labelSearch_By.visible = true;
                            labelSearch_By.layoutY = 102.0;
                            labelSearch_By.font = Arial_12;
                            labelSearch_By_Date.visible = false;
                            labelSearch_By_Date.layoutY = 145.0;
                            rdoSearch2.visible = false;
                            rdoSearch2.layoutY = 143.0;
                            rdoSearch2.onMouseClicked = rdoSearch2OnMouseClickedAtShown;
                            rdoSearch2.text = "";
                            rdoSearch2.font = Arial_14;
                            rdoSearch2.toggleGroup = toggleGroup;
                            label15.visible = false;
                            label15.text = "Customer History - Press ALT+W to view Total Sales";
                            rdoSearch.visible = true;
                            rdoSearch.layoutY = 100.0;
                            rdoSearch.onKeyReleased = rdoSearchOnKeyReleasedAtShown;
                            rdoSearch.onMouseClicked = rdoSearchOnMouseClickedAtShown;
                            rdoSearch.text = "";
                            rdoSearch.font = Arial_14;
                            rdoSearch.toggleGroup = toggleGroup;
                            label16.visible = false;
                            label16.layoutY = 90.0;
                            lblSaleMnLastMonth.visible = false;
                            lblSaleMnLastMonth.layoutY = 160.0;
                            separator.visible = false;
                            txtSaleMnKeyword.onKeyPressed = txtSaleMnKeywordOnKeyPressedAtShown;
                            txtSaleMnKeyword.onKeyReleased = txtSaleMnKeywordOnKeyReleasedAtShown;
                            txtSaleMnKeyword.editable = true;
                            optSearch.onKeyPressed = optSearchOnKeyPressedAtShown;
                            optSearch.onMouseClicked = optSearchOnMouseClickedAtShown;
                            optSearch.items = [ "Customer Name", "Mobile Number", "Customer Code", ];
                            panelSearch.focusTraversable = true;
                            txtSaleMnDate.onKeyPressed = txtSaleMnDateOnKeyPressed;
                            txtSaleMnDate.editable = false;
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
                            panelDate.visible = false;
                            panelDate.layoutY = 140.0;
                            __layoutInfo_panelDate.width = 200.0;
                            __layoutInfo_panelDate.height = 0.0;
                            panelDate.blocksMouse = false;
                            panelDate.focusTraversable = true;
                            separator3.visible = false;
                            separator3.layoutX = 615.0;
                            separator3.layoutY = 125.0;
                            __layoutInfo_separator3.height = 50.0;
                            label2.visible = false;
                            label2.layoutY = 120.0;
                            label2.text = "Yesterday";
                            label2.font = Arial_Bold_12;
                            label2.textFill = DarkGray;
                            label3.visible = false;
                            label3.layoutX = 640.0;
                            label3.layoutY = 120.0;
                            label3.text = "Today";
                            label3.font = Arial_Bold_12;
                            label3.textFill = DarkGray;
                            txtSaleMnBillNo.font = Arial_12;
                            imgSaleMnDateEdit.image = null;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            panelCalender.visible = true;
                            panelCalender.layoutX = 166.0;
                            panelCalender.layoutY = 180.0;
                            panelCalender.blocksMouse = true;
                            listName.onKeyPressed = listNameOnKeyPressedAtShown;
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

    function btnSaleMnEditOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
           currentState.actual = currentState.findIndex("Cust");
            delete  panelAlert.content;
          //sabarish Cust = CustomerInfo{};
          Consult = Consultation{};
       
            var customerCode :String = SalesMaintainLoadTableold.customerName;
            
            if( customerCode.equals(""))
            {
                FXinfo("Please Select a Customer from table to Edit .");
            }
            else
            {
               //sabarishdef Cust.StartUp(customerName);
              //sabarishdef   insert Cust.getDesignRootNodes() into panel.content;
Consult.startUp(customerCode);
 insert Consult.getDesignRootNodes() into panel.content;
            //sabarish   insert Consult.getDesignRootNodes() into panel.content;
           //sabarish    Consult.startUp();

            }     
         }
  
    var visit1 = bind fxCalendar.visible on replace {
        if (dateFlag1 and not visit1) {
            getDate(1);
        }
    };   
          
    function btnSaleMnReprintOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
      /*  */
    }

    function btnSaleMnReprintOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         currentState.actual = currentState.findIndex("Cust");
            delete  panelAlert.content;
          //sabarish Cust = CustomerInfo{};
          Medical = MedicalHistoryview{};

            var customerCode :String = SalesMaintainLoadTableold.customerName;
           
            if( customerCode.equals(""))
            {
                FXinfo("Please Select a Customer from table to Edit .");
            }
            else
            {
               //sabarishdef Cust.StartUp(customerName);
              //sabarishdef   insert Cust.getDesignRootNodes() into panel.content;
                Medical.startUp(customerCode);
                insert Medical.getDesignRootNodes() into panel.content;
            //sabarish   insert Consult.getDesignRootNodes() into panel.content;
           //sabarish    Consult.startUp();

            }
    }

    function rePrint():Void {
       //aaaaa
     }


    

    
    function cboEmp_codeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
    }

    function cboEmp_codeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
        if(event.code==KeyCode.VK_TAB) {
         txtSaleMnDoctorName.requestFocus();
        }
        shortcut(event);
   }
  
    function rdoSearch2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSaleMnKeyword.text = "";
        txtSaleMnDate.style = mandatoryStyle;
        txtSaleMnKeyword.style = "";
         }

    function rdoSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSaleMnDate.text = "";
        txtSaleMnKeyword.style = mandatoryStyle;
        txtSaleMnDate.style = "";
         }

    function rdoSearchOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
         }

    
    

    function txtSaleMnDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
    }

    function changeTableSize(i: Integer, j: Integer): Void {
        SalesLoad.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    function btnSaleMnCancelFormOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       if (event.code == KeyCode.VK_ENTER) {
       cancel();
       }
    }
    
    function cancel(): Void {             
        delete  panelTable.content;
        delete  panelEditTable.content;
        delete  panel.content;
        panel.visible = false;
        CommonDeclare.form[1] = 0;
    }

    function btnSaleMnCancelFormActionAtShown(): Void {
        cancel();
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        listName.visible = false;
    }

    
    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Sales Maintenance", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Sales Maintenance", msg);
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

    function optSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSaleMnKeyword.requestFocus();
    }

    function optSearchOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnKeyword.requestFocus(); }
    }

    function btnSaleMnCancelBillOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       //ffff
    }

    function btnSaleMnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       //fafaf
    }

    function btnSaleMnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //qqqqq
    }

    function btnSaleMnPrintOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         //qqqqq
    }
      
   public function shortcut(event: javafx.scene.input.KeyEvent): Void {
     //aaaa
    }

    function txtSaleMnKeywordOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {      
        shortcut(event);        
    }

   function btnSaleMnEditOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
       //kiji
    }
  

    public function reset(): Void {        
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 175.0;
        TableH = 310.0;
        SalesLoad.visible = true;
        if(txtSaleMnDate.text.equals("")) {
            rdoSearch.selected = true;
        }
        else {
            rdoSearch2.selected = true;
            rdoSearch2.requestFocus();
        }
    }

  
   function btnSaleMnEditActionAtShown(): Void {
           //edit
    }         
    function btnSaleMnSearchActionAtShown(): Void {
        fxCalendar.visible = false;
        rdoSearch2.selected = true;
        if (txtSaleMnDate.text != null) {
            var cdate: String = DateUtils.changeFormatDate(sdf.parse(txtSaleMnDate.text));
            var opt: String = "bill_date";
            SalesMaintainLoadTableold.loadCustomerMaintain(cdate);           
        } else {
            txtSaleMnDate.style = mandatoryStyle;
            FXinfo("Please Enter Date to View the Records.", txtSaleMnDate);
        }
    }

    function btnSaleMnSearchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (txtSaleMnDate.text != null) {
                var cdate: String = DateUtils.changeFormatDate(sdf.parse(txtSaleMnDate.text));
                var opt: String = "bill_date";
              SalesMaintainLoadTableold.loadCustomerMaintain();
             salesCnt=SalesMaintainLoadTableold.salesCount.toString();
            } 
            else
            {
                txtSaleMnDate.style = mandatoryStyle;
                FXinfo("Please Enter Date to View the Records.", txtSaleMnDate);
            }
        }
        shortcut(event);
    }

    function txtSaleMnKeywordOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;       
        if (txtSaleMnKeyword.rawText.length() > 2) {
            var opt: String;
            var cname: String;      
            if (optSearch.selectedIndex == 0 and txtSaleMnKeyword.rawText.length()>1) {              
               opt = "cust_name";
                cname = txtSaleMnKeyword.rawText;
            }
            else if (optSearch.selectedIndex ==1 and txtSaleMnKeyword.rawText.length()>1) {
                opt = "Mobile_num";
                cname = txtSaleMnKeyword.rawText;
            }
             else if (optSearch.selectedIndex ==2 and txtSaleMnKeyword.rawText.length()>1) {
                opt = "Customercode";
                cname = txtSaleMnKeyword.rawText;
            }
            SalesMaintainLoadTableold.loadCustomerMaintain(opt , cname);
            salesCnt=SalesMaintainLoadTableold.salesCount.toString();
          //sabarish  salesTotal="TOTAL CUSTOMER : {SalesMaintainLoadTableold.salesAmount.toString()}";
        }
    }
   
    public function imageDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = true;
        txtSaleMnDate.style = mandatoryStyle;
        if (not dateFlag) {
            if (txtSaleMnDate.text != null) {
                var dat = txtSaleMnDate.rawText.split("-");
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

    function getDate(i: Integer) {
        if (i == 0) {
            txtSaleMnDate.text = fxCalendar.getSelectedDate();
            dateFlag = false;
            SalesMaintainLoadTableold.invoice = "";
            SalesMaintainLoadTableold.typ = "";
            btnSaleMnSearch.requestFocus();
        }
        else {
            txtSaleMnDateEdit.text = fxCalendar.getSelectedDate();
            dateFlag1 = false;
        }

    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);

        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("ehr", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[4]);
            if (currentState.actual == 1) {
                if (val == 1) {
                    btnSaleMnUpdate.disable = true;
                    btnSaleMnCancelBill.disable = true;
                    btnSaleMnPrint.disable = true;
                } else if (val == 2) {
                    btnSaleMnUpdate.disable = false;
                    btnSaleMnCancelBill.disable = true;
                    btnSaleMnPrint.disable = false;
                } else if (val == 3) {
                    btnSaleMnUpdate.disable = false;
                    btnSaleMnCancelBill.disable = false;
                    btnSaleMnPrint.disable = false;
                }
            }
        } else {
            if (currentState.actual == 1) {
                btnSaleMnUpdate.disable = false;
                btnSaleMnCancelBill.disable = false;
                btnSaleMnPrint.disable = false;
            }
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    //updateValues();
    }
    var changPiv = bind currentState.actual on replace {
        getPrivileges(logUser);
    //updateValues();
    }
    var rdo: Boolean = bind rdoSearch.selected on replace {
        if (rdo) {
            txtSaleMnDate.disable = true;
            btnSaleMnSearch.disable = true;
            imageDate.disable = true;
            optSearch.disable = false;
            txtSaleMnKeyword.disable = false;
            txtSaleMnKeyword.style = mandatoryStyle;
            txtSaleMnDate.style="";
        } else {            
            txtSaleMnDate.disable = false;
            btnSaleMnSearch.disable = false;
            imageDate.disable = false;
            optSearch.disable = true;
            txtSaleMnKeyword.disable = true;
            txtSaleMnKeyword.style = "";
            txtSaleMnDate.style = mandatoryStyle;
        }
    }

    public function StartUp(): Void {

        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
              //  updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                //updateValues();
            }
        });

 (table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
               // updateValues();
            }            
        });
        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
               // updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
               // updateValues();
            }
        });
        if(settingsController.getSalesDiscountType()==0) {
            CommonDeclare.salesDiscApply=true;
         }               
        panel.visible = true;
        panelTableLY = 175.0;
        TableH = 310.0;
        panel.content = [rectangle, rectangle2, label, panelTable, rdoSearch, rdoSearch2, panelEditTable, rectTableBorder, panelButton, labelSearch_By, labelSearch_By_Date, label15, label16, lblSaleMnLastMonth, separator, panelSearch, panelDate, separator3, label2, label3, label4, label5, txtSaleMnBillNo, txtSaleMnCName, label6, label7, txtSaleMnDateEdit, txtSaleMnDoctorName, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmt, imageCustDown, imageDoctorDown, groupRemoveRow, panelCalender, listName, panelAlert, panelCardDetails,cboEmp_code,employee_id,lblSalesCount,lblCount,lblTotalMargin,lblSalesTotal,imgSaleMnDateEdit];
        currentState.actual = currentState.findIndex("Shown");
        SalesLoad.layoutX = 0;
        SalesLoad.layoutY = 0;        
        SalesLoad.visible = true;    
        txtSaleMnKeyword.style = mandatoryStyle;
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        fxCalendar.visible = false;
        panelTable.content = [SalesLoad];  
        panelCalender.content = [fxCalendar,];
        rdoSearch.selected=true;    
        getPrivileges(logUser);    
        txtSaleMnKeyword.requestFocus();
    }

}
