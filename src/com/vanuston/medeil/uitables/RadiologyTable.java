/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.DicomImplementation;
import com.vanuston.medeil.model.DicomModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.util.Vector;
import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;
import javax.swing.table.DefaultTableCellRenderer;

/**
 *
 * @author Vanitha
 */
public class RadiologyTable extends JTable {

    Logger log = Logger.getLogger(RadiologyTable.class, "RadiologyTable");
    public JTable radioTab;
    public JScrollPane scrollPane;
    public String thisForm = null;
    public static int dicomId;
    public static int dicomSetId = -1;
    public int initR = 0;
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
    final int[] colWidth = {60, 180, 60, 160, 45, 70, 100, 45, 45, 0};
    DicomImplementation dicomController;

    public RadiologyTable() throws RemoteException, NotBoundException {
        dicomController = (DicomImplementation) RegistryFactory.getClientStub(RegistryConstants.DicomImplementation);
    }

    public JComponent createTable() {
        Object[] colName = {"Patient Code", "Patient Name", "Patient Type", "Doctor Name", "Date", "Type", "Sub-Type", "Amount", "Process", "ID"};
        thisForm = "Radiology";
        initR = 10;
        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.sql.Date.class, java.lang.String.class, java.lang.String.class,
            java.lang.String.class, java.lang.String.class, java.lang.Integer.class};
        final boolean[] canEditCols = {false, false, false, false, false, false, false, false, false, true};
        int len = colName.length;
        try {
            radioTab = new JTable();
            scrollPane = new JScrollPane();

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
                radioTab.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            } catch (Exception ex) {
                String ss = "Method: Create Table    Exception : " + ex.getMessage();
                log.debug(ss);
            }

            radioTab.getColumnModel().getColumn(9).setMinWidth(0);
            radioTab.getColumnModel().getColumn(9).setMaxWidth(0);
            radioTab.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
            radioTab.getTableHeader().setBackground(new Color(226, 238, 244));
            radioTab.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
            radioTab.setShowGrid(true);
            radioTab.getTableHeader().setReorderingAllowed(false);
            for (int i = 0; i < len; i++) {
                radioTab.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);

            }

            radioTab.setGridColor(new java.awt.Color(204, 204, 255));
            radioTab.setCellSelectionEnabled(false);
            radioTab.setColumnSelectionAllowed(false);
            radioTab.setRowSelectionAllowed(true);
//            radioTab.setRowSelectionInterval(0, 1);
//            radioTab.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE); // for shorcutevent of javafx scene input

            AbstractAction disabled = new AbstractAction() {

                public boolean isEnabled() {
                    return false;
                }

                public void actionPerformed(ActionEvent e) {
                }
            };



            radioTab.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
            radioTab.getActionMap().put("none", disabled);


            radioTab.getInputMap().put(shrctF2, "shortcut");
            radioTab.getInputMap().put(shrctF3, "shortcut");
            radioTab.getInputMap().put(shrctF4, "shortcut");
            radioTab.getInputMap().put(shrctF5, "shortcut");
            radioTab.getInputMap().put(shrctF6, "shortcut");
            radioTab.getInputMap().put(shrctF7, "shortcut");
            radioTab.getInputMap().put(shrctF8, "shortcut");
            radioTab.getInputMap().put(shrctCtrlAr, "shortcut");
            radioTab.getInputMap().put(shrctF12, "removeRow");
            radioTab.getActionMap().put("actionF2", new AbstractAction() {

                @Override
                public void actionPerformed(ActionEvent e) {
                    radioTab.transferFocus();
                }
            });

            radioTab.setRowHeight(20);
            radioTab.setSelectionBackground(Color.LIGHT_GRAY);
            radioTab.setSelectionForeground(Color.RED);
            radioTab.revalidate();
            //- loaddDrugInformationValues();
            radioTab.addKeyListener(new KeyListener() {

                @Override
                public void keyReleased(KeyEvent e) {
                }

                @Override
                public void keyTyped(KeyEvent e) {
                }

                @Override
                public void keyPressed(KeyEvent e) {
                }
            });

            radioTab.addMouseListener(new MouseListener() {

                @Override
                public void mouseClicked(MouseEvent e) {
                    viewXrayCalculations();
                }

                @Override
                public void mousePressed(MouseEvent e) {
                }

                @Override
                public void mouseReleased(MouseEvent e) {
                    viewXrayCalculations();
                }

                @Override
                public void mouseEntered(MouseEvent e) {
                }

                @Override
                public void mouseExited(MouseEvent e) {
                }
            });


        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : createTable ()   = " + e.getMessage();
            log.debug(msg);

        }
        return radioTab;

    }

//    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) throws RemoteException, NotBoundException {
//        final Class[] types = type;
//        final boolean[] canEditCols = canEdit;
//        final int[] colWidth = width;
//        radioTab = new JTable();
//        scrollPane = new JScrollPane();
//        Vector cols = new Vector();
//        Vector data = new Vector();
//        int len = colName.length;
//        for (int i = 0; i < initRow; i++) {
//            Vector c = new Vector();
//            for (int j = 0; j < len; j++) {
//                c.addElement(null);
//            }
//            data.addElement(c);
//        }
//        for (int n = 0; n < len; n++) {
//            cols.addElement(colName[n]);
//            System.out.println(colName[n]);
//        }
//        try {
//            radioTab.setModel(new javax.swing.table.DefaultTableModel(data, cols) {
//
//                Class[] type = types;
//                boolean[] canEditCol = canEditCols;
//
//                @Override
//                public Class getColumnClass(int columnIndex) {
//                    return type[columnIndex];
//                }
//
//                @Override
//                public boolean isCellEditable(int rowIndex, int columnIndex) {
//                    return canEditCol[columnIndex];
//                }
//            });
//        } catch (Exception ex) {
//            String msg = "Class : RadiologyTable  Method : createTable ()   = " + ex.getMessage();
//            log.debug(msg);
//        }
//
//
//        radioTab.getColumnModel().getColumn(8).setMinWidth(0);
//        radioTab.getColumnModel().getColumn(8).setMaxWidth(0);
//
//        radioTab.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
//        radioTab.getTableHeader().setBackground(new Color(226, 238, 244));
//        radioTab.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
//        radioTab.setRowSelectionAllowed(true);
//        radioTab.setShowGrid(true);
//        radioTab.getTableHeader().setReorderingAllowed(false);
//        for (int i = 0; i < len; i++) {
//            radioTab.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
//        }
//        radioTab.setGridColor(new java.awt.Color(204, 204, 255));
//        radioTab.setCellSelectionEnabled(false);
//        radioTab.setColumnSelectionAllowed(false);
//        radioTab.setRowSelectionAllowed(true);
////        radioTab.setRowSelectionInterval(0, 1);
////@kural
////        radioTab.removeColumn(radioTab.getColumnModel().getColumn(3));
//// this line added for 26-11-2011 for disable copy option////////////////////////////////////////////////////
//
//        AbstractAction disabled = new AbstractAction() {
//
//            public boolean isEnabled() {
//                return false;
//            }
//
//            public void actionPerformed(ActionEvent e) {
//            }
//        };
//
//
//
//        radioTab.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
//        radioTab.getActionMap().put("none", disabled);
///////////////////////////////////////////////////////////////////////
//
//
//
//        radioTab.getInputMap().put(shrctF2, "shortcut");
//        radioTab.getInputMap().put(shrctF3, "shortcut");
//        radioTab.getInputMap().put(shrctF4, "shortcut");
//        radioTab.getInputMap().put(shrctF5, "shortcut");
//        radioTab.getInputMap().put(shrctF6, "shortcut");
//        radioTab.getInputMap().put(shrctF7, "shortcut");
//        radioTab.getInputMap().put(shrctF8, "shortcut");
//        radioTab.getInputMap().put(shrctCtrlAr, "shortcut");
//
//        radioTab.getActionMap().put("actionF2", new AbstractAction() {
//
//            @Override
//            public void actionPerformed(ActionEvent e) {
//                radioTab.transferFocus();
//            }
//        });
//        radioTab.setRowHeight(20);
//        radioTab.setSelectionBackground(Color.LIGHT_GRAY);
//        radioTab.setSelectionForeground(Color.RED);
//        radioTab.revalidate();
//        //- loaddDrugInformationValues();
//        radioTab.addKeyListener(new KeyListener() {
//
//            @Override
//            public void keyReleased(KeyEvent e) {
//            }
//
//            @Override
//            public void keyTyped(KeyEvent e) {
//            }
//
//            @Override
//            public void keyPressed(KeyEvent e) {
//            }
//        });
//
//        radioTab.addMouseListener(new MouseListener() {
//
//            @Override
//            public void mouseClicked(MouseEvent e) {
//                viewRadioCalculations();
//            }
//
//            @Override
//            public void mousePressed(MouseEvent e) {
//            }
//
//            @Override
//            public void mouseReleased(MouseEvent e) {
//                viewRadioCalculations();
//            }
//
//            @Override
//            public void mouseEntered(MouseEvent e) {
//            }
//
//            @Override
//            public void mouseExited(MouseEvent e) {
//            }
//        });
//        return radioTab;
//    }

    

    public void viewXrayCalculations() {
        final int i = radioTab.getSelectedRow();
        dicomId = (Integer) radioTab.getValueAt(i, 9);
        dicomSetId = dicomId;


    }

    public JComponent getScrollTable(JComponent jt) {
        radioTab = (JTable) jt;
        scrollPane.add(radioTab);
        scrollPane.setViewportView(radioTab);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) radioTab.getModel();
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);
        for (int i = 0; i < radioTab.getColumnCount(); i++) {
            radioTab.getColumnModel().getColumn(i).setCellRenderer(centerRenderer);
        }
        int row = radioTab.getRowCount();
        Vector datas = new Vector();
        try {
            for (int i = 0; i < radioTab.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else {
                    datas.addElement(null);
                }
            }
        } catch (Exception ex) {
            String ss = "Class : RAdiologyTable Method: addRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        model.insertRow(radioTab.getRowCount(), datas);
    }

    public void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) radioTab.getModel();
        model.getDataVector().removeAllElements();
        radioTab.revalidate();
    }

    public void removeRow() {
        int i = radioTab.getSelectedRow();
        int j = radioTab.getSelectedColumn();
        int rows = radioTab.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) radioTab.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
//                    resetValues();
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    radioTab.changeSelection(0, 0, false, false);
                    radioTab.changeSelection(0, j, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = radioTab.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (radioTab.getModel().getValueAt(n, 0) == null) {
                            radioTab.getModel().setValueAt(1, 0, 0);
                        } else {
                            radioTab.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    radioTab.changeSelection(0, 0, false, false);
                    radioTab.changeSelection(i, j, false, false);
                } else {
                    radioTab.changeSelection(0, 0, false, false);
                    radioTab.changeSelection(i - 1, j, false, false);
                }
            }

        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public void searchDicomInfoForView(String findName, int typeNum) {
        clearData();
        dicomSetId = -1;
        try {
            System.out.println(findName);
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(typeNum);

            ArrayList<DicomModel> dicomList = dicomController.viewRecords(dcmModel, findName);
            System.out.println(dicomList);
            for (int i = 0; i < dicomList.size(); i++) {
                dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);
                String patientType = dcmModel.getPatientType();
                if (patientType.equals("INPD") || patientType.equals("IN")) {
                    patientType = "IN";
                } else {
                    patientType = "OUT";
                }
                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 1);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 2);
                radioTab.getModel().setValueAt(patientType, i, 3);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);

                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 8);

            }
            radioTab.clearSelection();

        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : searchDicomInfoForView ()   = " + e.getMessage();
            log.debug(msg);

        }
    }

    public void searchDicomInfo(String findName, int typeNum) {
        clearData();
        dicomSetId = -1;
        try {
            System.out.println(findName);
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(13);
            switch (typeNum) {
                case 1:
                    dcmModel.setType("X - Ray");
                    break;
                case 2:
                    dcmModel.setType("Ultrasound");
                    break;
                case 4:
                    dcmModel.setType("Echo");
                    break;
                case 6:
                    dcmModel.setType("MRI Scan");
                    break;

            }
            ArrayList<DicomModel> dicomList = dicomController.viewRecords(dcmModel, findName);
            System.out.println(dicomList);
            for (int i = 0; i < dicomList.size(); i++) {
                dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);
                String patientType = dcmModel.getPatientType();
                if (patientType.equals("INPD") || patientType.equals("IN")) {
                    patientType = "IN";
                } else {
                    patientType = "OUT";
                }
                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 1);
                radioTab.getModel().setValueAt(patientType, i, 2);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 3);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);
                radioTab.getModel().setValueAt(dcmModel.getProcess(), i, 8);
                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 9);

            }
            radioTab.clearSelection();

        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : searchDicomInfo ()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void searchDicomInfoForEdit(String findName, int typeNum) {
        clearData();
        dicomSetId = -1;
        try {
            System.out.println(findName);
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(1);
            switch (typeNum) {
                case 1:
                    dcmModel.setProcess("xray_files");
                    break;
                case 2:
                    dcmModel.setProcess("ultrasound_files");
                    break;
                case 3:
                    dcmModel.setProcess("ECG");
                    break;
                case 4:
                    dcmModel.setProcess("Echo");
                    break;
                case 5:
                    dcmModel.setProcess("ct_files");
                    break;
                case 6:
                    dcmModel.setProcess("mri_files");
                    break;

            }
            ArrayList<DicomModel> dicomList = dicomController.viewRecords(dcmModel, findName);
            System.out.println(dicomList);
            for (int i = 0; i < dicomList.size(); i++) {
                dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);
                String patientType = dcmModel.getPatientType();
                if (patientType.equals("INPD") || patientType.equals("IN")) {
                    patientType = "IN";
                } else {
                    patientType = "OUT";
                }
                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 1);
                radioTab.getModel().setValueAt(patientType, i, 2);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 3);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);
                radioTab.getModel().setValueAt(dcmModel.getProcess(), i, 8);
                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 9);

            }
            radioTab.clearSelection();

        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : searchDicomInfoForEdit ()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void LoadDicomInfo(String findName, int num) {
        clearData();
        dicomSetId = -1;
        try {
            System.out.println(findName);
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(3);
            ArrayList<DicomModel> dicomList = dicomController.viewRecords(dcmModel, findName);
            System.out.println(dicomList);
            for (int i = 0; i < dicomList.size(); i++) {
                dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);
                String patientType = dcmModel.getPatientType();
                if (patientType.equals("INPD") || patientType.equals("IN")) {
                    patientType = "IN";
                } else {
                    patientType = "OUT";
                }
                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 1);
                radioTab.getModel().setValueAt(patientType, i, 2);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 3);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);
                radioTab.getModel().setValueAt(dcmModel.getProcess(), i, 8);
                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 9);

            }
            radioTab.clearSelection();

        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : LoadDicomInfo ()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void loadRadioInformatio(int typeNum) {

        try {
            clearData();
            DicomModel dicomModel = new DicomModel();
            dicomModel.setPassValue(1);


            switch (typeNum) {
                case 1:
                    dicomModel.setType("X - Ray");
                    break;
                case 2:
                    dicomModel.setType("Ultrasound");
                    break;
                case 3:
                    dicomModel.setType("ECG");
                    break;
                case 4:
                    dicomModel.setType("Echo");
                    break;
                case 5:
                    dicomModel.setType("CT Scan");
                    break;
                case 6:
                    dicomModel.setType("MRI Scan");
                    break;

            }
            ArrayList<DicomModel> dicomList = dicomController.viewAllRecord(dicomModel);



            for (int i = 0; i < dicomList.size(); i++) {
                DicomModel dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);
                String patientType = dcmModel.getPatientType();
                String type = "";
                if (patientType.equals("INPD") || patientType.equals("IN")) {
                    type = "IN";
                } else {
                    type = "OUT";
                }


                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 1);
                radioTab.getModel().setValueAt(type, i, 2);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 3);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);
                radioTab.getModel().setValueAt(dcmModel.getProcess(), i, 8);
                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 9);


            }
            radioTab.clearSelection();
        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : loadRadioInformatio ()   = " + e.getMessage();
            log.debug(msg);
            e.printStackTrace();
        }


    }

    public void loadViewRadioInformation(int num) {

        try {
            clearData();
            DicomModel dcmModel = new DicomModel();
            if (num == 1) {
                dcmModel.setPassValue(10);
            }
            ArrayList<DicomModel> dicomList = dicomController.viewAllRecord(dcmModel);
//            System.out.println(dicomList);
            for (int i = 0; i < dicomList.size(); i++) {
                dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);

                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 1);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 2);
                radioTab.getModel().setValueAt(dcmModel.getPatientType(), i, 3);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);
                radioTab.getModel().setValueAt(dcmModel.getProcess(), i, 8);
                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 9);

            }
            radioTab.clearSelection();
        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : loadViewRadioInformation ()   = " + e.getMessage();
            log.debug(msg);
            e.printStackTrace();
        }
    }

    public void loadAllFile(int typeNum) {
        dicomSetId = -1;
        try {
            clearData();
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(10);
            switch (typeNum) {
                case 1:
                    dcmModel.setProcess("xray_files");
                    break;
                case 2:
                    dcmModel.setProcess("ultrasound_files");
                    break;
                case 3:
                    dcmModel.setProcess("ecg_files");
                    break;
                case 4:
                    dcmModel.setProcess("Echo");
                    break;
                case 5:
                    dcmModel.setProcess("ct_files");
                    break;
                case 6:
                    dcmModel.setProcess("mri_files");
                    break;

            }
            ArrayList<DicomModel> dicomList = dicomController.viewAllRecord(dcmModel);
            for (int i = 0; i < dicomList.size(); i++) {
                dcmModel = new DicomModel();
                dcmModel = dicomList.get(i);

                String patientType = dcmModel.getPatientType();
                String type = "";
                if (patientType.equals("INPD") || patientType.equals("IN")) {
                    type = "IN";
                } else {
                    type = "OUT";
                }
                addRow();
                radioTab.getModel().setValueAt(dcmModel.getPatientCode(), i, 0);
                radioTab.getModel().setValueAt(dcmModel.getCustNameMobileNo(), i, 1);
                radioTab.getModel().setValueAt(type, i, 2);
                radioTab.getModel().setValueAt(dcmModel.getDoctorName(), i, 3);
                radioTab.getModel().setValueAt(dcmModel.getDicomDate(), i, 4);
                radioTab.getModel().setValueAt(dcmModel.getType(), i, 5);
                radioTab.getModel().setValueAt(dcmModel.getDicomSubType(), i, 6);
                radioTab.getModel().setValueAt(dcmModel.getPayment(), i, 7);
                radioTab.getModel().setValueAt(dcmModel.getProcess(), i, 8);
                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 9);

            }
            radioTab.clearSelection();
        } catch (Exception e) {
            String msg = "Class : RadiologyTable  Method : loadAllFile ()   = " + e.getMessage();
            log.debug(msg);
            e.printStackTrace();
        }
    }
}
