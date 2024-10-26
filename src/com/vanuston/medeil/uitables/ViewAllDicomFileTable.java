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
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Vanitha
 */
public class ViewAllDicomFileTable extends JTable {

    Logger log = Logger.getLogger(ViewAllDicomFileTable.class, "ViewAllDicomFileTable");
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
    DicomImplementation dicomController;

    public ViewAllDicomFileTable() throws RemoteException, NotBoundException {
        dicomController = (DicomImplementation) RegistryFactory.getClientStub(RegistryConstants.DicomImplementation);
    }

    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) throws RemoteException, NotBoundException {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        radioTab = new JTable();
        scrollPane = new JScrollPane();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < initRow; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
            }
            data.addElement(c);
        }
        for (int n = 0; n < len; n++) {
            cols.addElement(colName[n]);
            System.out.println(colName[n]);
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
            String msg = "Class : ViewAllDicomFileTable  Method : createTable ()   = " + ex.getMessage();
            log.debug(msg);
        }


        radioTab.getColumnModel().getColumn(8).setMinWidth(0);
        radioTab.getColumnModel().getColumn(8).setMaxWidth(0);

        radioTab.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        radioTab.getTableHeader().setBackground(new Color(226, 238, 244));
        radioTab.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        radioTab.setRowSelectionAllowed(true);
        radioTab.setShowGrid(true);
        radioTab.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            radioTab.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        radioTab.setGridColor(new java.awt.Color(204, 204, 255));
        radioTab.setCellSelectionEnabled(false);
        radioTab.setColumnSelectionAllowed(false);
        radioTab.setRowSelectionAllowed(true);
//        radioTab.setRowSelectionInterval(0, 1);
//@kural
//        radioTab.removeColumn(radioTab.getColumnModel().getColumn(3));
// this line added for 26-11-2011 for disable copy option////////////////////////////////////////////////////

        AbstractAction disabled = new AbstractAction() {

            public boolean isEnabled() {
                return false;
            }

            public void actionPerformed(ActionEvent e) {
            }
        };



        radioTab.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
        radioTab.getActionMap().put("none", disabled);
/////////////////////////////////////////////////////////////////////



        radioTab.getInputMap().put(shrctF2, "shortcut");
        radioTab.getInputMap().put(shrctF3, "shortcut");
        radioTab.getInputMap().put(shrctF4, "shortcut");
        radioTab.getInputMap().put(shrctF5, "shortcut");
        radioTab.getInputMap().put(shrctF6, "shortcut");
        radioTab.getInputMap().put(shrctF7, "shortcut");
        radioTab.getInputMap().put(shrctF8, "shortcut");
        radioTab.getInputMap().put(shrctCtrlAr, "shortcut");

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
                viewRadioCalculations();
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                viewRadioCalculations();
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });
        return radioTab;
    }

    public void viewRadioCalculations() {
        final int i = radioTab.getSelectedRow();
        dicomId = (Integer) radioTab.getValueAt(i, 8);
        dicomSetId = dicomId;


    }

    public void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }

    public JComponent getScrollTable(JComponent jt) {
        radioTab = (JTable) jt;
        scrollPane.add(radioTab);
        scrollPane.setViewportView(radioTab);
        return scrollPane;
    }

    public void searchDicomInfoForView(String findName, int typeNum) {
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

                case 4:
                    dcmModel.setProcess("echo_files");
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
            String msg = "Class : ViewAllDicomFileTable  Method : searchDicomInfoForView ()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void loadViewRadioInformation(int typeNum) {

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

                case 4:
                    dcmModel.setProcess("echo_files");
                    break;

                case 6:
                    dcmModel.setProcess("mri_files");
                    break;

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

                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 8);

            }
            radioTab.clearSelection();
        } catch (Exception e) {
            String msg = "Class : ViewAllDicomFileTable  Method : loadViewRadioInformation ()   = " + e.getMessage();
            log.debug(msg);
            e.printStackTrace();
        }
    }

    public void loadPatientWithTypeList(int typeNum, String patientName, String docName) {

        try {
            clearData();
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(12);
            switch (typeNum) {
                case 1:
                    dcmModel.setProcess("xray_files");
                    dcmModel.setCustNameMobileNo(patientName);
                    dcmModel.setDoctorName(docName);
                    break;
                case 2:
                    dcmModel.setProcess("ultrasound_files");
                    dcmModel.setCustNameMobileNo(patientName);
                    dcmModel.setDoctorName(docName);
                    break;

                case 4:
                    dcmModel.setProcess("echo_files");
                    dcmModel.setCustNameMobileNo(patientName);
                    dcmModel.setDoctorName(docName);
                    break;

                case 6:
                    dcmModel.setProcess("mri_files");
                    dcmModel.setCustNameMobileNo(patientName);
                    dcmModel.setDoctorName(docName);
                    break;

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

                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 8);

            }
            radioTab.clearSelection();
        } catch (Exception e) {
            String msg = "Class : ViewAllDicomFileTable  Method : loadPatientWithTypeList ()   = " + e.getMessage();
            log.debug(msg);
            e.printStackTrace();
        }
    }

    public void loadInformationWithDoctorName(int typeNum, String drName) {

        try {
            clearData();
            DicomModel dcmModel = new DicomModel();
            dcmModel.setPassValue(11);
            switch (typeNum) {
                case 1:
                    dcmModel.setProcess("xray_files");
                    dcmModel.setDoctorName(drName);
                    break;
                case 2:
                    dcmModel.setProcess("ultrasound_files");
                    dcmModel.setDoctorName(drName);
                    break;

                case 4:
                    dcmModel.setProcess("echo_files");
                    dcmModel.setDoctorName(drName);
                    break;

                case 6:
                    dcmModel.setProcess("mri_files");
                    dcmModel.setDoctorName(drName);
                    break;

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

                radioTab.getModel().setValueAt(dcmModel.getDicomId(), i, 8);

            }
            radioTab.clearSelection();
        } catch (Exception e) {
            String msg = "Class : ViewAllDicomFileTable  Method : loadInformationWithDoctorName ()   = " + e.getMessage();
            log.debug(msg);
            e.printStackTrace();
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) radioTab.getModel();
        model.getDataVector().removeAllElements();
        radioTab.revalidate();
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
            String msg = "Class : ViewAllDicomFileTable  Method : addRow ()   = " + ex.getMessage();
            log.debug(msg);
        }
        model.insertRow(radioTab.getRowCount(), datas);
    }
}
