/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * Radiology.java
 *
 * Created on Sep 27, 2024, 4:27:37 PM
 */
package com.vanuston.medeil.uitables;

import java.sql.Date;
import com.javafx.preview.control.PopupMenu;
import com.vanuston.medeil.controller.CommonController;
import com.vanuston.medeil.controller.RadiologyTypeController;
//import com.vanuston.medeil.model.RadiologyModel;
//import com.vanuston.medeil.model.RadiologyTypeModel;
import com.vanuston.medeil.model.RadiologyTypesModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import javax.swing.table.DefaultTableModel;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Rectangle;
import java.awt.ScrollPane;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelListener;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.swing.BoxLayout;
import javax.swing.DefaultListModel;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ListSelectionModel;
import javax.swing.SwingUtilities;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author prave
 */
public class Radiology extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(Radiology.class, "com.vanuston.medeil.uitables.Radiology");
    public String importType;
    public JPopupMenu popupMenu;
    JMenuItem item;
    JTable jcomp;
    JList jlist;
    public int a = 1;
    public int i = 0;
    public int visibility = 0;
    public int subvisibility = 0;

    /** Creates new form Radiology */
    public Radiology(JTable jTable, String importType) {
        this.importType = importType;
        initComponents();
        setModal(true);
//        getContentPane().setBackground(new java.awt.Color(255, 255, 204));
     // getContentPane().setBackground(new java.awt.Color(255, 255, 204));
       // setBackground(new Color(255, 228, 225));
//        JComboBox jComboBox = new JComboBox();
//        add(jComboBox);
       
        jPanel1.setVisible(true);
    }

    @Override
    public void setModal(boolean modal) {
        super.setModal(modal);
    }

    public boolean setTablevalues(String[] radiology) {
        try {

            jButton3.setBackground(Color.WHITE);
            jButton1.setBackground(Color.WHITE);
            jButton4.setBackground(Color.WHITE);
            radiologysubbtn.setBackground(Color.WHITE);
            jButton2.setBackground(Color.WHITE);
            jButton3.setToolTipText("Radiology list");
            jButton4.setToolTipText("Radiology Subtype list");
            jTable1.getTableHeader().setBackground(new Color(226, 238, 244));
            jTable1.setGridColor(new java.awt.Color(204, 204, 255));
            jTable1.setShowGrid(true);
            jPanel1.setBackground(Color.WHITE);
            final int[] colWidth = {15, 30, 135, 135, 15, 25, 90, 120};
            for (int i = 0; i < 8; i++) {
                jTable1.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
            }
            int rowcount = jTable1.getModel().getRowCount();
            int dataRowCount = 0;
            for (int i = 0; i < rowcount; i++) {

                if (jTable1.getModel().getValueAt(i, 2) != null) {
                    dataRowCount++;
                } else {
                    break;
                }
            }
            if (dataRowCount >= jTable1.getRowCount()) {
                addRow();
            }
            jTable1.getModel().setValueAt(dataRowCount + 1, dataRowCount, 0);

            jTable1.getModel().setValueAt(radiology[0], dataRowCount, 1);
            jTable1.getModel().setValueAt(radiology[1], dataRowCount, 2);
            jTable1.getModel().setValueAt(radiology[2], dataRowCount, 3);
            jTable1.getModel().setValueAt(radiology[3], dataRowCount, 4);
            jTable1.getModel().setValueAt(radiology[4], dataRowCount, 5);
            DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
            centerRenderer.setHorizontalAlignment(JLabel.CENTER);

            for (int i = 0; i < jTable1.getColumnCount(); i++) {
                jTable1.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
            }
        } catch (Exception ex) {
            String ss = "Method: setTablevalues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return true;
    }

    public void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
            int row = jTable1.getRowCount();
            Vector datas = new Vector();

            for (int i = 0; i < jTable1.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else {
                    datas.addElement(null);
                }
            }
            model.insertRow(jTable1.getRowCount(), datas);
        } catch (Exception ex) {
            String ss = "Method: addRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }

    }

    private void filterRadiologyTypes12() {
        System.out.println("filters");
        try {
            popupMenu = new JPopupMenu();
            popupMenu.removeAll(); // Clear the previous popup items

            CommonController controller = new CommonController();
            List<String> tempList = controller.getListItems(radiologytypetext.getText().trim(), "", "RADIOLOGYTYPE");
            System.out.println("Retrieved items: " + tempList);

            // If there are matching items, populate the popup menu
            if (!tempList.isEmpty()) {
                // Create a JPanel to hold the menu items
                JPanel panel = new JPanel();
                panel.setLayout(new BoxLayout(panel, BoxLayout.Y_AXIS)); // Vertical layout

                for (String type : tempList) {
                    JMenuItem item = new JMenuItem(type);
                    // Create a new menu item for each type
                    item.addActionListener(new ActionListener() {

                        @Override
                        public void actionPerformed(ActionEvent e) {
                            System.out.println("item selected");
                            JMenuItem clickedItem = (JMenuItem) e.getSource();
                            System.out.println("clickedddd item: " + clickedItem);
                            if (clickedItem.getText().equals("Add new")) {
                                String newOption = JOptionPane.showInputDialog(
                                        null,
                                        "Please specify the radiology type:",
                                        "Add Other Option",
                                        JOptionPane.PLAIN_MESSAGE);
                                if (newOption != null && !newOption.trim().equals("")) {
                                    System.out.println("insert");
                                    try {
                                        CommonController controller = new CommonController();
                                        controller.insert(newOption);
                                        radiologytypetext.setText(newOption);
                                    } catch (Exception e1) {
                                        String ss = "Method: filterRadiologyTypes1    Exception: " + e1.getMessage();
                                        log.debug(ss);
                                    }
                                }
                            } else {
                                radiologytypetext.setText(clickedItem.getText()); // Set selected text
                            }
                            popupMenu.setVisible(false); // Hide popup after selection
                            radiologySubtypeText.setText("");
                            radiologySubtypeText.requestFocus();
                        }
                    });
                    panel.add(item); // Add the item to the panel
                }

                // Add the panel to a JScrollPane
                JScrollPane scrollPane = new JScrollPane(panel);
                scrollPane.setPreferredSize(new Dimension(radiologytypetext.getWidth(), 100)); // Set fixed height
                scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
                scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

                popupMenu.add(scrollPane); // Add the scroll pane to the popup menu

                System.out.println("Component count: " + popupMenu.getComponentCount());
                if (popupMenu.getComponentCount() > 0) {
                    popupMenu.show(radiologytypetext, 0, radiologytypetext.getHeight()); // Display popup menu
                }
            } else {
                popupMenu.removeAll();
                popupMenu.setVisible(false);
            }

            // Refocus the text field after filtering
            radiologytypetext.requestFocus();
        } catch (Exception e) {
            String ss = "Method: filterRadiologyTypes1    Exception: " + e.getMessage();
            log.debug(ss);
        }
    }

    private void filter() {
        try {
            a = 0;
            System.out.println("hello");
            if (popupMenu == null) {
                popupMenu = new JPopupMenu();
            }

            if (jlist == null) {
                jlist = new JList();
            }

            popupMenu.removeAll();
            jlist.removeAll();
            System.out.println("hello1");
            CommonController controller = new CommonController();
            List<String> tempList = controller.getListItems(radiologytypetext.getText().trim(), "", "RADIOLOGYTYPE");
            System.out.println(tempList);
            System.out.println("hello2");
            DefaultListModel listModelk = new DefaultListModel();
            for (String itemm : tempList) {
                listModelk.addElement(itemm);
            }
            jlist.setModel(listModelk);


            jlist.addMouseListener(new MouseAdapter() {

                @Override
                public void mouseClicked(MouseEvent e) {
                    if (jlist.getSelectedValue() != null) {
                        String selectedItem = jlist.getSelectedValue().toString();
                        if (selectedItem.equals("Add new")) {
                            String newOption = JOptionPane.showInputDialog(
                                    null,
                                    "Please specify the radiolody type:",
                                    "Add Other Option",
                                    JOptionPane.PLAIN_MESSAGE //jComboBox1.addItem("Hello"); // Adds "Hello" to the combo box
                                    );
                            if (newOption != null && !newOption.trim().equals("")) {
                                System.out.println("insert");
                                try {
                                    CommonController controller = new CommonController();
                                    a = controller.insert(newOption);
                                    if (a == 1) {
                                        radiologytypetext.setText(newOption);
                                    } else {
                                    }
                                } catch (Exception e1) {
                                    String ss = "Method: filter    Exception : " + e1.getMessage();
                                    log.debug(ss);
                                }

                            }
                        }
                        radiologytypetext.setText(selectedItem); // Set the selected value in the text field
                        popupMenu.setVisible(false);
                        radiologySubtypeText.setText("");
                        radiologySubtypeText.requestFocus();
                    }
                }
            });

            JScrollPane scrollPane = new JScrollPane(jlist);
            scrollPane.setPreferredSize(new java.awt.Dimension(radiologytypetext.getWidth(), 100));
            popupMenu.add(scrollPane);
            popupMenu.show(radiologytypetext, 0, radiologytypetext.getHeight());
            popupMenu.setVisible(true);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        radiologytypetext.requestFocus();
    }

    private void filter1() {
        try {
            a = 1;
            System.out.println("helloo");

            popupMenu = new JPopupMenu();

            popupMenu.removeAll(); // Single call to clear previous entries

//     

            jlist = new JList(); // Initialize only once


            System.out.println("hello1");
            CommonController controller = new CommonController();
            List<String> tempList = controller.getListItems(radiologytypetext.getText().trim(), "", "RADIOLOGYTYPE");

            System.out.println(tempList);
            System.out.println("hello2");

            DefaultListModel listModel = new DefaultListModel();
            for (String itemm : tempList) {
                listModel.addElement(itemm);
            }
            System.out.println(listModel.toString());
            jlist.setModel(listModel);

            jlist.addMouseListener(new MouseAdapter() {

                @Override
                public void mouseClicked(MouseEvent e) {
                    JList clickedItem = (JList) e.getSource();
                    //  if (jlist.getSelectedValue() != null) {
                    String selectedItem = (String) clickedItem.getSelectedValue();
                    if (selectedItem.equals("Add new")) {
                        String newOption = JOptionPane.showInputDialog(
                                null,
                                "Please specify the radiology type:",
                                "Add Other Option",
                                JOptionPane.PLAIN_MESSAGE);
                        if (newOption != null && !newOption.trim().equals("")) {
                            System.out.println("insert");
                            try {
                                CommonController controllerr = new CommonController();
                                a = controllerr.insert(newOption);
                                if (a == 1) {
                                    radiologytypetext.setText(newOption);
                                } else {
                                    JOptionPane.showMessageDialog(null, "Category already exists!", "Alert", JOptionPane.WARNING_MESSAGE);
                                }
                            } catch (Exception e1) {
                                String ss = "Method: filter Exception : " + e1.getMessage();
                                log.debug(ss);
                            }
                        }
                    } else {
                        radiologytypetext.setText(selectedItem);
                    }
                    popupMenu.setVisible(false);
                    radiologySubtypeText.setText("");
                    if (a == 1) {
                        radiologySubtypeText.requestFocus();
                    } else {
                        radiologytypetext.requestFocus();
                    }
                    visibility = 0;
                    // }
                }
            });


            System.out.println("list");
            JScrollPane scrollPane = new JScrollPane(jlist);
            scrollPane.setPreferredSize(new java.awt.Dimension(radiologytypetext.getWidth(), 100));

            popupMenu.add(scrollPane);


            popupMenu.show(radiologytypetext, 0, radiologytypetext.getHeight());
            popupMenu.setVisible(true);
            visibility = 1;
        } catch (Exception e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        radiologytypetext.requestFocus();
    }

    private void filterRadiologyTypes1() {
        System.out.println("filters");
        try {
            popupMenu = new JPopupMenu();
            // Clear the previous popup items
            popupMenu.removeAll();
            jlist = new JList();
            CommonController controller = new CommonController();

            List<String> tempList = controller.getListItems(radiologytypetext.getText().trim(), "", "RADIOLOGYTYPE");
//            Object[] dataArray = tempList.toArray();
//            JList jlist = new JList(dataArray);
//            JScrollPane scrollPane = new JScrollPane(jlist);

            // If there are matching items, populate the popup menu

            DefaultListModel listModelk = new DefaultListModel();
            for (String itemm : tempList) {
                listModelk.addElement(itemm);
            }

            if (!tempList.isEmpty()) {
                for (String type : tempList) {
                    item = new JMenuItem(type);
                    // Create a new menu item for each type

                    item.addActionListener(new ActionListener() {

                        @Override
                        public void actionPerformed(ActionEvent e) {
                            System.out.println("item selected");
                            JMenuItem clickedItem = (JMenuItem) e.getSource();
                            System.out.println("clickedddd item");
                            System.out.println(clickedItem);
                            if (clickedItem.getText().equals("Add new")) {
                                String newOption = JOptionPane.showInputDialog(
                                        null,
                                        "Please specify the radiolody type:",
                                        "Add Other Option",
                                        JOptionPane.PLAIN_MESSAGE //jComboBox1.addItem("Hello"); // Adds "Hello" to the combo box
                                        );
                                if (newOption != null && !newOption.trim().equals("")) {
                                    System.out.println("insert");
                                    try {
                                        CommonController controller = new CommonController();
                                        controller.insert(newOption);
                                        radiologytypetext.setText(newOption);
                                    } catch (Exception e1) {
                                        String ss = "Method: filterRadiologyTypes1    Exception : " + e1.getMessage();
                                        log.debug(ss);
                                    }

                                }
                            } else {
                                radiologytypetext.setText(clickedItem.getText()); // Set selected text
                            }
                            popupMenu.setVisible(false);// Hide popup after selection
                            radiologySubtypeText.setText("");
                            radiologySubtypeText.requestFocus();

                        }
                    });
                    popupMenu.add(item); // Add the item to the popup menu

                }
                System.out.println("Component count");
                System.out.println(popupMenu.getComponentCount());

                if (popupMenu.getComponentCount() > 0) {
                    popupMenu.setPreferredSize(new Dimension(radiologytypetext.getWidth(), popupMenu.getPreferredSize().height)); // Set width to 300
                    popupMenu.show(radiologytypetext, 0, radiologytypetext.getHeight()); // Display popup menu

                }

            } else {
                popupMenu.removeAll();
                popupMenu.setVisible(false);
            }

            // Refocus the text field after filtering
            // radiologytypetext.requestFocus();

        } catch (Exception e) {
            String ss = "Method: filterRadiologyTypes1    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }

    private void filterRadiologySubType() {
        System.out.println("filterstype");
        try {
            popupMenu = new JPopupMenu();
            // Clear the previous popup items
            popupMenu.removeAll();
            jlist = new JList();
            CommonController controller = new CommonController();
            List<String> tempList = controller.getRadiologySubtype(radiologytypetext.getText().trim(), radiologySubtypeText.getText().trim());
            DefaultListModel listModel = new DefaultListModel();
            for (String itemm : tempList) {
                listModel.addElement(itemm);
            }
            jlist.setModel(listModel);
//             jlist.addMouseListener(new MouseAdapter() {
//
//                @Override
//                public void mouseClicked(MouseEvent e) {
//                    JList clickedItem = (JList) e.getSource();
//                    //  if (jlist.getSelectedValue() != null) {
//                    String selectedItem = (String) clickedItem.getSelectedValue();
//                    if (selectedItem.equals("Add new")) {
//                        String newOption = JOptionPane.showInputDialog(
//                                null,
//                                "Please specify the radiology type:",
//                                "Add Other Option",
//                                JOptionPane.PLAIN_MESSAGE);
//                        if (newOption != null && !newOption.trim().equals("")) {
//                            System.out.println("insert");
//                            try {
//                                CommonController controllerr = new CommonController();
//                                a = controllerr.insert(newOption);
//                                if (a == 1) {
//                                    radiologytypetext.setText(newOption);
//                                } else {
//                                    JOptionPane.showMessageDialog(null, "Category already exists!", "Alert", JOptionPane.WARNING_MESSAGE);
//                                }
//                            } catch (Exception e1) {
//                                String ss = "Method: filter Exception : " + e1.getMessage();
//                                log.debug(ss);
//                            }
//                        }
//                    } else {
//                        radiologytypetext.setText(selectedItem);
//                    }
//                    popupMenu.setVisible(false);
//                    radiologySubtypeText.setText("");
//                    if (a == 1) {
//                        radiologySubtypeText.requestFocus();
//                    } else {
//                        radiologytypetext.requestFocus();
//                    }
//                    visibility = 0;
//                    // }
//                }
//            });
            jlist.addMouseListener(new MouseAdapter() {
//

                @Override
                public void mouseClicked(MouseEvent e) {
                    JList clickedItem = (JList) e.getSource();
                    String selectedItem = (String) clickedItem.getSelectedValue();
                    if (selectedItem.equals("Add new")) {
                        String newOption = JOptionPane.showInputDialog(
                                null,
                                "Please specify the radiolody type:",
                                "Add Other Option",
                                JOptionPane.PLAIN_MESSAGE //jComboBox1.addItem("Hello"); // Adds "Hello" to the combo box
                                );
                        if (newOption != null && !newOption.trim().equals("")) {
                            radiologySubtypeText.setText(newOption);
                        }
                    } else {
                        radiologySubtypeText.setText(selectedItem); // Set selected text
                    }
                    popupMenu.setVisible(false);// Hide popup after selection
                    int rowcount = jTable1.getModel().getRowCount();
                    int dataRowCount = 0;
                    for (int i = 0; i < rowcount; i++) {
                        if (jTable1.getModel().getValueAt(i, 6) != null) {
                            dataRowCount++;
                        } else {
                            break;
                        }
                    }
                    System.out.println("came");

                    if (dataRowCount >= jTable1.getModel().getRowCount()) {
                        System.out.println("addd");
                        addRow();
                    }
                    if (jTable1.getModel().getValueAt(dataRowCount, 1) != null) {
                        System.out.println(jTable1.getModel().getValueAt(dataRowCount, 1));
                        jTable1.getModel().setValueAt(radiologytypetext.getText(), dataRowCount, 6);
                        jTable1.getModel().setValueAt(radiologySubtypeText.getText(), dataRowCount, 7);
                        // jTable1.getModel().getValueAt(rowcount, rowcount);
                    } else {
                        jTable1.getModel().setValueAt(dataRowCount + 1, dataRowCount, 0);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 1), dataRowCount, 1);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 2), dataRowCount, 2);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 3), dataRowCount, 3);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 4), dataRowCount, 4);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 5), dataRowCount, 5);
                        jTable1.getModel().setValueAt(radiologytypetext.getText(), dataRowCount, 6);
                        jTable1.getModel().setValueAt(radiologySubtypeText.getText(), dataRowCount, 7);
                    }
                    subvisibility = 0;
                }
            });
            JScrollPane scrollPane = new JScrollPane(jlist);
            scrollPane.setPreferredSize(new java.awt.Dimension(radiologySubtypeText.getWidth(), 100));
            popupMenu.add(scrollPane);
            popupMenu.show(radiologySubtypeText, 0, radiologySubtypeText.getHeight());
            popupMenu.setVisible(true);
            subvisibility = 1;
//            if (!tempList.isEmpty()) {
//                for (String type : tempList) {
//                    // Create a new menu item
//                    item = new JMenuItem(type);
//                    item.addActionListener(new ActionListener() {
//
//                        @Override
//                        public void actionPerformed(ActionEvent e) {
//                            JMenuItem clickedItem = (JMenuItem) e.getSource();
//                            radiologySubtypeText.setText(clickedItem.getText()); // Set selected text
//                            popupMenu.setVisible(false);// Hide popup after selection
//                            int rowcount = jTable1.getModel().getRowCount();
//                            int dataRowCount = 0;
//                            for (int i = 0; i < rowcount; i++) {
//                                if (jTable1.getModel().getValueAt(i, 6) != null) {
//                                    dataRowCount++;
//                                } else {
//                                    break;
//                                }
//                            }
//                            if (dataRowCount >= jTable1.getModel().getRowCount()) {
//                                System.out.println("addd");
//                                addRow();
//                            }
//                            if (jTable1.getModel().getValueAt(dataRowCount, 1) != null) {
//                                System.out.println(jTable1.getModel().getValueAt(dataRowCount, 1));
//                                jTable1.getModel().setValueAt(radiologytypetext.getText(), dataRowCount, 6);
//                                jTable1.getModel().setValueAt(radiologySubtypeText.getText(), dataRowCount, 7);
//                                // jTable1.getModel().getValueAt(rowcount, rowcount);
//                            } else {
//                                jTable1.getModel().setValueAt(dataRowCount + 1, dataRowCount, 0);
//                                jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 1), dataRowCount, 1);
//                                jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 2), dataRowCount, 2);
//                                jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 3), dataRowCount, 3);
//                                jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 4), dataRowCount, 4);
//                                jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 5), dataRowCount, 5);
//                                jTable1.getModel().setValueAt(radiologytypetext.getText(), dataRowCount, 6);
//                                jTable1.getModel().setValueAt(radiologySubtypeText.getText(), dataRowCount, 7);
//                            }
//                        }
//                    });
//                    popupMenu.add(item); // Add the item to the popup menu
//                }
//                // Show the popup below the text field if there are items to show
//                if (popupMenu.getComponentCount() > 0) {
//                    popupMenu.show(radiologySubtypeText, 0, radiologySubtypeText.getHeight());
////                      popupMenu.setVisible(true);
//                }
//            }
            //else {
//                // If no items are found, hide the popup
//                popupMenu.removeAll();
//                popupMenu.setVisible(false);
//            }

            // Refocus the text field after filtering
            radiologySubtypeText.requestFocus();

        } catch (Exception e) {
            String ss = "Method: filterRadiologySubType    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }

//jComboBox1.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "X-Ray", "Ultrasound", "ECG", "Echo", "CT Scan", "MRI Scan" }));
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        popupMenu1 = new java.awt.PopupMenu();
        jPanel1 = new javax.swing.JPanel();
        radiologyType = new javax.swing.JLabel();
        radiologySubtype = new javax.swing.JLabel();
        radiologySubtypeText = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        radiologysubbtn = new javax.swing.JButton();
        radiologytypetext = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();

        popupMenu1.setLabel("popupMenu1");

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Radiology Details");
        setBackground(new java.awt.Color(255, 255, 255));

        jPanel1.setAutoscrolls(true);
        jPanel1.setPreferredSize(new java.awt.Dimension(1200, 500));
        jPanel1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                radiologyAddButton(evt);
            }
        });

        radiologyType.setText("Radiology");

        radiologySubtype.setText("Radiology Subtype");

        radiologySubtypeText.setPreferredSize(new java.awt.Dimension(200, 20));
        radiologySubtypeText.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                radsuskeyClicked(evt);
            }
        });
        radiologySubtypeText.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                radsubkeypress(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                radsubkeyrelease(evt);
            }
        });

        jButton1.setFont(new java.awt.Font("Tahoma", 0, 18));
        jButton1.setText("+");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        radiologysubbtn.setFont(new java.awt.Font("Tahoma", 0, 18));
        radiologysubbtn.setText("+");
        radiologysubbtn.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                radiosubbtnadd(evt);
            }
        });

        radiologytypetext.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                radiologytypetextActionPerformed(evt);
            }
        });
        radiologytypetext.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                radioTypekeypress(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                radiotypekeyrelease(evt);
            }
        });

        jScrollPane1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(66, 66, 236)));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null}
            },
            new String [] {
                "S.No", "Date", "Doctor name", "Patient name", "Age", "Gender", "Radiology", "Radiology subtype"
            }
        )
        {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }

        }

    );
    jScrollPane1.setViewportView(jTable1);

    jButton2.setText("Save");
    jButton2.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            jButton2ActionPerformed(evt);
        }
    });

    jButton3.setForeground(new java.awt.Color(51, 102, 255));
    jButton3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/NavigationDown.png"))); // NOI18N
    jButton3.setAlignmentX(0.5F);
    jButton3.setMaximumSize(new java.awt.Dimension(45, 30));
    jButton3.setPreferredSize(new java.awt.Dimension(40, 20));
    jButton3.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            radDown(evt);
        }
    });

    jButton4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/NavigationDown.png"))); // NOI18N
    jButton4.setMaximumSize(new java.awt.Dimension(45, 40));
    jButton4.setPreferredSize(new java.awt.Dimension(40, 40));
    jButton4.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            jButton4radDown(evt);
        }
    });

    org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
    jPanel1.setLayout(jPanel1Layout);
    jPanel1Layout.setHorizontalGroup(
        jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
        .add(jPanel1Layout.createSequentialGroup()
            .add(34, 34, 34)
            .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                .add(jPanel1Layout.createSequentialGroup()
                    .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 955, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .addContainerGap())
                .add(jPanel1Layout.createSequentialGroup()
                    .add(radiologyType)
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                    .add(radiologytypetext, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 254, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(2, 2, 2)
                    .add(jButton3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 40, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(2, 2, 2)
                    .add(jButton1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(18, 18, 18)
                    .add(radiologySubtype, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 113, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(18, 18, 18)
                    .add(radiologySubtypeText, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 280, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(2, 2, 2)
                    .add(jButton4, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 40, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                    .add(radiologysubbtn, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .add(91, 91, 91))))
        .add(jPanel1Layout.createSequentialGroup()
            .add(480, 480, 480)
            .add(jButton2)
            .addContainerGap(504, Short.MAX_VALUE))
    );
    jPanel1Layout.setVerticalGroup(
        jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
        .add(jPanel1Layout.createSequentialGroup()
            .add(36, 36, 36)
            .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                .add(radiologytypetext, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE)
                .add(radiologysubbtn, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE)
                .add(org.jdesktop.layout.GroupLayout.TRAILING, jButton4, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE)
                .add(radiologySubtypeText, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE)
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(radiologyType)
                    .add(radiologySubtype)
                    .add(jButton1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE))
                .add(jButton3, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 33, Short.MAX_VALUE))
            .add(34, 34, 34)
            .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 142, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
            .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
            .add(jButton2)
            .add(23, 23, 23))
    );

    org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
    getContentPane().setLayout(layout);
    layout.setHorizontalGroup(
        layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
        .add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 1032, Short.MAX_VALUE)
    );
    layout.setVerticalGroup(
        layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
        .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 302, Short.MAX_VALUE)
    );

    java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
    setBounds((screenSize.width-1048)/2, (screenSize.height-341)/2, 1048, 341);
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        try {
            a = 1;
            String newOption = JOptionPane.showInputDialog(
                    null,
                    "Please specify the radiolody type:",
                    "Add Other Option",
                    JOptionPane.PLAIN_MESSAGE //jComboBox1.addItem("Hello"); // Adds "Hello" to the combo box
                    );
            if (newOption != null && !newOption.trim().equals("")) {
                System.out.println("insert");

                CommonController controller = new CommonController();
                a = controller.insert(newOption);
                if (a == 0) {
                    JOptionPane.showMessageDialog(null, "Category already exists!", "Alert", JOptionPane.WARNING_MESSAGE);
                    radiologytypetext.requestFocus();
                } else {
                    radiologytypetext.setText(newOption);
                    radiologySubtypeText.setText("");
                    radiologySubtypeText.requestFocus();
                }
            }
        } catch (Exception e) {
            String ss = "Method: jButton1ActionPerformed    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }//GEN-LAST:event_jButton1ActionPerformed
    private void alert(String s) {
        JOptionPane.showMessageDialog(null, s, "Alert", JOptionPane.INFORMATION_MESSAGE);
    }
    private void radiologyAddButton(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radiologyAddButton
    }//GEN-LAST:event_radiologyAddButton

    private void radsubkeypress(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_radsubkeypress
        System.out.println("radsubkeypress");
    }//GEN-LAST:event_radsubkeypress

    private void radsubkeyrelease(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_radsubkeyrelease
        try {
            System.out.println(radiologySubtypeText.getText());
            System.out.println("enterss");
            if (radiologytypetext.getText().trim().equals("")) {
                JOptionPane.showMessageDialog(
                        this, // parent component
                        "Please enter a value in the Radiology field.", // message
                        "Input Required", // title
                        JOptionPane.WARNING_MESSAGE // message type
                        );
                radiologySubtypeText.setText("");
                radiologytypetext.requestFocus();
            } else {
                filterRadiologySubType();
            }
            System.out.println("radsubkeyrelease");
        } catch (Exception e) {
            String ss = "Method: radsubkeyrelease    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }//GEN-LAST:event_radsubkeyrelease

    private void radiosubbtnadd(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_radiosubbtnadd
        try {
            if (radiologytypetext.getText().equals("")) {
                JOptionPane.showMessageDialog(
                        this, // parent component
                        "Please enter a value in the Radiology field.", // message
                        "Input Required", // title
                        JOptionPane.WARNING_MESSAGE // message type
                        );
            } else {
                String newOption = JOptionPane.showInputDialog(
                        null,
                        "Please specify the radiolody type:",
                        "Add Other Option",
                        JOptionPane.PLAIN_MESSAGE //jComboBox1.addItem("Hello"); // Adds "Hello" to the combo box
                        );
                if (newOption != null && !newOption.trim().equals("")) {
                    radiologySubtypeText.setText(newOption);
                    int rowcount = jTable1.getModel().getRowCount();
                    int dataRowCount = 0;
                    for (int i = 0; i < rowcount; i++) {
                        System.out.println("checkkk");

                        System.out.println(jTable1.getModel().getValueAt(i, 2));
                        if (jTable1.getModel().getValueAt(i, 6) != null) {
                            dataRowCount++;
                        } else {
                            break;
                        }
                    }
                    if (dataRowCount >= jTable1.getModel().getRowCount()) {
                        System.out.println("addd");
                        addRow();
                    }
                    if (jTable1.getModel().getValueAt(dataRowCount, 1) != null) {
                        System.out.println(jTable1.getModel().getValueAt(dataRowCount, 1));
                        jTable1.getModel().setValueAt(radiologytypetext.getText(), dataRowCount, 6);
                        jTable1.getModel().setValueAt(radiologySubtypeText.getText(), dataRowCount, 7);
                        // jTable1.getModel().getValueAt(rowcount, rowcount);
                    } else {
                        jTable1.getModel().setValueAt(dataRowCount + 1, dataRowCount, 0);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 1), dataRowCount, 1);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 2), dataRowCount, 2);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 3), dataRowCount, 3);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 4), dataRowCount, 4);
                        jTable1.getModel().setValueAt(jTable1.getModel().getValueAt(dataRowCount - 1, 5), dataRowCount, 5);
                        jTable1.getModel().setValueAt(radiologytypetext.getText(), dataRowCount, 6);
                        jTable1.getModel().setValueAt(radiologySubtypeText.getText(), dataRowCount, 7);
                    }
                }
            }
        } catch (Exception e) {
            String ss = "Method: radiosubbtnadd    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }//GEN-LAST:event_radiosubbtnadd

    private void radiologytypetextActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_radiologytypetextActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_radiologytypetextActionPerformed

    private void radiotypekeyrelease(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_radiotypekeyrelease
        System.out.println("cameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        // filterRadiologyTypes1();
        filter1();
//        if (evt.getKeyCode() != KeyEvent.VK_DOWN) {
//            System.out.println("?");
//            radiologytypetext.requestFocus();
//
////            JComboBox jComboBox = new JComboBox();
////                    add(jComboBox);
//        } else {
//            radiologySubtypeText.requestFocus();
//        }
    }//GEN-LAST:event_radiotypekeyrelease

    private void radioTypekeypress(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_radioTypekeypress
// int keyCode = evt.getKeyCode();
//        radiologytypetext.addKeyListener(new KeyAdapter() {
//    private int selectedIndex = -1; // Track the selected item
//
//    @Override
//    public void keyPressed(KeyEvent e) {
//        if (popupMenu.isVisible() && !tempList.isEmpty()) {
//            int keyCode = e.getKeyCode();
//            if (keyCode == KeyEvent.VK_DOWN) {
//                selectedIndex = (selectedIndex + 1) % popupMenu.getComponentCount();
//                selectMenuItem(selectedIndex);
//            } else if (keyCode == KeyEvent.VK_UP) {
//                selectedIndex = (selectedIndex - 1 + popupMenu.getComponentCount()) % popupMenu.getComponentCount();
//                selectMenuItem(selectedIndex);
//            } else if (keyCode == KeyEvent.VK_ENTER && selectedIndex != -1) {
//                JMenuItem selectedItem = (JMenuItem) popupMenu.getComponent(selectedIndex);
//                selectedItem.doClick(); // Trigger the item click
//            }
//        }
//            }});
    }//GEN-LAST:event_radioTypekeypress
    private void selectMenuItem(int index) {
        for (int i = 0; i < popupMenu.getComponentCount(); i++) {
            JMenuItem item = (JMenuItem) popupMenu.getComponent(i);
            item.setArmed(i == index); // Highlight the current item
        }
    }
    private void radsuskeyClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_radsuskeyClicked
        try {
            System.out.println("radiology subcategory clicked");
            if (radiologytypetext.getText().equals("")) {

                // Show an alert dialog if the text field is empty
                JOptionPane.showMessageDialog(
                        this, // parent component
                        "Please enter a value in the Radiology field.", // message
                        "Input Required", // title
                        JOptionPane.WARNING_MESSAGE // message type
                        );

            }
            ;
        } catch (Exception e) {
            String ss = "Method: radsuskeyClicked    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }//GEN-LAST:event_radsuskeyClicked

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        // TODO add your handling code here:
        try {
            boolean retVal = false;
            if (clickValid() == 0) {
                int datarowcount = 0;

                for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
                    if (jTable1.getModel().getValueAt(i, 0) != null) {
                        datarowcount++;
                    } else {
                        break;
                    }
                }
                CommonController commonController = new CommonController();

                System.out.println(jTable1.getModel().getValueAt(0, 3).toString());
                String cuscode = commonController.getPatientCode(jTable1.getModel().getValueAt(0, 3).toString());


                int radiologyTypeNo;
                String mobile = commonController.getMobileNo(cuscode, "");
                System.out.println("Patient nameee");
                System.out.println(cuscode);

                System.out.println(jTable1.getModel().getValueAt(0, 4).toString());
                ArrayList radiology = new ArrayList();
                for (int i = 0; i < datarowcount; i++) {
                    RadiologyTypesModel r = new RadiologyTypesModel();
                    r.setAge(Integer.parseInt(jTable1.getModel().getValueAt(i, 4).toString()));
//                    r.setAmount(jTable1.getModel().getValueAt(i, 8).toString());
                    r.setDoctorName(jTable1.getModel().getValueAt(i, 2).toString());
                    r.setCustCode(cuscode);
                    //jTable1.getModel().getValueAt(0, 1).toString()
                    r.setDate(Date.valueOf(DateUtils.changeFormatDate(jTable1.getModel().getValueAt(i, 1).toString())));
                    r.setGender(jTable1.getModel().getValueAt(i, 5).toString());
                    r.setPatientName(jTable1.getModel().getValueAt(i, 3).toString());
                    r.setMobileNo(mobile);
                    r.setRadiologySubtype(jTable1.getModel().getValueAt(i, 7).toString());
                    r.setRadiologyType(jTable1.getModel().getValueAt(i, 6).toString());
                    radiologyTypeNo = commonController.getRadiologyId(jTable1.getModel().getValueAt(i, 6).toString());
                    r.setRadiologyTypeNo(radiologyTypeNo);
                    r.setStatus(0);
                    r.setPaidStatus("unpaid");
                    radiology.add(r);
                }
                System.out.println(radiology);
                RadiologyTypeController rController = new RadiologyTypeController();
                System.out.println("save");
                System.out.println("records");
//                for (int i = 0; i < radiology.size(); i++) {
//                    RadiologyTypesModel rr = (RadiologyTypesModel) radiology.get(i);
//
//                    retVal = rController.create(rr);
//                    System.out.println(retVal);
//                }
                retVal = rController.createRecords(radiology);
                System.out.println(retVal);
                if (retVal == true) {
                    JOptionPane.showMessageDialog(null, "Data saved successfully!", "Save Notification", JOptionPane.INFORMATION_MESSAGE);

                }
                System.out.println("save1");
            }
        } catch (Exception e) {
            String ss = "Method: jButton2ActionPerformed    Exception : " + e.getMessage();

            System.out.println(e.getMessage());
            log.debug(ss);
        }
    }//GEN-LAST:event_jButton2ActionPerformed

    private void radDown(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_radDown
//        if (popupMenu == null) {
//            System.out.println("menu nulll");
//            popupMenu = new JPopupMenu();
//        }
//        System.out.println("Visibility");
//        System.out.println(popupMenu.isVisible());
        if (visibility == 1) {
            popupMenu.setVisible(false);
            visibility = 0;
            System.out.println("made notVisible");
        } else {
            filter1();
            System.out.println("made Visible");
            visibility = 1;
        }

    }//GEN-LAST:event_radDown

    private void jButton4radDown(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4radDown
        // TODO add your handling code here:
        if (radiologytypetext.getText().equals("")) {
            JOptionPane.showMessageDialog(
                    this, // parent component
                    "Please enter a value in the Radiology field.", // message
                    "Input Required", // title
                    JOptionPane.WARNING_MESSAGE // message type
                    );
        } else {
            if (subvisibility == 1) {
                popupMenu.setVisible(false);
                subvisibility = 0;
                System.out.println("made notVisible");
            } else {
                filterRadiologySubType();
                System.out.println("made Visible");
                subvisibility = 1;
            }
        }
    }//GEN-LAST:event_jButton4radDown
    private int clickValid() {
        int retVal = 0;
        try {

            if (radiologytypetext.getText().trim().equals("")) {
                System.out.println("a");
                radiologytypetext.requestFocus();
                alert("Please enter radiolgy");
                retVal = 1;
            } else if (radiologySubtypeText.getText().trim().equals("")) {
                radiologySubtypeText.requestFocus();
                alert("Please enter radiolgy subtype");
                //JOptionPane.showMessageDialog(null, "This is an information alert!", "Alert", JOptionPane.INFORMATION_MESSAGE);
                retVal = 1;
            }
//            } else {
//                int row = jTable1.getRowCount();
//                for (int i = 0; i < row; i++) {
//
//                    if (jTable1.getModel().getValueAt(i, 0) != null && jTable1.getModel().getValueAt(i, 8) == null) {
//                        alert("Please enter amount");
//                        retVal = 1;
//                        break;
//                    } else if (jTable1.getModel().getValueAt(i, 0) == null) {
//                        break;
//                    }
//                }
//            }
//            if (retVal == 0) {
//                int row = jTable1.getRowCount();
//                System.out.println(row);
//                for (int i = 0; i < row; i++) {
//                    if (jTable1.getModel().getValueAt(i, 0) != null) {
//                        if (isValidAmount(jTable1.getModel().getValueAt(i, 8).toString()) == false) {
//                            System.out.println("coount");
//                            System.out.println(i);
//                            alert("Please enter valid amount in row " + ++i);
//                            retVal = 1;
//                            break;
//                        }
//                    } else {
//                        break;
//                    }
//
//                }
//            }


        } catch (Exception e) {
            String ss = "Method: clickValid()    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return retVal;
    }

    public static boolean isValidAmount(String input) {
        System.out.println(input);
        // Regular expression to match numbers with optional decimal point
        return input.matches("\\d*\\.?\\d+");
    }
    /**
     * @param args the command line arguments
     */
//    public static void main(String args[]) {
//        java.awt.EventQueue.invokeLater(new Runnable() {
//            public void run() {
//                Radiology dialog = new Radiology(new javax.swing.JTable(), true);
//               // javax.swing.JTable javax.swing.JFrame()
//                dialog.addWindowListener(new java.awt.event.WindowAdapter() {
//                    public void windowClosing(java.awt.event.WindowEvent e) {
//                        System.exit(0);
//                    }
//                });
//                dialog.setVisible(true);
//            }
//        });
//    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private java.awt.PopupMenu popupMenu1;
    private javax.swing.JLabel radiologySubtype;
    private javax.swing.JTextField radiologySubtypeText;
    private javax.swing.JLabel radiologyType;
    private javax.swing.JButton radiologysubbtn;
    private javax.swing.JTextField radiologytypetext;
    // End of variables declaration//GEN-END:variables
}
