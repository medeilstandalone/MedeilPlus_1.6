package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Customer1;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.CustomerModel1;
import java.rmi.NotBoundException;
import java.sql.*;
import javax.swing.*;
import java.awt.Color;
import java.awt.Font;
import java.util.Vector;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.RemoteException;

public class customerSearch {

    Customer1 custController;

    public customerSearch() throws RemoteException, NotBoundException {
        custController = (Customer1) RegistryFactory.getClientStub(RegistryConstants.Customer1);
    }

    public JTable CustomerSearch;
    public JScrollPane scrollPane = new JScrollPane();
    public int totQty = 0;
    public int totItems = 0;
    public double totAmt = 0.00;
    public double totDistAmt = 0.0;
    public double totVATAmt = 0.0;
    public int totPurcQty = 0;
    public int totPurcItems = 0;
    public double totPurcAmt = 0.00;
    public double totPurcDistAmt = 0.0;
    public double totPurcVAT4Amt = 0.0;
    public double totPurcVAT12Amt = 0.0;
    public double amt = 0.00;
    public static String invoice;
    public static String typ;
    public static int salesCount;
    public static double salesAmount;
    public static String customerName = "";
    public static Logger log = Logger.getLogger(SalesMaintainLoadTable.class, "Sales");
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public  KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public  KeyStroke print = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0); 
    CustomerModel1  cust = new CustomerModel1();
    public JComponent createViewTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        CustomerSearch = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 1; i <= col; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
            }
            data.addElement(c);
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colName[i]);
        }
        try {
            CustomerSearch.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

                Class[] type = types;
                boolean[] canEditCol = canEditCols;

                @Override
                public Class getColumnClass(int columnIndex) {
                    return type[columnIndex];
                }

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });
        } catch (Exception e) {
            String msg = "Class : Sales Maintanance  Method : createViewTable()   = "+e.getMessage();
            log.debug(msg);
        }
      //sabarish  CustomerSearch.getColumnModel().getColumn(6).setCellRenderer(new DecimalFormatRenderer());
        CustomerSearch.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        CustomerSearch.getTableHeader().setBackground(new Color(226, 238, 244));
        CustomerSearch.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        CustomerSearch.setShowGrid(true);
        CustomerSearch.getTableHeader().setReorderingAllowed(false);
        CustomerSearch.setSelectionMode(0);
        CustomerSearch.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            CustomerSearch.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        CustomerSearch.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
               final int i = CustomerSearch.getSelectedRow();
               if (CustomerSearch.getModel().getValueAt(i, 0) != null && CustomerSearch.getModel().getValueAt(i, 1) != null) {
                    invoice = (String) CustomerSearch.getModel().getValueAt(i, 0);
                    typ = (String) CustomerSearch.getModel().getValueAt(i, 2);
                    customerName = (String) CustomerSearch.getModel().getValueAt(i, 0);
                   // System.out.println("cust"+customerName);
                }               
            }
        });

        CustomerSearch.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = CustomerSearch.getSelectedRow();
                if (CustomerSearch.getModel().getValueAt(i, 0) != null && CustomerSearch.getModel().getValueAt(i, 1) != null) {
                    invoice = (String) CustomerSearch.getModel().getValueAt(i, 0);
                    typ = (String) CustomerSearch.getModel().getValueAt(i, 2);
                    customerName = (String) CustomerSearch.getModel().getValueAt(i, 0);
                    // System.out.println("cust"+customerName);
                }             
            }
        });

        CustomerSearch.getInputMap().put(edit, "action");
        CustomerSearch.getInputMap().put(can, "action");
        CustomerSearch.getInputMap().put(print, "action");
        CustomerSearch.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                CustomerSearch.transferFocus();
            }
        });
        CustomerSearch.setGridColor(new java.awt.Color(204, 204, 255));
        CustomerSearch.setCellSelectionEnabled(false);
        CustomerSearch.setRowSelectionAllowed(true);
        CustomerSearch.setRowHeight(20);
        CustomerSearch.setSelectionBackground(Color.LIGHT_GRAY);
        CustomerSearch.setSelectionForeground(Color.RED);
        CustomerSearch.revalidate();
	return CustomerSearch;
    }
    public JComponent getScrollTable(JComponent jt) {
        CustomerSearch = (JTable) jt;
        scrollPane.add(CustomerSearch);
        scrollPane.setViewportView(CustomerSearch);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) CustomerSearch.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < CustomerSearch.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(CustomerSearch.getRowCount(), datas);
    }

    public void removeRow() {
        int i = CustomerSearch.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) CustomerSearch.getModel();
            model.removeRow(i);
            CustomerSearch.getModel().setValueAt(i, i - 1, 0);
            CustomerSearch.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(null, "Please select row to remove...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) CustomerSearch.getModel();
        model.getDataVector().removeAllElements();
        for(int i=0;i<15;i++) {
        addRow();
        }
        CustomerSearch.revalidate();
    }

    public void focusSet(int row, int col) {
        CustomerSearch.requestFocus();
        CustomerSearch.changeSelection(row, col, false, false);
        CustomerSearch.setCellSelectionEnabled(true);
    }

    public void focusSet() {
        CustomerSearch.requestFocus();
        CustomerSearch.changeSelection(0, 1, false, false);
        CustomerSearch.getModel().setValueAt("1", 0, 0);
        CustomerSearch.setCellSelectionEnabled(true);
    }

    public void loadCustomerMaintain() {
        try {
            clearData();            
            int i;                
            CustomerModel1 Customer1 = new CustomerModel1();
            List <CustomerModel1> custlist = new ArrayList();
            Customer1 = custController.loadCustomerMaintain();
            custlist = Customer1.getListofitems();
            salesCount =custlist.size();
            salesAmount=0.00;
            CustomerModel1 custDet;
            if (Customer1.getRowCount() > 15) {
                DefaultTableModel model = (DefaultTableModel) CustomerSearch.getModel();
                model.getDataVector().removeAllElements();
                CustomerSearch.revalidate();
                for (int j = 0; j < Customer1.getRowCount(); j++)
                {
                    addRow();
                }
            }
                for( i = 0; i <  custlist.size();i++)
                {
                    custDet =  custlist.get(i);
                    CustomerSearch.getModel().setValueAt(custDet.getCust_code(),i,0) ;
                    CustomerSearch.getModel().setValueAt(custDet.getCust_name(), i, 1);
                    CustomerSearch.getModel().setValueAt(custDet.getMobile_no(), i, 2);
                    CustomerSearch.getModel().setValueAt(custDet.getCust_city(), i, 3);
                    CustomerSearch.getModel().setValueAt(custDet.getDob(), i, 4);
                
                   
                }
        } catch (Exception e) {
            String msg = "Class : Sales Maintanance  Method : LoadSalesMaintain()   = "+e.getMessage();
            log.debug(msg);
        }
    }

    public void loadCustomerMaintain(String option, String val) {
       try {
            clearData();
            int i;                     
            CustomerModel1 Customer1 = new CustomerModel1();
            List <CustomerModel1> custlist = new ArrayList();
            Customer1 = custController.loadCustomerSearch(option,val);
            custlist = Customer1.getListofitems();
            salesCount =custlist.size();
            salesAmount=0.00;
            CustomerModel1 custDet;
            if (Customer1.getRowCount() > 15)
            {
                DefaultTableModel model = (DefaultTableModel) CustomerSearch.getModel();
                model.getDataVector().removeAllElements();
                CustomerSearch.revalidate();
                for (int j = 0; j < Customer1.getRowCount(); j++) {
                    addRow();
                }
            }
                for( i = 0; i <  custlist.size();i++)
                {
                    custDet =  custlist.get(i);
                    CustomerSearch.getModel().setValueAt(custDet.getCust_code(),i,0) ;
                    CustomerSearch.getModel().setValueAt(custDet.getCust_name(), i, 1);
                    CustomerSearch.getModel().setValueAt(custDet.getMobile_no(), i, 2);
                    CustomerSearch.getModel().setValueAt(custDet.getCust_city(), i, 3);
                    CustomerSearch.getModel().setValueAt(custDet.getDob(), i, 4);
                   
                }             
        }
       catch (Exception e) {
            System.out.println("Exception in sales maintload table old "+e);
            String msg = "Class : Sales Maintanance  Method : LoadSalesMaintain()   = "+e.getMessage();
            log.debug(msg);
        }
    }
    public void loadCustomerMaintain(String cdate) {
       try {
            clearData();
            int i;        
            CustomerModel1 Customer1 = new CustomerModel1();
            List <CustomerModel1> custlist = new ArrayList();
          //  Customer1 = custController.loadCustomerSearch(cdate);
            custlist = Customer1.getListofitems();
            salesCount =custlist.size();
            salesAmount=0.00;
            CustomerModel1 custDet;
            if (Customer1.getRowCount() > 15) {
                DefaultTableModel model = (DefaultTableModel) CustomerSearch.getModel();
                model.getDataVector().removeAllElements();
                CustomerSearch.revalidate();
                for (int j = 0; j < Customer1.getRowCount(); j++) {
                    addRow();
                }
            }
                for( i = 0; i <  custlist.size();i++)
                {
                    custDet =  custlist.get(i);
                     CustomerSearch.getModel().setValueAt(custDet.getCust_code(),i,0) ;
                    CustomerSearch.getModel().setValueAt(custDet.getCust_name(), i, 1);
                    CustomerSearch.getModel().setValueAt(custDet.getMobile_no(), i, 2);
                    CustomerSearch.getModel().setValueAt(custDet.getCust_city(), i, 3);
                    CustomerSearch.getModel().setValueAt(custDet.getDob(), i, 4);
                   
                }
        } catch (Exception e) {
            System.out.println("Exception in sales maintload table old "+e);
            String msg = "Class : Sales Maintanance  Method : LoadSalesMaintain()   = "+e.getMessage();
            log.debug(msg);
        }
    }

}
