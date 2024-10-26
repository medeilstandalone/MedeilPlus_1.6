package com.vanuston.medeil.uitables;

import com.sun.corba.se.pept.transport.InboundConnectionCache;
import com.vanuston.medeil.client.RegistryFactory;
import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.Vector;
//naziya import com.vanuston.medeil.dao.CommonDAO;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
//sabarish import com.vanuston.medeil.implementation.Stock;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.ServiceModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.awt.Font;
import java.awt.Color;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.TableCellRenderer;
import java.awt.event.KeyEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionEvent;
//import javax.swing.AbstractAction;
import java.awt.event.MouseAdapter;
import java.util.*;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;
import java.awt.Component;
import java.util.ArrayList;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;

public class CashSalesTable2 extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(CashSalesTable2.class, "Utilities");
    public JTable jcomp;
    public SalesTableModel dtmodel;
    public String thisForm = null;
    public int initR;
    public JScrollPane scrollPane;
    public double qty[];
    public double uprice[];
    public double vat4[];
    public double vat12[];
    public double dist[];
    public double subTot[];
    public double Total[];
    public int stockQty;
    public int totQty = 0;
    public int totItems = 0;
    
    //ajith
    public String h1drug = "";
    public int stockId;
    public boolean UIFocusFlag = false;
    public double totAmt = 0.00;
    public double totalAmtttt = 0.00;
    public double totDistAmt = 0.0;
    public double subtotdist[];
    public double totVATAmt4 = 0.0;
    public double totMargin = 0.0;
    //- public  double totVATAmt12 = 0.0;
    //GST variable Start
    public double totGst = 0.0;
    public double totSgst = 0.0;
    public double totCgst = 0.0;
    public double totIgst = 0.0;
    public double totUtgst = 0.0;
    public double Sgst[];
    public double Cgst[];
    public double tGst[];
    public double Igst[];
    public double Utgst[];
    /* int sgst=CommonDAO.sgst;
    int cgst=CommonDAO.cgst;
    int igst=CommonDAO.igst;
    int utgst=CommonDAO.utgst;
    int gst=CommonDAO.gst;*/
    double gstPer = 0.0;
    //GST variable End
    public int nullVal;
    public KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke shrctF6 = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke shrctF8 = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public double amt = 0.00;
    public String alert1 = "";
    public String itN = "";
    //public  GetSalesDrugData g;
//sabarish    public  GetSubstituteDrugs sd;
    //sabarish   public TempStocks ts;
    public boolean barcodeSelected = false;
    public boolean barcodeFocus = false;
    public boolean product = false;
    public String itemCode = "";
    public int k = 0;
    //new add 
    //                       0   1   2    3   4  5   6   7   8   9  10   11 12 13 4 15 16 17 18
    //sabarish final int[] colWidth = {15, 35, 125, 60, 30, 40, 50, 40, 50, 30, 25, 25,25,25,25,25,25,40,30};
    //                       0   1   2    3   4  5   6    7   8
    final int[] colWidth = {15, 125, 25, 60, 60, 60, 60, 100,60};//sabarish
    public List<Integer> numberKeys;
    /* public  JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width, String form) {
    thisForm = form;
    initR = initRow;
    final Class[] types = type;
    final boolean[] canEditCols = canEdit;
    final int[] colWidth = width;*/

    public JComponent createTable() {
        //                               0,     1,      2,           3,        4,       5,         6     7       8       9        10      11     12    13     4     15     16      17       18
        //sabarish  Object[] colName ={"S.No","Code","Products","Formulation","Qty","Batch No","Expiry","Price","MRP", "Disc %","Margin","VAT%","GST","SGST","CGST","IGST","UTGST","Amount","Adj ID"};
        //                    0          1               2           3               4         5             6          7        8
        Object[] colName = {"S.No", "Particulars", "Qty/Days", "Discount", "Price/per unit", "GST", "Total Amount","Category"};
       // naziya  Object[] colName = {"S.No", "Particulars", "Qty/Days", "Discount", "Price/per unit", "Gst", "Total Amount"};
        thisForm = "CashSales";
        // padhu   //initR = 15;
        initR = 15;
        //                               0                        1                      2                     Amount-index 12,Adjid index 13

        final Class[] types = {java.lang.Integer.class, java.lang.String.class, java.lang.Integer.class,
            //           3                   4                        5
            java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,
            //            6                    7                   8
            java.lang.Double.class,java.lang.String.class};
        numberKeys = java.util.Arrays.asList(
                KeyEvent.VK_0,
                KeyEvent.VK_1,
                KeyEvent.VK_2,
                KeyEvent.VK_3,
                KeyEvent.VK_4,
                KeyEvent.VK_5,
                KeyEvent.VK_6,
                KeyEvent.VK_7,
                KeyEvent.VK_8,
                KeyEvent.VK_9);
        //                               0       1      2     3     4     5      6      7      8     9     10      11    12    13    4     15    16    17    18
        //sabarish  final boolean[] canEditCols = {false, false, false, false, true, false, false, true, false, true, false, false, false,false,false,false,false,false,false};
        //  sabarish                    0       1      2     3     4     5      6      7     8
        final boolean[] canEditCols = {false, false, true, true, true, true, false , false};

       // final boolean[] canEditCols = {false, false, true, true, false, true, false};
        int len = colName.length;

        try {
            jcomp = new JTable() {
//                @Override
//                public void removeColumn(TableColumn aColumn) {
//                    TableColumnModel columnModel = jcomp.getColumnModel();
//                    super.removeColumn(columnModel.getColumn(0));
//                }




                @Override
                public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
                    Component c = super.prepareRenderer(renderer, row, column);
                    c.setFont(new Font("Arial", Font.BOLD, 14));
                    return c;
                }
            };




            scrollPane = new JScrollPane();
            //g = new GetSalesDrugData(jcomp,thisForm,"salescashinsert");
            SwingUtilities.updateComponentTreeUI(jcomp);
            Vector cols = new Vector();
            Vector data = new Vector();
            for (int i = 0; i < initR; i++) {
                Vector c = new Vector();
                for (int j = 0; j < len; j++) {
                    c.addElement(null);
                }
                data.addElement(c);
            }
            for (int n = 0; n < len; n++) {
                cols.addElement(colName[n]);
            }
            try {
                dtmodel = new SalesTableModel(data, cols, types, canEditCols);
                jcomp.setModel(dtmodel);
            } catch (Exception ex) {
                String ss = "Method: Create Table    Exception : " + ex.getMessage();
                log.debug(ss);
            }
            if (colWidth.length > 0) {
                for (int i = 0; i < len; i++) {
                    jcomp.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
                  
                }
            }
            //*************************************************Below Start Gst Hide Table Process*************************************************//
            //performance issue problem
            // if(gst==0)
            //{
            //sabarish   jcomp.getColumnModel().getColumn(12).setMinWidth(0);
            //sabarish    jcomp.getColumnModel().getColumn(12).setMaxWidth(0);
             /*  }
            if(sgst==0)
            {

            jcomp.getColumnModel().getColumn(13).setMinWidth(0);
            jcomp.getColumnModel().getColumn(13).setMaxWidth(0);
            }
            if(cgst==0)
            {
            jcomp.getColumnModel().getColumn(4).setMinWidth(0);
            jcomp.getColumnModel().getColumn(4).setMaxWidth(0);
            }
            if(igst==0)
            {
            jcomp.getColumnModel().getColumn(15).setMinWidth(0);
            jcomp.getColumnModel().getColumn(15).setMaxWidth(0);
            }
            if(utgst==0)
            {*/
            //sabarish     jcomp.getColumnModel().getColumn(16).setMinWidth(0);
            //sabarish    jcomp.getColumnModel().getColumn(16).setMaxWidth(0);
            //    }

            //*************************************************Above Gst Hide Table Process*************************************************//
            jcomp.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
            jcomp.setSelectionMode(0);
            jcomp.getTableHeader().setBackground(new Color(226, 238, 244));
            jcomp.getTableHeader().setFont(new Font("Arial",Font.BOLD,14));
            jcomp.setShowGrid(true);
            jcomp.getTableHeader().setReorderingAllowed(false);
         
           //jcomp.getColumnModel().getColumn(0).setCellRenderer(new Invi());
            //sabarish jcomp.getColumnModel().getColumn(10).setCellRenderer(new DecimalFormatRenderer());
            //sabarish  jcomp.getColumnModel().getColumn(12).setCellRenderer(new PercentageFormatRenderer());
            //sabarish jcomp.getColumnModel().getColumn(13).setCellRenderer(new PercentageFormatRenderer());
            //sabarish jcomp.getColumnModel().getColumn(4).setCellRenderer(new PercentageFormatRenderer());
            //sabarish jcomp.getColumnModel().getColumn(15).setCellRenderer(new PercentageFormatRenderer());
            //sabarish jcomp.getColumnModel().getColumn(16).setCellRenderer(new PercentageFormatRenderer());
            //sabarish jcomp.getColumnModel().getColumn(11).setCellRenderer(new PercentageFormatRenderer());
            //sabarish jcomp.getColumnModel().getColumn(17).setCellRenderer(new DecimalFormatRenderer());//12
            //sabarish  jcomp.removeColumn(jcomp.getColumnModel().getColumn(18));
            //remove Vat
            //sabarish   jcomp.getColumnModel().getColumn(11).setMinWidth(0);
            //sabarish  jcomp.getColumnModel().getColumn(11).setMaxWidth(0);
            //VAT
            jcomp.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
            jcomp.getInputMap().put(focusOut, "focusOut");
            jcomp.getInputMap().put(focusOut1, "focusOut");
            jcomp.getInputMap().put(shrctF2, "focusOut");
            jcomp.getInputMap().put(shrctF3, "focusOut");
            jcomp.getInputMap().put(shrctF4, "focusOut");
            jcomp.getInputMap().put(shrctF5, "focusOut");
            jcomp.getInputMap().put(shrctF6, "focusOut");
            jcomp.getInputMap().put(shrctF7, "focusOut");
            jcomp.getInputMap().put(shrctF8, "focusOut");
            jcomp.getInputMap().put(shrctCtrlAr, "focusOut");
            jcomp.getInputMap().put(shrctF12, "removeRow");
            jcomp.getInputMap().put(callTable, "callTable");
            jcomp.getActionMap().put("removeRow", new AbstractAction("removeRow") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                    removeRow();
                }
            });
            //new add
            jcomp.getActionMap().put("shortcut", new AbstractAction("shortcut") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                    try {
                        if (jcomp.getCellEditor() != null) {
                            jcomp.getCellEditor().stopCellEditing();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            });
            jcomp.getActionMap().put("focusOut", new AbstractAction("focusOut") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                    jcomp.clearSelection();
                    jcomp.transferFocus();
                }
            });
            jcomp.getActionMap().put("callTable", new AbstractAction("callTable") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                }
            });
            jcomp.setGridColor(new java.awt.Color(204, 204, 255));
            jcomp.setCellSelectionEnabled(true);
            jcomp.setRowHeight(25);
            jcomp.setSelectionBackground(Color.LIGHT_GRAY);
            jcomp.setSelectionForeground(Color.RED);
            jcomp.revalidate();

            jcomp.addMouseListener(new MouseAdapter() {

                @Override
                public void mouseClicked(MouseEvent e) {
                    System.out.println("mouse click table");
                    final int i = jcomp.getSelectedRow();
                    final int j = jcomp.getSelectedColumn();
                    for (int val = 0; val < jcomp.getRowCount(); val++) {
                        if (jcomp.getModel().getValueAt(val, 2) == null); else {
                            if (jcomp.getModel().getValueAt(val, 2).equals(0)) {
                                jcomp.changeSelection(val, 2, false, false);
                            }
                        }
                    }
                    //  calculateMargin();
                    salesCalculations();

                }
            });
            jcomp.addKeyListener(new KeyAdapter() {

                @Override
                public void keyReleased(KeyEvent e) {
                    System.out.println("key released table");
                    final int i = jcomp.getSelectedRow();
                    final int j = jcomp.getSelectedColumn();
                    try {
                        if (i == jcomp.getModel().getRowCount() - 1) {
                            addRow();
                        }
                        salesCalculations();
                        if (e.getKeyCode() == 10) {
                            InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                            KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                            KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                            im.put(enter, im.get(tab));
                        }
                        alert1 = "";
                        itN = (String) jcomp.getModel().getValueAt(i, 2);
//                        if (j == 7) {
//                            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
//                            int stkQty = 0;
//                            stkQty = Integer.parseInt(salesController.getStockQty(jcomp.getModel().getValueAt(i, 2).toString(), jcomp.getModel().getValueAt(i, 6).toString()));
//                            int qty = 0;
//                            if (jcomp.getModel().getValueAt(i, 2) == null); else {
//                                qty = Integer.parseInt(jcomp.getModel().getValueAt(i, 2).toString());
//                            }
//                            if (qty == 0) {
//                                jcomp.changeSelection(i, 2, false, false);
//                            } else {
//                                double sp = 0;
//                                //sabarish if(jcomp.getModel().getValueAt(i, 18).toString().equals("0"))
//                                {
//                                    if (qty <= stkQty) {
//                                        if (i == jcomp.getModel().getRowCount() - 1) {
//                                            addRow();
//                                        }
//                                        jcomp.changeSelection(i, 2, false, false);
//                                    } else {
//                                        String ss = "";
//                                        if (stkQty == 0 || stkQty < 0) {
//                                            ss = "Please this Medicine " + jcomp.getModel().getValueAt(i, 2) + " is Out of Stock";
//                                        } else {
//                                            ss = "Please enter quantity less than Stock Quantity of Medicine " + jcomp.getModel().getValueAt(i, 2) + " is : " + stkQty;
//                                        }
//                                        Alert.inform("Sales Cash", ss);
//                                        jcomp.requestFocus();
//                                        jcomp.changeSelection(i, 2, false, false);
//                                    }
//                                }
//                            }
//                        }
                        //sabarish   else if(i == jcomp.getModel().getRowCount() - 1 && j==10)
                        //sabarish   {
                        //sabarish      addRow();
                        //sabarish  }
                        //sabarish    calculateMargin();
                    } catch (Exception ex) {
                        String ss = "Method: tablekeyReleased  Exception : " + ex.getMessage();
                        log.debug(ss);
                    }
                }

                @Override
                public void keyPressed(KeyEvent e) {
                    System.out.println("key pressed table");
                    final int i = jcomp.getSelectedRow();
                    final int j = jcomp.getSelectedColumn();
                    InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    try {
                        //sabarish   salesCalculations();
                        //sabarish if (e.getKeyCode() == 10) {
                        //sabarish   KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        //sabarish  KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        //sabarish  im.put(enter, im.get(tab));
                        //sabarish   }
                        if (e.isActionKey()) {
                            for (int val = 0; val < jcomp.getRowCount(); val++) {
                                if (jcomp.getModel().getValueAt(val, 1) == null); else {
                                    jcomp.getModel().setValueAt(val + 1, val, 0);
                                }
                                if (jcomp.getModel().getValueAt(val, 2) == null); else {
                                    if (Integer.parseInt(jcomp.getModel().getValueAt(val, 2).toString()) == 0) {
                                        jcomp.changeSelection(val, 2, false, false);
                                        break;
                                    }
                                }
                            }
                        }
                        if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                            if (jcomp.getModel().isCellEditable(i, j)) {
                                jcomp.getModel().setValueAt("", i, j);
                            }
                        } else {
                            char c = e.getKeyChar();
                            if (jcomp.getModel().isCellEditable(i, j)) {
                                if ((c > '0' && c <= '9')) {
                                    jcomp.getModel().setValueAt(0, i, j);
                                }
                            }
                        }
                        //sabarish   calculateMargin();
                    } catch (Exception ex) {
                        String ss = "Method: tableKeyPressed    Exception : " + ex.getMessage();
                        log.debug(ss);
                    }
                }

                @Override
                public void keyTyped(KeyEvent e) {
                    //sabarish  calculateMargin();
                    //sabarish salesCalculations();
                }
            });
            return jcomp;
        } catch (Exception ex) {
            String ss = "Method: createTable   Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return jcomp;
    }
    /*   public double calculateMargin() {
    double margin = 0.0;
    try
    {
    double discount=0.00;
    double vat=0.00;
    double purPrice=0.00;
    double purdisc=0.00;
    double salesVat = 0.00;
    double unitPrice = 0.00;
    double salesGst = 0.00;//gst
    double purGst=0.00;

    int i=jcomp.getSelectedRow();
    if(i!=-1)
    {
    if(jcomp.getModel().getValueAt(i, 4)!=null && jcomp.getModel().getValueAt(i, 4)!="") {
    int stkQty = Integer.parseInt(jcomp.getModel().getValueAt(i, 4).toString());
    //sabarish   if((jcomp.getModel().getValueAt(i, 7)!=null && !jcomp.getModel().getValueAt(i, 7).toString().equals(""))) {
    //sabarish   unitPrice = Double.parseDouble(jcomp.getModel().getValueAt(i, 7).toString());
    //sabarish  }
    //sabarish  if(jcomp.getModel().getValueAt(i, 9)!=null && jcomp.getModel().getValueAt(i, 9)!="") {
    //sabarish  discount = Double.parseDouble(jcomp.getModel().getValueAt(i, 9).toString());
    //sabarish   }
    //sabarish   if(jcomp.getModel().getValueAt(i, 11)!=null)
    //sabarish {
    //sabarish   vat = Double.parseDouble(jcomp.getModel().getValueAt(i, 11).toString());
    //sabarish  }
    CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
    String getPurcPrice=commonController.getQueryValue("select purchase_price from stock_statement where item_code='"+jcomp.getModel().getValueAt(i, 1).toString()+"' and batch_no='"+jcomp.getModel().getValueAt(i, 5).toString()+"'");
    String getPurcDisc=commonController.getQueryValue("select distinct unit_discount from  purchase_invoice where item_code='"+jcomp.getModel().getValueAt(i, 1).toString()+"' and batch_no='"+jcomp.getModel().getValueAt(i, 5).toString()+"'");
    if(!getPurcPrice.equals(""))
    purPrice=Double.parseDouble(getPurcPrice);
    if(getPurcDisc.equals("") || getPurcDisc==null)
    {
    purdisc=0.0;
    }
    else
    {
    purdisc=Double.parseDouble(getPurcDisc);
    }
    double vatCalcFlag=Double.parseDouble(commonController.getQueryValue("select vat_calc_flag from drugtable where itemcode='"+jcomp.getModel().getValueAt(i, 1).toString()+"'"));
    if(vatCalcFlag==0)
    {
    salesVat=Value.Round((unitPrice*vat)/(100),2);

    salesGst=Value.Round((unitPrice*gstPer)/(100),2);

    purGst=Value.Round(((purPrice*gstPer)/(100)*stkQty),2);
    }
    else
    {
    salesGst=0;
    salesVat=0;
    }
    int exclu_inclu=CommonDAO.inexcl;
    if(exclu_inclu==1)
    {
    margin=Value.Round(((unitPrice-(unitPrice*(discount/100))-purPrice)*stkQty),2);
    jcomp.getModel().setValueAt(margin, i, 2); //se
    }
    else if(exclu_inclu==0)
    {
    //  margin=Value.Round(((unitPrice-(unitPrice*(discount/100))-(purPrice-(purPrice*(purdisc/100))))*stkQty)-salesGst+purGst,2);
    margin=Value.Round(((unitPrice-(unitPrice*(discount/100))-purPrice)*stkQty)-(salesGst*stkQty)+purGst,2);
    jcomp.getModel().setValueAt(margin, i, 2); //se
    double percMargin=0;
    percMargin = Value.Round(((margin/unitPrice)*100),2);
    }
    }
    }
    }
    catch(Exception ex) {
    System.out.println("Method: calculateMargin   Exception : " + ex);
    ex.printStackTrace();
    String ss = "Method: calculateMargin   Exception : " + ex.getMessage();
    log.debug(ss);
    }
    return margin;
    }*/


    public List<ServiceModel> getTableValues() {
        int rowCount = jcomp.getModel().getRowCount();
        List<ServiceModel> values = new ArrayList<ServiceModel>();
        ServiceModel model;
        try {
            for (int i = 0; i < rowCount; i++) {
                    model = new ServiceModel();
                    if (jcomp.getModel().getValueAt(i, 1) == null && jcomp.getModel().getValueAt(i, 2) == null);
                    else {
                        
                        model.setService_name(""+jcomp.getModel().getValueAt(i, 1));
                        model.setQty (Double.parseDouble(jcomp.getModel().getValueAt(i, 2).toString()));
                        model.setUnit_discount(Double.parseDouble(jcomp.getModel().getValueAt(i, 3).toString()));
                        model.setUnit_price(Double.parseDouble(jcomp.getModel().getValueAt(i, 4).toString()));
                        model.setUnit_vat(Double.parseDouble(jcomp.getModel().getValueAt(i, 5).toString()));
                        model.setTotal_price(Double.parseDouble(jcomp.getModel().getValueAt(i, 6).toString()));
                        model.setCategory(""+jcomp.getModel().getValueAt(i, 7));
                        values.add(model);
                    }
            }
        } catch (Exception ex) {
            String ss = "Method: getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return values;
    }
public List<ServiceModel> getTableInpatientValues() {
        int rowCount = jcomp.getModel().getRowCount();
        List<ServiceModel> values = new ArrayList<ServiceModel>();
        ServiceModel model;
        try {
            for (int i = 0; i < rowCount; i++) {
                    model = new ServiceModel();
                    if (jcomp.getModel().getValueAt(i, 1) == null && jcomp.getModel().getValueAt(i, 2) == null);
                    else {

//                        model.setService_name(""+jcomp.getModel().getValueAt(i, 1));
//                        model.setQty (Double.parseDouble(jcomp.getModel().getValueAt(i, 2).toString()));
//                        model.setUnit_discount(Double.parseDouble(jcomp.getModel().getValueAt(i, 3).toString()));
//                        model.setUnit_price(Double.parseDouble(jcomp.getModel().getValueAt(i, 4).toString()));
//                        model.setUnit_vat(Double.parseDouble(jcomp.getModel().getValueAt(i, 5).toString()));
//                        model.setTotal_price(Double.parseDouble(jcomp.getModel().getValueAt(i, 6).toString()));
//                        model.setCategory(""+jcomp.getModel().getValueAt(i, 7));
                        model.setBillno(jcomp.getModel().getValueAt(i, 8).toString());
                        values.add(model);
                    }
            }
        } catch (Exception ex) {
            String ss = "Method: getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return values;
    }


public void addColumnToTable()
    {
//   DefaultTableModel model = (DefaultTableModel)   jcomp.getModel();
//
             boolean columnExists = false;
    for (int i = 0; i < dtmodel.getColumnCount(); i++) {
        if (dtmodel.getColumnName(i).equals("Billno")) {
            columnExists = true;
            break;
        }
    }
              if (!columnExists) {
        dtmodel.addColumn("Billno", new Object[initR]);  // Add the new column
//          boolean[] newCanEditCols = new boolean[dtmodel.getColumnCount()];
//    for (int i = 0; i < newCanEditCols.length; i++) {
//        newCanEditCols[i] = false; // Set all columns to non-editable
//    }
        final boolean[] canEditColsnew = {false, false, false, false, false, false, false , false};
        dtmodel.setCanEditCols(canEditColsnew);
    }
            
}
public void removeLastColumn() {
     boolean columnExists = false;
    for (int i = 0; i < dtmodel.getColumnCount(); i++) {
        if (dtmodel.getColumnName(i).equals("Billno")) {
            columnExists = true;
            break;
        }
    }
     if (columnExists) {
         TableColumnModel columnModel = jcomp.getColumnModel();
        int columnIndex = jcomp.getColumnModel().getColumnIndex("Billno");
         columnModel.removeColumn(columnModel.getColumn(columnIndex));
          dtmodel.setColumnCount(dtmodel.getColumnCount() - 1);
           final boolean[] canEditColsnew = {false, false, true, true, true, true, false , false};
           dtmodel.setCanEditCols(canEditColsnew);
     }
}
    public JComponent getScrollTable(JComponent jt) {
        jcomp = (JTable) jt;
        scrollPane.add(jcomp);
        scrollPane.setViewportView(jcomp);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        int row = jcomp.getRowCount();
        Vector datas = new Vector();
        try {
            for (int i = 0; i < jcomp.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else {
                    datas.addElement(null);
                }
            }
        } catch (Exception ex) {
            String ss = "Method: addRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        model.insertRow(jcomp.getRowCount(), datas);
    }

    public void removeRow() {
        int i = jcomp.getSelectedRow();
        int j = jcomp.getSelectedColumn();
        int rows = jcomp.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    resetValues();
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    jcomp.changeSelection(0, 0, false, false);
                    jcomp.changeSelection(0, j, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = jcomp.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (jcomp.getModel().getValueAt(n, 0) == null) {
                            jcomp.getModel().setValueAt(1, 0, 0);
                        } else {
                            jcomp.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    jcomp.changeSelection(0, 0, false, false);
                    jcomp.changeSelection(i, j, false, false);
                } else {
                    jcomp.changeSelection(0, 0, false, false);
                    jcomp.changeSelection(i - 1, j, false, false);
                }
            }
            //sabarish  salesCalculations();
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }


    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < initR; i++) {
            addRow();
        }
        //sabarish  salesCalculations();
        jcomp.revalidate();
    }

    public List getSalesBillItems() {
        List<SalesModel> salesBillItems = new ArrayList<SalesModel>();
        try {
            SalesModel model;
            try {
                for (int index = 0; index < jcomp.getRowCount(); index++) {
                    if (!(jcomp.getModel().getValueAt(index, 1) == null)) {
                        model = new SalesModel();
                        model.setModuleType("SALES");
                        model.setItemCode(jcomp.getModel().getValueAt(index, 1).toString());
                        model.setItemName(jcomp.getModel().getValueAt(index, 2).toString());
                        model.setFormulation(jcomp.getModel().getValueAt(index, 3).toString());
                        if (jcomp.getModel().getValueAt(index, 2) == null || jcomp.getModel().getValueAt(index, 2).toString().equals("")) {
                            model.setQuantity(0);
                        } else {
                            model.setQuantity((Integer) jcomp.getModel().getValueAt(index, 2));
                        }
                     //sabarish   model.setBatchNumber(jcomp.getModel().getValueAt(index, 5).toString());
                      //sabarish  model.setExpiryDate(jcomp.getModel().getValueAt(index, 6).toString());
                        //sabarish     if(jcomp.getModel().getValueAt(index, 7) == null || jcomp.getModel().getValueAt(index, 7).toString().equals(""))
                        //sabarish     {
                        //sabarish     model.setUnitPrice(0.00);
                        //sabarish  }
                        //sabarish   else
                        //sabarish   {
                        //sabarish  model.setUnitPrice(Double.parseDouble(jcomp.getModel().getValueAt(index,7).toString()));
                        //sabarish   }
                        //sabarish  if(jcomp.getModel().getValueAt(index, 8) == null || jcomp.getModel().getValueAt(index, 8).toString().equals(""))
                        //sabarish  {
                        //sabarish    model.setMrp(0.00);
                        //sabarish   }
                        //sabarish else
                        //sabarish  {
                        //sabarish    model.setMrp((Double)jcomp.getModel().getValueAt(index,8));
                        //sabarish   }
                        //sabarish  if(jcomp.getModel().getValueAt(index, 9) == null || jcomp.getModel().getValueAt(index, 9).toString().equals("")) {
                        //sabarish  model.setUnitDiscount(0.00);
                        //sabarish }
                        //sabarish  else
                        //sabarish  {
                        //sabarish model.setUnitDiscount(Double.parseDouble(jcomp.getModel().getValueAt(index,9).toString()));
                        //sabarish  }
                        //sabarish   model.setUnitVAT((Double)jcomp.getModel().getValueAt(index,11));
                        //gst here*************
                        //sabarish model.setGst((Double)jcomp.getModel().getValueAt(index,12));
                        //sabarish model.setSgst((Double)jcomp.getModel().getValueAt(index,13));
                        //sabarish model.setCgst((Double)jcomp.getModel().getValueAt(index,4));
                        //sabarish model.setIgst((Double)jcomp.getModel().getValueAt(index,15));
                        //sabarish model.setUtgst((Double)jcomp.getModel().getValueAt(index,16));
                        //**************
                        //sabarish  model.setSubTotal((Double)jcomp.getModel().getValueAt(index,17));//12
                        //sabarish model.setTotalItems(Integer.parseInt(jcomp.getModel().getValueAt(index, 18).toString()));
                        salesBillItems.add(model);
                    }
                }
            } catch (Exception e) {
                System.out.print("cash sales table(1)=" + e);
                String ss = "Method: getSalesBillItems Exception : " + e.getMessage();
                log.debug(ss);
            }
        } catch (Exception exception) {
            System.out.print("cash sales table1234 " + exception);
            log.debug("Method: getSalesBillItems    Exception : " + exception.getMessage());
        }
        return salesBillItems;
    }

    public int getDataRowCount() {
        int rowCount = 0;
        for (int rowIndex = 0; rowIndex < jcomp.getModel().getRowCount(); rowIndex++) {
            if (jcomp.getModel().getValueAt(rowIndex, 1) != null && jcomp.getModel().getValueAt(rowIndex, 7) != null && jcomp.getModel().getValueAt(rowIndex, 1) != "" && jcomp.getModel().getValueAt(rowIndex, 7) != "") {
            } else {
                rowCount = rowIndex;
                break;
            }
        }
        return rowCount;
    }

    public void insertPreviousBill(String billNumber) {
        try {
            if (billNumber.length() > 10) {
                billNumber = billNumber.split("-")[0];
            }
            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
            //sabarish  Stock stockController = (Stock) RegistryFactory.getClientStub(RegistryConstants.Stock);
            List<SalesModel> salesBillItems = new ArrayList<SalesModel>();
            SalesModel salesModel;
            String billIndex = billNumber.substring(0, 3);
            String billType = "";
            if (billIndex.equalsIgnoreCase("SCA")) {
                billType = "cash";
            } else if (billIndex.equalsIgnoreCase("SCR")) {
                billType = "credit";
            } else if (billIndex.equalsIgnoreCase("SCD")) {
                billType = "cards";
            }
            int rowCount = getDataRowCount();
            salesModel = salesController.loadEditTable(billNumber, billType);
            SalesModel sales;
            salesBillItems = salesModel.getListofitems();
            for (int index = 0; index < salesBillItems.size(); index++) {
                sales = (SalesModel) salesBillItems.get(index);
                Boolean flag = false;
                for (int rowIndex = 0; rowIndex < rowCount && rowCount != 0; rowIndex++) {
                    if (sales.getItemCode().equals(jcomp.getModel().getValueAt(rowIndex, 1).toString()) && sales.getBatchNumber().equals(jcomp.getModel().getValueAt(rowIndex, 7).toString())) {
                        flag = true;
                        break;
                    }
                }
                int stockQuantity = 0;
                //sabarish  stockQuantity=Integer.parseInt(stockController.getStockQty(sales.getItemCode(),sales.getBatchNumber()));
//                  if(stockQuantity < 0) {
//                      CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
//                      commonController.getQueryValue("select ");
//                  }
                if (rowCount != 0 && flag == false) {
                    addRow();
                    jcomp.getModel().setValueAt(rowCount + 1, rowCount, 0);
                    jcomp.getModel().setValueAt(sales.getItemCode(), rowCount, 1);
                    jcomp.getModel().setValueAt(sales.getItemName(), rowCount, 2);
                    jcomp.getModel().setValueAt(sales.getFormulation(), rowCount, 3);
                    jcomp.getModel().setValueAt(sales.getQuantity(), rowCount, 4);
                    jcomp.getModel().setValueAt(sales.getBatchNumber(), rowCount, 7);
                    jcomp.getModel().setValueAt(sales.getReturnExpiryDate(), rowCount, 8);
                    //sabarish   jcomp.getModel().setValueAt(sales.getUnitPrice(), rowCount,7);
                    //sabarish  jcomp.getModel().setValueAt(sales.getMrp(), rowCount, 8);
                    //sabarish    jcomp.getModel().setValueAt(sales.getUnitDiscount(), rowCount, 9);
                    //sabarish  jcomp.getModel().setValueAt(0.00, rowCount,10);
                    //sabarish   jcomp.getModel().setValueAt(sales.getUnitVAT(), rowCount,11);
                    //gst***********************************
                    //sabarish jcomp.getModel().setValueAt(sales.getGst(),rowCount,12);
                    //sabarish jcomp.getModel().setValueAt(sales.getSgst(), rowCount,13);
                    //sabarish  jcomp.getModel().setValueAt(sales.getCgst(), rowCount,4);
                    //sabarish  jcomp.getModel().setValueAt(sales.getIgst(), rowCount,15);
                    //sabarish  jcomp.getModel().setValueAt(sales.getUtgst(), rowCount,16);
                    //gst***********************************
                    //sabarish  jcomp.getModel().setValueAt(0.00, rowCount,17);//12
                    //sabarish jcomp.getModel().setValueAt(0, rowCount,18);
                    rowCount++;
                } else {
                    jcomp.getModel().setValueAt(rowCount + 1, rowCount, 0);
                    jcomp.getModel().setValueAt(sales.getItemCode(), rowCount, 1);
                    jcomp.getModel().setValueAt(sales.getItemName(), rowCount, 2);
                    jcomp.getModel().setValueAt(sales.getFormulation(), rowCount, 3);
                    jcomp.getModel().setValueAt(sales.getQuantity(), rowCount, 4);
                    jcomp.getModel().setValueAt(sales.getBatchNumber(), rowCount, 7);
                    jcomp.getModel().setValueAt(sales.getReturnExpiryDate(), rowCount, 8);
                    //sabarish  jcomp.getModel().setValueAt(sales.getUnitPrice(), rowCount,7);
                    //sabarish   jcomp.getModel().setValueAt(sales.getMrp(), rowCount, 8);
                    //sabarish jcomp.getModel().setValueAt(sales.getUnitDiscount(), rowCount, 9);
                    //sabarish  jcomp.getModel().setValueAt(0.00, rowCount,10);
                    //sabarish  jcomp.getModel().setValueAt(sales.getUnitVAT(), rowCount,11);
                    //gst***********************************
                    //sabarish   jcomp.getModel().setValueAt(sales.getGst(),rowCount,12);
                    //sabarish  jcomp.getModel().setValueAt(sales.getSgst(), rowCount,13);
                    //sabarish  jcomp.getModel().setValueAt(sales.getCgst(), rowCount,4);
                    //sabarish  jcomp.getModel().setValueAt(sales.getIgst(), rowCount,15);
                    //sabarish  jcomp.getModel().setValueAt(sales.getUtgst(), rowCount,16);
                    //gst***********************************
                    //sabarish   jcomp.getModel().setValueAt(0.00, rowCount,17);//12
                    //sabarish  jcomp.getModel().setValueAt(0, rowCount,18);
                    rowCount++;
                }
            }
        } catch (Exception ex) {
            String ss = "Method: insertPreviousBill    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void resetValues() {
        totQty = 0;
        totItems = 0;
        totAmt = 0.00;
        totalAmtttt = 0.00;
        totDistAmt = 0.0;
        totVATAmt4 = 0.0;
        totGst = 0.0;
        totSgst = 0.0;
        totCgst = 0.0;
        totIgst = 0.0;
        totUtgst = 0.0;
        //- totVATAmt12 = 0.0;
        amt = 0.00;
    }

    public void focusSet() {
        jcomp.requestFocus();
        jcomp.changeSelection(0, 1, false, false);
        jcomp.getModel().setValueAt("1", 0, 0);
        jcomp.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col) {
        jcomp.requestFocus();
        jcomp.changeSelection(row, col, false, false);
        jcomp.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col, String barcode) {
        for (int i = 0; i < jcomp.getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, 1) != null) {
                row++;
            }
        }
        jcomp.requestFocus();
        jcomp.changeSelection(row, col, false, false);
        jcomp.setCellSelectionEnabled(true);
        barcodeSelected = false;
        barcodeFocus = true;
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, colNo) == null || jcomp.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble("" + jcomp.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalItems() {
        int tot = 0;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, 2) != null || jcomp.getModel().getValueAt(i, 2) != "") {
                tot++;
            }
        }
        return tot;
    }
    public Boolean isIncludedVat = false;

    public void salesCalculations() {
        int rowCount = jcomp.getRowCount();
        qty = new double[rowCount];
        uprice = new double[rowCount];
        vat4 = new double[rowCount];
        vat12 = new double[rowCount];
        dist = new double[rowCount];
        subTot = new double[rowCount];
        tGst = new double[rowCount];
        Sgst = new double[rowCount];
        Cgst = new double[rowCount];
        Igst = new double[rowCount];
        Utgst = new double[rowCount];
        Total= new double[rowCount];
        totGst = 0;
        totSgst = 0;
        totCgst = 0;
        totIgst = 0;
        totUtgst = 0;
        totDistAmt = 0;
        subtotdist = new double[rowCount];
        totVATAmt4 = 0;
        totAmt = 0;
        totalAmtttt = 0;
        totQty = 0;
        totItems = 0;
        totMargin = 0;
//      System.out.println("saless");
//      System.out.println(totQty);
      
        try {

            for (int i = 0; i < rowCount; i++) {
                if (jcomp.getModel().getValueAt(i, 1) == null || jcomp.getModel().getValueAt(i, 1).equals("")) {
                    if (i == 0) {
                        nullVal = 0;
                        break;
                    }
                } else {
                    nullVal = 1;
                    totItems++;
                    if (jcomp.getModel().getValueAt(i, 2) == null) {
                        jcomp.changeSelection(i, 2, false, false);
                    } else {
                        if (jcomp.getModel().getValueAt(i, 2).equals("")) {
                            qty[i] = 0;
                        } else {
//                            double number = Double.parseDouble(jcomp.getModel().getValueAt(i, 2).toString());
                            qty[i] = Double.parseDouble(jcomp.getModel().getValueAt(i, 2).toString());
                        }

                        if (jcomp.getModel().getValueAt(i, 4) == null || jcomp.getModel().getValueAt(i, 4).equals("")) {
                            uprice[i] = 0.0;
                        } else {
                            uprice[i] = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 4));
                        }
                        subTot[i] = Value.Round(qty[i] * uprice[i], 2);
                        Total[i] = subTot[i];
                        jcomp.getModel().setValueAt(subTot[i], i, 6);//12
                       
                        
                        if (jcomp.getModel().getValueAt(i, 3) == null || jcomp.getModel().getValueAt(i, 3).equals("")) {
                            dist[i] = 0.0;
                        } else {
                            dist[i] = Value.Round(subTot[i] * (Double.parseDouble("" + jcomp.getModel().getValueAt(i, 3)) / 100), 2);
                            subtotdist[i]=subTot[i]-dist[i];
                            jcomp.getModel().setValueAt(subtotdist[i], i, 6);//12
                            Total[i] = subtotdist[i];

                           //sabarish subTot[i]=subTot[i]-dist[i];//saba

                             //sabarish jcomp.getModel().setValueAt(subTot[i], i, 6);//12//saba
                        }
                       
                        if(jcomp.getModel().getValueAt(i, 3) == null || jcomp.getModel().getValueAt(i, 3).equals("") || jcomp.getModel().getValueAt(i, 3) == "0.0"  ){
                       
                        if (jcomp.getModel().getValueAt(i, 5) == null || jcomp.getModel().getValueAt(i, 5).equals("")) {
                            vat4[i] = 0.0;
                            vat12[i] = 0.0;
                        }
                        else{
                            double vatPerc = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 5));
                            vat4[i] = Value.Round((qty[i] * uprice[i] * vatPerc) / 100, 2);
                            vat12[i]=subTot[i]+vat4[i];
                            jcomp.getModel().setValueAt(vat12[i], i, 6);//12
                            Total[i]=vat12[i];

                           //sabarish subTot[i]=subTot[i]+vat4[i];//saba
                           //sabarish jcomp.getModel().setValueAt(subTot[i], i, 6);//12//saba
                             }
                            }
                        else{
                 

                          if (jcomp.getModel().getValueAt(i, 5) == null || jcomp.getModel().getValueAt(i, 5).equals("")) {
                            vat4[i] = 0.0;
                          vat12[i] = 0.0;
                        }
                        else {
                            double vatPerc = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 5));
                            vat4[i] = Value.Round((subtotdist[i] * vatPerc) / 100, 2);
                           vat12[i]=subtotdist[i]+vat4[i];
                           jcomp.getModel().setValueAt(vat12[i], i, 6);//12
                        Total[i]=vat12[i];
                           //sabarish   subTot[i]=(subTot[i]-dist[i])+vat4[i];//saba
                            //sabarish  jcomp.getModel().setValueAt(subTot[i], i, 6);//12//saba
                        }
}
                        totVATAmt4 += Value.Round(vat4[i], 2);
                        totQty += qty[i];
                        totGst += vat4[i];
                        totDistAmt += Value.Round(dist[i], 2);
                        totAmt += Value.Round(subTot[i],2);
                        totalAmtttt += Value.Round(Total[i],2);
                       
                       
//naziya                        int exclu_inclu = CommonDAO.inexcl;
                       /* if (exclu_inclu == 0) {
                            if (true)//saba
                            {
                                gstproductAmt = Value.Round(((subTot[i] - dist[i]) / (100 + gstPer)) * 100, 2);
                                Sgst[i] = Value.Round(gstproductAmt * (sgstPer / 100), 2);
                                Cgst[i] = Value.Round(gstproductAmt * (cgstPer / 100), 2);
                                Igst[i] = Value.Round(gstproductAmt * (igstPer / 100), 2);
                                Utgst[i] = Value.Round(gstproductAmt * (utgstper / 100), 2);
                                tGst[i] = Value.Round(gstproductAmt * (gstPer / 100), 2);
                                totGst += Value.Round(tGst[i], 2);
                                totSgst += Value.Round(Sgst[i], 2);
                                totCgst += Value.Round(Cgst[i], 2);
                                totIgst += Value.Round(Igst[i], 2);
                                totUtgst += Value.Round(Utgst[i], 2);
                            } //sabarish  else if(exclu_inclu == 1)
                            else if (false) {
                                Sgst[i] = Value.Round((qty[i] * (uprice[i] - (dist[i] / qty[i])) * sgstPer) / 100, 2);
                                Cgst[i] = Value.Round((qty[i] * (uprice[i] - (dist[i] / qty[i])) * cgstPer) / 100, 2);
                                Igst[i] = Value.Round((qty[i] * (uprice[i] - (dist[i] / qty[i])) * igstPer) / 100, 2);
                                Utgst[i] = Value.Round((qty[i] * (uprice[i] - (dist[i] / qty[i])) * utgstper) / 100, 2);
                                tGst[i] = Value.Round((qty[i] * (uprice[i] - (dist[i] / qty[i])) * gstPer) / 100, 2);
                                totGst += Value.Round(tGst[i], 2);
                                totSgst += Value.Round(Sgst[i], 2);
                                totCgst += Value.Round(Cgst[i], 2);
                                totIgst += Value.Round(Igst[i], 2);
                                totUtgst += Value.Round(Utgst[i], 2);
                            }
                        }*/
                        //totGst End
                        //GST ******************************
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            String ss = "Method: salesCalculations    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public int adjustAmount(int adjustAmt) {
//        int itemsOneQty;
//        int rowCount;
//        int returnFlag;
//        do {
//        itemsOneQty=0;
//        rowCount=0;
//        salesCalculations();
//        int qtyChanged[] = new int[jcomp.getModel().getRowCount()];
//        if(adjustAmt < totAmt && totAmt!=0) {
//         for (int index = 0; index < jcomp.getModel().getRowCount(); index++) {
//          if (jcomp.getModel().getValueAt(index, 2) != null && jcomp.getModel().getValueAt(index, 2) != "" && jcomp.getModel().getValueAt(index, 2) != "null" ) {
//            rowCount++;
//            int oldQty = Integer.parseInt(jcomp.getModel().getValueAt(index,4).toString());
//            double oldUnitPrice = Double.parseDouble(jcomp.getModel().getValueAt(index,7).toString());
//
//            if(oldQty > 1) {
//                qtyChanged[index] = oldQty-1;
//                if(qtyChanged[index]==0) qtyChanged[index]=1;
//                jcomp.getModel().setValueAt(qtyChanged[index], index, 4);
//                jcomp.getModel().setValueAt(qtyChanged[index]*oldUnitPrice,index,12);
//                salesCalculations();
//                if(totAmt <= adjustAmt)
        {
//                break;
//                }
//           }
//           if(oldQty==1) itemsOneQty++;
//          }
//        }
//         returnFlag = 1;
//        }
//        else if(totAmt == 0) {
//         returnFlag = 0;
//        }
//        else {
//         returnFlag = 2;
//        }
//       if(itemsOneQty == rowCount){
//           break;
//       }
//       } while(totAmt > adjustAmt);
//       return returnFlag;

            int returnFlag = 0;
            int qtyChanged[] = new int[jcomp.getModel().getRowCount()];
            do {
                if (adjustAmt < totAmt && totAmt != 0) {
                    //sabarish     salesCalculations();
                    for (int index = 0; index < jcomp.getModel().getRowCount(); index++) {
                        double perc = adjustAmt / totAmt;
                        if (jcomp.getModel().getValueAt(index, 2) != null && jcomp.getModel().getValueAt(index, 2) != "" && jcomp.getModel().getValueAt(index, 2) != "null") {
                            int oldQty = Integer.parseInt(jcomp.getModel().getValueAt(index, 4).toString());
                            double unitPrice = Double.parseDouble(jcomp.getModel().getValueAt(index, 2).toString());//se
                            qtyChanged[index] = (int) (oldQty * perc);
                            jcomp.getModel().setValueAt(qtyChanged[index], index, 4);
                            jcomp.getModel().setValueAt(qtyChanged[index] * unitPrice, index, 2);//se
                        }
                    }
                    returnFlag = 1;
                } else if (totAmt == 0) {
                    returnFlag = 0;
                } else {
                    returnFlag = 2;
                }
            } while (totAmt > adjustAmt);
            return returnFlag;
        }
    }

    public void calcDiscount(String discAmt) {
        double discPerc = 0.00;
        discPerc = Value.Round(Double.parseDouble(discAmt) * 100 / totAmt, 2);
        for (int index = 0; index < jcomp.getModel().getRowCount(); index++) {
            if (jcomp.getModel().getValueAt(index, 2) != null && jcomp.getModel().getValueAt(index, 2) != "" && jcomp.getModel().getValueAt(index, 2) != "null") {
                // jcomp.getModel().setValueAt(discPerc, index, 9);
            }
        }
        //sabarish  salesCalculations();
    }

    public void insertSalesAdjData() {
        clearData();
        //sabarish   new GetSalesAdjustmentDatas(jcomp, "Sales", "ADJUSTMENT").setVisible(true);
        //sabarish  salesCalculations();
    }
//ajith work

    public int isExist(String productCode, String Ibatchno) {
        int rowCount = jcomp.getModel().getRowCount();
        int rowVal = -1;
        try {
            for (int i = 0; i < rowCount; i++) {
                if (jcomp.getModel().getValueAt(i, 2) != null
                        && jcomp.getModel().getValueAt(i, 2) != ""
                        && !(jcomp.getModel().getValueAt(i, 2) + "").equalsIgnoreCase("null")) {
                    //Batch number check
                    if (jcomp.getModel().getValueAt(i, 8) != null
                            && jcomp.getModel().getValueAt(i, 8) != ""
                            && !(jcomp.getModel().getValueAt(i, 8) + "").equalsIgnoreCase("null")) {
                        if (productCode.equals(jcomp.getModel().getValueAt(i, 2) + "")
                                && Ibatchno.equals(jcomp.getModel().getValueAt(i, 8) + "")) {
                            rowVal = i;
                            jcomp.changeSelection(rowVal, 4, false, false);
                            break;
                            //Alert.inform("Sales Cash","This Product Already Added_1. ...");
                        }
                    } else {
                        if (productCode.equals(jcomp.getModel().getValueAt(i, 2) + "")) {
                            rowVal = i;
                            jcomp.changeSelection(rowVal, 4, false, false);
                            break;
                            //                        Alert.inform("Sales Cash","This Product Already Added. ...");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            String ss = "Method: isExist    Exception : " + ex.getMessage();
            log.debug(ss);
        }

        return rowVal;
    }

    public Boolean validation(String ItemName, String BatchNo) {
        try {
            CommonImplements commonController1 = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            String expDate = "select expiry_date from stock_statement where item_name='" + ItemName.trim() + "' and batch_no='" + BatchNo.trim() + "'";
            String expDate1 = commonController1.getQueryValue(expDate);
            boolean check = true;
            String expCheckQuery = "SELECT DATEDIFF(STR_TO_DATE('" + expDate1.trim() + "','%Y-%m-%d'),concat(DATE_FORMAT(curdate(),'%Y-%m'),'-01')) as compare";
            int dateDiff = Integer.parseInt(commonController1.getQueryValue(expCheckQuery));

            String hdrug = "select schedule from drugtable where itemname = (select distinct SUBSTRING_INDEX((item_name),'_',1) AS itemname FROM stock_statement s where s.item_name='" + ItemName.trim() + "' and s.batch_no='" + BatchNo.trim() + "')";
            h1drug = commonController1.getQueryValue(hdrug);

            String banndrug = "select distinct generic_name from banned_drug where generic_name= (select distinct genericname from drugtable where itemname=(select distinct SUBSTRING_INDEX((item_name),'_',1) AS itemname FROM stock_statement s where s.item_name='" + ItemName.trim() + "' and s.batch_no='" + BatchNo.trim() + "'))";
            String banndrug1 = commonController1.getQueryValue(banndrug);

            if (banndrug1.equals("")) {
                if (h1drug.trim().equals("h1") || h1drug.trim().equals("H1")) {
                    String message = "This medicine \"" + ItemName.trim() + " \" is H1 drug.Do u want to add it?";
                    int returnPressed = JOptionPane.showConfirmDialog(rootPane, message, "Sales Invoice", JOptionPane.YES_NO_OPTION);
                    if (returnPressed == 0) {
                        check = true;
                    } else {
                        check = false;
                    }
                }
                if (dateDiff <= 0 && check == true) {
                    String message = "This medicine \"" + ItemName.trim() + "\" is expired Drug. Do u want to add it?";
                    int returnPressed = JOptionPane.showConfirmDialog(rootPane, message, "Sales Invoice", JOptionPane.YES_NO_OPTION);
                    if (returnPressed == 0) {
                        check = true;
                    } else {
                        check = false;
                    }
                }
            } else {
                check = false;
                String message = "Alert: This medicine \"" + ItemName.trim() + " \" is Banned drug";
                JOptionPane.showMessageDialog(rootPane, message);
            }
            return check;
        } catch (Exception e) {
            System.out.println("validation exp=" + e);
            String ss = "Method: Validation Exception : " + e.getMessage();
            log.debug(ss);
            return false;
        }
    }
     public void setTablevalue(List<ServiceModel>salesList)
    {
         ServiceModel listModel;
         int rowPointer=0;
         System.out.println("rowwww");
         System.out.println(salesList.size());
        for (int index = 0; index < salesList.size(); index++) {
                listModel = (ServiceModel) salesList.get(index);

                jcomp.getModel().setValueAt(rowPointer + 1, rowPointer, 0);
                jcomp.getModel().setValueAt(listModel.getService_name(), rowPointer, 1);
                jcomp.getModel().setValueAt(listModel.getQty(), rowPointer, 2);
                jcomp.getModel().setValueAt(listModel.getDiscount_amt(), rowPointer, 3);
                jcomp.getModel().setValueAt(listModel.getUnit_price(), rowPointer, 4);
                jcomp.getModel().setValueAt(listModel.getUnit_gst(), rowPointer, 5);
                jcomp.getModel().setValueAt(listModel.getTotal_amount(), rowPointer, 6);
                jcomp.getModel().setValueAt(listModel.getCategory(), rowPointer, 7);
                jcomp.getModel().setValueAt(listModel.getBillno(), rowPointer, 8);
                rowPointer++;
     }
    }
   // public String[] setTablevaluesss(String Item_Name, int sno, int st) {
     public String[] setTablevaluesss(String ctg,String subctg,String service, int sno, int st) {
        int rowCount = jcomp.getModel().getRowCount();
        int rowPointer = 0;
        String[] arr = new String[6];
        arr[0] = "-1";
        arr[1] = "0";
        arr[2] = "0";
        arr[3] = "-1";
        SalesModel listModel;
        // int fetchrowVal = 0;
        try {
            try{
            if (rowCount == 1) {
                addRow();
                rowCount = rowCount + 1;
            }
            if (st > 1) {
                rowPointer = st - 2;
            } else {
                for (int i = 0; i < rowCount; i++) {
                    if (jcomp.getModel().getValueAt(i, 1) != null && jcomp.getModel().getValueAt(i, 1) != "" && !(jcomp.getModel().getValueAt(i, 1) + "").equalsIgnoreCase("null")
                            && jcomp.getModel().getValueAt(i, 2) != null && !(jcomp.getModel().getValueAt(i, 2) + "").equalsIgnoreCase("null") & jcomp.getModel().getValueAt(i, 2) != "") {
                    } else {
                        rowPointer = i;
                        break;
                    }
                }
            }
            }
            catch(Exception e){
                System.out.println("cat="+e);
            }
            String sql1 = "";
            try{

//            if (sno == 0) {
////sql1="select distinct(s.item_name),s.item_code,d.mfgname,d.dosage,s.selling_price,s.mrp,d.vat,s.batch_no,s.formulation,s.ban_flag_id ,s.qty ,s.rack_no, s.shelf_no,s.sales_discount,s.purchase_price,s.selling_price,s.packing,s.expiry_date from stock_statement s, drugtable d where s.item_name='"+Item_Code+"' and s.batch_no='"+Ibatchno+"' and s.ss_flag_id = 0 group by d.vat";
//                //sql1 = "SELECT * FROM billing_catagory_list where billingname='" + Item_Name + "'";
//                sql1="select c.category,l.* from billing_catagory_list l left join billing_catagory_type c on c.sno=l.bcatagoryid where l.billingname='" + Item_Name + "' and c.category='" + Dianame + "' ";
//            } else {
               // sql1 = "SELECT * FROM billing_catagory_list where billingname='" + Item_Name + "' ";

                sql1="Select * from billing_category where category = '"+ctg+"' and subcategory = '"+subctg+"' and servicename = '"+service+"'";
                System.out.println(sql1);
                // }billing_category
            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
            List<SalesModel> salesList = salesController.getQueryTableValues(sql1);
            for (int index = 0; index < salesList.size(); index++) {
                listModel = (SalesModel) salesList.get(index);

                jcomp.getModel().setValueAt(rowPointer + 1, rowPointer, 0);
                /* jcomp.getModel().setValueAt(listModel.getItemCode(), rowPointer,1);
                jcomp.getModel().setValueAt(listModel.getItemName(), rowPointer,2);
                jcomp.getModel().setValueAt(listModel.getFormulation(), rowPointer,3);
                //sabarish jcomp.getModel().setValueAt(Qty, rowPointer,4);
                jcomp.getModel().setValueAt(listModel.getBatchNumber(), rowPointer,5);
                jcomp.getModel().setValueAt(DateUtils.normalFormatExpDate(listModel.getExpiryDate()), rowPointer,6);
                jcomp.getModel().setValueAt(listModel.getUnitPrice(), rowPointer,7);
                jcomp.getModel().setValueAt(listModel.getMrp(), rowPointer, 8);
                jcomp.getModel().setValueAt(listModel.getUnitDiscount(), rowPointer, 9);
                jcomp.getModel().setValueAt(0.00, rowPointer,10);
                if(listModel.getUnitVAT()!= null && ! listModel.getUnitVAT().equals(""))
                {
                jcomp.getModel().setValueAt(listModel.getUnitVAT(),rowPointer,11);
                }
                else
                {
                jcomp.getModel().setValueAt(0,rowPointer,11);
                }
                //gst performance
                jcomp.getModel().setValueAt(listModel.getGst(), rowPointer,12);
                jcomp.getModel().setValueAt(listModel.getSgst(), rowPointer,13);
                jcomp.getModel().setValueAt(listModel.getCgst(), rowPointer,14);
                jcomp.getModel().setValueAt(listModel.getIgst(), rowPointer,15);
                jcomp.getModel().setValueAt(listModel.getUtgst(), rowPointer,16);

                jcomp.getModel().setValueAt(listModel, rowPointer,17);//12
                jcomp.getModel().setValueAt(0, rowPointer,18);*/

                jcomp.getModel().setValueAt(listModel.getBillingname(), rowPointer, 1);
                jcomp.getModel().setValueAt("1", rowPointer, 2);
                jcomp.getModel().setValueAt(0, rowPointer, 3);
                jcomp.getModel().setValueAt(listModel.getBilling_amount(), rowPointer, 4);
                jcomp.getModel().setValueAt(listModel.getGst(), rowPointer, 5);
                jcomp.getModel().setValueAt(listModel.getBilling_amount(), rowPointer, 6);
                jcomp.getModel().setValueAt(listModel.getCategory(), rowPointer, 7);
                

                //sabarihs jcomp.changeSelection(rowPointer, 4, false, false);
                //sabarihs jcomp.setEditingColumn(4);
                rowCount++;
                //sabarish calculateMargin();
                //sabarish salesCalculations();
                
            }

            }
            catch(Exception e ){
                System.out.println("second="+e);
            }
        } catch (Exception ex) {
            System.out.println("cash table1=" + ex);
            System.out.println("cash table2=" + ex.getMessage());
           // System.out.println("cash table3=" + ex.printStackTrace());
            ex.printStackTrace();
            String ss = "Method:setTablevaluesss Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return arr;
    }
}
