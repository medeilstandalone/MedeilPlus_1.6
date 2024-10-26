package com.vanuston.medeil.ui;

import java.lang.*;
import java.lang.Class;
import javafx.scene.image.Image;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.input.KeyCode;
import javafx.scene.image.ImageView;
//import javafx.animation.Timeline;
import java.awt.Dimension;
import java.lang.Exception;
import java.text.SimpleDateFormat;
import javafx.ext.swing.SwingComponent;
//import javax.swing.JComponent;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.NumberUtils;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.model.ServiceModel;
import com.vanuston.medeil.model.MsgReturnModel;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Validation;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import java.io.File;
import com.vanuston.medeil.model.DrugModel1;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import com.vanuston.medeil.uitables.CashSalesTable2;
import com.vanuston.medeil.uitables.PrescriptionDetails;
import javax.swing.JTable;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.awt.event.KeyEvent;
import com.vanuston.medeil.util.ShopUserInfo;
import com.vanuston.medeil.client.RegistryFactory;
import java.lang.Void;
import com.vanuston.medeil.util.DBConnection;
import java.util.HashMap;

def DocInfo = DoctorInformation {};
def CustInfo = CustomerInformation {};

public class ServiceBilling {

    var appointmentController: com.vanuston.medeil.implementation.Appointment;
    var gstAmt;//ggst
    var stockqty: String = "0";
   public var print: Integer = 0;
    var initFocus: String = "BarCode";
    var sno: Integer = 0;
    var isManualDisc = false;
    public var rndVal: String = "0.00";
    var flag:Boolean=false;
    var netAmt: Double = 0.0;
    var CashSalesTableObj = new CashSalesTable2();
    var listH = 0.0;
    var imgP = false;
    var imgD = false;
    var alerCnt1 = 0;
    var billLi: List = new ArrayList();
    var itNAM1: String = "";
    var itemDis: String = "";
    //def HomePage = HomePage {};
    public var cashBillDate = DateUtils.now("dd-MM-yyyy");
    // var mandatory = CommonDeclare.textbox_mandatory();//new add
    var mandatory = CommonDeclare.presc_textbox_mandatory(); //new add
    var dateFlag: Boolean = false;
    var fxCalendar: FXCalendar = FXCalendar { theme: Theme {}; };
    var tinNo = bind CommonDeclare.tin;
    var vatAmt;
    def MessageBox = MessageBox {};
    var expAlert = CashSalesTableObj.alert1;
    var settingsController: com.vanuston.medeil.implementation.Settings = RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
    var pntName: List = new ArrayList();
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    //var cashTable = CashSalesTableObj.createTable(rowNo, colNames, colType, colEditable, colWidth, "Sales");\
    var cashTable = CashSalesTableObj.createTable();//new add
    var salesCashTable = SwingComponent.wrap(CashSalesTableObj.getScrollTable(cashTable));//new add   
    var error = CommonDeclare.textbox_error();
    var selBillType = "Cash" on replace {
        getNetPaidChange();
        getAutoIncre();
    };
    var log: Logger = Logger.getLogger(ServiceBilling.class, "Sales");
    var alertSt: Integer = 0;
    var panelW = bind CommonDeclare.panelFormW on replace {

        listSalesCash.visible = false;
    }
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton31LX;
    var botton2LX = bind CommonDeclare.botton32LX;
    var botton3LX = bind CommonDeclare.botton33LX;
    var botton4LX = bind CommonDeclare.botton43LX;
    var botton21LX = bind CommonDeclare.botton2LX;
    var botton22LX = bind CommonDeclare.botton3LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW + 15;
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
    var ImageCalenderLX = bind C4LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C4LX + 100;
    var imgClickdownLX = bind C2LX + Type2TextboxW - 2;
    var imgCust = bind C2LX + 125;//sababrish
    var imgClickdown1LX = bind C4LX + Type2TextboxW - 102;
    var imgClickdownW = 20.5;
    var imgClickdownH = 20.5;
    var rectbuttonLX = bind 85.13341804 * panelW / 100;
    var ListLX = 0.0;
    var ListLY = 0.0;
    var LabelTINLX = bind 82.23888183 * panelW / 100;
    var AmtPanelLX = bind BottomC4LX + Type4TextboxW + 20;
    var AmtTextW = bind panelW - AmtPanelLX - 30;
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 235.0 on replace { changeTableSize(TableW, TableH); };//sabarish
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 85.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind (panelTableLY + TableH);
    //ajith add
    var secondCo1l = bind (18.5546875 * panelW) / 100;
    var textboxw2 = bind (26.53125 * panelW) / 100;
    var textboxw1 = bind (21.53125 * panelW) / 100;
    var product2x = bind (46.875 * panelW) / 100;
    var listW = Type2TextboxW;
    def AddFormulation = AddService {};
    var ret3 = bind AddFormulation.panel.visible on replace {
        panel.disable = ret3;
        panelService.visible = ret3;
        AddFormulation.txtFormulation.requestFocus();
        product2.text = AddFormulation.formulation;
//          txtdcrname.text=AddFormulation.formulation;
        AddFormulation.formulation = "";
    }


      def DeleteServBill = DeleteServBill {};
    var ret4 = bind DeleteServBill.panel.visible on replace {
        panel.disable = ret4;
        panelService.visible = ret4;
        DeleteServBill.txtHsnCode.requestFocus();
        product2.text = DeleteServBill.HSN;
        DeleteServBill.HSN = "";
    }
    def AddServCategory = AddServCategory {};
    var ret5 = bind AddServCategory.panel.visible on replace {
//        panel.disable = ret5;
        panelService.visible = ret5;
        AddServCategory.txtFormulation.requestFocus();
        txtCategory.text = AddServCategory.formulation;
        AddServCategory.formulation = "";
    }
    def AddSubCategory=AddSubCategory{};
   var ret6 = bind AddSubCategory.panel.visible on replace{
       System.out.println(AddSubCategory.panel.visible);
       
        panel.disable = ret6;
         panelService.visible = ret6;
        AddSubCategory.subCtgTxt.requestFocus();
        txtdcrname.text = AddSubCategory.formulation;
       AddSubCategory.formulation = "";
       }
       def BalanceDue=BalanceDue{};
        var checkk = bind BalanceDue.flagg on replace {
            System.out.println("save Balance dueee");
            if(checkk==1)
            {
                System.out.println("save Balance dueee");
                resetValues();
                }
        }

       var check = bind BalanceDue.flag on replace {
           System.out.println("repllaceeeeeeeeee");
           System.out.println("?");
           System.out.println(check);
         if(check==1)
         {
             System.out.println("repllaceeeeeeeeeed");
             flag=true;
             column();
             
         }
       
     }
       var ret7 = bind BalanceDue.panel.visible on replace{


        panel.disable = ret7;
         panelService.visible = ret7;
         BalanceDue.cusName.text=txtSalesCaPName.text;
        // BalanceDue.txtFormulation.text=String.valueOf((Double.parseDouble(balance.toString())*-1));

       BalanceDue.Setcategory(balance);
       BalanceDue.subCtgTxt.requestFocus();
//        txtdcrname.text = BalanceDue.formulation;
//       BalanceDue.formulation = "";
       }
    function changeTableSize(i: Double, j: Double): Void {
        salesCashTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX;
    var BottomC4LX = bind CommonDeclare.BottomC4LX;
    var balance = "0.00";
    public var getAutoVal: String;
    var salesController: Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
    var empCode: String[] = commonController.getEmployeeCode("").toArray() as String[];
    var valid1: Validation;
    var sar2: Integer = 0;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelDocInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelCustInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    def __layoutInfo_imageView7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def imageView7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutInfo: __layoutInfo_imageView7
    }
    
    public-read def product_rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 326.0
        layoutY: 144.0
        x: bind panelTableLX+20
        width: bind TableW-40
        height: 50.0
    }
    
    public-read def lblBillNo: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-20
        text: "Label"
    }
    
    def __layoutInfo_txtBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW+100
    }
    public-read def txtBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX-60
        layoutInfo: __layoutInfo_txtBillNo
    }
    
    public-read def product_code: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-20
        layoutY: 159.0
        text: "Label"
    }
    
    def __layoutInfo_product2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW+100
    }
    public-read def product2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX-60
        layoutY: 150.0
        layoutInfo: __layoutInfo_product2
    }
    
    def __layoutInfo_productimageView6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def productimageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX-60+Type2TextboxW+98
        layoutInfo: __layoutInfo_productimageView6
        fitWidth: bind imgClickdownW
    }
    
    public-read def PolicyNo: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+120
        text: "Label"
    }
    
    public-read def InsurName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+120
        text: "Label"
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+120
        text: "Label"
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-90
        text: "Label"
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_button1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
    }
    public-read def button1: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C3LX+400
        layoutInfo: __layoutInfo_button1
        graphic: imageView6
        text: "Button"
    }
    
    def __layoutInfo_quantity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def quantity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+230
        layoutInfo: __layoutInfo_quantity
    }
    
    def __layoutInfo_batch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def batch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+230
        layoutInfo: __layoutInfo_batch
    }
    
    def __layoutInfo_billno: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW+100
    }
    public-read def billno: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX-110
        layoutInfo: __layoutInfo_billno
    }
    
    def __layoutInfo_qutinhand: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def qutinhand: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+230
        layoutInfo: __layoutInfo_qutinhand
    }
    
    public-read def batch2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C3LX+100
    }
    
    public-read def rdoinsureYes: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C3LX+10
        text: "Radio Button"
    }
    
    public-read def rdoinsureNo: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C3LX+60
        text: "Radio Button"
    }
    
    public-read def lblbill: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-65
        text: "Label"
    }
    
    public-read def imageView10: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX-60+Type2TextboxW+98
        fitWidth: bind imgClickdownW
    }
    
    public-read def product: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ product_rectangle2, lblBillNo, txtBillNo, product_code, product2, productimageView6, PolicyNo, InsurName, label19, label22, button1, quantity, batch, billno, qutinhand, batch2, rdoinsureYes, rdoinsureNo, lblbill, imageView10, ]
    }
    
    public-read def lblBarcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind LabelTINLX-20
        text: "Label"
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-85
        text: "Label"
    }
    
    def __layoutInfo_txtSalesCaBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesCaBarcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind LabelTINLX+35
        layoutInfo: __layoutInfo_txtSalesCaBarcode
    }
    
    public-read def CashDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX+40+Type3TextboxW
        layoutY: 75.0
    }
    
    public-read def imgCateg: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX-60
        layoutY: 15.0
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-100
        text: "Label"
    }
    
    public-read def cboEmp_code: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C4LX-100
        layoutY: -4.0
        items: bind empCode
    }
    
    public-read def rdoIn: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C3LX+10
        text: "Radio Button"
    }
    
    public-read def rdoOut: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C3LX+60
        text: "Radio Button"
    }
    
    public-read def listBillNo: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
    }
    
    def __layoutInfo_txtdcrname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtdcrname: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX-185
        layoutInfo: __layoutInfo_txtdcrname
    }
    
    public-read def subCategory: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-175
        text: "Label"
    }
    
    public-read def imgSubCateg: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX-85
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    def __layoutInfo_AddBtnCtg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def AddBtnCtg: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind imgClickdownLX-35
        layoutInfo: __layoutInfo_AddBtnCtg
        text: "Button"
    }
    
    def __layoutInfo_AddBtnSubCtg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def AddBtnSubCtg: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind imgClickdown1LX-60
        layoutInfo: __layoutInfo_AddBtnSubCtg
        text: "Button"
    }
    
    def __layoutInfo_AddBtnSer: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def AddBtnSer: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C3LX-120
        layoutInfo: __layoutInfo_AddBtnSer
        text: "Button"
    }
    
    public-read def button2: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind imgClickdown1LX+40
        text: "Button"
    }
    
    public-read def button3: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind imgClickdown1LX+120
        text: "Button"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaveOnly: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind bottonH
    }
    public-read def btnSaveOnly: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutY: 534.0
        layoutInfo: __layoutInfo_btnSaveOnly
        graphic: imageView2
        text: "Save [F3]"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_button
        text: "Button"
    }
    
    public-read def imgPrescrib: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnPrescibe: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPrescibe: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_btnPrescibe
        graphic: imgPrescrib
        text: "Button"
    }
    
    public-read def imageView8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
    }
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+35
        height: bind bottonH
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C3LX-400
        layoutInfo: __layoutInfo_btnBack
        graphic: imageView8
        text: "Button"
    }
    
    public-read def imageView9: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnUpload: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind bottonH
    }
    public-read def btnUpload: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnUpload
        graphic: imageView9
        text: "Button"
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 733.0
        height: 218.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 50.0
        layoutY: 145.0
        layoutInfo: __layoutInfo_listView
        focusTraversable: false
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 325.0
        layoutY: 49.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_rectRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutInfo: __layoutInfo_rectRemoveRow
        width: 120.0
        height: 50.0
    }
    
    def __layoutInfo_LabelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def LabelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutInfo: __layoutInfo_LabelRemoveRow
        text: "Remove Row  [F12]"
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+180
        layoutY: 499.0
        text: "Label"
    }
    
    public-read def adjust_amount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+90
        layoutY: 336.0
        text: "Label"
    }
    
    def __layoutInfo_txtadjust: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtadjust: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+180
        layoutInfo: __layoutInfo_txtadjust
    }
    
    def __layoutInfo_btnAdjust: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAdjust: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C2LX+300
        layoutInfo: __layoutInfo_btnAdjust
        text: "Button"
    }
    
    public-read def lblTotalMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+430
        text: "Label"
    }
    
    def __layoutInfo_btnStkAdj: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnStkAdj: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C2LX+430
        layoutInfo: __layoutInfo_btnStkAdj
        text: "Button"
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH+29
    }
    
    def __layoutInfo_txtSalesCaDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW-50
    }
    public-read def txtSalesCaDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+150
        layoutInfo: __layoutInfo_txtSalesCaDiscount
        styleClass: "Borderless-text-box"
    }
    
    def __layoutInfo_txtSalesCaVAT123: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaVAT123: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+180
        layoutY: 499.0
        layoutInfo: __layoutInfo_txtSalesCaVAT123
        styleClass: "Borderless-text-box"
    }
    
    def __layoutInfo_txtSalesCaRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C2LX+210
        layoutInfo: __layoutInfo_txtSalesCaRoundAmt
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtSalesCaToalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSalesCaToalAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_txtSalesCaToalAmt
        graphic: label17
        text: "Label"
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX-30
        layoutY: 6.0
        content: [ txtSalesCaToalAmt, ]
    }
    
    def __layoutInfo_rectButton: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rectButton: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: 531.0
        layoutInfo: __layoutInfo_rectButton
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_lblBillHistory: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblBillHistory: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: 532.0
        layoutInfo: __layoutInfo_lblBillHistory
        text: "Label"
    }
    
    def __layoutInfo_listSalesCash: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: bind listH
    }
    public-read def listSalesCash: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listSalesCash
        focusTraversable: false
        items: null
    }
    
    def __layoutInfo_listsubcategory: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: bind listH
    }
    public-read def listsubcategory: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listsubcategory
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listproductCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW+100
        height: bind listH
    }
    public-read def listproductCode: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX-60
        layoutInfo: __layoutInfo_listproductCode
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind textboxw1-5
        height: bind listH
    }
    public-read def listProductName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind product2x
        layoutInfo: __layoutInfo_listProductName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_batchlist: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind listH
    }
    public-read def batchlist: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C3LX-40
        layoutInfo: __layoutInfo_batchlist
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 90.0
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_lblBalanceDue: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def lblBalanceDue: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblBalanceDue
        graphic: label5
        text: bind balance
    }
    
    public-read def panelBalanceDue: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX-220
        content: [ lblBalanceDue, ]
    }
    
    public-read def panelplugin: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def rdobank: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        text: "Radio Button"
    }
    
    public-read def rdocash: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        text: "Radio Button"
    }
    
    public-read def rdocredit: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        text: "Radio Button"
    }
    
    public-read def textbox: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_listbill: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW+100
        height: bind listH
    }
    public-read def listbill: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listbill
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelBillType: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelTemp: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelDispatch: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    def __layoutInfo_panelService: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelService: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX1+150
        layoutY: bind panelAlertLY1+70
        layoutInfo: __layoutInfo_panelService
    }
    
    def __layoutInfo_panelDeleteBill: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelDeleteBill: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX1+150
        layoutY: bind panelAlertLY1+70
        layoutInfo: __layoutInfo_panelDeleteBill
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelService, panelDeleteBill, ]
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
    
    def __layoutInfo_txtRemarks: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtRemarks: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtRemarks
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    public-read def panelRemrkTxt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ txtRemarks, rdobank, rdocash, rdocredit, textbox, label21, label23, ]
    }
    
    public-read def panelRemarks: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX-200
        content: [ label12, label20, panelRemrkTxt, ]
    }
    
    def __layoutInfo_txtSalesCaNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSalesCaNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtSalesCaNetPaid
        styleClass: "text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_panelTxtColumn2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
        height: 100.0
    }
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX-200
        layoutY: 31.0
        layoutInfo: __layoutInfo_panelTxtColumn2
        content: [ txtSalesCaNetPaid, txtSalesCaRoundAmt, ]
    }
    
    def __layoutInfo_lblSalesCaTotalQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesCaTotalQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 419.0
        layoutInfo: __layoutInfo_lblSalesCaTotalQty
        styleClass: "Borderless-text-box"
        focusTraversable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaSubTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSalesCaSubTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+240
        layoutY: 1.0
        layoutInfo: __layoutInfo_txtSalesCaSubTotal
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaVAT4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW-50
    }
    public-read def txtSalesCaVAT4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+400
        layoutInfo: __layoutInfo_txtSalesCaVAT4
        styleClass: "Borderless-text-box"
        text: "100.00"
        editable: bind isManualDisc
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesCaTotalItm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesCaTotalItm: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 392.0
        layoutInfo: __layoutInfo_lblSalesCaTotalItm
        styleClass: "Borderless-text-box"
        onKeyReleased: lblSalesCaTotalItmOnKeyReleased
        focusTraversable: false
        font: Arial_12
    }
    
    def __layoutInfo_panelTxtColumn1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        layoutY: 31.0
        layoutInfo: __layoutInfo_panelTxtColumn1
        content: [ lblSalesCaTotalItm, txtSalesCaDiscount, txtSalesCaVAT4, txtSalesCaVAT123, txtSalesCaSubTotal, lblSalesCaTotalQty, ]
    }
    
    def __layoutInfo_txtSalesCaPBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCaPBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtSalesCaPBillNo
        focusTraversable: false
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesCaDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind imgClickdown1LX+40
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtSalesCaDate
        text: bind cashBillDate
        font: Arial_12
    }
    
    def __layoutInfo_txtCategory: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCategory: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX-60
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtCategory
        styleClass: "Borderless-text-box"
        focusTraversable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCaDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX-185
        layoutY: 121.0
        layoutInfo: __layoutInfo_txtSalesCaDName
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        hfill: false
    }
    public-read def txtSalesCaPName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX-60
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtSalesCaPName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        promptText: "Enter Customer Name"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
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
    
    def __layoutInfo_btnSalesCaReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesCaReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesCaReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSalesCaSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesCaSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesCaSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Print  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnSaveOnly, btnSalesCaSave, btnSalesCaReset, button, btnPrescibe, btnBack, btnUpload, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+190
        layoutY: 490.0
        text: "Balance"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 600.0
        layoutY: 467.0
        text: "Amt. Paid"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelLblColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX+260
        content: [ label13, label7, panelTxtColumn2, ]
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+400
        layoutY: 444.0
        text: "VAT"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+230
        layoutY: 398.0
        text: "subtotal"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX+150
        layoutY: 421.0
        text: "discount"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 44.0
        layoutY: 421.0
        text: "Total Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 44.0
        layoutY: 398.0
        text: "Total Products"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelLblColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC1LX
        content: [ label10, label11, label6, label4, label1, label15, ]
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 75.0
        text: "Bill No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-175
        layoutY: 121.0
        text: "Doctor Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind imgClickdown1LX-10
        layoutY: 75.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-20
        layoutY: 75.0
        text: "TIN No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-20
        layoutY: 60.0
        styleClass: "label"
        text: "Patient Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        blocksMouse: false
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.05
        green: 0.32
        blue: 0.07
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        effect: lightingEffect
        text: "Sales - Cash Bill"
        font: Arial_25
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 30.0
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95686275
        green: 0.9490196
        blue: 0.8627451
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutY: 0.0
        fill: linearGradientHeader
        height: 32.0
    }
    
    public-read def Arial_Bold__65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnCustDocSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCustDocSave: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind botton21LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnCustDocSave
        graphic: imageView4
        text: "Save [F3]"
        font: Arial_Bold_14
        action: btnCustDocSaveAction
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgPName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX-60
        image: image
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX-85
        image: image2
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def panelTopSection: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ label2, txtSalesCaPName, lblBarcode, label16, imgPName, txtSalesCaDName, label3, txtCategory, label9, label8, txtSalesCaDate, txtSalesCaBarcode, imgDName, CashDatePicker, txtSalesCaPBillNo, imgCateg, label18, cboEmp_code, rdoIn, rdoOut, listBillNo, txtdcrname, subCategory, imgSubCateg, AddBtnCtg, AddBtnSubCtg, AddBtnSer, button2, button3, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
        content: [ rectangle, rectHeader, label, product, panelTopSection, panelButtons, listView, separator, rectRemoveRow, LabelRemoveRow, label14, panelLblColumn1, adjust_amount, txtadjust, btnAdjust, lblTotalMargin, btnStkAdj, panelTable, rectTableBorder, panelTxtColumn1, panelLblColumn2, panelAmt, rectButton, lblBillHistory, listSalesCash, listsubcategory, listproductCode, listProductName, batchlist, panelCalender, panelBalanceDue, panelplugin, panelAlert, panelRemarks, listbill, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageBack
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSalesBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind botton22LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnSalesBack
        graphic: imageView5
        text: "Back to Sales"
        font: Arial_Bold_14
    }
    
    public-read def panelBack: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ btnCustDocSave, btnSalesBack, ]
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgPrescribe: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Import.png"
    }
    
    public-read def lightgray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.8
        green: 0.8
        blue: 0.8
    }
    
    public-read def pink: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.9843137
        green: 0.89411765
        blue: 1.0
    }
    
    public-read def lgray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.8
        green: 0.8
        blue: 0.8
    }
    
    public-read def lgray2: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.8117647
        green: 0.8117647
        blue: 0.8235294
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/panelBackGrnd.png"
    }
    
    public-read def toggleGroup3: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "DoctorInfo", "Shown", "Edit1", "Edit", "CustomerInfo", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            imageView4.visible = false;
                            btnCustDocSave.visible = false;
                            btnCustDocSave.text = "Save [F3]";
                            imageView5.visible = false;
                            btnSalesBack.visible = false;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            btnSalesBack.action = btnSalesBackAction;
                            panelBack.visible = false;
                            imageView7.visible = false;
                            imageView7.image = null;
                            rectangle.visible = false;
                            rectangle.fill = linearGradient;
                            rectangle.strokeWidth = 2.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.width = 0.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 0.0;
                            rectHeader.arcHeight = 0.0;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.visible = false;
                            product_rectangle2.opacity = 1.0;
                            product_rectangle2.layoutX = 326.0;
                            product_rectangle2.layoutY = 144.0;
                            product_rectangle2.styleClass = "";
                            product_rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.stroke = null;
                            product_rectangle2.y = 0.0;
                            product_rectangle2.height = 50.0;
                            product_rectangle2.arcWidth = 0.0;
                            product_rectangle2.arcHeight = 0.0;
                            lblBillNo.visible = false;
                            lblBillNo.layoutY = 0.0;
                            lblBillNo.text = "Label";
                            txtBillNo.visible = false;
                            txtBillNo.layoutY = 0.0;
                            txtBillNo.editable = false;
                            product_code.visible = false;
                            product_code.layoutY = 159.0;
                            product_code.text = "Label";
                            product_code.textFill = javafx.scene.paint.Color.BLACK;
                            product2.visible = false;
                            product2.layoutY = 150.0;
                            product2.promptText = null;
                            productimageView6.visible = false;
                            productimageView6.managed = true;
                            productimageView6.layoutY = 0.0;
                            productimageView6.image = null;
                            productimageView6.x = 0.0;
                            productimageView6.y = 0.0;
                            productimageView6.fitHeight = 0.0;
                            PolicyNo.visible = false;
                            PolicyNo.layoutY = 0.0;
                            PolicyNo.text = "Label";
                            InsurName.visible = false;
                            InsurName.layoutY = 0.0;
                            InsurName.text = "Label";
                            label19.visible = false;
                            label19.layoutY = 0.0;
                            label19.text = "Label";
                            label22.visible = false;
                            label22.layoutY = 0.0;
                            label22.text = "Label";
                            imageView6.visible = false;
                            imageView6.image = null;
                            button1.visible = false;
                            button1.layoutY = 0.0;
                            button1.text = "Button";
                            quantity.visible = false;
                            quantity.layoutY = 0.0;
                            quantity.text = null;
                            quantity.promptText = null;
                            batch.visible = false;
                            batch.layoutY = 0.0;
                            batch.promptText = null;
                            billno.visible = false;
                            billno.layoutY = 0.0;
                            qutinhand.visible = false;
                            qutinhand.layoutY = 0.0;
                            qutinhand.styleClass = "text-box";
                            qutinhand.promptText = null;
                            qutinhand.editable = true;
                            batch2.visible = false;
                            batch2.layoutY = 0.0;
                            batch2.image = null;
                            batch2.fitWidth = 0.0;
                            batch2.fitHeight = 0.0;
                            rdoinsureYes.visible = false;
                            rdoinsureYes.layoutY = 0.0;
                            rdoinsureYes.text = "Radio Button";
                            rdoinsureYes.toggleGroup = null;
                            rdoinsureNo.visible = false;
                            rdoinsureNo.layoutY = 0.0;
                            rdoinsureNo.text = "Radio Button";
                            rdoinsureNo.toggleGroup = null;
                            rdoinsureNo.selected = false;
                            lblbill.visible = false;
                            lblbill.layoutY = 0.0;
                            lblbill.text = "Label";
                            imageView10.visible = false;
                            imageView10.layoutY = 0.0;
                            imageView10.image = null;
                            imageView10.fitHeight = 0.0;
                            product.visible = false;
                            product.layoutY = 0.0;
                            label2.disable = false;
                            label2.layoutY = 60.0;
                            label2.text = "Customer Name";
                            label2.font = Arial_12;
                            txtSalesCaPName.visible = true;
                            txtSalesCaPName.layoutY = 60.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.promptText = "Enter Customer Name";
                            txtSalesCaPName.editable = true;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            label16.visible = false;
                            label16.layoutY = 0.0;
                            label16.text = "Label";
                            imgPName.visible = false;
                            imgPName.layoutY = 0.0;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgPName.image = image;
                            txtSalesCaDName.visible = true;
                            txtSalesCaDName.layoutY = 85.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.text = null;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.editable = true;
                            label3.visible = true;
                            label3.layoutY = 60.0;
                            label3.text = "TIN No";
                            label3.font = Arial_12;
                            txtCategory.visible = true;
                            txtCategory.layoutY = 85.0;
                            txtCategory.styleClass = "Borderless-text-box";
                            txtCategory.promptText = null;
                            txtCategory.editable = false;
                            txtCategory.font = Arial_12;
                            label9.layoutY = 60.0;
                            label9.font = Arial_12;
                            label8.layoutY = 85.0;
                            label8.font = Arial_12;
                            txtSalesCaDate.layoutY = 60.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.disable = false;
                            txtSalesCaBarcode.layoutY = 0.0;
                            imgDName.visible = false;
                            imgDName.layoutY = 0.0;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = false;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 60.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.focusTraversable = false;
                            txtSalesCaPBillNo.editable = false;
                            txtSalesCaPBillNo.font = Arial_12;
                            imgCateg.visible = false;
                            imgCateg.layoutY = 15.0;
                            imgCateg.image = null;
                            label18.visible = false;
                            label18.opacity = 1.0;
                            label18.layoutY = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = -4.0;
                            rdoIn.visible = false;
                            rdoIn.layoutY = 0.0;
                            rdoIn.text = "Radio Button";
                            rdoIn.toggleGroup = null;
                            rdoOut.visible = false;
                            rdoOut.layoutY = 0.0;
                            rdoOut.text = "Radio Button";
                            rdoOut.toggleGroup = null;
                            listBillNo.visible = false;
                            txtdcrname.visible = false;
                            txtdcrname.layoutY = 0.0;
                            txtdcrname.text = null;
                            txtdcrname.promptText = null;
                            txtdcrname.editable = true;
                            subCategory.visible = false;
                            subCategory.layoutY = 0.0;
                            subCategory.text = "Label";
                            imgSubCateg.visible = false;
                            imgSubCateg.layoutY = 0.0;
                            imgSubCateg.image = null;
                            AddBtnCtg.visible = false;
                            AddBtnCtg.layoutY = 0.0;
                            AddBtnCtg.text = "Button";
                            AddBtnSubCtg.visible = false;
                            AddBtnSubCtg.layoutY = 0.0;
                            AddBtnSubCtg.text = "Button";
                            AddBtnSer.visible = false;
                            AddBtnSer.layoutY = 0.0;
                            AddBtnSer.text = "Button";
                            button2.visible = false;
                            button2.layoutY = 0.0;
                            button2.text = "Button";
                            button3.visible = false;
                            button3.layoutY = 0.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 0.0;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.layoutY = 534.0;
                            btnSaveOnly.text = "Save [F3]";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesCaSave.visible = true;
                            btnSalesCaSave.layoutY = 525.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesCaReset.layoutY = 525.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            button.visible = false;
                            button.layoutY = 0.0;
                            button.text = "Button";
                            imgPrescrib.visible = false;
                            imgPrescrib.image = null;
                            imgPrescrib.fitWidth = 0.0;
                            imgPrescrib.fitHeight = 0.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.text = "Button";
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            imageView8.visible = false;
                            imageView8.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            imageView9.visible = false;
                            imageView9.image = null;
                            btnUpload.visible = false;
                            btnUpload.text = "Button";
                            panelButtons.visible = false;
                            listView.visible = true;
                            listView.disable = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 288.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.layoutY = 0.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.y = 0.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            LabelRemoveRow.managed = true;
                            LabelRemoveRow.layoutY = 0.0;
                            __layoutInfo_LabelRemoveRow.width = 100.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            label14.visible = false;
                            label14.layoutY = 60.0;
                            label10.visible = true;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label10.font = Arial_12;
                            label11.visible = true;
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label11.font = Arial_12;
                            label6.managed = true;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_12;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_12;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label1.font = Arial_12;
                            label15.visible = false;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 336.0;
                            adjust_amount.text = "Label";
                            txtadjust.visible = false;
                            txtadjust.layoutY = 0.0;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 0.0;
                            btnAdjust.text = "Button";
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 0.0;
                            btnStkAdj.text = "Button";
                            panelTable.visible = false;
                            panelTable.layoutY = 0.0;
                            panelTable.styleClass = "";
                            rectTableBorder.visible = false;
                            rectTableBorder.fill = javafx.scene.paint.Color.BLACK;
                            rectTableBorder.stroke = null;
                            rectTableBorder.strokeWidth = 1.0;
                            rectTableBorder.y = 0.0;
                            lblSalesCaTotalItm.visible = true;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 445.0;
                            lblSalesCaTotalItm.styleClass = "Borderless-text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = true;
                            lblSalesCaTotalItm.editable = false;
                            txtSalesCaDiscount.visible = false;
                            txtSalesCaDiscount.disable = false;
                            txtSalesCaDiscount.layoutY = 0.0;
                            txtSalesCaDiscount.styleClass = "Borderless-text-box";
                            txtSalesCaDiscount.promptText = null;
                            txtSalesCaDiscount.selectOnFocus = true;
                            txtSalesCaDiscount.editable = true;
                            txtSalesCaVAT4.layoutY = 0.0;
                            txtSalesCaVAT4.styleClass = "Borderless-text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = true;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutY = 499.0;
                            txtSalesCaVAT123.styleClass = "Borderless-text-box";
                            txtSalesCaVAT123.promptText = null;
                            txtSalesCaVAT123.selectOnFocus = true;
                            txtSalesCaVAT123.editable = true;
                            txtSalesCaSubTotal.layoutY = 0.0;
                            txtSalesCaSubTotal.styleClass = "Borderless-text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = true;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            lblSalesCaTotalQty.visible = true;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 470.0;
                            lblSalesCaTotalQty.styleClass = "Borderless-text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = true;
                            lblSalesCaTotalQty.editable = false;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 0.0;
                            label13.visible = true;
                            label13.layoutX = 70.0;
                            label13.layoutY = 445.0;
                            label13.font = Arial_12;
                            label7.visible = true;
                            label7.layoutY = 470.0;
                            label7.font = Arial_12;
                            txtSalesCaNetPaid.visible = true;
                            txtSalesCaNetPaid.layoutY = 445.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.selectOnFocus = true;
                            txtSalesCaNetPaid.editable = true;
                            txtSalesCaNetPaid.font = Arial_Bold_12;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 0.0;
                            txtSalesCaRoundAmt.selectOnFocus = true;
                            txtSalesCaRoundAmt.editable = true;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 0.0;
                            __layoutInfo_panelTxtColumn2.width = 0.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
                            label17.visible = false;
                            label17.text = "Label";
                            label17.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesCaToalAmt.visible = false;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "Label";
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesCaToalAmt.textFill = javafx.scene.paint.Color.BLACK;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 0.0;
                            rectButton.visible = true;
                            rectButton.managed = true;
                            rectButton.layoutY = 531.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = true;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 534.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            listSalesCash.disable = false;
                            listsubcategory.visible = false;
                            listsubcategory.layoutY = 0.0;
                            listsubcategory.items = [ "Item 1", "Item 2", "Item 3", ];
                            listproductCode.visible = false;
                            listproductCode.opacity = 1.0;
                            listproductCode.layoutY = 0.0;
                            listproductCode.styleClass = "list-view";
                            listproductCode.cellFactory = null;
                            listProductName.visible = false;
                            listProductName.disable = false;
                            listProductName.layoutY = 0.0;
                            listProductName.styleClass = "list-view";
                            listProductName.blocksMouse = true;
                            listProductName.focusTraversable = true;
                            listProductName.items = [ "Item 1", "Item 2", "Item 3", ];
                            listProductName.vertical = true;
                            listProductName.pannable = true;
                            batchlist.visible = false;
                            batchlist.disable = false;
                            batchlist.opacity = 1.0;
                            batchlist.layoutY = 0.0;
                            batchlist.styleClass = "list-view";
                            batchlist.items = [ "Item 1", "Item 2", "Item 3", ];
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = false;
                            panelCalender.pickOnBounds = false;
                            panelCalender.cache = false;
                            label5.visible = false;
                            label5.text = "Label";
                            label5.textFill = javafx.scene.paint.Color.BLACK;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.hpos = javafx.geometry.HPos.LEFT;
                            lblBalanceDue.textFill = javafx.scene.paint.Color.BLACK;
                            panelBalanceDue.visible = false;
                            panelBalanceDue.layoutY = 0.0;
                            panelplugin.visible = false;
                            panelplugin.layoutY = 0.0;
                            panelAlert.visible = true;
                            label12.visible = false;
                            label12.disable = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            label20.visible = false;
                            label20.layoutY = 0.0;
                            label20.text = "Label";
                            txtRemarks.visible = true;
                            txtRemarks.layoutY = 470.0;
                            txtRemarks.styleClass = "Borderless-text-box";
                            txtRemarks.text = "";
                            txtRemarks.promptText = "0.00";
                            txtRemarks.selectOnFocus = true;
                            txtRemarks.editable = false;
                            rdobank.visible = false;
                            rdobank.layoutX = 0.0;
                            rdobank.layoutY = 0.0;
                            rdobank.text = "Radio Button";
                            rdobank.toggleGroup = null;
                            rdocash.visible = false;
                            rdocash.layoutX = 0.0;
                            rdocash.layoutY = 0.0;
                            rdocash.text = "Radio Button";
                            rdocash.toggleGroup = null;
                            rdocredit.visible = false;
                            rdocredit.layoutX = 0.0;
                            rdocredit.text = "Radio Button";
                            rdocredit.toggleGroup = null;
                            textbox.visible = false;
                            textbox.layoutX = 0.0;
                            label21.visible = false;
                            label21.layoutX = 0.0;
                            label21.text = "Label";
                            label21.textFill = javafx.scene.paint.Color.BLACK;
                            label23.visible = false;
                            label23.layoutX = 0.0;
                            label23.layoutY = 0.0;
                            label23.text = "Label";
                            label23.textFill = javafx.scene.paint.Color.BLACK;
                            panelRemrkTxt.visible = false;
                            panelRemrkTxt.layoutX = 0.0;
                            panelRemarks.visible = false;
                            panelRemarks.layoutY = 0.0;
                            listbill.visible = false;
                            listbill.items = [ "Item 1", "Item 2", "Item 3", ];
                            panel.visible = false;
                            panel.disable = false;
                            panelBillType.visible = false;
                            panelInfo.visible = false;
                            panelTemp.visible = false;
                            panelDispatch.visible = false;
                            panelService.visible = false;
                            panelDeleteBill.visible = false;
                            panel2.visible = false;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                            image4.placeholder = null;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            imageView4.visible = true;
                            btnCustDocSave.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            imageView5.visible = true;
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            panelBack.visible = false;
                            imageView7.visible = true;
                            __layoutInfo_imageView7.width = 500.0;
                            __layoutInfo_imageView7.height = 500.0;
                            imageView7.image = image4;
                            rectangle.visible = false;
                            rectangle.fill = linearGradient;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.width = 1024.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = false;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill - 1";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.visible = true;
                            product_rectangle2.opacity = 1.0;
                            product_rectangle2.layoutX = 0.0;
                            product_rectangle2.layoutY = 0.0;
                            product_rectangle2.styleClass = "form-background";
                            product_rectangle2.fill = linearGradient;
                            product_rectangle2.stroke = DarkGray;
                            product_rectangle2.y = 90.0;
                            product_rectangle2.height = 88.0;
                            product_rectangle2.arcWidth = 5.0;
                            product_rectangle2.arcHeight = 5.0;
                            lblBillNo.visible = true;
                            lblBillNo.layoutY = 108.0;
                            lblBillNo.text = "Bill No";
                            lblBillNo.font = Arial_14;
                            txtBillNo.visible = true;
                            txtBillNo.layoutY = 105.0;
                            txtBillNo.editable = false;
                            product_code.visible = true;
                            product_code.layoutY = 138.0;
                            product_code.text = "Service Name :";
                            product_code.font = Arial_14;
                            product_code.textFill = DarkGray;
                            product2.visible = true;
                            product2.cursor = null;
                            product2.layoutY = 135.0;
                            __layoutInfo_product2.height = 25.0;
                            product2.onKeyPressed = product2OnKeyPressedAtShown;
                            product2.onKeyReleased = product2OnKeyReleasedAtShown;
                            product2.promptText = "Search  Service Name";
                            product2.font = Arial_14;
                            productimageView6.visible = true;
                            productimageView6.managed = true;
                            productimageView6.layoutY = 135.0;
                            __layoutInfo_productimageView6.width = 0.0;
                            __layoutInfo_productimageView6.height = 0.0;
                            __layoutInfo_productimageView6.minWidth = 0.0;
                            __layoutInfo_productimageView6.minHeight = 0.0;
                            __layoutInfo_productimageView6.maxWidth = 0.0;
                            __layoutInfo_productimageView6.maxHeight = 0.0;
                            productimageView6.onMouseClicked = productimageView6OnMouseClickedAtShown;
                            productimageView6.image = image;
                            productimageView6.x = 0.0;
                            productimageView6.y = 0.0;
                            productimageView6.fitHeight = 25.0;
                            PolicyNo.visible = false;
                            PolicyNo.layoutY = 120.0;
                            PolicyNo.text = "PolicyNo";
                            PolicyNo.font = Arial_14;
                            InsurName.visible = false;
                            InsurName.layoutY = 95.0;
                            InsurName.text = "Insurance Name";
                            InsurName.font = Arial_14;
                            label19.visible = false;
                            label19.layoutY = 145.0;
                            label19.text = "Amount";
                            label19.font = Arial_14;
                            label22.visible = true;
                            label22.layoutY = 108.0;
                            label22.text = "Insured Patient";
                            label22.font = Arial_14;
                            imageView6.visible = true;
                            imageView6.image = imagePrint;
                            button1.visible = false;
                            button1.layoutY = 135.0;
                            __layoutInfo_button1.height = 25.0;
                            button1.text = "Reprint";
                            button1.font = Arial_Bold_14;
                            button1.action = btnReprintActionAtShown;
                            quantity.visible = false;
                            quantity.layoutY = 95.0;
                            __layoutInfo_quantity.height = 20.0;
                            quantity.onKeyPressed = quantityOnKeyPressedAtShown;
                            quantity.onKeyTyped = quantityOnKeyTypedAtShown;
                            quantity.text = "";
                            quantity.promptText = "Insurance";
                            quantity.font = Arial_12;
                            batch.visible = false;
                            batch.layoutY = 120.0;
                            __layoutInfo_batch.height = 20.0;
                            batch.onKeyPressed = batchOnKeyPressedAtShown;
                            batch.onKeyReleased = batchOnKeyReleasedAtShown;
                            batch.promptText = "Policy Number";
                            batch.font = Arial_12;
                            billno.visible = false;
                            billno.layoutY = 138.0;
                            __layoutInfo_billno.height = 20.0;
                            billno.font = null;
                            qutinhand.visible = false;
                            qutinhand.layoutY = 145.0;
                            __layoutInfo_qutinhand.height = 20.0;
                            qutinhand.styleClass = "text-box";
                            qutinhand.onKeyPressed = qutinhandOnKeyPressedAtShown;
                            qutinhand.promptText = "Policy Amount";
                            qutinhand.editable = true;
                            qutinhand.font = Arial_12;
                            batch2.visible = false;
                            batch2.layoutY = 100.0;
                            batch2.onMouseClicked = batch2OnMouseClickedAtShown;
                            batch2.image = image;
                            batch2.fitWidth = 24.0;
                            batch2.fitHeight = 30.0;
                            rdoinsureYes.visible = true;
                            rdoinsureYes.layoutY = 110.0;
                            rdoinsureYes.onKeyPressed = rdoinsureYesOnKeyPressedAtShown;
                            rdoinsureYes.onMouseClicked = rdoinsureYesOnMouseClickedAtShown;
                            rdoinsureYes.text = "Yes";
                            rdoinsureYes.font = Arial_14;
                            rdoinsureYes.toggleGroup = toggleGroup2;
                            rdoinsureNo.visible = true;
                            rdoinsureNo.layoutY = 110.0;
                            rdoinsureNo.onKeyPressed = rdoinsureNoOnKeyPressedAtShown;
                            rdoinsureNo.onMouseClicked = rdoinsureNoOnMouseClickedAtShown;
                            rdoinsureNo.text = "No";
                            rdoinsureNo.font = Arial_14;
                            rdoinsureNo.toggleGroup = toggleGroup2;
                            rdoinsureNo.selected = true;
                            lblbill.visible = false;
                            lblbill.cursor = null;
                            lblbill.layoutY = 138.0;
                            lblbill.text = "Bill No";
                            lblbill.font = Arial_14;
                            imageView10.visible = false;
                            imageView10.layoutY = 0.0;
                            imageView10.image = null;
                            imageView10.fitHeight = 0.0;
                            product.visible = true;
                            product.layoutY = 0.0;
                            label2.disable = false;
                            label2.layoutY = 30.0;
                            label2.text = "Name";
                            label2.font = Arial_14;
                            txtSalesCaPName.visible = true;
                            txtSalesCaPName.layoutY = 30.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.promptText = "Patientname or Mobile No or Patient UHID";
                            txtSalesCaPName.editable = true;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 55.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_14;
                            lblBarcode.textFill = DarkGray;
                            label16.visible = true;
                            label16.layoutY = 132.0;
                            label16.text = "Patient Type";
                            label16.font = Arial_14;
                            imgPName.visible = true;
                            imgPName.layoutY = 30.0;
                            imgPName.onMouseClicked = imgPNameOnMouseClickedAtShown;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgPName.image = image;
                            txtSalesCaDName.visible = true;
                            txtSalesCaDName.layoutY = 30.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.text = "";
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.editable = true;
                            label3.visible = true;
                            label3.layoutY = 55.0;
                            label3.text = "Dept/Category";
                            label3.font = Arial_14;
                            txtCategory.visible = true;
                            txtCategory.layoutY = 55.0;
                            txtCategory.styleClass = "text-box";
                            txtCategory.onKeyReleased = txtCategoryOnKeyReleasedAtShown;
                            txtCategory.promptText = "Search Service Category";
                            txtCategory.editable = true;
                            txtCategory.font = Arial_12;
                            label9.layoutY = 30.0;
                            label9.font = Arial_14;
                            label8.layoutY = 30.0;
                            label8.font = Arial_14;
                            txtSalesCaDate.layoutY = 30.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.disable = false;
                            txtSalesCaBarcode.layoutY = 55.0;
                            txtSalesCaBarcode.onKeyPressed = txtSalesCaBarcodeOnKeyPressedAtShown;
                            txtSalesCaBarcode.onKeyTyped = txtSalesCaBarcodeOnKeyTypedAtShown;
                            txtSalesCaBarcode.onMouseClicked = txtSalesCaBarcodeOnMouseClickedAtShown;
                            txtSalesCaBarcode.font = Arial_Bold_12;
                            imgDName.visible = true;
                            imgDName.layoutY = 30.0;
                            imgDName.onMouseClicked = imgDNameOnMouseClickedAtShown;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 30.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = true;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 55.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.onKeyReleased = txtSalesCaPBillNoOnKeyReleasedAtShown;
                            txtSalesCaPBillNo.focusTraversable = true;
                            txtSalesCaPBillNo.editable = true;
                            txtSalesCaPBillNo.font = Arial_Bold_14;
                            imgCateg.visible = true;
                            imgCateg.layoutY = 55.0;
                            imgCateg.onMouseClicked = imgBillOnMouseClickedAtShown;
                            imgCateg.image = image;
                            label18.visible = false;
                            label18.opacity = 0.9;
                            label18.layoutY = 30.0;
                            label18.text = "Employee ID";
                            label18.font = Arial_14;
                            label18.textFill = DarkGray;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = 30.0;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            rdoIn.visible = true;
                            rdoIn.layoutY = 132.0;
                            rdoIn.onKeyPressed = rdoInOnKeyPressedAtShown;
                            rdoIn.text = "In";
                            rdoIn.font = Arial_14;
                            rdoIn.toggleGroup = toggleGroup;
                            rdoOut.visible = true;
                            rdoOut.layoutY = 132.0;
                            rdoOut.onKeyPressed = rdoOutOnKeyPressedAtShown;
                            rdoOut.text = "Out";
                            rdoOut.font = Arial_14;
                            rdoOut.toggleGroup = toggleGroup;
                            listBillNo.visible = false;
                            txtdcrname.visible = true;
                            txtdcrname.layoutY = 55.0;
                            txtdcrname.onKeyReleased = txtdcrnameOnKeyReleasedAtShown;
                            txtdcrname.text = "";
                            txtdcrname.promptText = "Enter Sub category";
                            txtdcrname.editable = true;
                            txtdcrname.font = Arial_12;
                            subCategory.visible = true;
                            subCategory.layoutY = 55.0;
                            subCategory.text = "Sub category";
                            subCategory.font = Arial_14;
                            imgSubCateg.visible = true;
                            imgSubCateg.layoutY = 55.0;
                            imgSubCateg.onMouseClicked = imgSubCategOnMouseClickedAtShown;
                            imgSubCateg.image = image2;
                            AddBtnCtg.visible = true;
                            AddBtnCtg.layoutY = 55.0;
                            __layoutInfo_AddBtnCtg.width = 30.0;
                            __layoutInfo_AddBtnCtg.height = 20.5;
                            AddBtnCtg.text = "+";
                            AddBtnCtg.font = Arial_Bold_20;
                            AddBtnCtg.action = AddBtnCtgActionAtShown;
                            AddBtnSubCtg.visible = true;
                            AddBtnSubCtg.layoutY = 55.0;
                            __layoutInfo_AddBtnSubCtg.width = 30.0;
                            __layoutInfo_AddBtnSubCtg.height = 20.5;
                            AddBtnSubCtg.text = "+";
                            AddBtnSubCtg.font = Arial_Bold_20;
                            AddBtnSubCtg.action = AddBtnSubCtgActionAtShown;
                            AddBtnSer.visible = true;
                            AddBtnSer.layoutY = 132.0;
                            __layoutInfo_AddBtnSer.width = 30.0;
                            __layoutInfo_AddBtnSer.height = 20.5;
                            AddBtnSer.text = "+";
                            AddBtnSer.font = Arial_Bold_20;
                            AddBtnSer.action = AddBtnSerActionAtShown;
                            button2.visible = false;
                            button2.layoutY = 50.0;
                            button2.text = "BalanceDue";
                            button2.action = button2ActionAtShown;
                            button3.visible = false;
                            button3.layoutY = 70.0;
                            button3.action = button3ActionAtShown;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 5.0;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSaveOnly.visible = true;
                            btnSaveOnly.cursor = null;
                            btnSaveOnly.layoutY = 0.0;
                            btnSaveOnly.onKeyPressed = btnSaveOnlyOnKeyPressedAtShown;
                            btnSaveOnly.effect = reflectionEffect;
                            btnSaveOnly.text = "Save [F3]";
                            btnSaveOnly.font = Arial_Bold_14;
                            btnSaveOnly.action = btnSaveOnlyActionAtShown;
                            imageView.visible = true;
                            imageView.image = imagePrint;
                            btnSalesCaSave.visible = true;
                            btnSalesCaSave.layoutY = 0.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesCaReset.layoutY = 0.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            button.visible = true;
                            button.layoutY = 0.0;
                            button.text = "Delete";
                            button.font = Arial_Bold_14;
                            button.action = editButtonActionAtShown;
                            imgPrescrib.visible = true;
                            imgPrescrib.image = imgPrescribe;
                            imgPrescrib.fitWidth = 25.0;
                            imgPrescrib.fitHeight = 25.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.onKeyPressed = btnPrescibeOnKeyPressedAtShown;
                            btnPrescibe.effect = reflectionEffect;
                            btnPrescibe.text = "Prescription";
                            btnPrescibe.font = Arial_Bold_14;
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            btnPrescibe.action = btnPrescibeActionAtShown;
                            imageView8.visible = false;
                            imageView8.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            imageView9.visible = false;
                            imageView9.image = null;
                            btnUpload.visible = false;
                            btnUpload.text = "Button";
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.disable = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 85.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 268.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.layoutY = 435.0;
                            __layoutInfo_rectRemoveRow.width = 120.0;
                            __layoutInfo_rectRemoveRow.height = 20.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.y = 20.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            LabelRemoveRow.managed = true;
                            LabelRemoveRow.layoutY = 455.0;
                            __layoutInfo_LabelRemoveRow.width = 120.0;
                            __layoutInfo_LabelRemoveRow.height = 20.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            label14.visible = false;
                            label14.layoutY = 40.0;
                            label10.visible = false;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label10.font = Arial_Bold_12;
                            label11.visible = false;
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label11.font = Arial_Bold_12;
                            label6.managed = true;
                            label6.layoutY = 3.0;
                            label6.text = "Discount";
                            label6.font = Arial_Bold_12;
                            label4.layoutY = 3.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_Bold_12;
                            label1.layoutY = 3.0;
                            label1.text = "Total GST";
                            label1.font = Arial_Bold_12;
                            label15.visible = false;
                            label15.layoutY = 30.0;
                            label15.text = "VAT 12.5%";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 460.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 420.0;
                            adjust_amount.text = "Adjust Amt.";
                            adjust_amount.font = Arial_Bold_12;
                            txtadjust.visible = false;
                            txtadjust.layoutY = 420.0;
                            txtadjust.onKeyPressed = txtadjustOnKeyPressedAtShown;
                            txtadjust.font = Arial_12;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 420.0;
                            __layoutInfo_btnAdjust.height = 20.0;
                            btnAdjust.onKeyPressed = btnAdjustOnKeyPressedAtShown;
                            btnAdjust.onMouseClicked = btnAdjustOnMouseClickedAtShown;
                            btnAdjust.text = "Adjust Qty [F7]";
                            btnAdjust.font = Arial_12;
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 420.0;
                            lblTotalMargin.text = "";
                            lblTotalMargin.font = Arial_Bold_14;
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 420.0;
                            __layoutInfo_btnStkAdj.height = 20.0;
                            btnStkAdj.onMouseClicked = btnStkAdjOnMouseClickedAtShown;
                            btnStkAdj.text = "Stock Adjustment to Bill [F8]";
                            btnStkAdj.font = Arial_12;
                            panelTable.visible = true;
                            panelTable.layoutY = 214.0;
                            panelTable.styleClass = "";
                            rectTableBorder.visible = true;
                            rectTableBorder.fill = null;
                            rectTableBorder.stroke = Violet;
                            rectTableBorder.strokeWidth = 2.0;
                            rectTableBorder.y = 100.0;
                            lblSalesCaTotalItm.visible = false;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 0.0;
                            lblSalesCaTotalItm.styleClass = "text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = false;
                            lblSalesCaTotalItm.editable = false;
                            txtSalesCaDiscount.visible = true;
                            txtSalesCaDiscount.disable = false;
                            txtSalesCaDiscount.layoutY = 0.0;
                            txtSalesCaDiscount.styleClass = "text-box";
                            txtSalesCaDiscount.onKeyPressed = txtSalesCaDiscountOnKeyPressedAtShown;
                            txtSalesCaDiscount.onKeyReleased = txtSalesCaDiscountOnKeyReleasedAtShown;
                            txtSalesCaDiscount.onKeyTyped = txtSalesCaDiscountOnKeyTypedAtShown;
                            txtSalesCaDiscount.promptText = "0.00";
                            txtSalesCaDiscount.selectOnFocus = false;
                            txtSalesCaDiscount.editable = false;
                            txtSalesCaDiscount.font = Arial_12;
                            txtSalesCaVAT4.layoutY = 0.0;
                            txtSalesCaVAT4.styleClass = "text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = false;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutY = 30.0;
                            txtSalesCaVAT123.styleClass = "text-box";
                            txtSalesCaVAT123.promptText = "0.00";
                            txtSalesCaVAT123.selectOnFocus = false;
                            txtSalesCaVAT123.editable = false;
                            txtSalesCaVAT123.font = Arial_12;
                            txtSalesCaSubTotal.layoutY = 0.0;
                            txtSalesCaSubTotal.styleClass = "text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = false;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            lblSalesCaTotalQty.visible = false;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 25.0;
                            lblSalesCaTotalQty.styleClass = "text-box";
                            lblSalesCaTotalQty.onKeyReleased = lblSalesCaTotalQtyOnKeyReleasedAtShown;
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = false;
                            lblSalesCaTotalQty.editable = false;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 460.0;
                            __layoutInfo_panelTxtColumn1.width = 0.0;
                            __layoutInfo_panelTxtColumn1.height = 0.0;
                            label13.visible = false;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label13.font = Arial_Bold_12;
                            label7.visible = false;
                            label7.layoutY = 0.0;
                            label7.font = Arial_Bold_12;
                            txtSalesCaNetPaid.visible = false;
                            txtSalesCaNetPaid.layoutY = 0.0;
                            __layoutInfo_txtSalesCaNetPaid.height = 20.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.onKeyTyped = txtSalesCaNetPaidOnKeyTypedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.selectOnFocus = false;
                            txtSalesCaNetPaid.editable = false;
                            txtSalesCaNetPaid.font = Arial_12;
                            txtSalesCaRoundAmt.visible = false;
                            txtSalesCaRoundAmt.layoutY = 25.0;
                            txtSalesCaRoundAmt.onKeyPressed = txtSalesCaRoundAmtOnKeyPressedAtShown;
                            txtSalesCaRoundAmt.onKeyTyped = txtSalesCaRoundAmtOnKeyTypedAtShown;
                            txtSalesCaRoundAmt.selectOnFocus = false;
                            txtSalesCaRoundAmt.editable = false;
                            txtSalesCaRoundAmt.font = Arial_12;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 0.0;
                            __layoutInfo_panelTxtColumn2.width = 0.0;
                            __layoutInfo_panelTxtColumn2.height = 0.0;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 465.0;
                            label17.visible = true;
                            label17.text = "Total";
                            label17.font = Arial_30;
                            label17.textFill = Gray;
                            txtSalesCaToalAmt.visible = true;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "0.00";
                            txtSalesCaToalAmt.font = Arial_25;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.RIGHT;
                            txtSalesCaToalAmt.textFill = Gray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 476.0;
                            rectButton.visible = false;
                            rectButton.managed = true;
                            rectButton.layoutY = 520.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = false;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 523.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            listSalesCash.disable = false;
                            listSalesCash.onKeyPressed = listSalesCashOnKeyPressedAtShown;
                            listsubcategory.visible = false;
                            listsubcategory.layoutY = 0.0;
                            listsubcategory.items = null;
                            listproductCode.visible = false;
                            listproductCode.opacity = 1.0;
                            listproductCode.layoutY = 163.0;
                            listproductCode.styleClass = "list-view";
                            listproductCode.cellFactory = null;
                            listProductName.visible = false;
                            listProductName.disable = true;
                            listProductName.layoutY = 105.0;
                            listProductName.styleClass = "list-view";
                            listProductName.blocksMouse = false;
                            listProductName.focusTraversable = false;
                            listProductName.items = null;
                            listProductName.vertical = false;
                            listProductName.pannable = false;
                            batchlist.visible = false;
                            batchlist.disable = false;
                            batchlist.opacity = 1.0;
                            batchlist.layoutY = 130.0;
                            __layoutInfo_batchlist.width = 140.0;
                            batchlist.styleClass = "list-view";
                            batchlist.items = null;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = true;
                            panelCalender.pickOnBounds = false;
                            panelCalender.cache = false;
                            label5.visible = true;
                            label5.text = "Balance Due :";
                            label5.font = Arial_30;
                            label5.textFill = Gray;
                            lblBalanceDue.visible = true;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 2.0;
                            lblBalanceDue.font = Arial_25;
                            lblBalanceDue.hpos = javafx.geometry.HPos.RIGHT;
                            lblBalanceDue.textFill = Orange;
                            panelBalanceDue.visible = true;
                            panelBalanceDue.layoutY = 476.0;
                            panelplugin.visible = true;
                            panelplugin.layoutY = 505.0;
                            panelAlert.visible = true;
                            label12.visible = true;
                            label12.disable = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 25.0;
                            label12.text = "Remarks";
                            label12.font = Arial_Bold_12;
                            label12.textFill = DarkGray;
                            label20.visible = true;
                            label20.layoutY = 0.0;
                            label20.text = "Payment Mode";
                            label20.font = Arial_14;
                            txtRemarks.visible = true;
                            txtRemarks.layoutY = 25.0;
                            __layoutInfo_txtRemarks.width = 200.0;
                            __layoutInfo_txtRemarks.height = 30.0;
                            txtRemarks.styleClass = "text-box";
                            txtRemarks.text = "";
                            txtRemarks.promptText = "";
                            txtRemarks.selectOnFocus = false;
                            txtRemarks.editable = true;
                            rdobank.visible = true;
                            rdobank.layoutX = 110.0;
                            rdobank.layoutY = 0.0;
                            rdobank.onKeyPressed = rdobankOnKeyPressedAtShown;
                            rdobank.text = "Bank";
                            rdobank.font = Arial_14;
                            rdobank.toggleGroup = toggleGroup3;
                            rdocash.visible = true;
                            rdocash.layoutX = 40.0;
                            rdocash.layoutY = 0.0;
                            rdocash.onKeyPressed = rdocashOnKeyPressedAtShown;
                            rdocash.text = "Cash";
                            rdocash.font = Arial_14;
                            rdocash.toggleGroup = toggleGroup3;
                            rdocredit.visible = true;
                            rdocredit.layoutX = 170.0;
                            rdocredit.onKeyPressed = rdocreditOnKeyPressedAtShown;
                            rdocredit.onMouseClicked = rdocreditOnMouseClickedAtShown;
                            rdocredit.text = "Credit";
                            rdocredit.font = Arial_14;
                            rdocredit.toggleGroup = toggleGroup3;
                            textbox.visible = true;
                            textbox.layoutX = 300.0;
                            label21.visible = true;
                            label21.layoutX = 250.0;
                            label21.text = "Payable";
                            label21.font = Arial_Bold_12;
                            label21.textFill = DarkGray;
                            label23.visible = false;
                            label23.layoutX = 210.0;
                            label23.layoutY = 30.0;
                            label23.text = "(Payable amount is deducted from advance)";
                            label23.font = Arial_12;
                            label23.textFill = DarkGray;
                            panelRemrkTxt.visible = true;
                            panelRemrkTxt.layoutX = 60.0;
                            panelRemarks.visible = true;
                            panelRemarks.layoutY = 460.0;
                            listbill.visible = false;
                            listbill.items = [ "Item 1", "Item 2", "Item 3", ];
                            panel.visible = true;
                            panel.disable = false;
                            panel.onKeyReleased = panelOnKeyReleasedAtShown;
                            panel.onMouseClicked = panelOnMouseClickedAtShown;
                            panelBillType.visible = false;
                            panelInfo.visible = true;
                            panelTemp.visible = false;
                            panelDispatch.visible = false;
                            panelDispatch.onMouseClicked = panelDispatchOnMouseClickedAtShown;
                            panelService.visible = true;
                            panelDeleteBill.visible = true;
                            panel2.visible = true;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                            image4.placeholder = image5;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            imageView4.visible = true;
                            btnCustDocSave.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            imageView5.visible = true;
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            panelBack.visible = false;
                            imageView7.visible = true;
                            __layoutInfo_imageView7.width = 500.0;
                            __layoutInfo_imageView7.height = 500.0;
                            imageView7.image = image4;
                            rectangle.visible = false;
                            rectangle.fill = linearGradient;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.width = 1024.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = false;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill - 1";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.visible = true;
                            product_rectangle2.opacity = 1.0;
                            product_rectangle2.layoutX = 0.0;
                            product_rectangle2.layoutY = 0.0;
                            product_rectangle2.styleClass = "form-background";
                            product_rectangle2.fill = linearGradient;
                            product_rectangle2.stroke = DarkGray;
                            product_rectangle2.y = 90.0;
                            product_rectangle2.height = 88.0;
                            product_rectangle2.arcWidth = 5.0;
                            product_rectangle2.arcHeight = 5.0;
                            lblBillNo.visible = true;
                            lblBillNo.layoutY = 108.0;
                            lblBillNo.text = "Bill No";
                            lblBillNo.font = Arial_14;
                            txtBillNo.visible = true;
                            txtBillNo.layoutY = 105.0;
                            txtBillNo.editable = false;
                            product_code.visible = true;
                            product_code.layoutY = 138.0;
                            product_code.text = "Service Name :";
                            product_code.font = Arial_14;
                            product_code.textFill = DarkGray;
                            product2.visible = true;
                            product2.cursor = null;
                            product2.layoutY = 135.0;
                            __layoutInfo_product2.height = 25.0;
                            product2.onKeyPressed = product2OnKeyPressedAtShown;
                            product2.onKeyReleased = product2OnKeyReleasedAtShown;
                            product2.promptText = "Search  Service Name";
                            product2.font = Arial_14;
                            productimageView6.visible = true;
                            productimageView6.managed = true;
                            productimageView6.layoutY = 135.0;
                            __layoutInfo_productimageView6.width = 0.0;
                            __layoutInfo_productimageView6.height = 0.0;
                            __layoutInfo_productimageView6.minWidth = 0.0;
                            __layoutInfo_productimageView6.minHeight = 0.0;
                            __layoutInfo_productimageView6.maxWidth = 0.0;
                            __layoutInfo_productimageView6.maxHeight = 0.0;
                            productimageView6.onMouseClicked = productimageView6OnMouseClickedAtShown;
                            productimageView6.image = image;
                            productimageView6.x = 0.0;
                            productimageView6.y = 0.0;
                            productimageView6.fitHeight = 25.0;
                            PolicyNo.visible = false;
                            PolicyNo.layoutY = 120.0;
                            PolicyNo.text = "PolicyNo";
                            PolicyNo.font = Arial_14;
                            InsurName.visible = false;
                            InsurName.layoutY = 95.0;
                            InsurName.text = "Insurance Name";
                            InsurName.font = Arial_14;
                            label19.visible = false;
                            label19.layoutY = 145.0;
                            label19.text = "Amount";
                            label19.font = Arial_14;
                            label22.visible = true;
                            label22.layoutY = 108.0;
                            label22.text = "Insured Patient";
                            label22.font = Arial_14;
                            imageView6.visible = true;
                            imageView6.image = imagePrint;
                            button1.visible = false;
                            button1.layoutY = 135.0;
                            __layoutInfo_button1.height = 25.0;
                            button1.text = "Reprint";
                            button1.font = Arial_Bold_14;
                            button1.action = btnReprintActionAtShown;
                            quantity.visible = false;
                            quantity.layoutY = 95.0;
                            __layoutInfo_quantity.height = 20.0;
                            quantity.onKeyPressed = quantityOnKeyPressedAtShown;
                            quantity.onKeyTyped = quantityOnKeyTypedAtShown;
                            quantity.text = "";
                            quantity.promptText = "Insurance";
                            quantity.font = Arial_12;
                            batch.visible = false;
                            batch.layoutY = 120.0;
                            __layoutInfo_batch.height = 20.0;
                            batch.onKeyPressed = batchOnKeyPressedAtShown;
                            batch.onKeyReleased = batchOnKeyReleasedAtShown;
                            batch.promptText = "Policy Number";
                            batch.font = Arial_12;
                            billno.visible = false;
                            billno.layoutY = 138.0;
                            __layoutInfo_billno.height = 20.0;
                            billno.font = null;
                            qutinhand.visible = false;
                            qutinhand.layoutY = 145.0;
                            __layoutInfo_qutinhand.height = 20.0;
                            qutinhand.styleClass = "text-box";
                            qutinhand.onKeyPressed = qutinhandOnKeyPressedAtShown;
                            qutinhand.promptText = "Policy Amount";
                            qutinhand.editable = true;
                            qutinhand.font = Arial_12;
                            batch2.visible = false;
                            batch2.layoutY = 100.0;
                            batch2.onMouseClicked = batch2OnMouseClickedAtShown;
                            batch2.image = image;
                            batch2.fitWidth = 24.0;
                            batch2.fitHeight = 30.0;
                            rdoinsureYes.visible = true;
                            rdoinsureYes.layoutY = 110.0;
                            rdoinsureYes.onKeyPressed = rdoinsureYesOnKeyPressedAtShown;
                            rdoinsureYes.onMouseClicked = rdoinsureYesOnMouseClickedAtShown;
                            rdoinsureYes.text = "Yes";
                            rdoinsureYes.font = Arial_14;
                            rdoinsureYes.toggleGroup = toggleGroup2;
                            rdoinsureNo.visible = true;
                            rdoinsureNo.layoutY = 110.0;
                            rdoinsureNo.onKeyPressed = rdoinsureNoOnKeyPressedAtShown;
                            rdoinsureNo.onMouseClicked = rdoinsureNoOnMouseClickedAtShown;
                            rdoinsureNo.text = "No";
                            rdoinsureNo.font = Arial_14;
                            rdoinsureNo.toggleGroup = toggleGroup2;
                            rdoinsureNo.selected = true;
                            lblbill.visible = false;
                            lblbill.cursor = null;
                            lblbill.layoutY = 138.0;
                            lblbill.text = "Bill No";
                            lblbill.font = Arial_14;
                            imageView10.visible = false;
                            imageView10.layoutY = 0.0;
                            imageView10.image = null;
                            imageView10.fitHeight = 0.0;
                            product.visible = true;
                            product.layoutY = 0.0;
                            label2.disable = false;
                            label2.layoutY = 30.0;
                            label2.text = "Name";
                            label2.font = Arial_14;
                            txtSalesCaPName.visible = true;
                            txtSalesCaPName.layoutY = 30.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.promptText = "Patientname or Mobile No or Patient UHID";
                            txtSalesCaPName.editable = true;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 55.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_14;
                            lblBarcode.textFill = DarkGray;
                            label16.visible = true;
                            label16.layoutY = 132.0;
                            label16.text = "Patient Type";
                            label16.font = Arial_14;
                            imgPName.visible = true;
                            imgPName.layoutY = 30.0;
                            imgPName.onMouseClicked = imgPNameOnMouseClickedAtShown;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgPName.image = image;
                            txtSalesCaDName.visible = true;
                            txtSalesCaDName.layoutY = 30.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.text = "";
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.editable = true;
                            label3.visible = true;
                            label3.layoutY = 55.0;
                            label3.text = "Dept/Category";
                            label3.font = Arial_14;
                            txtCategory.visible = true;
                            txtCategory.layoutY = 55.0;
                            txtCategory.styleClass = "text-box";
                            txtCategory.onKeyReleased = txtCategoryOnKeyReleasedAtShown;
                            txtCategory.promptText = "Search Service Category";
                            txtCategory.editable = true;
                            txtCategory.font = Arial_12;
                            label9.layoutY = 30.0;
                            label9.font = Arial_14;
                            label8.layoutY = 30.0;
                            label8.font = Arial_14;
                            txtSalesCaDate.layoutY = 30.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.disable = false;
                            txtSalesCaBarcode.layoutY = 55.0;
                            txtSalesCaBarcode.onKeyPressed = txtSalesCaBarcodeOnKeyPressedAtShown;
                            txtSalesCaBarcode.onKeyTyped = txtSalesCaBarcodeOnKeyTypedAtShown;
                            txtSalesCaBarcode.onMouseClicked = txtSalesCaBarcodeOnMouseClickedAtShown;
                            txtSalesCaBarcode.font = Arial_Bold_12;
                            imgDName.visible = true;
                            imgDName.layoutY = 30.0;
                            imgDName.onMouseClicked = imgDNameOnMouseClickedAtShown;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 30.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = true;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 55.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.onKeyReleased = txtSalesCaPBillNoOnKeyReleasedAtShown;
                            txtSalesCaPBillNo.focusTraversable = true;
                            txtSalesCaPBillNo.editable = true;
                            txtSalesCaPBillNo.font = Arial_Bold_14;
                            imgCateg.visible = true;
                            imgCateg.layoutY = 55.0;
                            imgCateg.onMouseClicked = imgBillOnMouseClickedAtShown;
                            imgCateg.image = image;
                            label18.visible = false;
                            label18.opacity = 0.9;
                            label18.layoutY = 30.0;
                            label18.text = "Employee ID";
                            label18.font = Arial_14;
                            label18.textFill = DarkGray;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = 30.0;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            rdoIn.visible = true;
                            rdoIn.layoutY = 132.0;
                            rdoIn.onKeyPressed = rdoInOnKeyPressedAtShown;
                            rdoIn.text = "In";
                            rdoIn.font = Arial_14;
                            rdoIn.toggleGroup = toggleGroup;
                            rdoOut.visible = true;
                            rdoOut.layoutY = 132.0;
                            rdoOut.onKeyPressed = rdoOutOnKeyPressedAtShown;
                            rdoOut.text = "Out";
                            rdoOut.font = Arial_14;
                            rdoOut.toggleGroup = toggleGroup;
                            listBillNo.visible = false;
                            txtdcrname.visible = true;
                            txtdcrname.layoutY = 55.0;
                            txtdcrname.onKeyReleased = txtdcrnameOnKeyReleasedAtShown;
                            txtdcrname.text = "";
                            txtdcrname.promptText = "Enter Sub category";
                            txtdcrname.editable = true;
                            txtdcrname.font = Arial_12;
                            subCategory.visible = true;
                            subCategory.layoutY = 55.0;
                            subCategory.text = "Sub category";
                            subCategory.font = Arial_14;
                            imgSubCateg.visible = true;
                            imgSubCateg.layoutY = 55.0;
                            imgSubCateg.onMouseClicked = imgSubCategOnMouseClickedAtShown;
                            imgSubCateg.image = image2;
                            AddBtnCtg.visible = true;
                            AddBtnCtg.layoutY = 55.0;
                            __layoutInfo_AddBtnCtg.width = 30.0;
                            __layoutInfo_AddBtnCtg.height = 20.5;
                            AddBtnCtg.text = "+";
                            AddBtnCtg.font = Arial_Bold_20;
                            AddBtnCtg.action = AddBtnCtgActionAtShown;
                            AddBtnSubCtg.visible = true;
                            AddBtnSubCtg.layoutY = 55.0;
                            __layoutInfo_AddBtnSubCtg.width = 30.0;
                            __layoutInfo_AddBtnSubCtg.height = 20.5;
                            AddBtnSubCtg.text = "+";
                            AddBtnSubCtg.font = Arial_Bold_20;
                            AddBtnSubCtg.action = AddBtnSubCtgActionAtShown;
                            AddBtnSer.visible = true;
                            AddBtnSer.layoutY = 132.0;
                            __layoutInfo_AddBtnSer.width = 30.0;
                            __layoutInfo_AddBtnSer.height = 20.5;
                            AddBtnSer.text = "+";
                            AddBtnSer.font = Arial_Bold_20;
                            AddBtnSer.action = AddBtnSerActionAtShown;
                            button2.visible = false;
                            button2.layoutY = 0.0;
                            button2.text = "Button";
                            button3.visible = false;
                            button3.layoutY = 0.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 5.0;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSaveOnly.visible = true;
                            btnSaveOnly.cursor = null;
                            btnSaveOnly.layoutY = 0.0;
                            btnSaveOnly.onKeyPressed = btnSaveOnlyOnKeyPressedAtShown;
                            btnSaveOnly.effect = reflectionEffect;
                            btnSaveOnly.text = "Save [F3]";
                            btnSaveOnly.font = Arial_Bold_14;
                            btnSaveOnly.action = btnSaveOnlyActionAtShown;
                            imageView.visible = true;
                            imageView.image = imagePrint;
                            btnSalesCaSave.visible = true;
                            btnSalesCaSave.layoutY = 0.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesCaReset.layoutY = 0.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            button.visible = true;
                            button.layoutY = 0.0;
                            button.text = "Edit";
                            button.font = Arial_Bold_14;
                            button.action = editButtonActionAtShown;
                            imgPrescrib.visible = true;
                            imgPrescrib.image = imgPrescribe;
                            imgPrescrib.fitWidth = 25.0;
                            imgPrescrib.fitHeight = 25.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.onKeyPressed = btnPrescibeOnKeyPressedAtShown;
                            btnPrescibe.effect = reflectionEffect;
                            btnPrescibe.text = "Prescription";
                            btnPrescibe.font = Arial_Bold_14;
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            btnPrescibe.action = btnPrescibeActionAtShown;
                            imageView8.visible = false;
                            imageView8.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            imageView9.visible = false;
                            imageView9.image = null;
                            btnUpload.visible = false;
                            btnUpload.text = "Button";
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.disable = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 85.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 268.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.layoutY = 435.0;
                            __layoutInfo_rectRemoveRow.width = 120.0;
                            __layoutInfo_rectRemoveRow.height = 20.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.y = 20.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            LabelRemoveRow.managed = true;
                            LabelRemoveRow.layoutY = 455.0;
                            __layoutInfo_LabelRemoveRow.width = 120.0;
                            __layoutInfo_LabelRemoveRow.height = 20.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            label14.visible = false;
                            label14.layoutY = 40.0;
                            label10.visible = false;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label10.font = Arial_Bold_12;
                            label11.visible = false;
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label11.font = Arial_Bold_12;
                            label6.managed = true;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_Bold_12;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_Bold_12;
                            label1.layoutY = 25.0;
                            label1.text = "Total GST";
                            label1.font = Arial_Bold_12;
                            label15.visible = false;
                            label15.layoutY = 30.0;
                            label15.text = "VAT 12.5%";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 460.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 420.0;
                            adjust_amount.text = "Adjust Amt.";
                            adjust_amount.font = Arial_Bold_12;
                            txtadjust.visible = false;
                            txtadjust.layoutY = 420.0;
                            txtadjust.onKeyPressed = txtadjustOnKeyPressedAtShown;
                            txtadjust.font = Arial_12;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 420.0;
                            __layoutInfo_btnAdjust.height = 20.0;
                            btnAdjust.onKeyPressed = btnAdjustOnKeyPressedAtShown;
                            btnAdjust.onMouseClicked = btnAdjustOnMouseClickedAtShown;
                            btnAdjust.text = "Adjust Qty [F7]";
                            btnAdjust.font = Arial_12;
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 420.0;
                            lblTotalMargin.text = "";
                            lblTotalMargin.font = Arial_Bold_14;
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 420.0;
                            __layoutInfo_btnStkAdj.height = 20.0;
                            btnStkAdj.onMouseClicked = btnStkAdjOnMouseClickedAtShown;
                            btnStkAdj.text = "Stock Adjustment to Bill [F8]";
                            btnStkAdj.font = Arial_12;
                            panelTable.visible = true;
                            panelTable.layoutY = 214.0;
                            panelTable.styleClass = "";
                            rectTableBorder.visible = true;
                            rectTableBorder.fill = null;
                            rectTableBorder.stroke = Violet;
                            rectTableBorder.strokeWidth = 2.0;
                            rectTableBorder.y = 100.0;
                            lblSalesCaTotalItm.visible = false;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 0.0;
                            lblSalesCaTotalItm.styleClass = "text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = false;
                            lblSalesCaTotalItm.editable = false;
                            txtSalesCaDiscount.visible = true;
                            txtSalesCaDiscount.disable = false;
                            txtSalesCaDiscount.layoutY = 25.0;
                            txtSalesCaDiscount.styleClass = "text-box";
                            txtSalesCaDiscount.onKeyPressed = txtSalesCaDiscountOnKeyPressedAtShown;
                            txtSalesCaDiscount.onKeyReleased = txtSalesCaDiscountOnKeyReleasedAtShown;
                            txtSalesCaDiscount.onKeyTyped = txtSalesCaDiscountOnKeyTypedAtShown;
                            txtSalesCaDiscount.promptText = "0.00";
                            txtSalesCaDiscount.selectOnFocus = false;
                            txtSalesCaDiscount.editable = false;
                            txtSalesCaDiscount.font = Arial_12;
                            txtSalesCaVAT4.layoutY = 25.0;
                            txtSalesCaVAT4.styleClass = "text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = false;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutY = 30.0;
                            txtSalesCaVAT123.styleClass = "text-box";
                            txtSalesCaVAT123.promptText = "0.00";
                            txtSalesCaVAT123.selectOnFocus = false;
                            txtSalesCaVAT123.editable = false;
                            txtSalesCaVAT123.font = Arial_12;
                            txtSalesCaSubTotal.layoutY = 25.0;
                            txtSalesCaSubTotal.styleClass = "text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = false;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            lblSalesCaTotalQty.visible = false;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 25.0;
                            lblSalesCaTotalQty.styleClass = "text-box";
                            lblSalesCaTotalQty.onKeyReleased = lblSalesCaTotalQtyOnKeyReleasedAtShown;
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = false;
                            lblSalesCaTotalQty.editable = false;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 460.0;
                            __layoutInfo_panelTxtColumn1.width = 0.0;
                            __layoutInfo_panelTxtColumn1.height = 0.0;
                            label13.visible = false;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label13.font = Arial_Bold_12;
                            label7.visible = false;
                            label7.layoutY = 0.0;
                            label7.font = Arial_Bold_12;
                            txtSalesCaNetPaid.visible = false;
                            txtSalesCaNetPaid.layoutY = 0.0;
                            __layoutInfo_txtSalesCaNetPaid.height = 20.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.onKeyTyped = txtSalesCaNetPaidOnKeyTypedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.selectOnFocus = false;
                            txtSalesCaNetPaid.editable = false;
                            txtSalesCaNetPaid.font = Arial_12;
                            txtSalesCaRoundAmt.visible = false;
                            txtSalesCaRoundAmt.layoutY = 25.0;
                            txtSalesCaRoundAmt.onKeyPressed = txtSalesCaRoundAmtOnKeyPressedAtShown;
                            txtSalesCaRoundAmt.onKeyTyped = txtSalesCaRoundAmtOnKeyTypedAtShown;
                            txtSalesCaRoundAmt.selectOnFocus = false;
                            txtSalesCaRoundAmt.editable = false;
                            txtSalesCaRoundAmt.font = Arial_12;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 0.0;
                            __layoutInfo_panelTxtColumn2.width = 0.0;
                            __layoutInfo_panelTxtColumn2.height = 0.0;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 460.0;
                            label17.visible = true;
                            label17.text = "Total";
                            label17.font = Arial_30;
                            label17.textFill = Gray;
                            txtSalesCaToalAmt.visible = true;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "0.00";
                            txtSalesCaToalAmt.font = Arial_25;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.RIGHT;
                            txtSalesCaToalAmt.textFill = Gray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 470.0;
                            rectButton.visible = false;
                            rectButton.managed = true;
                            rectButton.layoutY = 520.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = false;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 523.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            listSalesCash.disable = false;
                            listSalesCash.onKeyPressed = listSalesCashOnKeyPressedAtShown;
                            listsubcategory.visible = false;
                            listsubcategory.layoutY = 0.0;
                            listsubcategory.items = null;
                            listproductCode.visible = false;
                            listproductCode.opacity = 1.0;
                            listproductCode.layoutY = 163.0;
                            listproductCode.styleClass = "list-view";
                            listproductCode.cellFactory = null;
                            listProductName.visible = false;
                            listProductName.disable = true;
                            listProductName.layoutY = 105.0;
                            listProductName.styleClass = "list-view";
                            listProductName.blocksMouse = false;
                            listProductName.focusTraversable = false;
                            listProductName.items = null;
                            listProductName.vertical = false;
                            listProductName.pannable = false;
                            batchlist.visible = false;
                            batchlist.disable = false;
                            batchlist.opacity = 1.0;
                            batchlist.layoutY = 130.0;
                            __layoutInfo_batchlist.width = 140.0;
                            batchlist.styleClass = "list-view";
                            batchlist.items = null;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = true;
                            panelCalender.pickOnBounds = false;
                            panelCalender.cache = false;
                            label5.visible = true;
                            label5.text = "Balance Due :";
                            label5.font = Arial_30;
                            label5.textFill = DarkGray;
                            lblBalanceDue.visible = true;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.font = Arial_25;
                            lblBalanceDue.hpos = javafx.geometry.HPos.RIGHT;
                            lblBalanceDue.textFill = Orange;
                            panelBalanceDue.visible = true;
                            panelBalanceDue.layoutY = 470.0;
                            panelplugin.visible = true;
                            panelplugin.layoutY = 505.0;
                            panelAlert.visible = true;
                            label12.visible = true;
                            label12.disable = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 25.0;
                            label12.text = "Remarks";
                            label12.font = Arial_Bold_12;
                            label12.textFill = DarkGray;
                            label20.visible = true;
                            label20.layoutY = 0.0;
                            label20.text = "Payment Mode";
                            label20.font = Arial_14;
                            txtRemarks.visible = true;
                            txtRemarks.layoutY = 25.0;
                            __layoutInfo_txtRemarks.width = 280.0;
                            __layoutInfo_txtRemarks.height = 30.0;
                            txtRemarks.styleClass = "text-box";
                            txtRemarks.text = "";
                            txtRemarks.promptText = "";
                            txtRemarks.selectOnFocus = false;
                            txtRemarks.editable = true;
                            rdobank.visible = true;
                            rdobank.layoutX = 110.0;
                            rdobank.layoutY = 0.0;
                            rdobank.onKeyPressed = rdobankOnKeyPressedAtShown;
                            rdobank.text = "Bank";
                            rdobank.font = Arial_14;
                            rdobank.toggleGroup = toggleGroup3;
                            rdocash.visible = true;
                            rdocash.layoutX = 40.0;
                            rdocash.layoutY = 0.0;
                            rdocash.onKeyPressed = rdocashOnKeyPressedAtShown;
                            rdocash.text = "Cash";
                            rdocash.font = Arial_14;
                            rdocash.toggleGroup = toggleGroup3;
                            rdocredit.visible = true;
                            rdocredit.layoutX = 170.0;
                            rdocredit.onKeyPressed = rdocreditOnKeyPressedAtShown;
                            rdocredit.text = "Credit";
                            rdocredit.font = Arial_14;
                            rdocredit.toggleGroup = toggleGroup3;
                            textbox.visible = false;
                            textbox.layoutX = 0.0;
                            label21.visible = false;
                            label21.layoutX = 0.0;
                            label21.text = "Label";
                            label21.textFill = javafx.scene.paint.Color.BLACK;
                            label23.visible = false;
                            label23.layoutX = 0.0;
                            label23.layoutY = 0.0;
                            label23.text = "Label";
                            label23.textFill = javafx.scene.paint.Color.BLACK;
                            panelRemrkTxt.visible = true;
                            panelRemrkTxt.layoutX = 60.0;
                            panelRemarks.visible = true;
                            panelRemarks.layoutY = 460.0;
                            listbill.visible = false;
                            listbill.items = [ "Item 1", "Item 2", "Item 3", ];
                            panel.visible = true;
                            panel.disable = false;
                            panel.onKeyReleased = panelOnKeyReleasedAtShown;
                            panel.onMouseClicked = panelOnMouseClickedAtShown;
                            panelBillType.visible = false;
                            panelInfo.visible = true;
                            panelTemp.visible = false;
                            panelDispatch.visible = false;
                            panelDispatch.onMouseClicked = panelDispatchOnMouseClickedAtShown;
                            panelService.visible = true;
                            panelDeleteBill.visible = true;
                            panel2.visible = true;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                            image4.placeholder = image5;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            imageView4.visible = true;
                            btnCustDocSave.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            imageView5.visible = true;
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            panelBack.visible = false;
                            imageView7.visible = true;
                            __layoutInfo_imageView7.width = 500.0;
                            __layoutInfo_imageView7.height = 500.0;
                            imageView7.image = image4;
                            rectangle.visible = false;
                            rectangle.fill = linearGradient;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.width = 1024.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = false;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill - 1";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.visible = true;
                            product_rectangle2.opacity = 1.0;
                            product_rectangle2.layoutX = 0.0;
                            product_rectangle2.layoutY = 0.0;
                            product_rectangle2.styleClass = "form-background";
                            product_rectangle2.fill = linearGradient;
                            product_rectangle2.stroke = DarkGray;
                            product_rectangle2.y = 90.0;
                            product_rectangle2.height = 88.0;
                            product_rectangle2.arcWidth = 5.0;
                            product_rectangle2.arcHeight = 5.0;
                            lblBillNo.visible = true;
                            lblBillNo.layoutY = 108.0;
                            lblBillNo.text = "Bill No";
                            lblBillNo.font = Arial_14;
                            txtBillNo.visible = true;
                            txtBillNo.layoutY = 105.0;
                            txtBillNo.onKeyReleased = txtBillNoOnKeyReleasedAtEdit;
                            txtBillNo.editable = true;
                            product_code.visible = true;
                            product_code.layoutY = 138.0;
                            product_code.text = "Service Name :";
                            product_code.font = Arial_14;
                            product_code.textFill = DarkGray;
                            product2.visible = true;
                            product2.cursor = null;
                            product2.layoutY = 135.0;
                            __layoutInfo_product2.height = 25.0;
                            product2.onKeyPressed = product2OnKeyPressedAtShown;
                            product2.onKeyReleased = product2OnKeyReleasedAtShown;
                            product2.promptText = "Search  Service Name";
                            product2.font = Arial_14;
                            productimageView6.visible = true;
                            productimageView6.managed = true;
                            productimageView6.layoutY = 135.0;
                            __layoutInfo_productimageView6.width = 0.0;
                            __layoutInfo_productimageView6.height = 0.0;
                            __layoutInfo_productimageView6.minWidth = 0.0;
                            __layoutInfo_productimageView6.minHeight = 0.0;
                            __layoutInfo_productimageView6.maxWidth = 0.0;
                            __layoutInfo_productimageView6.maxHeight = 0.0;
                            productimageView6.onMouseClicked = productimageView6OnMouseClickedAtShown;
                            productimageView6.image = image;
                            productimageView6.x = 0.0;
                            productimageView6.y = 0.0;
                            productimageView6.fitHeight = 25.0;
                            PolicyNo.visible = false;
                            PolicyNo.layoutY = 120.0;
                            PolicyNo.text = "PolicyNo";
                            PolicyNo.font = Arial_14;
                            InsurName.visible = false;
                            InsurName.layoutY = 95.0;
                            InsurName.text = "Insurance Name";
                            InsurName.font = Arial_14;
                            label19.visible = false;
                            label19.layoutY = 145.0;
                            label19.text = "Amount";
                            label19.font = Arial_14;
                            label22.visible = true;
                            label22.layoutY = 108.0;
                            label22.text = "Insured Patient";
                            label22.font = Arial_14;
                            imageView6.visible = true;
                            imageView6.image = imagePrint;
                            button1.visible = false;
                            button1.layoutY = 135.0;
                            __layoutInfo_button1.height = 25.0;
                            button1.text = "Reprint";
                            button1.font = Arial_Bold_14;
                            button1.action = btnReprintActionAtShown;
                            quantity.visible = false;
                            quantity.layoutY = 95.0;
                            __layoutInfo_quantity.height = 20.0;
                            quantity.onKeyPressed = quantityOnKeyPressedAtShown;
                            quantity.onKeyTyped = quantityOnKeyTypedAtShown;
                            quantity.text = "";
                            quantity.promptText = "Insurance";
                            quantity.font = Arial_12;
                            batch.visible = false;
                            batch.layoutY = 120.0;
                            __layoutInfo_batch.height = 20.0;
                            batch.onKeyPressed = batchOnKeyPressedAtShown;
                            batch.onKeyReleased = batchOnKeyReleasedAtShown;
                            batch.promptText = "Policy Number";
                            batch.font = Arial_12;
                            billno.visible = false;
                            billno.layoutY = 138.0;
                            __layoutInfo_billno.height = 20.0;
                            billno.font = null;
                            qutinhand.visible = false;
                            qutinhand.layoutY = 145.0;
                            __layoutInfo_qutinhand.height = 20.0;
                            qutinhand.styleClass = "text-box";
                            qutinhand.onKeyPressed = qutinhandOnKeyPressedAtShown;
                            qutinhand.promptText = "Policy Amount";
                            qutinhand.editable = true;
                            qutinhand.font = Arial_12;
                            batch2.visible = false;
                            batch2.layoutY = 100.0;
                            batch2.onMouseClicked = batch2OnMouseClickedAtShown;
                            batch2.image = image;
                            batch2.fitWidth = 24.0;
                            batch2.fitHeight = 30.0;
                            rdoinsureYes.visible = true;
                            rdoinsureYes.layoutY = 110.0;
                            rdoinsureYes.onKeyPressed = rdoinsureYesOnKeyPressedAtShown;
                            rdoinsureYes.onMouseClicked = rdoinsureYesOnMouseClickedAtShown;
                            rdoinsureYes.text = "Yes";
                            rdoinsureYes.font = Arial_14;
                            rdoinsureYes.toggleGroup = toggleGroup2;
                            rdoinsureNo.visible = true;
                            rdoinsureNo.layoutY = 110.0;
                            rdoinsureNo.onKeyPressed = rdoinsureNoOnKeyPressedAtShown;
                            rdoinsureNo.onMouseClicked = rdoinsureNoOnMouseClickedAtShown;
                            rdoinsureNo.text = "No";
                            rdoinsureNo.font = Arial_14;
                            rdoinsureNo.toggleGroup = toggleGroup2;
                            rdoinsureNo.selected = true;
                            lblbill.visible = false;
                            lblbill.cursor = null;
                            lblbill.layoutY = 138.0;
                            lblbill.text = "Bill No";
                            lblbill.font = Arial_14;
                            imageView10.visible = true;
                            imageView10.layoutY = 103.0;
                            imageView10.image = image;
                            imageView10.fitHeight = 25.0;
                            product.visible = true;
                            product.layoutY = 0.0;
                            label2.disable = false;
                            label2.layoutY = 30.0;
                            label2.text = "Name";
                            label2.font = Arial_14;
                            txtSalesCaPName.visible = true;
                            txtSalesCaPName.layoutY = 30.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.promptText = "Patientname or Mobile No or Patient UHID";
                            txtSalesCaPName.editable = true;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 55.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_14;
                            lblBarcode.textFill = DarkGray;
                            label16.visible = true;
                            label16.layoutY = 132.0;
                            label16.text = "Patient Type";
                            label16.font = Arial_14;
                            imgPName.visible = true;
                            imgPName.layoutY = 30.0;
                            imgPName.onMouseClicked = imgPNameOnMouseClickedAtShown;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgPName.image = image;
                            txtSalesCaDName.visible = true;
                            txtSalesCaDName.layoutY = 30.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.text = "";
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.editable = true;
                            label3.visible = true;
                            label3.layoutY = 55.0;
                            label3.text = "Dept/Category";
                            label3.font = Arial_14;
                            txtCategory.visible = true;
                            txtCategory.layoutY = 55.0;
                            txtCategory.styleClass = "text-box";
                            txtCategory.onKeyReleased = txtCategoryOnKeyReleasedAtShown;
                            txtCategory.promptText = "Search Service Category";
                            txtCategory.editable = true;
                            txtCategory.font = Arial_12;
                            label9.layoutY = 30.0;
                            label9.font = Arial_14;
                            label8.layoutY = 30.0;
                            label8.font = Arial_14;
                            txtSalesCaDate.layoutY = 30.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.disable = false;
                            txtSalesCaBarcode.layoutY = 55.0;
                            txtSalesCaBarcode.onKeyPressed = txtSalesCaBarcodeOnKeyPressedAtShown;
                            txtSalesCaBarcode.onKeyTyped = txtSalesCaBarcodeOnKeyTypedAtShown;
                            txtSalesCaBarcode.onMouseClicked = txtSalesCaBarcodeOnMouseClickedAtShown;
                            txtSalesCaBarcode.font = Arial_Bold_12;
                            imgDName.visible = true;
                            imgDName.layoutY = 30.0;
                            imgDName.onMouseClicked = imgDNameOnMouseClickedAtShown;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 30.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = true;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 55.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.onKeyReleased = txtSalesCaPBillNoOnKeyReleasedAtShown;
                            txtSalesCaPBillNo.focusTraversable = true;
                            txtSalesCaPBillNo.editable = true;
                            txtSalesCaPBillNo.font = Arial_Bold_14;
                            imgCateg.visible = true;
                            imgCateg.layoutY = 55.0;
                            imgCateg.onMouseClicked = imgBillOnMouseClickedAtShown;
                            imgCateg.image = image;
                            label18.visible = false;
                            label18.opacity = 0.9;
                            label18.layoutY = 30.0;
                            label18.text = "Employee ID";
                            label18.font = Arial_14;
                            label18.textFill = DarkGray;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = 30.0;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            rdoIn.visible = true;
                            rdoIn.layoutY = 132.0;
                            rdoIn.onKeyPressed = rdoInOnKeyPressedAtShown;
                            rdoIn.text = "In";
                            rdoIn.font = Arial_14;
                            rdoIn.toggleGroup = toggleGroup;
                            rdoOut.visible = true;
                            rdoOut.layoutY = 132.0;
                            rdoOut.onKeyPressed = rdoOutOnKeyPressedAtShown;
                            rdoOut.text = "Out";
                            rdoOut.font = Arial_14;
                            rdoOut.toggleGroup = toggleGroup;
                            listBillNo.visible = false;
                            txtdcrname.visible = true;
                            txtdcrname.layoutY = 55.0;
                            txtdcrname.onKeyReleased = txtdcrnameOnKeyReleasedAtShown;
                            txtdcrname.text = "";
                            txtdcrname.promptText = "Enter Sub category";
                            txtdcrname.editable = true;
                            txtdcrname.font = Arial_12;
                            subCategory.visible = true;
                            subCategory.layoutY = 55.0;
                            subCategory.text = "Sub category";
                            subCategory.font = Arial_14;
                            imgSubCateg.visible = true;
                            imgSubCateg.layoutY = 55.0;
                            imgSubCateg.onMouseClicked = imgSubCategOnMouseClickedAtShown;
                            imgSubCateg.image = image2;
                            AddBtnCtg.visible = true;
                            AddBtnCtg.layoutY = 55.0;
                            __layoutInfo_AddBtnCtg.width = 30.0;
                            __layoutInfo_AddBtnCtg.height = 20.5;
                            AddBtnCtg.text = "+";
                            AddBtnCtg.font = Arial_Bold_20;
                            AddBtnCtg.action = AddBtnCtgActionAtShown;
                            AddBtnSubCtg.visible = true;
                            AddBtnSubCtg.layoutY = 55.0;
                            __layoutInfo_AddBtnSubCtg.width = 30.0;
                            __layoutInfo_AddBtnSubCtg.height = 20.5;
                            AddBtnSubCtg.text = "+";
                            AddBtnSubCtg.font = Arial_Bold_20;
                            AddBtnSubCtg.action = AddBtnSubCtgActionAtShown;
                            AddBtnSer.visible = true;
                            AddBtnSer.layoutY = 132.0;
                            __layoutInfo_AddBtnSer.width = 30.0;
                            __layoutInfo_AddBtnSer.height = 20.5;
                            AddBtnSer.text = "+";
                            AddBtnSer.font = Arial_Bold_20;
                            AddBtnSer.action = AddBtnSerActionAtShown;
                            button2.visible = false;
                            button2.layoutY = 0.0;
                            button2.text = "Button";
                            button3.visible = false;
                            button3.layoutY = 0.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 5.0;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.cursor = null;
                            btnSaveOnly.layoutY = 0.0;
                            btnSaveOnly.onKeyPressed = btnSaveOnlyOnKeyPressedAtShown;
                            btnSaveOnly.effect = reflectionEffect;
                            btnSaveOnly.text = "Save [F3]";
                            btnSaveOnly.font = Arial_Bold_14;
                            btnSaveOnly.action = btnSaveOnlyActionAtShown;
                            imageView.visible = true;
                            imageView.image = imagePrint;
                            btnSalesCaSave.visible = false;
                            btnSalesCaSave.layoutY = 0.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesCaReset.layoutY = 0.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            button.visible = false;
                            button.layoutY = 0.0;
                            button.text = "Delete";
                            button.font = Arial_Bold_14;
                            button.action = buttonActionAtShown;
                            imgPrescrib.visible = true;
                            imgPrescrib.image = imgPrescribe;
                            imgPrescrib.fitWidth = 25.0;
                            imgPrescrib.fitHeight = 25.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.onKeyPressed = btnPrescibeOnKeyPressedAtShown;
                            btnPrescibe.effect = reflectionEffect;
                            btnPrescibe.text = "Prescription";
                            btnPrescibe.font = Arial_Bold_14;
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            btnPrescibe.action = btnPrescibeActionAtShown;
                            imageView8.visible = true;
                            imageView8.image = imageBack;
                            btnBack.visible = true;
                            btnBack.text = "Back [Ctrl+Left]";
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = back;
                            imageView9.visible = true;
                            imageView9.image = imageSave;
                            btnUpload.visible = true;
                            btnUpload.effect = reflectionEffect;
                            btnUpload.text = "Update[F7]";
                            btnUpload.font = Arial_Bold_14;
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.disable = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 85.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 268.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.layoutY = 435.0;
                            __layoutInfo_rectRemoveRow.width = 120.0;
                            __layoutInfo_rectRemoveRow.height = 20.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Violet;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.y = 20.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            LabelRemoveRow.managed = true;
                            LabelRemoveRow.layoutY = 455.0;
                            __layoutInfo_LabelRemoveRow.width = 120.0;
                            __layoutInfo_LabelRemoveRow.height = 20.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            label14.visible = false;
                            label14.layoutY = 40.0;
                            label10.visible = false;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label10.font = Arial_Bold_12;
                            label11.visible = false;
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label11.font = Arial_Bold_12;
                            label6.managed = true;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_Bold_12;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_Bold_12;
                            label1.layoutY = 25.0;
                            label1.text = "Total GST";
                            label1.font = Arial_Bold_12;
                            label15.visible = false;
                            label15.layoutY = 30.0;
                            label15.text = "VAT 12.5%";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 460.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 420.0;
                            adjust_amount.text = "Adjust Amt.";
                            adjust_amount.font = Arial_Bold_12;
                            txtadjust.visible = false;
                            txtadjust.layoutY = 420.0;
                            txtadjust.onKeyPressed = txtadjustOnKeyPressedAtShown;
                            txtadjust.font = Arial_12;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 420.0;
                            __layoutInfo_btnAdjust.height = 20.0;
                            btnAdjust.onKeyPressed = btnAdjustOnKeyPressedAtShown;
                            btnAdjust.onMouseClicked = btnAdjustOnMouseClickedAtShown;
                            btnAdjust.text = "Adjust Qty [F7]";
                            btnAdjust.font = Arial_12;
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 420.0;
                            lblTotalMargin.text = "";
                            lblTotalMargin.font = Arial_Bold_14;
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 420.0;
                            __layoutInfo_btnStkAdj.height = 20.0;
                            btnStkAdj.onMouseClicked = btnStkAdjOnMouseClickedAtShown;
                            btnStkAdj.text = "Stock Adjustment to Bill [F8]";
                            btnStkAdj.font = Arial_12;
                            panelTable.visible = true;
                            panelTable.layoutY = 214.0;
                            panelTable.styleClass = "";
                            rectTableBorder.visible = true;
                            rectTableBorder.fill = null;
                            rectTableBorder.stroke = Violet;
                            rectTableBorder.strokeWidth = 2.0;
                            rectTableBorder.y = 100.0;
                            lblSalesCaTotalItm.visible = false;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 0.0;
                            lblSalesCaTotalItm.styleClass = "text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = false;
                            lblSalesCaTotalItm.editable = false;
                            txtSalesCaDiscount.visible = true;
                            txtSalesCaDiscount.disable = false;
                            txtSalesCaDiscount.layoutY = 25.0;
                            txtSalesCaDiscount.styleClass = "text-box";
                            txtSalesCaDiscount.onKeyPressed = txtSalesCaDiscountOnKeyPressedAtShown;
                            txtSalesCaDiscount.onKeyReleased = txtSalesCaDiscountOnKeyReleasedAtShown;
                            txtSalesCaDiscount.onKeyTyped = txtSalesCaDiscountOnKeyTypedAtShown;
                            txtSalesCaDiscount.promptText = "0.00";
                            txtSalesCaDiscount.selectOnFocus = false;
                            txtSalesCaDiscount.editable = false;
                            txtSalesCaDiscount.font = Arial_12;
                            txtSalesCaVAT4.layoutY = 25.0;
                            txtSalesCaVAT4.styleClass = "text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = false;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutY = 30.0;
                            txtSalesCaVAT123.styleClass = "text-box";
                            txtSalesCaVAT123.promptText = "0.00";
                            txtSalesCaVAT123.selectOnFocus = false;
                            txtSalesCaVAT123.editable = false;
                            txtSalesCaVAT123.font = Arial_12;
                            txtSalesCaSubTotal.layoutY = 25.0;
                            txtSalesCaSubTotal.styleClass = "text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = false;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            lblSalesCaTotalQty.visible = false;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 25.0;
                            lblSalesCaTotalQty.styleClass = "text-box";
                            lblSalesCaTotalQty.onKeyReleased = lblSalesCaTotalQtyOnKeyReleasedAtShown;
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = false;
                            lblSalesCaTotalQty.editable = false;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 460.0;
                            __layoutInfo_panelTxtColumn1.width = 0.0;
                            __layoutInfo_panelTxtColumn1.height = 0.0;
                            label13.visible = false;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label13.font = Arial_Bold_12;
                            label7.visible = false;
                            label7.layoutY = 0.0;
                            label7.font = Arial_Bold_12;
                            txtSalesCaNetPaid.visible = false;
                            txtSalesCaNetPaid.layoutY = 0.0;
                            __layoutInfo_txtSalesCaNetPaid.height = 20.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.onKeyTyped = txtSalesCaNetPaidOnKeyTypedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.selectOnFocus = false;
                            txtSalesCaNetPaid.editable = false;
                            txtSalesCaNetPaid.font = Arial_12;
                            txtSalesCaRoundAmt.visible = false;
                            txtSalesCaRoundAmt.layoutY = 25.0;
                            txtSalesCaRoundAmt.onKeyPressed = txtSalesCaRoundAmtOnKeyPressedAtShown;
                            txtSalesCaRoundAmt.onKeyTyped = txtSalesCaRoundAmtOnKeyTypedAtShown;
                            txtSalesCaRoundAmt.selectOnFocus = false;
                            txtSalesCaRoundAmt.editable = false;
                            txtSalesCaRoundAmt.font = Arial_12;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 0.0;
                            __layoutInfo_panelTxtColumn2.width = 0.0;
                            __layoutInfo_panelTxtColumn2.height = 0.0;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 460.0;
                            label17.visible = true;
                            label17.text = "Total";
                            label17.font = Arial_30;
                            label17.textFill = Gray;
                            txtSalesCaToalAmt.visible = true;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "0.00";
                            txtSalesCaToalAmt.font = Arial_25;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.RIGHT;
                            txtSalesCaToalAmt.textFill = Gray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 470.0;
                            rectButton.visible = false;
                            rectButton.managed = true;
                            rectButton.layoutY = 520.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = false;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 523.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            listSalesCash.disable = false;
                            listSalesCash.onKeyPressed = listSalesCashOnKeyPressedAtShown;
                            listsubcategory.visible = false;
                            listsubcategory.layoutY = 0.0;
                            listsubcategory.items = null;
                            listproductCode.visible = false;
                            listproductCode.opacity = 1.0;
                            listproductCode.layoutY = 163.0;
                            listproductCode.styleClass = "list-view";
                            listproductCode.cellFactory = null;
                            listProductName.visible = false;
                            listProductName.disable = true;
                            listProductName.layoutY = 105.0;
                            listProductName.styleClass = "list-view";
                            listProductName.blocksMouse = false;
                            listProductName.focusTraversable = false;
                            listProductName.items = null;
                            listProductName.vertical = false;
                            listProductName.pannable = false;
                            batchlist.visible = false;
                            batchlist.disable = false;
                            batchlist.opacity = 1.0;
                            batchlist.layoutY = 130.0;
                            __layoutInfo_batchlist.width = 140.0;
                            batchlist.styleClass = "list-view";
                            batchlist.items = null;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = true;
                            panelCalender.pickOnBounds = false;
                            panelCalender.cache = false;
                            label5.visible = true;
                            label5.text = "Balance Due :";
                            label5.font = Arial_30;
                            label5.textFill = DarkGray;
                            lblBalanceDue.visible = true;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.font = Arial_25;
                            lblBalanceDue.hpos = javafx.geometry.HPos.RIGHT;
                            lblBalanceDue.textFill = Orange;
                            panelBalanceDue.visible = true;
                            panelBalanceDue.layoutY = 470.0;
                            panelplugin.visible = true;
                            panelplugin.layoutY = 505.0;
                            panelAlert.visible = true;
                            label12.visible = true;
                            label12.disable = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 25.0;
                            label12.text = "Remarks";
                            label12.font = Arial_Bold_12;
                            label12.textFill = DarkGray;
                            label20.visible = true;
                            label20.layoutY = 0.0;
                            label20.text = "Payment Mode";
                            label20.font = Arial_14;
                            txtRemarks.visible = true;
                            txtRemarks.layoutY = 25.0;
                            __layoutInfo_txtRemarks.width = 280.0;
                            __layoutInfo_txtRemarks.height = 30.0;
                            txtRemarks.styleClass = "text-box";
                            txtRemarks.text = "";
                            txtRemarks.promptText = "";
                            txtRemarks.selectOnFocus = false;
                            txtRemarks.editable = true;
                            rdobank.visible = true;
                            rdobank.layoutX = 110.0;
                            rdobank.layoutY = 0.0;
                            rdobank.onKeyPressed = rdobankOnKeyPressedAtShown;
                            rdobank.text = "Bank";
                            rdobank.font = Arial_14;
                            rdobank.toggleGroup = toggleGroup3;
                            rdocash.visible = true;
                            rdocash.layoutX = 40.0;
                            rdocash.layoutY = 0.0;
                            rdocash.onKeyPressed = rdocashOnKeyPressedAtShown;
                            rdocash.text = "Cash";
                            rdocash.font = Arial_14;
                            rdocash.toggleGroup = toggleGroup3;
                            rdocredit.visible = true;
                            rdocredit.layoutX = 170.0;
                            rdocredit.onKeyPressed = rdocreditOnKeyPressedAtShown;
                            rdocredit.text = "Credit";
                            rdocredit.font = Arial_14;
                            rdocredit.toggleGroup = toggleGroup3;
                            textbox.visible = false;
                            textbox.layoutX = 0.0;
                            label21.visible = false;
                            label21.layoutX = 0.0;
                            label21.text = "Label";
                            label21.textFill = javafx.scene.paint.Color.BLACK;
                            label23.visible = false;
                            label23.layoutX = 0.0;
                            label23.layoutY = 0.0;
                            label23.text = "Label";
                            label23.textFill = javafx.scene.paint.Color.BLACK;
                            panelRemrkTxt.visible = true;
                            panelRemrkTxt.layoutX = 60.0;
                            panelRemarks.visible = true;
                            panelRemarks.layoutY = 460.0;
                            listbill.visible = false;
                            listbill.items = [ "Item1", ];
                            panel.visible = true;
                            panel.disable = false;
                            panel.onKeyReleased = panelOnKeyReleasedAtShown;
                            panel.onMouseClicked = panelOnMouseClickedAtShown;
                            panelBillType.visible = false;
                            panelInfo.visible = true;
                            panelTemp.visible = false;
                            panelDispatch.visible = false;
                            panelDispatch.onMouseClicked = panelDispatchOnMouseClickedAtShown;
                            panelService.visible = true;
                            panelDeleteBill.visible = true;
                            panel2.visible = true;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                            image4.placeholder = image5;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            imageView4.visible = false;
                            btnCustDocSave.visible = false;
                            btnCustDocSave.text = "Save [F3]";
                            imageView5.visible = false;
                            btnSalesBack.visible = false;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            btnSalesBack.action = btnSalesBackAction;
                            panelBack.visible = false;
                            imageView7.visible = false;
                            imageView7.image = null;
                            rectangle.visible = false;
                            rectangle.fill = linearGradient;
                            rectangle.strokeWidth = 2.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.width = 0.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 0.0;
                            rectHeader.arcHeight = 0.0;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.visible = false;
                            product_rectangle2.opacity = 1.0;
                            product_rectangle2.layoutX = 326.0;
                            product_rectangle2.layoutY = 144.0;
                            product_rectangle2.styleClass = "";
                            product_rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            product_rectangle2.stroke = null;
                            product_rectangle2.y = 0.0;
                            product_rectangle2.height = 50.0;
                            product_rectangle2.arcWidth = 0.0;
                            product_rectangle2.arcHeight = 0.0;
                            lblBillNo.visible = false;
                            lblBillNo.layoutY = 0.0;
                            lblBillNo.text = "Label";
                            txtBillNo.visible = false;
                            txtBillNo.layoutY = 0.0;
                            txtBillNo.editable = false;
                            product_code.visible = false;
                            product_code.layoutY = 159.0;
                            product_code.text = "Label";
                            product_code.textFill = javafx.scene.paint.Color.BLACK;
                            product2.visible = false;
                            product2.layoutY = 150.0;
                            product2.promptText = null;
                            productimageView6.visible = false;
                            productimageView6.managed = true;
                            productimageView6.layoutY = 0.0;
                            productimageView6.image = null;
                            productimageView6.x = 0.0;
                            productimageView6.y = 0.0;
                            productimageView6.fitHeight = 0.0;
                            PolicyNo.visible = false;
                            PolicyNo.layoutY = 0.0;
                            PolicyNo.text = "Label";
                            InsurName.visible = false;
                            InsurName.layoutY = 0.0;
                            InsurName.text = "Label";
                            label19.visible = false;
                            label19.layoutY = 0.0;
                            label19.text = "Label";
                            label22.visible = false;
                            label22.layoutY = 0.0;
                            label22.text = "Label";
                            imageView6.visible = false;
                            imageView6.image = null;
                            button1.visible = false;
                            button1.layoutY = 0.0;
                            button1.text = "Button";
                            quantity.visible = false;
                            quantity.layoutY = 0.0;
                            quantity.text = null;
                            quantity.promptText = null;
                            batch.visible = false;
                            batch.layoutY = 0.0;
                            batch.promptText = null;
                            billno.visible = false;
                            billno.layoutY = 0.0;
                            qutinhand.visible = false;
                            qutinhand.layoutY = 0.0;
                            qutinhand.styleClass = "text-box";
                            qutinhand.promptText = null;
                            qutinhand.editable = true;
                            batch2.visible = false;
                            batch2.layoutY = 0.0;
                            batch2.image = null;
                            batch2.fitWidth = 0.0;
                            batch2.fitHeight = 0.0;
                            rdoinsureYes.visible = false;
                            rdoinsureYes.layoutY = 0.0;
                            rdoinsureYes.text = "Radio Button";
                            rdoinsureYes.toggleGroup = null;
                            rdoinsureNo.visible = false;
                            rdoinsureNo.layoutY = 0.0;
                            rdoinsureNo.text = "Radio Button";
                            rdoinsureNo.toggleGroup = null;
                            rdoinsureNo.selected = false;
                            lblbill.visible = false;
                            lblbill.layoutY = 0.0;
                            lblbill.text = "Label";
                            imageView10.visible = false;
                            imageView10.layoutY = 0.0;
                            imageView10.image = null;
                            imageView10.fitHeight = 0.0;
                            product.visible = false;
                            product.layoutY = 0.0;
                            label2.disable = false;
                            label2.layoutY = 60.0;
                            label2.text = "Customer Name";
                            label2.font = Arial_12;
                            txtSalesCaPName.visible = true;
                            txtSalesCaPName.layoutY = 60.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.promptText = "Enter Customer Name";
                            txtSalesCaPName.editable = true;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            label16.visible = false;
                            label16.layoutY = 0.0;
                            label16.text = "Label";
                            imgPName.visible = false;
                            imgPName.layoutY = 0.0;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgPName.image = image;
                            txtSalesCaDName.visible = true;
                            txtSalesCaDName.layoutY = 85.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.text = null;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.editable = true;
                            label3.visible = true;
                            label3.layoutY = 60.0;
                            label3.text = "TIN No";
                            label3.font = Arial_12;
                            txtCategory.visible = true;
                            txtCategory.layoutY = 85.0;
                            txtCategory.styleClass = "Borderless-text-box";
                            txtCategory.promptText = null;
                            txtCategory.editable = false;
                            txtCategory.font = Arial_12;
                            label9.layoutY = 60.0;
                            label9.font = Arial_12;
                            label8.layoutY = 85.0;
                            label8.font = Arial_12;
                            txtSalesCaDate.layoutY = 60.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.disable = false;
                            txtSalesCaBarcode.layoutY = 0.0;
                            imgDName.visible = false;
                            imgDName.layoutY = 0.0;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = false;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 60.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.focusTraversable = false;
                            txtSalesCaPBillNo.editable = false;
                            txtSalesCaPBillNo.font = Arial_12;
                            imgCateg.visible = false;
                            imgCateg.layoutY = 15.0;
                            imgCateg.image = null;
                            label18.visible = false;
                            label18.opacity = 1.0;
                            label18.layoutY = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = -4.0;
                            rdoIn.visible = false;
                            rdoIn.layoutY = 0.0;
                            rdoIn.text = "Radio Button";
                            rdoIn.toggleGroup = null;
                            rdoOut.visible = false;
                            rdoOut.layoutY = 0.0;
                            rdoOut.text = "Radio Button";
                            rdoOut.toggleGroup = null;
                            listBillNo.visible = false;
                            txtdcrname.visible = false;
                            txtdcrname.layoutY = 0.0;
                            txtdcrname.text = null;
                            txtdcrname.promptText = null;
                            txtdcrname.editable = true;
                            subCategory.visible = false;
                            subCategory.layoutY = 0.0;
                            subCategory.text = "Label";
                            imgSubCateg.visible = false;
                            imgSubCateg.layoutY = 0.0;
                            imgSubCateg.image = null;
                            AddBtnCtg.visible = false;
                            AddBtnCtg.layoutY = 0.0;
                            AddBtnCtg.text = "Button";
                            AddBtnSubCtg.visible = false;
                            AddBtnSubCtg.layoutY = 0.0;
                            AddBtnSubCtg.text = "Button";
                            AddBtnSer.visible = false;
                            AddBtnSer.layoutY = 0.0;
                            AddBtnSer.text = "Button";
                            button2.visible = false;
                            button2.layoutY = 0.0;
                            button2.text = "Button";
                            button3.visible = false;
                            button3.layoutY = 0.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 0.0;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.layoutY = 534.0;
                            btnSaveOnly.text = "Save [F3]";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesCaSave.visible = false;
                            btnSalesCaSave.layoutY = 525.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesCaReset.layoutY = 525.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            button.visible = false;
                            button.layoutY = 0.0;
                            button.text = "Button";
                            imgPrescrib.visible = false;
                            imgPrescrib.image = null;
                            imgPrescrib.fitWidth = 0.0;
                            imgPrescrib.fitHeight = 0.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.text = "Button";
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            imageView8.visible = false;
                            imageView8.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            imageView9.visible = false;
                            imageView9.image = null;
                            btnUpload.visible = false;
                            btnUpload.text = "Button";
                            panelButtons.visible = false;
                            listView.visible = true;
                            listView.disable = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 288.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.layoutY = 0.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.y = 0.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            LabelRemoveRow.managed = true;
                            LabelRemoveRow.layoutY = 0.0;
                            __layoutInfo_LabelRemoveRow.width = 100.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            label14.visible = false;
                            label14.layoutY = 60.0;
                            label10.visible = true;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label10.font = Arial_12;
                            label11.visible = true;
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label11.font = Arial_12;
                            label6.managed = true;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_12;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_12;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label1.font = Arial_12;
                            label15.visible = false;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 336.0;
                            adjust_amount.text = "Label";
                            txtadjust.visible = false;
                            txtadjust.layoutY = 0.0;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 0.0;
                            btnAdjust.text = "Button";
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 0.0;
                            btnStkAdj.text = "Button";
                            panelTable.visible = false;
                            panelTable.layoutY = 0.0;
                            panelTable.styleClass = "";
                            rectTableBorder.visible = false;
                            rectTableBorder.fill = javafx.scene.paint.Color.BLACK;
                            rectTableBorder.stroke = null;
                            rectTableBorder.strokeWidth = 1.0;
                            rectTableBorder.y = 0.0;
                            lblSalesCaTotalItm.visible = true;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 445.0;
                            lblSalesCaTotalItm.styleClass = "Borderless-text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = true;
                            lblSalesCaTotalItm.editable = false;
                            txtSalesCaDiscount.visible = false;
                            txtSalesCaDiscount.disable = false;
                            txtSalesCaDiscount.layoutY = 0.0;
                            txtSalesCaDiscount.styleClass = "Borderless-text-box";
                            txtSalesCaDiscount.promptText = null;
                            txtSalesCaDiscount.selectOnFocus = true;
                            txtSalesCaDiscount.editable = true;
                            txtSalesCaVAT4.layoutY = 0.0;
                            txtSalesCaVAT4.styleClass = "Borderless-text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = true;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutY = 499.0;
                            txtSalesCaVAT123.styleClass = "Borderless-text-box";
                            txtSalesCaVAT123.promptText = null;
                            txtSalesCaVAT123.selectOnFocus = true;
                            txtSalesCaVAT123.editable = true;
                            txtSalesCaSubTotal.layoutY = 0.0;
                            txtSalesCaSubTotal.styleClass = "Borderless-text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = true;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            lblSalesCaTotalQty.visible = true;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 470.0;
                            lblSalesCaTotalQty.styleClass = "Borderless-text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = true;
                            lblSalesCaTotalQty.editable = false;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 0.0;
                            label13.visible = true;
                            label13.layoutX = 70.0;
                            label13.layoutY = 445.0;
                            label13.font = Arial_12;
                            label7.visible = true;
                            label7.layoutY = 470.0;
                            label7.font = Arial_12;
                            txtSalesCaNetPaid.visible = true;
                            txtSalesCaNetPaid.layoutY = 445.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.selectOnFocus = true;
                            txtSalesCaNetPaid.editable = true;
                            txtSalesCaNetPaid.font = Arial_Bold_12;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 0.0;
                            txtSalesCaRoundAmt.selectOnFocus = true;
                            txtSalesCaRoundAmt.editable = true;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 0.0;
                            __layoutInfo_panelTxtColumn2.width = 0.0;
                            __layoutInfo_panelTxtColumn2.height = 0.0;
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
                            label17.visible = false;
                            label17.text = "Label";
                            label17.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesCaToalAmt.visible = false;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "Label";
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesCaToalAmt.textFill = javafx.scene.paint.Color.BLACK;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 0.0;
                            rectButton.visible = true;
                            rectButton.managed = true;
                            rectButton.layoutY = 531.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = true;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 534.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            listSalesCash.disable = false;
                            listsubcategory.visible = false;
                            listsubcategory.layoutY = 0.0;
                            listsubcategory.items = [ "Item 1", "Item 2", "Item 3", ];
                            listproductCode.visible = false;
                            listproductCode.opacity = 1.0;
                            listproductCode.layoutY = 0.0;
                            listproductCode.styleClass = "list-view";
                            listproductCode.cellFactory = null;
                            listProductName.visible = false;
                            listProductName.disable = false;
                            listProductName.layoutY = 0.0;
                            listProductName.styleClass = "list-view";
                            listProductName.blocksMouse = true;
                            listProductName.focusTraversable = true;
                            listProductName.items = [ "Item 1", "Item 2", "Item 3", ];
                            listProductName.vertical = true;
                            listProductName.pannable = true;
                            batchlist.visible = false;
                            batchlist.disable = false;
                            batchlist.opacity = 1.0;
                            batchlist.layoutY = 0.0;
                            batchlist.styleClass = "list-view";
                            batchlist.items = [ "Item 1", "Item 2", "Item 3", ];
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = true;
                            panelCalender.pickOnBounds = true;
                            panelCalender.cache = true;
                            label5.visible = false;
                            label5.text = "Label";
                            label5.textFill = javafx.scene.paint.Color.BLACK;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.hpos = javafx.geometry.HPos.LEFT;
                            lblBalanceDue.textFill = javafx.scene.paint.Color.BLACK;
                            panelBalanceDue.visible = false;
                            panelBalanceDue.layoutY = 0.0;
                            panelplugin.visible = false;
                            panelplugin.layoutY = 0.0;
                            panelAlert.visible = true;
                            label12.visible = false;
                            label12.disable = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            label20.visible = false;
                            label20.layoutY = 0.0;
                            label20.text = "Label";
                            txtRemarks.visible = true;
                            txtRemarks.layoutY = 470.0;
                            txtRemarks.styleClass = "Borderless-text-box";
                            txtRemarks.text = "";
                            txtRemarks.promptText = "0.00";
                            txtRemarks.selectOnFocus = true;
                            txtRemarks.editable = false;
                            rdobank.visible = false;
                            rdobank.layoutX = 0.0;
                            rdobank.layoutY = 0.0;
                            rdobank.text = "Radio Button";
                            rdobank.toggleGroup = null;
                            rdocash.visible = false;
                            rdocash.layoutX = 0.0;
                            rdocash.layoutY = 0.0;
                            rdocash.text = "Radio Button";
                            rdocash.toggleGroup = null;
                            rdocredit.visible = false;
                            rdocredit.layoutX = 0.0;
                            rdocredit.text = "Radio Button";
                            rdocredit.toggleGroup = null;
                            textbox.visible = false;
                            textbox.layoutX = 0.0;
                            label21.visible = false;
                            label21.layoutX = 0.0;
                            label21.text = "Label";
                            label21.textFill = javafx.scene.paint.Color.BLACK;
                            label23.visible = false;
                            label23.layoutX = 0.0;
                            label23.layoutY = 0.0;
                            label23.text = "Label";
                            label23.textFill = javafx.scene.paint.Color.BLACK;
                            panelRemrkTxt.visible = false;
                            panelRemrkTxt.layoutX = 0.0;
                            panelRemarks.visible = false;
                            panelRemarks.layoutY = 0.0;
                            listbill.visible = false;
                            listbill.items = [ "Item 1", "Item 2", "Item 3", ];
                            panel.visible = false;
                            panel.disable = false;
                            panelBillType.visible = false;
                            panelInfo.visible = false;
                            panelTemp.visible = false;
                            panelDispatch.visible = false;
                            panelService.visible = false;
                            panelDeleteBill.visible = false;
                            panel2.visible = false;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                            image4.placeholder = null;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelDocInfo, panelCustInfo, panelBack, imageView7, panel, panelBillType, panelInfo, panelTemp, panelDispatch, panel2, ]
    }
    // </editor-fold>//GEN-END:main

    function rdocreditOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        rdocredit.selected=true;
        System.out.println("clickeddd");
         }

    function button3ActionAtShown(): Void {
        CashSalesTableObj.removeLastColumn();
        flag=false;
         }

    function button2ActionAtShownn (): Void {
        flag=true;
            }
  

    function editButtonActionAtShown(): Void {


//         currentState.actual = currentState.findIndex("Edit");
//
//          resetValues();
//         salesCashTable1.layoutX = 0;
//        salesCashTable1.layoutY = 0;
//         var cashTable1 = CashSalesTableObj.createTable();//new add
//    var salesCashTable1 = SwingComponent.wrap(CashSalesTableObj.getScrollTable(cashTable1));//new add

//         panelTable.content = [salesCashTable];
//         System.out.println("fff");
//        TableH=235.0;
//          System.out.println(salesCashTable1.visible);
//         System.out.println(panelTable.visible);
         }

 function back(): Void {
        currentState.actual = currentState.findIndex("Shown");
         resetValues();
        }

//    function cancelActionAtShown(): Void {
//        resetValues();
//        panel.visible=false;
//      def c=SalesCash12{};
//      c.cancelFormm();
////        CommonDeclare.form[3] = 0;
//         }

    function AddBtnSubCtgActionAtShown(): Void {
        //        if (txtSalesCaPName.text.trim().equals("")) {
        //        FXinfo("Please select Patient name");
        //    } else
        if (not txtCategory.text.trim().equals("")) {

            popSubCategory(txtCategory.text);
        } else {
            FXinfo("Please select Category");
        }
    }

    function txtdcrnameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //
        if (not txtCategory.text.trim().equals("")) {
            listSubCategory();
            if (event.code == KeyCode.VK_DOWN) {
                listsubcategory.requestFocus();
                listsubcategory.selectFirstRow();
            }
        } else {

            FXinfo("Please select Category");
        }
    }

    function imgSubCategOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        //
        if (not txtCategory.rawText.trim().equals("")) {
            if (listsubcategory.visible == false) {
                listSubCategory();

            } else {
                listsubcategory.visible = false;
            }

        } else {
            FXinfo("Please select Category name");
        } }
//
//      


    function rdocreditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            rdobank.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {

            rdocredit.selected = true;

        }
    }

    function AddBtnSerActionAtShown(): Void {
        if (txtdcrname.rawText.trim().equals("")) {
            FXinfo("Please Select subcategory");
        } else {

            popService(txtCategory.rawText,txtdcrname.rawText);
        }
    }

    function AddBtnCtgActionAtShown(): Void {
        popCategory();
    }

    function txtCategoryOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {

        System.out.println(txtCategory.text.trim());
        getBillNo(txtCategory.rawText.trim());
    }

    function buttonActionAtShown(): Void {
        if (CommonDeclare.userType != "SuperAdmin") {
            FXinfo("Admin Only Have Access to Delete Bills");
        } else {
            System.out.println("Delete Bill");
            panelDeleteBill.visible = true;
            DeleteServBill.Show();
        }
    }

    function rdoinsureNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoinsureNo.selected = true;
        }
    }

    function rdoinsureYesOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            rdoinsureNo.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            //rdoIn.visible=true;
            rdoinsureYes.selected = true;
            PolicyNo.visible = true;
            quantity.visible = true;
            InsurName.visible = true;
            batch.visible = true;
            label19.visible = true;
            qutinhand.visible = true;
            quantity.requestFocus();

        }
    }

    function rdoinsureNoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        PolicyNo.visible = false;
        quantity.visible = false;
        InsurName.visible = false;
        batch.visible = false;
        label19.visible = false;
        qutinhand.visible = false;
    }

    function rdoinsureYesOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        PolicyNo.visible = true;
        quantity.visible = true;
        InsurName.visible = true;
        batch.visible = true;
        label19.visible = true;
        qutinhand.visible = true;
        quantity.requestFocus();
    }

    function rdoInOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            rdoOut.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {

            rdoIn.selected = true;

        }
    }

    function rdoOutOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_TAB) {
            txtSalesCaDName.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {

            rdoOut.selected = true;
        }
    }
 function rdoCreditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
     if (event.code == KeyCode.VK_ENTER) {
            System.out.println("credittt");
            rdocredit.selected = true;
        }
     }
    function rdobankOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
             rdocredit.requestFocus();
        // txtSalesCaDName.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
        System.out.println("bankkkkk");
            rdobank.selected = true;
        }
    }

    function rdocashOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            rdobank.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {

            rdocash.selected = true;

        }
    }

    public function panelOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function productimageView6OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not txtdcrname.rawText.trim().equals("")) {
            if (product2.text == "") {
                System.out.println("iop");
                getProductCode(0, event);
                System.out.println("iop2");
                listproductCode.visible = true;
                listproductCode.requestFocus();
                listproductCode.selectFirstRow();
                listTrue();
                System.out.println("iop23");
                 }
             } else {
            FXinfo("Please select sub category");
             }
         }

    function panelDispatchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    //listFalse();
    }

    function btnStkAdjOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        stockAdjustmentToBill();
    }

    function stockAdjustmentToBill(): Void {
        var stkAdjustRows = Integer.parseInt(commonController.getQueryValue("SELECT count(*) FROM stock_adjustment s where adjusted_stock <0"));
        if (stkAdjustRows == 0) {
            FXinfo("There is no Stock Adjustment available for Sales bill Conversion.Please check");
        } else {
            if (CashSalesTableObj.nullVal == 1) {
                var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Sales Cash", "<html>Selecting this option will reset table values.<br> Do you want to continue?</html> ");
                if (cn.staus == true) {
                    CashSalesTableObj.insertSalesAdjData();
                }
            } else {
                CashSalesTableObj.insertSalesAdjData();
            }
        }
    }

    function txtSalesCaDiscountOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
        if (event.code == KeyCode.VK_ENTER) {
            if (CashSalesTableObj.barcodeFocus == true) {
                txtSalesCaBarcode.requestFocus();
            } else {
                txtSalesCaPName.requestFocus();
            }
        }
    }

    function btnPrescibeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtSalesCaPBillNo.requestFocus();
            if (event.shiftDown) {
                btnSalesCaReset.requestFocus();
            }
        }
    }

    var pd: PrescriptionDetails;

    function btnPrescibeActionAtShown(): Void {
        pd = new PrescriptionDetails(CashSalesTableObj.jcomp, "SalesInvoice");
        pd.setVisible(true);
        var isVisible = bind pd.isVisible() on replace {
            if (not isVisible and not pd.isLoaded) {
                      ;
                   }
     else if(not isVisible and pd.isLoaded)
          {
         txtSalesCaPName.text=pd.patientName;
        // txtSalesCaDName.text = pd.doctorName;
        }
        }
       }

         function lblSalesCaTotalQtyOnKeyReleasedAtShown(event:javafx.scene.input.KeyEvent): Void {
          shortcut(event)  ;
               }
            var  salesDiscSettings= bind CommonDeclare.salesDiscApply on replace   {
                CashSalesTableObj.dtmodel.setCellEditable(0,6, salesDiscSettings); //selva
                       }

        function txtSalesCaDiscountOnKeyPressedAtShown  (event

     : javafx.scene.input.KeyEvent): Void {
        if (settingsController.getSalesDiscountType     ()

         ==       0)   {
                txtSalesCaDiscount.editable = false;
            } else      {
                txtSalesCaDiscount  .editable = true;
            }


     if(event    .code

         == KeyCode.VK_TAB  )       {
            //                txtSalesCaBalAmt.requestFocus();
            if(  event.shiftDown    )

      {
         btnAdjust.requestFocus    ();
        }
                  }
         shortcut(event);
    }

    function txtSalesCaDiscountOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void
         {
        if(not txtSalesCaDiscount.rawText.trim().equals(""))
        {
            var intValid:Integer;
            valid1 = new Validation();
            intValid = valid1.getDecimalValid(txtSalesCaDiscount.rawText, 1, 6);
            if(intValid ==1)
            {
                FXinfo("Discount amount cannot be more than 6 digits.");
            }
            else if(intValid ==0)
            {
                FXinfo("Please enter only numbers.Characters not allowed");
            }
            else if(Double.parseDouble(txtSalesCaDiscount.rawText) >= CashSalesTableObj.totAmt)
            {
                FXinfo("Discount Amount cannot be greater than total Amount");
            }
            else
            {
                CashSalesTableObj.calcDiscount(txtSalesCaDiscount.rawText.trim());
                calcDiscTotal ("disc");
            }
        }
        else
        {
            CashSalesTableObj.calcDiscount("0");
            calcDiscTotal("disc");
        }
      }

    function calcDiscTotal (calcType:String): Void {
            var ta: Double = Value.Round(CashSalesTableObj.totAmt, 2);
            var tott:Double=Value.Round(CashSalesTableObj.totalAmtttt, 2);
            var tda: Double = Value.Round(CashSalesTableObj.totDistAmt, 2);
            var tvat4: Double = Value.Round(CashSalesTableObj.totVATAmt4, 2);
             var tGst: Double = Value.Round(CashSalesTableObj.totGst, 2);
              gstAmt=(tGst);
            vatAmt = (tvat4);
            txtSalesCaSubTotal.text = Value.Round(ta);
            txtSalesCaToalAmt.text = Value.Round(tott);
            lblSalesCaTotalQty.text = "{CashSalesTableObj.totQty}";
            lblSalesCaTotalItm.text = "{CashSalesTableObj.totItems}";
         //sabarish   lblTotalMargin.text = "TOTAL MARGIN : {Value.Round(CashSalesTableObj.totMargin)}";
             if(calcType.equals("total"))
             {
           txtSalesCaDiscount.text = "{Value.Round(tda, 2)}";
            }
            //txtSalesCaVAT4.text = Value.Round(tvat4);
         txtSalesCaVAT4.text = Value.Round(tGst);
       
         textbox.text=txtSalesCaToalAmt.text.toString();
        
        if(Double.parseDouble(balance.toString())>0)
        {
            
            System.out.println("?.,");
      var payable: Double = Double.parseDouble(txtSalesCaToalAmt.text.toString())-Double.parseDouble(balance.toString());
            if(payable<0)
            {
                System.out.println("----");
                 payable=0.00;
                 textbox.text="0.00";
                 label23.visible=true;
            }
            else
            {
                System.out.println("----");
                System.out.println(payable.toString());
                textbox.text=payable.toString();
                 label23.visible=true;
                }
            }
            if(flag==true)
            {
                System.out.println("Ajithh??");
                textbox.text=balance.toString().substring(1);
                }
                else
                {
                    System.out.println("Ajithhhhhhh");
                    }
                    System.out.println("hellooooooooooooooooooooooooooooooooooo");
                    System.out.println(flag);
            
    }



       function txtSalesCaRoundAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_TAB) {
         //sabarish   SalesPlugin.txtReceived.requestFocus();
            if(event.shiftDown){
                txtSalesCaVAT4.requestFocus();
            }
        }
        shortcut(event);
        }

    function txtSalesCaRoundAmtOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        if (NumberUtils.isNumeric(txtSalesCaRoundAmt) and not txtSalesCaRoundAmt.rawText.equals("")) {
         //txtSalesCaToalAmt.text = "{Value.Round(netAmt+Double.parseDouble(txtSalesCaRoundAmt.text))}";
         txtSalesCaToalAmt.text = Double.toString(Value.Round(CashSalesTableObj.totAmt, 2));
         if(selBillType.equals("Cash")) {
             txtSalesCaNetPaid.text = txtSalesCaToalAmt.text;
//             txtSalesCaBalAmt.text = "0.00";
        } else if (selBillType.equals("Credit") and not txtSalesCaNetPaid.rawText.equals("")) {
                var bal = Double.parseDouble(txtSalesCaToalAmt.text) - Double.parseDouble(txtSalesCaNetPaid.rawText);
//                txtSalesCaBalAmt.text = Value.Round("{bal}");
            }
            }
         }

    function cboEmp_codeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
         }

    function txtadjustOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void
    {
        if(event.code == KeyCode.VK_ENTER) {
            btnAdjust.requestFocus();
        }
        else if(event.code == KeyCode.VK_TAB) {
            btnAdjust.requestFocus();
            if(event.shiftDown){
             //salestype sabarish    SalesTypeSelection.rdoCard.requestFocus();
            }
        }
        shortcut(event);
    }

    function btnAdjustOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            adjustmentAmount();
        }
        if(event.code == KeyCode.VK_TAB) {
            txtSalesCaDiscount.requestFocus();
            if(event.shiftDown)
            {
                txtadjust.requestFocus();
            }
        }
        shortcut(event);
    }

    function btnAdjustOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        adjustmentAmount();
         }
    function adjustmentAmount():Void{
         var returnFlag : Integer;
         var valid1:Validation = new Validation();
         var intValid:Integer;
         if(txtadjust.rawText.trim() !=""){
            intValid = valid1.getNumberValid(txtadjust.text, 1, 6);
            if(intValid ==1)
            {
                FXinfo("Adjustment amount cannot be more than 6 digits.");
            }
            else if(intValid ==0)
            {
                FXinfo("Please enter only numbers.Characters and decimals not allowed");
            }
            else if(txtadjust.rawText.trim().equals("0"))
            {
                FXinfo("Adjustment amount should be greater than zero.");
            }
            else
            {
                returnFlag = CashSalesTableObj.adjustAmount(Integer.parseInt(txtadjust.text));
                if(returnFlag == 0){
                    FXinfo("Please enter table values.");
                }
                else if(returnFlag == 2){
                    FXinfo("Adjustment Amount greater than total sales Amount");
                }
            }
         }
         else {
                FXinfo("Please enter the Amount in Adjust amt. text box");
         }
         updateIntValues();
    }

    function cboEmp_codeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
        if(event.code==KeyCode.VK_TAB) {
            txtSalesCaDate.requestFocus();
            if(event.shiftDown){
                txtSalesCaPBillNo.requestFocus();
            }
        }
        shortcut(event);
    }              

    function btnSaveOnlyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
        saveSales(0);
        }
        }

    function txtSalesCaPBillNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getBillNo(txtSalesCaPBillNo.rawText);
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_DOWN)
        {
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        }
       else if (event.code == KeyCode.VK_ESCAPE)
        {
            listSalesCash.visible = false;
            CashSalesTableObj.focusSet();
        }
         shortcut(event);

    }

    function imgBillOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if(listSalesCash.visible==false){
        getBillNo("");}
        else
        {
            listSalesCash.visible=false;
            }
         }

    function txtSalesCaNetPaidOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (NumberUtils.isNumeric(txtSalesCaNetPaid)) {
              if (selBillType.equals("Credit") and not txtSalesCaNetPaid.rawText.equals("")) {
                var bal = Double.parseDouble(txtSalesCaToalAmt.text) - Double.parseDouble(txtSalesCaNetPaid.rawText);
//                txtSalesCaBalAmt.text = Value.Round("{bal}");
            }
        };
    }

    function lblSalesCaTotalItmOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }
  
    var tmp = bind listSalesCash.visible on replace
            {
                if (tmp == true)
                    fxCalendar.visible = false;
            }
    var panelAlertLX = bind (panelW - 500)/ 2;
    var panelAlertLY = bind (panelH - 150)/ 2;
     var panelAlertLX1 = 0;//bind (panelW - 500) / 2;
    var panelAlertLY1 = 0;//bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Sales - {selBillType} Payment",type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {        
        CustomAlert.ShowInfo("Service Billing", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, t : TextBox ): Void {
        CustomAlert.ShowInfo("Service Billing", msg);
        showAlertbox();
        t.requestFocus();
        t.style = error;
    }

    function rotateImage(img: ImageView): Void {
    }

     function imgPNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        System.out.println("a");
        listCustomerChanges(0);
        setMandatory();
    }
 
    function imgDNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listDoctorChanges(0);
    }

    function listSalesCashOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER)
            listSalesCash.visible = false;
    }

 public function ShowList(): Void {
        listFalse();     
    }

    function btnSaveOnlyActionAtShown(): Void {
        if(flag==false)
        {
            
             saveSales(0);
            }
            else
            {
                 saveSales(1);
                }
       
    }
     function listCustomerChanges(type: Integer): Void {
        try{
        var listControlObj: ListController = new ListController();
        listSalesCash.visible = true;
        listH = 0.0;
        listSalesCash.layoutX = txtSalesCaPName.layoutX;
        listSalesCash.layoutY = txtSalesCaPName.layoutY + txtSalesCaPName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesCaPName, listSalesCash, "salescustomer", type);
        var selS: String = bind listControlObj.selectedString on replace {
            if (selS.length() > 0) {
                rdoIn.requestFocus();

                //txtSalesCaDName.requestFocus();
                if (listSalesCash.selectedItem != "New name...") {
                var cust = "{listSalesCash.selectedItem}";
                txtSalesCaPName.text = cust;
                listSalesCash.visible = false;
                var n11:Integer= commonController.getQueryWitColumn("Select patient_type from cust_information where cusname_mobno = '{cust}'","patient_type");
                  if (n11 == 1) {
                        rdoIn.selected = true;

                            balance = commonController.getCustomerBalanceDue(cst);

                       if(Double.parseDouble(balance.toString())<0)
                       {
                           button2.visible=true;
                           }


                           }

//                imgP = false;
//                rdoIn.requestFocus();
//                //txtSalesCaDName.requestFocus();
//                balance = commonController.getCustomerBalance("{cust}");
//                if(creditLimitAlert("{cust}").equals(true))
//                {
//                var creditLimit:Double = salesController.getCreditLimit("{txtSalesCaPName.rawText.trim()}");
//                FXinfo("Customer oustanding exceeds the Credit Limit - {creditLimit}. To Change credit Limit in Customer Information, press ALT+C. ");
//                }
                }
                else
                {
                    txtSalesCaPName.requestFocus();
                  //  callCustInfo();
                    listSalesCash.visible = false;
                    imgP = false;
                }
            }
         }
       }
      catch (ex: Exception)
        {
            var que = " Class: ServiceBilling Method: listCustomerChanges Exception:{ex}";
            log.debug(que);
        }
   }
   
    function listCustomerChangess(type: Integer): Void {
        try{
            System.out.println("qq");
        var listControlObj: ListController = new ListController();
        listSalesCash.visible = true;
        listH = 0.0;
        listSalesCash.layoutX = txtSalesCaPName.layoutX;
        listSalesCash.layoutY = txtSalesCaPName.layoutY + txtSalesCaPName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesCaPName, listSalesCash, "salescustomer", type);
        var selS: String = bind listControlObj.selectedString on replace {                
            if (selS.length() > 0) {
//                rdoIn.requestFocus();
                
                //txtSalesCaDName.requestFocus();
                if (listSalesCash.selectedItem != "New name...") {
                var cust = "{listSalesCash.selectedItem}";
                txtSalesCaPName.text = cust;
                listSalesCash.visible = false;
            var n11:Integer= commonController.getQueryWitColumn("Select patient_type from cust_information where cusname_mobno = '{cust}'","patient_type");
               System.out.println("ggggg");
               System.out.println(n11);
                                  if (n11 == 1) {
                        rdoIn.selected = true;

                            balance = commonController.getCustomerBalanceDue(cst);
                            
                       if(Double.parseDouble(balance.toString())<0)
                       {
                           button2.visible=true;
                           }
                      

                           }
//                         billLi=commonController.getCreditBill("{cust}");
//                          var productLi: List = new ArrayList();
//
//                       if(billLi.isEmpty())
//                       {
//                           System.out.println("????????????????????");
//
//                           }
//                           else
//                           {
//                               balance = commonController.getCustomerBalanceDue(cst);
//                               System.out.println("!!!!!!");
//                               button2.visible=true;
//
////                               button3.visible=true;
//
//                               }

                        //checl
//               balance = commonController.getCustomerBalance("{cust}");
                    } else { rdoOut.selected = true; };
                    //rdoIn.selected=true;
                imgP = false;
//                rdoIn.requestFocus();chg
                //txtSalesCaDName.requestFocus();
                
//                if(creditLimitAlert("{cust}").equals(true))
//                {
//                var creditLimit:Double = salesController.getCreditLimit("{txtSalesCaPName.rawText.trim()}");
//                FXinfo("Customer oustanding exceeds the Credit Limit - {creditLimit}. To Change credit Limit in Customer Information, press ALT+C. ");
//                }
                }
                else
                {
                    txtSalesCaPName.requestFocus();
                  //  callCustInfo();
                    listSalesCash.visible = false;
                    imgP = false;
                }
            }
         }
       
      catch (ex: Exception)
        {
            var que = " Class: ServiceBilling Method: listCustomerChanges Exception:{ex}";
            log.debug(que);
        }
   }

    function creditLimitAlert(custName:String):Boolean{        
        var custos:Double = Double.parseDouble(commonController.getCustomerBalance("{custName}"));
        var creditLimit:Double = salesController.getCreditLimit("{custName}");
        var balamt:Double;
//        if(txtSalesCaBalAmt.text!=""){
//        balamt = Double.parseDouble(txtSalesCaBalAmt.text);
//        }
        var credit:Boolean = false;                        
        if(creditLimit!=0 and creditLimit < (custos+balamt))
        {
            credit = true;
        }
        return credit;
    }

 function listDoctorChanges(type: Integer): Void {
       try
        {
        var listControlObj: ListController = new ListController();
        listSalesCash.visible = true;
        listH = 0.0;
        listSalesCash.layoutX = txtSalesCaDName.layoutX;
        listSalesCash.layoutY = txtSalesCaDName.layoutY + txtSalesCaDName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesCaDName, listSalesCash, "salesdoctor", type);
         var selS: String = bind listControlObj.selectedString on replace {                
                if (selS.length() > 0) {
                   // CashSalesTableObj.focusSet();
                   product2.requestFocus();
                     if (listSalesCash.selectedItem != "New name...") {
            txtSalesCaDName.text = "{listSalesCash.selectedItem}";
            listSalesCash.visible = false;
            //CashSalesTableObj.focusSet();
            product2.requestFocus();
        } else {
            listSalesCash.visible = false;
            txtSalesCaDName.requestFocus();
           // callDocInfo();
        }
      }
    }
   }
    catch (ex: Exception)
        {
            var que = " Class: ServiceBilling Method: listDoctorChanges Exception:{ex}";
            log.debug(que);
        }
    }
    function btnCustDocSaveAction(): Void {    
     var stateVal = currentState.actual;     
     if (stateVal == 2) {
     var retVal = bind CustInfo.save(1);
     saveAndBack(retVal);
     } else if (stateVal == 0) {

     var retVal = bind DocInfo.doctorSave();
     saveAndBack(retVal);
     }     
    }
   
     var ret1 = bind CustInfo.checkVal on replace {
     saveAndBack(ret1);
     }
     var ret2 = bind DocInfo.checkVal on replace {
     saveAndBack(ret2);
     }
     var bk = bind CustInfo.isBack on replace {
     btnSalesBackAction();
     }
     var bk1 = bind DocInfo.isBack on replace {
     btnSalesBackAction();
     }
    
    function saveAndBack(retVal: Integer): Void {
    
    var stateVal = currentState.actual;
    if (stateVal == 2) {
     var user = bind CustInfo.newCust;
    if (retVal == 1) {
    currentState.actual = currentState.findIndex("Shown");
     txtSalesCaPName.text = user;
    txtSalesCaDName.requestFocus();
    }
    } else if (stateVal == 0) {
     var user = bind DocInfo.newDoc;
    if (retVal == 1) {
    currentState.actual = currentState.findIndex("Shown");
     txtSalesCaDName.text = user;
    CashSalesTableObj.focusSet();
    }
    }
    updateIntValues();
     
    }
    function btnSalesBackAction(): Void {
        var stateVal = currentState.actual;
        if (stateVal == currentState.findIndex("CustomerInfo")) {
            panelCustInfo.visible = false;
            panelBack.visible = false;
            txtSalesCaPName.text = "";
            txtSalesCaPName.requestFocus();
        } else if (stateVal == currentState.findIndex("DoctorInfo")) {
            panelDocInfo.visible = false;
            panelBack.visible = false;
            txtSalesCaDName.text = "";
            txtSalesCaDName.requestFocus();
        }
        currentState.actual = currentState.findIndex("Shown");
        updateIntValues();
    }

    function rectButtonOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    }
    def kr = KeyRegistry {};
    var short = bind CommonDeclare.currKyEvent on replace
           {
                if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 11)
                {
                    shortcut(short);
                }
            }
    public var hotKeyAddBill = false;
    public var hotKeyCloseBill = false;
    public function shortcut(event: javafx.scene.input.KeyEvent): Void
    {
        hotKeyAddBill = false;
        hotKeyCloseBill = false;
        if (event.code == kr.print and btnSalesCaSave.disable == false)
        {
            saveSales(1);
        }
        else if (event.code == kr.save and btnSalesCaSave.disable == false)
        {
            saveSales(0);
        }
        else if(event.code==kr.back)
        {
            back();
            }
        else if (event.code == KeyCode.VK_F4)
       {
            if(event.controlDown)
            {
                hotKeyCloseBill = true;
            }
            else if( btnSalesCaReset.text == "Reset [F4]")
            {
                resetValues();
            }
       }
        //Ajith added shortcut
         if(event.code == kr.product)
           {
               if(product2.text=="")
               {
                product2.requestFocus();                        
           }}
         if( event.code == kr.del)
           {
               if(txtSalesCaPBillNo.text=="")
               {
               txtSalesCaPBillNo.requestFocus();
            }
            }
        if (event.code == kr.backUp)
         {
             if(txtSalesCaPName.text=="")
             {
                  txtSalesCaPName.requestFocus();                      
             }
             }
       if (event.code == kr.restore)
         {    if(txtSalesCaDName.text==""){
                  txtSalesCaDName.requestFocus();                       
         }}
       if ( event.code == kr.edit)
         {
             if(txtSalesCaDate.text==""){
                txtSalesCaDate.requestFocus();                                  
         }}      
        }          
var C1LXbtnPrescibe: Number = bind 0.0;

  function txtSalesCaBarcodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void
    {
        if(event.code == KeyCode.VK_ENTER) {
            var itemCode:String = commonController.getQueryValue("SELECT item_code FROM barcode_mapping where delete_flag=0 and item_id='{txtSalesCaBarcode.rawText.trim()}' or barcode='{txtSalesCaBarcode.rawText.trim()}'");
            if(itemCode=="") {
                itemCode= commonController.getQueryValue("SELECT itemcode FROM drugtable where substring(item_id,3,9)='{txtSalesCaBarcode.rawText.trim()}' and dru_flag_id!=3");
            }
            var stockExists:String =commonController.getQueryValue("select count(qty) from stock_statement where item_code='{itemCode}' and ss_flag_id=0");
            if(itemCode=="") {
                FXinfo("Select valid barcode");
            }
            else if(stockExists=="0" or stockExists=="")
            {
                FXinfo("The selected Item/barcode not available in stock");
            }
            else
            {
                CashSalesTableObj.barcodeSelected = true;
                CashSalesTableObj.itemCode = itemCode;
                CashSalesTableObj.focusSet(0,1,"barcode");
            }
       }        
        else if(event.code==KeyCode.VK_F4 and event.controlDown)
        {
            hotKeyAddBill = true;
        }
        else if(event.code==KeyCode.VK_F7) {
            adjustmentAmount();
        }
        else if(event.code==KeyCode.VK_F8) {
            stockAdjustmentToBill();
        }     
    }

    public function shortcutOnTable(event: java.awt.event.KeyEvent): Void {
        try
        {             
            if (event.getKeyText(event.getKeyCode()) == "F2" and btnSalesCaSave.disable == false) {
                saveSales(1);
            }
            if (event.getKeyText(event.getKeyCode()) == "F3" and btnSalesCaSave.disable == false) {
                saveSales(0);
            }
            if (event.getKeyText(event.getKeyCode()) == "F4" and btnSalesCaReset.text == "Reset [F4]")
            {
                resetValues();
            }           
            if(event.getKeyText(event.getKeyCode()) == "F7")
            {
                adjustmentAmount();
            }
            else if(event.getKeyText(event.getKeyCode()) == "F8")
            {
                stockAdjustmentToBill();
            }
            //ajith added
            if(event.getKeyText(event.getKeyCode()) == "F1")
            {
                product2.requestFocus();
            }
            if(event.getKeyText(event.getKeyCode()) == "F5")
            {
               txtSalesCaPBillNo.requestFocus();
            }
             if(event.getKeyText(event.getKeyCode()) == "F10")
            {
               txtSalesCaPName.requestFocus();
            }
             if(event.getKeyText(event.getKeyCode()) == "F13")
            {
              cboEmp_code.requestFocus();
            }
             if(event.getKeyText(event.getKeyCode()) == "F11")
            {
               txtSalesCaDName.requestFocus();
            }
             if(event.getKeyText(event.getKeyCode()) == "F6")//
            {
               txtSalesCaDate.requestFocus();
            }
             if(event.getKeyText(event.getKeyCode()) == "F9")
            {
                txtSalesCaBarcode.requestFocus();
            }                       
    } 
    catch (ex: Exception)
       {
            log.debug("salesmydesign shortcutOnTable {ex.getMessage()}");
        }
    }

    function CashDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag)
        {
            if (txtSalesCaDate.text != null) {
                var dat = txtSalesCaDate.rawText.split("-");
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
            fxCalendar.visible = not fxCalendar.visible;
            dateFlag = true;
        } 
        else
        {
            fxCalendar.visible = false;
        }
    }

    function txtSalesCaNetPaidOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
     if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
     {
                txtSalesCaNetPaid.text = Value.Round(txtSalesCaNetPaid.rawText);
                btnSalesCaSave.requestFocus();
        }
        shortcut(event);
    }

    function btnSalesCaSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER){
            saveSales(1);
        }
        if(event.code == KeyCode.VK_TAB){
            btnSaveOnly.requestFocus();
            if(event.shiftDown){
             //sabarish   SalesPlugin.txtReceived.requestFocus();
            }
        }
    }

    function txtSalesCaSubTotalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    }
    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
       if(flag==false)
       {
       CashSalesTableObj.removeRow();
        updateIntValues();
        itNAM1 = "";
        }
    }

    function txtSalesCaDNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtSalesCaDName.style=mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB )
        {
            listSalesCash.visible = false;            
            if(event.shiftDown and event.code == KeyCode.VK_TAB)
            {
                txtSalesCaPName.requestFocus();
            } 
            else
            {
                //CashSalesTableObj.focusSet();
                product2.requestFocus();
            }
            updateIntValues();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listSalesCash.visible = false;
            //CashSalesTableObj.focusSet();
            product2.requestFocus();

        }

        if (event.code == KeyCode.VK_DOWN) {
            listDoctorChanges(1);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        }
       // product2.requestFocus();
    }

    function txtSalesCaDNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDoctorChanges(1);
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_DOWN)
        {
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        }
       else if (event.code == KeyCode.VK_ESCAPE)
        {
            listSalesCash.visible = false;
            //CashSalesTableObj.focusSet();
            product2.requestFocus();
        }
      //  product2.requestFocus();
         shortcut(event);
    }

    function setMandatory():Void{
        if(selBillType.equals("Credit"))
        {
            txtSalesCaPName.style = mandatory;
            product2.style=mandatory;
        }
    }

    function txtSalesCaPNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void
    {
      // getPatient(txtSalesCaPName.rawText);
         listCustomerChanges(1);
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_DOWN)
        {
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        }
       else if (event.code == KeyCode.VK_ESCAPE)
        {
            listSalesCash.visible = false;
            CashSalesTableObj.focusSet();
        } else if(event.code == KeyCode.VK_TAB)
        {
            //listSalesCash.visible = false;
           // CashSalesTableObj.focusSet();
           rdoIn.requestFocus();
        }
         //rdoIn.requestFocus();
         shortcut(event);

    }

    function txtSalesCaPNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       txtSalesCaPName.style=mandatory;
       setMandatory();
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB  ) {
            //txtSalesCaDName.requestFocus();
//            rdoIn.requestFocus();
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
               txtSalesCaDate.requestFocus();
//               rdoIn.requestFocus();
            }
            listSalesCash.visible = false;
        } else if (event.code == KeyCode.VK_DOWN) {
//            getPatient(txtSalesCaPName.rawText);
            listCustomerChanges(1);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        } else if(event.code == KeyCode.VK_ESCAPE){
            txtSalesCaDName.requestFocus();
            listSalesCash.visible = false;
        }
        //rdoIn.requestFocus();
    }
    function btnSalesCaResetOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            resetValues();
    }

    function btnSalesCaResetActionAtShown(): Void {
        resetValues();
    }

    function btnSalesCaSaveOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnSalesCaSaveActionAtShown(): Void {
        saveSale(1);
    }

    function btnReprintActionAtShown(): Void {
        saveSale(1);
    }

      public function saveSale(ss: Integer): Void {
        try {
            System.out.println(flag);
            System.out.println("printerrrssssss");
            var check =checkValid();
            System.out.println(check);
          //sabarish  updateIntValues();
            var service= new ServiceModel();
            var patientName = txtSalesCaPName.rawText;
            var docname=txtSalesCaDName.rawText;


              if (flag == true and rdocredit.selected == true) {
        System.out.println("??");
        check = 1;
        FXinfo("Now clearing credit balance so credit not allowed");
    } else if (rdocredit.selected == true) {
        check = 1;
        FXinfo("credit bill cannot be printed");
    }
               
            if (check == 0)
            {
            System.out.println("valid");
                 var code = commonController.getCustomerCode(patientName);
                 var id = commonController.getCustomeridsab(patientName);
                  var docid = commonController.getdocidsab(docname);
                var sdf = new SimpleDateFormat("dd-MM-yyyy");

                var billDate = DateUtils.changeFormatDate(sdf.parse(txtSalesCaDate.rawText));
                //getAutoIncre();
                service.setModuleType("Service");
                service.setCustid(Integer.parseInt(id));
                service.setCust_code(code);
                  System.out.println("valid1");
//                service.setDoctorid(Integer.parseInt(docid));
                service.setCust_name(txtSalesCaPName.rawText);
                service.setBill_date(billDate);
                service.setDoctor_name(txtSalesCaDName.rawText);
                  System.out.println("valid2");
//                     var patientty: Integer = 0;
//                        if(rdoIn.selected==true){
//                 patientty=1;
//                  }else if(rdoOut.selected=true)  {
//                      patientty=2;
//                  }

                        var patienttype: String="";
                      if(rdoIn.selected==true){
                          patienttype="INPD";
                      }
                      else if(rdoOut.selected=true){
                          patienttype="OPD";
                      }

              // service.setPatienttype(patientty);
               service.setPatienttypes(patienttype);
                System.out.println("valid3");
                 var paymenttype: String="";
                 if(rdocash.selected==true){
                     paymenttype="Cash";
                 }
                else if(rdobank.selected=true){
                     paymenttype="Bank";
                 }
                 else
                 {
                       paymenttype="Credit";
                     }
                 service.setPaymentmode(paymenttype);
              //naziya250719 service.setService_name(product2.rawText);
               service.setService_name("");
               var insurancety: String = "";
                 System.out.println("valid4");
               if(rdoinsureYes.selected==true){
                   insurancety="Yes";


               service.setInsurance_status(insurancety);
               service.setInsurance_name(quantity.rawText);
               var inam:String=qutinhand.rawText;
               var insuamount:Double;
               insuamount=Double.parseDouble(inam);
               service.setInsurance_amount(insuamount);
               service.setInsurance_schemes(batch.rawText);
                   }

                   else if(rdoinsureNo.selected=true)  {
                      insurancety="No";

               service.setInsurance_status(insurancety);
               service.setInsurance_name("");

               service.setInsurance_amount(0);
               service.setInsurance_schemes("");
                  }

               var subtotalamt:String=txtSalesCaSubTotal.rawText;
               var totdisc:String=txtSalesCaDiscount.rawText;
               var totvat:String=txtSalesCaVAT4.rawText;
               var billtott:Double=Value.Round(CashSalesTableObj.totalAmtttt, 2);
               service.setTotal_amount(billtott);
               var subtotalamount:Double;
               var totaldiscount:Double;
               var totalvat:Double;
               subtotalamount=Double.parseDouble(subtotalamt);
               totaldiscount=Double.parseDouble(totdisc);
               totalvat=Double.parseDouble(totvat);
               service.setTotal_discountamt(totaldiscount);
               service.setSub_total(subtotalamount);
               service.setTax_amount(totalvat);
               service.setInsertType("save");
               service.setServiceListItems(CashSalesTableObj.getTableValues());
                var type="";
                var returnObject = new Object();
                returnObject = salesController.createRecord1(service);
                
                var msgReturnModel: Boolean;//sabarish MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as Boolean;

                if(returnObject.equals(true))
                {
                    type="save";
                    if (ss == 1) {
                        var salesController : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
                        var prescNo = "";
                        if(service.getInsertType().equals("save")) {
                        prescNo = commonController.getQueryValue("select max(billid) from billing_main");

                        }
                        else {
                        prescNo = "0";
                        }
                        type = "Print";
                        var reportSource: File = new File("printerfiles/Servicebill.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        var jasperPrint:JasperPrint = salesController.jasperPrint(prescNo, "Prescription",jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);
                    }

                   System.out.println("12222");
                     if(flag==true)
        {
            System.out.println("dpppppppp");
             salesController.updatePayment(CashSalesTableObj.getTableInpatientValues(), txtSalesCaPName.text);
            }
                }
                    FXalert(0);
                    resetValues();
                    }
                    else
                    {
                        System.out.println("didddd");
                        }

        }
        catch (ex: Exception)


        {
            ex.getMessage();
            var que = " Class: ServiceBilling Method: saveSales Exception:{ex}";
            log.debug(que);
        }
    }
    function txtSalesCaDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtSalesCaPName.requestFocus();
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
                cboEmp_code.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtSalesCaPBillNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            cboEmp_code.requestFocus();
            listSalesCash.visible = false;
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
                btnPrescibe.requestFocus();
            }

        } else if (event.code == KeyCode.VK_DOWN) {
            getBillNo(txtSalesCaPBillNo.rawText);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        } else if(event.code == KeyCode.VK_ESCAPE){
            txtSalesCaPBillNo.requestFocus();
        }

        shortcut(event);
    }

    function  insertPreviousBillValues(billNo:String):Void {
        if(CashSalesTableObj.nullVal==1)
        {
            var cn:ConfirmDialogBox = new ConfirmDialogBox(0,"Sales Cash","<html>Selecting this option will reset existing table values.<br> Do you want to continue?</html> ");
            if(cn.staus==true) {
                CashSalesTableObj.clearData();
             CashSalesTableObj.insertPreviousBill(billNo);
            }
            else
            {
                txtSalesCaPBillNo.text = "";
            }
        }
        else
        {
         CashSalesTableObj.insertPreviousBill
         (billNo);
        }
    }
     public function getBillNo(s :  String):Void {
     try{
        ShowList();
        listH = 0.0;  
        listSalesCash.visible = true;
        listSalesCash.layoutX = txtCategory.layoutX;
        listSalesCash.layoutY = txtCategory.layoutY + txtCategory.height + 5;
        listSalesCash.width = txtSalesCaPName.width;
        var billInfo: List = new ArrayList();
        billInfo=salesController.previousBillNumber(s);
        listSalesCash.items = billInfo.toArray();
        var billNo: String;
        listSalesCash.onKeyPressed = function(e) {
                if (e.code == KeyCode.VK_ENTER) {
                    billNo = "{listSalesCash.selectedItem}";
                    txtCategory.text = billNo;
                    var chk:String=txtCategory.text.trim();
                    if(chk == "null" or chk ==null){
                        txtCategory.text="";
                        }
                      if(chk=="Others"){
                          popCategory();
                          }

                    listSalesCash.visible = false;
                    txtdcrname.requestFocus();
                } else if (e.code == KeyCode.VK_DOWN) {
                    if (listSalesCash.selectedIndex == 0) {
                        listSalesCash.selectFirstRow();
                    }
                } else if (e.code == KeyCode.VK_ESCAPE) {
                    listSalesCash.visible = false;
                    txtCategory.requestFocus();
                }
            };
        listSalesCash.onMouseReleased = function(e) {
                    billNo = "{listSalesCash.selectedItem}";
                    txtCategory.text = billNo;
                     var chk:String=txtCategory.text.trim();
                    if(chk == "null" or chk ==null){
                        txtCategory.text="";
                        }
                      if(chk=="Others"){
                          popCategory();;
                          }

                    listSalesCash.visible = false;
                    txtdcrname.requestFocus();
                }
        var height: Integer = 0;
        if (listSalesCash.items.size() < 9) {
            height = listSalesCash.items.size();
            if (height < 3) {
                listH = (height * 25);
            } else {
                listH = (height * 25) - (height - 2);
            }
        } else {
            height = 8;

            listH = (height * 25) - (height - 2);
        }
      }
      catch (ex: Exception)
        {
            var que = " Class: ServiceBilling Method: getBillNo Exception:{ex}";
            log.debug(que);
        }
    }
    public function disableList(): Void {
        listSalesCash.visible = false;
    }

    function checkValid(): Integer {
        var retVal = 0;
        var pName = txtSalesCaPName.rawText;
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var chk: Boolean = commonController.isNotAllow(1);        
        var code = commonController.getCustomerCode(pName);
       //sabarish var freeBillRestrict = commonController.freeBillCount();
       var inpa: Boolean= rdoIn.selected ;
       var out: Boolean= rdoOut.selected ;
        var txtDate:java.util.Date = DateUtils.normalStringToDate(txtSalesCaDate.rawText.trim());
        var billDate:java.util.Date = DateUtils.normalStringToDate(DateUtils.now("dd-MM-yyyy"));
        CashSalesTableObj.salesCalculations();

        if(txtSalesCaPName.rawText.trim().length()<=0){
            retVal = 1;
            FXinfo("Please select the Patient Name");
            }
       else if (CashSalesTableObj.nullVal == 0) {
            retVal = 1;
            FXinfo("Service table is empty. Please enter some values!");
            CashSalesTableObj.focusSet();}
//        }else if (txtCategory.rawText.trim().length()<= 0) {
//            retVal = 2;
//            FXinfo("Please select the Category Name");
//            txtCategory.requestFocus();
//            }
//        }else if(txtSalesCaDName.rawText.trim().length()<=0){
//            retVal = 1;
//            FXinfo("Please select the Doctor Name");
//            }else if(txtSalesCaDName.rawText.trim().length()<=0){
//            retVal =e 1;
//            FXinfo("Please select the Doctor Name");
//            }
        /*else if (chk) {
            retVal = 1;
            FXinfo("Trial Edition has '10' bills only allowed....Upgrade to Express/Standard Edition");
        }*/  else if(txtSalesCaPName.rawText.trim().length() > 40) {
            FXinfo("Customer Name length cannot be more than 40 characters");
            retVal  = 1;
        }  else if(txtSalesCaDName.rawText.trim().length() > 100) {
            FXinfo("Doctor Name length cannot be more than 100 characters");
            retVal = 1;
        }
         else if(inpa == false and  out == false){
            retVal = 1;
            FXinfo("Please Select In or Out patient");
           }
           else if(rdoOut.selected==true and rdocredit.selected==true)
           {
                retVal = 1;
            FXinfo( "Out patient cannot given credit");
               }
               else if(rdoinsureYes.selected==true)
               {
                   if(rdobank.selected==true or rdocash.selected)
                   {
                         retVal = 1;
            FXinfo( "Insurance only credit");
                       }
                   }
                   else if (rdocredit.selected==false and rdocash.selected==false and rdobank.selected==false)
                  {
                      FXinfo("Please select payment mode");
                      }

//else if(Double.parseDouble(balance)>0 and rdocredit.selected==true)
//                   {
//                         retVal = 1;
//            FXinfo("Balance amount is there...");
//                       }
        else
        {
            retVal = 0;
        }
        return retVal;
    }

    public function saveSales(ss: Integer): Void {
        try {
            System.out.println("????");
            System.out.println("ca1234");
            System.out.println(flag);
//            if(flag==false)
//            {
            if(flag==false)
            {
            System.out.println("???");
           System.out.println(rdocredit.selected);

            var check =checkValid();

//            if(ss==1 and rdocredit.selected==true)
//            {
//                FXinfo("Credit not allowed");
//                check=1;
//                }
          //sabarish  updateIntValues();
            var service= new ServiceModel();
            var patientName = txtSalesCaPName.rawText;
            //var docname=txtSalesCaDName.rawText;
            if (check == 0)
            {

                 var code = commonController.getCustomerCode(patientName);
                 var id = commonController.getCustomeridsab(patientName);
                 // var docid = commonController.getdocidsab(docname);
                var sdf = new SimpleDateFormat("dd-MM-yyyy");

                var billDate = DateUtils.changeFormatDate(sdf.parse(txtSalesCaDate.rawText));
                //getAutoIncre();
                System.out.println("check1");
                service.setModuleType("Service");
                service.setCustid(Integer.parseInt(id));
                service.setCust_code(code);
                //service.setDoctorid(Integer.parseInt(docid));
                service.setCust_name(txtSalesCaPName.rawText);
                service.setBill_date(billDate);
                if(txtdcrname.rawText.toString().equals(""))
                {
                    service.setDoctor_name("");
                    }
                    else
                    {
                service.setDoctor_name(txtdcrname.rawText);
                    }
                System.out.println("selected1");
             System.out.println(rdocredit.selected);
                 var patienttype: String="";
                      if(rdoIn.selected==true){
                          patienttype="INPD";
                      }
                      else if(rdoOut.selected=true) {
                          patienttype="OPD";
                      }
                       service.setPatienttypes(patienttype);
                        System.out.println("selected2");
             System.out.println(rdocredit.selected);
                       var paymenttype: String="";
                 if(rdocash.selected==true){
                     System.out.println("cashhh");
                     paymenttype="Cash";
                 }
                  else if(rdocredit.selected==true) {
                     paymenttype="Credit";
                     }
                else if(rdobank.selected=true){
                     paymenttype="Bank";
                     System.out.println("bank");
                 }

              ;
                    

                 service.setPaymentmode(paymenttype);
                 
              //naziya250719 service.setService_name(product2.rawText);
               service.setService_name("");
               var insurancety: String = "";
               if(rdoinsureYes.selected==true){
                   insurancety="Yes";


               service.setInsurance_status(insurancety);
               service.setInsurance_name(quantity.rawText);
               var inam:String=qutinhand.rawText;
               var insuamount:Double;
               insuamount=Double.parseDouble(inam);
               service.setInsurance_amount(insuamount);
               service.setInsurance_schemes(batch.rawText);
                   }

                   else if(rdoinsureNo.selected=true)  {
                      insurancety="No";

               service.setInsurance_status(insurancety);
               service.setInsurance_name("");
               
               service.setInsurance_amount(0);
               service.setInsurance_schemes("");
                  }
                  
               var subtotalamt:String=txtSalesCaSubTotal.rawText;
               var totdisc:String=txtSalesCaDiscount.rawText;
               var totvat:String=txtSalesCaVAT4.rawText;
               var billtott:Double=Value.Round(CashSalesTableObj.totalAmtttt, 2);
               service.setTotal_amount(billtott);
//               if(Double.parseDouble(balance.toString())>0 or rdocredit.selected==true)
//              {
//                  var bal:Double = Double.parseDouble(balance.toString());
//               var amt:Double=bal-billtott;
//                service.setBalamce_amount(amt);
//                 if(rdocash.selected==true or rdobank.selected==true)
//                 {
//                     if(amt<0)
//                     {
//                         service.setBalamce_amount(bal);
//                         }
//                     }
//                 service.setModuleType("0");
//                 }
//                  else {
//                      service.setModuleType("-1");
//                      }

                    
    if (Double.parseDouble(balance.toString()) > 0 or rdocredit.selected == true) {
       //if balance 0 the user can put credit 
       var bal: Double = Double.parseDouble(balance.toString());
        var amt: Double = bal - billtott;
        if (amt < 0) {
            if (rdocash.selected == true or rdobank.selected == true) {
                service.setBalamce_amount(0);
            }
        }
        if (rdocredit.selected == true or amt > 0) {
            service.setBalamce_amount(amt);
        }
        //               service.setBalamce_amount(amt);
        //                service.setBalamce_amount(Double.parseDouble(balance.toString())-billtott);
        service.setModuleType("0");
    } else {
        service.setModuleType("-1");
    }
               var subtotalamount:Double;
               var totaldiscount:Double;
               var totalvat:Double;
               subtotalamount=Double.parseDouble(subtotalamt);
               totaldiscount=Double.parseDouble(totdisc);
               totalvat=Double.parseDouble(totvat);
               service.setTotal_discountamt(totaldiscount);
               service.setSub_total(subtotalamount);
               service.setTax_amount(totalvat);
               service.setRemarks(txtRemarks.text);
               service.setInsertType("save");
               service.setServiceListItems(CashSalesTableObj.getTableValues());
                var type="";
                var returnObject = new Object();
                returnObject = salesController.createRecord1(service);
              
                var msgReturnModel: Boolean;//sabarish MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as Boolean;
               
                if(returnObject.equals(true))
                {
                    System.out.println("saveddddd");
                    type="save";
                    if (ss == 1) {
                        var salesController : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
                        var prescNo = "";
                        if(service.getInsertType().equals("save")) {
                        prescNo = commonController.getQueryValue("select max(billid) from billing_main");
                        
                        }
                        else {
                        prescNo = "0";
                        }

                        type = "Print";                      
                        var reportSource: File = new File("printerfiles/Servicebill.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        var jasperPrint:JasperPrint = salesController.jasperPrint(prescNo, "Prescription",jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);                        
                    }
                    FXalert(0);
                    resetValues();

                }
             
//        } }
//        else
//        {
//            System.out.println("printerrrrr");
//           var prescNo = commonController.getQueryValue("select max(billid) from billing_main");
////            var productLi: List = new ArrayList();
////           productLi=CashSalesTableObj.getTableInpatientValues();
////
//         salesController.updatePayment(CashSalesTableObj.getTableInpatientValues(), txtSalesCaPName.text);
////               salesController.updatePayments(txtSalesCaPName.text);
//               var reportSource: File = new File("printerfiles/Servicebill.jasper");
//                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
//                        var jasperPrint:JasperPrint = salesController.jasperPrint(prescNo, "Prescription",jasperReport);
//                        JasperPrintManager.printReport(jasperPrint, false);
//            CashSalesTableObj.removeLastColumn();
//
//        resetValues();
//
//           }
        }
        
      
              }
              else
              {
                  FXinfo("You have clicked for print");
                  }
              }
        catch (ex: Exception)


        {
            ex.printStackTrace();
            var que = " Class: ServiceBilling Method: saveSales Exception:{ex}";
            log.debug(que);

        }
    }

    public function resetValues(): Void {
  
        cashBillDate = DateUtils.now("dd-MM-yyyy");
        txtSalesCaNetPaid.text = "0.00";
        txtSalesCaPName.text = "";
        //txtSalesCaDName.text = "";
        txtSalesCaPBillNo.text = "";
        txtSalesCaSubTotal.text = "0.00";
        txtSalesCaDiscount.text = "0.00";
        txtSalesCaVAT4.text = "0.00";
        txtSalesCaToalAmt.text = "0.00";
        lblSalesCaTotalQty.text = "0";
        lblSalesCaTotalItm.text = "0";
//        txtSalesCaBalAmt.text = "0.00";
        balance = "0.00";
        //ajith
        product2.text="";
        batch.text="";
        quantity.text="";
        qutinhand.text="";
        getAutoIncre();
        itNAM1 ="";
        CashSalesTableObj.clearData();
        CashSalesTableObj.resetValues();
        alertSt = salesController.getAlertStatus();        
        selBillType = "Cash" ;
        txtSalesCaPName.style = "";
        txtSalesCaNetPaid.style = "";
        txtSalesCaRoundAmt.style = "";
        updateIntValues();
        cboEmp_code.select(0);        
        txtadjust.text = "";
        listSalesCash.visible = false;
        listView.visible = false;
        //ajith
        batchlist.visible=false;
        listproductCode.visible=false;
        listsubcategory.visible=false;
      //sabarish  SalesPlugin.reset();
        txtSalesCaBarcode.text = "";
        txtRemarks.text="";
        product2.requestFocus();
        txtCategory.text="";
        txtdcrname.text="";
        button2.visible=false;
        button3.visible=false;
        rdocash.selected=false;
        rdocredit.selected=false;
        rdobank.selected=false;
        txtSalesCaDName.text="";
        flag=false;
        var res="SELECT coalesce(max((billid+0)),0)+1 as billno FROM billing_main;";
        txtBillNo.text= String.valueOf(salesController.queryExecution2(res));
        BalanceDue.flag=0;
       CashSalesTableObj.removeLastColumn();
       label23.visible=false;
       textbox.text="0.00";
  }









function getNetPaidChange():Void{
     if (selBillType.equals("Credit")) {
          txtSalesCaNetPaid.text = "0.00";
//          txtSalesCaBalAmt.text = txtSalesCaToalAmt.text;
        }
     else {
         txtSalesCaNetPaid.text = txtSalesCaToalAmt.text;
//         txtSalesCaBalAmt.text = "0.00";
     }
}

    function getAutoIncre(): String {        
        panelplugin.visible = true;
        if (selBillType.equals("Cash")) {
            txtSalesCaNetPaid.editable = false;
            txtSalesCaPName.style = mandatory;
            txtSalesCaPName.style = "";
            getAutoVal = commonController.getAutoIncrement(cashBillDate, "CashSales");
        } else if (selBillType.equals("Credit")) {
            txtSalesCaNetPaid.editable = true;
        //-     txtSalesCaNetPaid.text = "0.00";
            txtSalesCaPName.style = mandatory;
            getAutoVal = commonController.getAutoIncrement(cashBillDate, "CreditSales");
        } else if (selBillType.equals("Cards")) {
            txtSalesCaNetPaid.editable = false;
            txtSalesCaPName.style = mandatory;
            txtSalesCaPName.style = "";
            panelplugin.visible = false;
            getAutoVal = commonController.getAutoIncrement(cashBillDate, "CardSales");
        }
        //updateIntValues();
        return getAutoVal;
    }


    public function alertSetting(): Void {
//        var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
        alertSt = salesController.getAlertStatus();
        if (alertSt == 1) {
            expAlert = CashSalesTableObj.alert1;
            itemDis = CashSalesTableObj.itN;
            var itNN: String = CashSalesTableObj.itN;

            if (expAlert != null and expAlert.length() > 0) {
                var str: String = "";
                if (itNN != itNAM1) {
                    str = "The product '{itNN}' will expire on {expAlert}";
                    alerCnt1 = 0;
                }
                if (alerCnt1 == 0) {
                    panelAlert.visible = true;
                    delete  panelAlert.content;
                    MessageBox.MsgBox("Sales Cash Bill", "Information", str);
                    insert MessageBox.getDesignRootNodes() into panelAlert.content;
                    itNAM1 = itNN;
                    alerCnt1 = 1;
                }
                CashSalesTableObj.alert1 = "";
                expAlert = "";
            }
        }

    }

    var visit = bind fxCalendar.visible on replace {
                if (dateFlag and not visit) {
                    cashBillDate = fxCalendar.getSelectedDate();
                    dateFlag = false;
                    txtSalesCaPName.requestFocus();
                }
            };

   function updateIntValues(): Void {       
        try {            
            CashSalesTableObj.salesCalculations();    
            calcDiscTotal("total");
       
       } catch (ex: Exception) {
            log.debug("UpdateIntValue(0 Exception:{ex.getMessage()}");
        }
    }  
    var rotateImg = bind listSalesCash.visible on replace {
                if (imgP and rotateImg)
                {
                    imgPName.rotate += 180.0;
                } 
                else
                {
                    imgPName.rotate = 0.0;
                }

                if (imgD and rotateImg)
                {
                    imgDName.rotate = 180.0;
                } else
                {
                    imgDName.rotate = 0.0;
                }
            } 
    function callCustInfo(): Void {
    insertCustomerForm();
    currentState.actual = currentState.findIndex("CustomerInfo");
    CustInfo.txtCustName.requestFocus();
    }

    function callDocInfo(): Void {
   // DocInfo.Startup();
    insertDocForm();
    currentState.actual = currentState.findIndex("DoctorInfo");
    DocInfo.txtDoctorDName.requestFocus();
    }     
    function insertCustomerForm(): Void {
     CustInfo.FromSales();
     delete  panelCustInfo.content;
     insert CustInfo.getDesignRootNodes() into panelCustInfo.content;
     updateIntValues();
    }

    function insertDocForm(): Void {
    DocInfo.currentState.actual = DocInfo.currentState.findIndex("FromSales");
    DocInfo.checkState = 1;
    delete  panelDocInfo.content;
    insert DocInfo.getDesignRootNodes() into panelDocInfo.content;
    updateIntValues();
    }
     var tot=bind txtSalesCaToalAmt.text on replace {
         try {
          //sabarish  SalesPlugin.Amount = Double.parseDouble(tot);
         } catch (e)
         {
           //sabarish  SalesPlugin.Amount =0.0;
         }
     }
    var logUser: String = bind CommonDeclare.user on replace {
                getPrivileges(logUser);
                updateIntValues();
            }

    function getPrivileges(u: String): Void {
//        commonController=new CommonController();
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("billing", uname);//sales
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {
                btnSalesCaSave.disable = true;
                btnSaveOnly.disable = true;
            } else if (val == 2) {
                btnSalesCaSave.disable = false;
                btnSaveOnly.disable = false;
            } else if (val == 3) {
                btnSalesCaSave.disable = false;
                btnSaveOnly.disable = false;
            }
        }
        else {
            btnSalesCaSave.disable = false;
            btnSaveOnly.disable = false;
        }

    }

    var cst = bind txtSalesCaPName.rawText on replace
             {
                 System.out.println("came");
//                 System.out.println(commonController.getCustomerBalanceDue(cst));
//                if (cst != null or cst.trim().length() > 0) { balance = commonController.getCustomerBalanceDue(cst); } else { balance = "0.00"; }
             balance = "0.00";

             }

     function initSalesCash():Void
           {
               try{
            (cashTable as javax.swing.JTable).addKeyListener(KeyAdapter
            {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void
            {
            System.out.println("keyyyyy");
//                alertSetting();
                updateIntValues();
                shortcutOnTable(e);                               
//                CashSalesTableObj.jcomp.getSelectedRow();
//                if(CashSalesTableObj.jcomp.getSelectedColumn()==10)
//                {
//                    if(e.getKeyCode()==e.VK_ENTER)
//                    {
//                       if(CashSalesTableObj.barcodeFocus==true)
//                       {
//                             txtSalesCaBarcode.requestFocus();
//                        }
//                       if(CashSalesTableObj.product==true)
//                        {
//                            product2.requestFocus();
//                         }
//                        else
//                           {
//                            CashSalesTableObj.jcomp.getModel().setValueAt(i + 2, i + 1, 0);
//                           }
//                    }
//                }
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {                
                 System.out.println("keyTyped");
                 shortcutOnTable(e);
//                 alertSetting();
                 updateIntValues();
               }
        });
        (cashTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener
        {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void
            {
                 System.out.println("value changed");
                 updateIntValues();
                 
            }
        });
        if(settingsController.getSalesDiscountType()==0)
        {
            CommonDeclare.salesDiscApply=true;
         }
        currentState.actual = currentState.findIndex("Shown");
//      txtSalesCaPName.requestrdoOutFocus();
//        rdoOut.selected=true;changed
      //  rdocash.selected=true;
        txtSalesCaPName.style=mandatory;
       // txtSalesCaDName.style=mandatory;
        product2.style=mandatory;

        product2.requestFocus();
        CashDatePicker.image = Image { url: "{__DIR__}images/Calender.png" };
        listView.visible = false;
        salesCashTable.layoutX = 0;
        salesCashTable.layoutY = 0;
        getPrivileges(logUser);        
        updateIntValues();        
        fxCalendar.visible = false;
        panelCalender.content = [fxCalendar,];
        panelTable.content = [salesCashTable,];
//      panelForm.visible = false;
        delete  panelBillType.content;
        delete  panelTemp.content;
        delete  panelDispatch.content;
        product2.requestFocus();
        delete  panelService.content;
        AddFormulation.panel.visible = false;
        DeleteServBill.panel.visible = false;
        AddServCategory.panel.visible = false;
        AddSubCategory.panel.visible=false;
        BalanceDue.panel.visible=false;
        insert AddFormulation.panel into panelService.content;
        insert DeleteServBill.panel into panelService.content;
        insert AddServCategory.panel into panelService.content;
        insert AddSubCategory.panel into panelService.content;
         insert BalanceDue.panel into panelService.content;
        panel.visible=true;
        }catch(e) {
            log.debug(" Class : ServiceBilling   Method: initsales()   Exception : {e.getMessage()}");
        }
    }

        public var initFocus1 = false on replace
        {
            if(initFocus1)
            {
                product2.requestFocus();
                initFocus1 =false;
            }
        }

     var existRow : Integer = -1;
 function quantityOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB )
        {
            batch.requestFocus();            
        }
        shortcut(event);

         }
        function qutinhandOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

          shortcut(event);
         }
    function quantityOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
     
        shortcut(event);
    }

    function addTableItem(): Void
     {
         try
         {
            var tqutinhandStrng: String = qutinhand.rawText;
            var tquantity: Integer = 0;
            if (tqutinhandStrng != null and tqutinhandStrng != "" and tqutinhandStrng != "null")
            {
                tquantity = Integer.parseInt(tqutinhandStrng);               
            }
            else
            {
                tquantity=-1;
            }
            var enterQtyString: String = quantity.rawText;
            var enterQty: Integer = 0;
            if (enterQtyString != null and enterQtyString != "" and enterQtyString != "null")
            {
                enterQty = Integer.parseInt(enterQtyString);
            }
            if (tquantity <0)
            {
                FXinfo("Please Add New Product.....");
            }
            else if (tquantity == 0 or enterQty == 0)
            {
                 quantity.requestFocus();
                FXinfo("Please Enter Valid Quantity....");
            }          
             else
             {
                var existId =0;
                if(existRow >= 0)
                {
                    existId = existRow + 2;
                }
               existRow = -1;
               var itemname = product2.rawText.trim();
               var itemcode = product2.rawText.trim();             
               var qty=Integer.parseInt(quantity.rawText.trim());
               var batchNo = batch.rawText.trim();
               var discPer:Double =0.0;
              //sabarish var freeArr =CashSalesTableObj.setTablevalues(itemname,itemcode,qty,sno,batchNo,existId,discPer);
                product2.text = "";
                batch.text="";
                qutinhand.text = "";
                quantity.text = "";               
                if(itemname == null)
                {
                    product2.requestFocus();
                }
                else
                {
                    product2.requestFocus();
                }
                updateValues();
            }
          }
         catch(e:Exception)
              {
               java.lang.System.out.println("add Table Item:{e.getMessage()}");
              }
      }

 function updateValues(): Void
    {
          listFalse();
          updateIntValues();
    }

function listFalse():Void
      {
          
           listView.visible=false;
           listSalesCash.visible=false;
           listproductCode.visible=false;
           listProductName.visible=false;
           batchlist.visible=false;
           listsubcategory.visible=false;//added
     }

     function listTrue():Void
      {

           listView.visible=false;
           listSalesCash.visible=false;
           listproductCode.visible=true;
           listProductName.visible=false;
           batchlist.visible=false;
           listsubcategory.visible=false;//add
     }
    //ajith product code here    
       function product2OnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void
       {
           
      getProductCode(1,event);
        if (event.code == KeyCode.VK_DOWN or event.code == KeyCode.VK_ENTER)
        {

            listproductCode.requestFocus();
            listproductCode.selectFirstRow();
            if(event.code == KeyCode.VK_ENTER){
             if(product2.rawText != ""){
                listproductCode.visible=false;
                product2.text="";
                product2.requestFocus();
                }
                }
        }
        else if (event.code == KeyCode.VK_ESCAPE)
        {
            listproductCode.visible = false;
            product2.requestFocus();
            product2.text="";

        }
      else if(event.code == KeyCode.VK_TAB)
        {
             //FXinfo("Enter your Service Name");
             rdoinsureYes.requestFocus();
        }
        shortcut(event);
       }

    function product2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void
            {
                {
                product2.style=mandatory;
               //sabarish  getBatchCode(1,event);
               
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER)
          {
              
              product2.text="";
              product2.requestFocus();
             //sabarish  batch.requestFocus();
          }      
        }

  }

    function popService(): Void {
        panelService.visible = true;
        AddFormulation.Show();
    }
    function popCategory(): Void {
        panelService.visible = true;
        AddServCategory.Show();
    }
      function popService(dia:String,subctg:String): Void {
          System.out.println("!!!!!");
        panelService.visible = true;
        AddFormulation.Show();
        AddFormulation.Setcategory(dia,subctg);
    }
     function popSubCategory(dia:String): Void {
        panelService.visible = true;
//        AddFormulation.Show();
//        AddFormulation.Setcategory(dia);
//panel.disable=false;
            AddSubCategory.Show();
           AddSubCategory.Setcategory(dia);
        System.out.println("pop");
        
//        System.out.println("?");
//        return AddFormulation.formulation;
    }
    function popBalanceDue():Void
    {
         panelService.visible = true;
         BalanceDue.Show();
        }
function listSubCategory(): Void {
 
    try {
      
                  var drugBean = new DrugModel1();
            var subCategoryLi: List = new ArrayList();
            listsubcategory.visible = true;
            listH = 0.0;

            listsubcategory.layoutX = txtdcrname.layoutX;

            listsubcategory.layoutY = txtdcrname.layoutY + txtdcrname.height + 5;

            var size = listsubcategory.items.size();

            if (not listsubcategory.items.isEmpty()) {
                for (i in [0..<size]) {
                    listsubcategory.items[i] = null;
                    txtdcrname.requestFocus();
                }
            }
            drugBean.setFormulation(txtdcrname.rawText.trim());
            drugBean.setMfr_name(txtCategory.rawText.trim());
            subCategoryLi = commonController.getListItems(drugBean.getFormulation(), drugBean.getMfr_name(), "SEE");
            listsubcategory.clearSelection();
            if (subCategoryLi.size() > 0) {
                
                listsubcategory.items = subCategoryLi.toArray();
                listsubcategory.onKeyPressed = function(e) {
                    if(e.code==KeyCode.VK_ENTER)
                    {
                        System.out.println("ddddd");
                       var sam:String = listsubcategory.selectedItem.toString();
                        if(sam.equals("Add new..."))
                        {
                            var dia:String=txtCategory.rawText;
                            System.out.println("ddd");
                            System.out.println(product2.text);
                            popSubCategory(dia);
                             
                             
                        }
                        else
                        {
                            txtdcrname.text="{listsubcategory.selectedItem}";
                            }
                            listsubcategory.visible=false;
                             product2.text="";
                              product2.requestFocus();
                        }
                        else if(e.code==KeyCode.VK_DOWN)
                        {
                          
                        if (listsubcategory.selectedIndex == 0) {
                                listsubcategory.selectFirstRow();
                            }
                          
                            }
                    }
                     listsubcategory.onMouseClicked = function(e)
                       {
                            
                             var sam:String = listsubcategory.selectedItem.toString();
                        System.out.println(sam);
                        if(sam.equals("Add new..."))
                        {
                            System.out.println("mouseeeeeeeee");
                            
                            var dia:String=txtCategory.rawText;
                            System.out.println("ddd");
                         popSubCategory(dia);
                        }
                        else
                        {
                            txtdcrname.text="{listsubcategory.selectedItem}";
                            }
                            listsubcategory.visible=false;
                              product2.text="";
                              product2.requestFocus();
                            
                           }
//                    if (e.code == KeyCode.VK_ENTER)
//                            {
//                                product2.text = "{listproductCode.selectedItem}";
//                                var sam: String = product2.rawText.trim();
//                                if (sam == "Others") {
//                                if(txtCategory.rawText !="" or txtCategory.text != null ){
//                                var dia : String;
//                                dia=txtCategory.rawText;
//                                popService(dia);
//                                }
//                                else{
//                                     FXinfo("Please Select Category.");
//                                    }
//                            }
//                                listproductCode.visible=false;
//                                 ShowList();
//                                 listH=0.0;
//                                 gettablevalue();
//                                 product2.text="";
//                                 product2.requestFocus();
//                           //santhosh     getBatchCode(0,e);
//                            }
                if (listsubcategory.items.size() < 9) {
                    listH = 25 * listsubcategory.items.size();
                } else {
                    listH = 8 * 25;
                }
    }
               
    } catch (ex: Exception) {
        var que = " Class: ServiceBilling Method: listSubCategory Exception:{ex}";
        log.debug(que);
        ex.getMessage();
        ex.printStackTrace();
    }
}
  function txtBillNoOnKeyReleasedAtEdit(event: javafx.scene.input.KeyEvent): Void {
       if(currentState.actual==3)
       {
           System.out.println("edit");
            listH = 0.0;
            listbill.visible = true;
            var size=listbill.items.size();
            var billlist:List = new ArrayList();
             if (not listproductCode.items.isEmpty())
                {

                    for (i in [0..<size])
                    listproductCode.items[i] = null;
                               }

                         billlist=      commonController.getService(txtCategory.rawText, txtdcrname.rawText, product2.rawText.trim());
           }
               
 commonController.getService(txtCategory.rawText, txtdcrname.rawText, product2.rawText.trim());
           }

  function getProductCode(n: Integer, event: Object): Void
      {
        try {
System.out.println("proddducttttt");
            //ShowList();
            var drugBean = new DrugModel1();
            listH = 0.0;
            //var productLi: String[] = [];
            var productLi: List = new ArrayList();
            listproductCode.visible = true;
            var size = listproductCode.items.size();
            if (not listproductCode.items.isEmpty())
                {

                    for (i in [0..<size])
                    listproductCode.items[i] = null;
                    product2.requestFocus();
                    product2.text="";

                 }
          
//            drugBean.setFormulation(product2.rawText.trim());
//            drugBean.setMfr_name(txtCategory.rawText.trim());
//            productLi = commonController.getListItems(drugBean.getFormulation(),drugBean.getMfr_name(), "SEE");'
                            System.out.println(product2.rawText.trim());
                productLi =   commonController.getService(txtCategory.rawText, txtdcrname.rawText, product2.rawText.trim());
                System.out.println(productLi);
          if (productLi.size()>=0)
            {

                listproductCode.clearSelection();
                listproductCode.items = productLi.toArray();
                listproductCode.onKeyPressed = function(e)
                {
                        if (e.code == KeyCode.VK_ENTER)
                            {
                                product2.text = "{listproductCode.selectedItem}";
                                var sam: String = product2.rawText.trim();
                                if (sam == "Add new...") {
                                if(txtCategory.rawText !="" or txtCategory.text != null ){
                                var dia : String;
                                dia=txtCategory.rawText;
                                popService(dia, txtdcrname.rawText);
                             }
                                else{
                                     FXinfo("Please Select Category.");
                                    }
                            }
                                listproductCode.visible=false;
                                 ShowList();
                                 listH=0.0;
                                 gettablevalue();
//                                 product2.text="";
//                                 product2.requestFocus();
                           //santhosh     getBatchCode(0,e);
                            }
                            else if (e.code == KeyCode.VK_ESCAPE)
                            {
                                listproductCode.visible =false;
                                product2.text="";
                                product2.requestFocus();

                            }
                           }
                       listproductCode.onMouseClicked = function(e)
                       {
                            product2.text = "{listproductCode.selectedItem}";
                                var sam: String = product2.rawText.trim();
                                if (sam == "Others") {
                                if(txtCategory.rawText !="" or txtCategory.text != null ){
                                var dia : String;
                                dia=txtCategory.rawText;
                                popService(dia,txtdcrname.rawText);
                                }
                                else{
                                     FXinfo("Please Select Category.");
                                    }
                            }

                                 ShowList();
                                 listH=0.0;
                                 gettablevalue();
//                                 product2.text="";
//                product2.requestFocus();
                               //santhosh getBatchCode(0,e);

                            }
                if (product2.rawText.trim() == "null" or product2.rawText.trim().equals(""))
                {
                    product2.text = "";
                    product2.requestFocus();
                }
                if (listproductCode.items.size() < 9)
                {
                    listH = 25*listproductCode.items.size();
                }
                else
                {
                    listH = 8*25;
                }
            }
            else
            {
                listproductCode.visible = false;
//                product2.text="";
//                product2.requestFocus();
            }
        }
        catch (ex: Exception)
        {
            var que = " Class : ServiceBilling  Method: getProductCode()  Exception : {ex}";
            log.debug(que);
        }
    }

    function gettablevalue(): Void
     {
         try
         {             
               var service = product2.rawText.trim();
               var ctg  =  txtCategory.rawText.trim();
               var subctg= txtdcrname.rawText.trim();
               var existId:Integer=0;
                if(existRow >= 0)
                {
                   existId = existRow + 2;
                }
                existRow = -1;
               var freeArr =CashSalesTableObj.setTablevaluesss(ctg,subctg,service,sno,existId);

               if(freeArr == null)
                {
                    product2.requestFocus();
                    product2.text="";
                }
                else
                {
                  updateIntValues();
                }
              
          }
         catch(e:Exception)
              {
               java.lang.System.out.println("add Table Value:{e.getMessage()}");
              }
      }
  
function panelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    // listFalse();
         }        
//function BarCodeAction(): Void {
//     var itemname = product2.rawText.trim();
//     var itemcode = product2.rawText.trim();
//        barKeyTypeCount = 0;
//        txtSalesCaBarcode.selectAll();
//        initFocus = "BarCode";
//        var getObj: Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
//
//        if (not itemname.equals(""))
//        {
//           popTemp();
//            existRow = -1;
//            existRow = CashSalesTableObj.isExist(itemname, itemcode);
//            var qty = 0.0;
//            if (existRow >= 0)
//            {
//                quantity.text = "{CashSalesTableObj.jcomp.getModel().getValueAt(existRow, 3)}";
//                try
//                {
//                    qty = Double.parseDouble(quantity.text.trim());
//                    quantity.text = String.valueOf(qty + 1);
//                }
//                catch (ne: NumberFormatException)
//                {
//                    log.debug("class:salesmydesign Method:txBarCodeKeyEvent NumberException:{ne.getMessage()}");
//                }
//            }
//            else
//            {
//                quantity.text = String.valueOf(qty + 1);
//            }
//            initFocus = "BarCode";
//            addTableItem();
//            updateValues();
//        }
//        else
//        {
//            FXinfo("Please Enter Valid BAR Code !");
//            txtSalesCaBarcode.requestFocus();
//        }
//    }
     var barKeyTypeCount:Integer=0;
     function txtSalesCaBarcodeOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        event.code;
        event.char;
        barKeyTypeCount++;
}

 function txtSalesCaBarcodeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         initFocus = "BarCode";
        txtSalesCaBarcode.selectAll();
        }
         


  public function StartUp(): Void
         {
             System.out.println("vankamm");
            // HomePage.Hide();
             initSalesCash();
             product2.requestFocus();
             txtBillNo.editable=false;
             var res="SELECT coalesce(max((billid+0)),0)+1 as billno FROM billing_main;";
             txtBillNo.text= String.valueOf(salesController.queryExecution2(res));
            
         }

function batch2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void
      {          
          if(batch.text!=null)
             {
              var batchlist1: String[] = [];
              var getObject : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
            //sabarish  batchlist1 = getObject.getbatchno(product2.rawText.trim()).toArray() as String[];
              batchlist.visible=true;
              batchlist.requestFocus();
              batchlist.selectFirstRow();
              }
       }       
 

//function getStockQty1(n: Integer, event: Object): Void
//   {
//        try
//        {
//        ShowList();
//        qutinhand.visible = true;
//        var getObjec : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
//            if (n == 1)
//            {
//                if(product2.rawText.trim().length()>0)
//                {
//                 //sabarish   stockqty = getObjec.getStockQty(product2.rawText.trim(), batch.rawText.trim());
//                    qutinhand.text = "{stockqty}";
//                    quantity.requestFocus();
//                }
//                else if(qutinhand.text=="")
//                    {
//                    FXinfo("Quantity  not Available That given Product");
//                    }
//             }
//       }
//       catch(e:Exception)
//       {
//           java.lang.System.out.println(e);
//       }
//     }

   function batchOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void
      {
    
        shortcut(event);
      }

    function batchOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void
         {


        
          }


  function popTemp(): Void
       {
             var itemname = product2.rawText.trim();
             var batchNo = batch.rawText.trim();
             var itemcode="select item_code from stock_statement where item_name='{itemname}' and batch_no='{batchNo}' group by item_name,batch_no;";
            var iCode=commonController.getQueryValue(itemcode);
         if(Integer.parseInt(quantity.text)>= Integer.parseInt(stockqty))
             {
            panelTemp.visible = true;
          
            product2.requestFocus();
             }
           else
            {
              panelTemp.visible = false;
            }
         }
         function button2ActionAtShown (): Void {

      popBalanceDue();
//    if(CustomAlert.print==1)
//    {
//        CashSalesTableObj.addColumnToTable();
//         billLi=commonController.getCreditBill(txtSalesCaPName.rawText);
//        CashSalesTableObj.setTablevalue(billLi);
//
//        }
            }
            public function column():Void
            {
                System.out.println(flag);
                 CashSalesTableObj.addColumnToTable();
         billLi=commonController.getCreditBill(txtSalesCaPName.rawText);
        CashSalesTableObj.setTablevalue(billLi);
        updateIntValues();
         System.out.println(flag);
                }
  }