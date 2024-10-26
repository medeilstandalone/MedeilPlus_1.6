/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.model.AppointmentModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author muralikrishnan
 */
public class ManageAppointmentTable {

    public JTable jtable;
    public JScrollPane scrollPane = new JScrollPane();
    public String acc_no;
    //public String appointNumber;
    //public String appointId;
    public Logger log = Logger.getLogger(ManageAppointmentTable.class, "Manage Appointment");
    public KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    public JComponent createViewTable() {
        int rows=7;
        Object[] colNames = {"Appointment No.", "Appointment Date", "Patient Name-Mobile No.", "Doctor Name", "Appointment From", "Appointment To","id","Status"};
        Class[] colType = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,java.lang.String.class,java.lang.Integer.class, java.lang.String.class};
        boolean[] colEditable  = {false, false, false, false, true, true,true,false};
        int[] columnWidth  = {125, 200, 200, 180, 150, 150,0, 150};
        final Class[] types = colType;
        final boolean[] canEditCols = colEditable;
        final int[] colWidth = columnWidth;
        jtable = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();

        int len = colNames.length;
        for (int i = 1; i <= rows; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
            }
            data.addElement(c);
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colNames[i]);
        }
        try {
            jtable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : ManageAppointmentTable  Method : createViewTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }        
        jtable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        jtable.getTableHeader().setBackground(new Color(226, 238, 244));
        jtable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        jtable.setShowGrid(true);
        jtable.getTableHeader().setReorderingAllowed(false);
        jtable.setSelectionMode(0);
        jtable.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            jtable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        jtable.setGridColor(new java.awt.Color(204, 204, 255));
        jtable.setCellSelectionEnabled(false);
        jtable.setRowSelectionAllowed(true);
        jtable.setRowHeight(20);
        jtable.setSelectionBackground(Color.LIGHT_GRAY);
        jtable.setSelectionForeground(Color.RED);
        jtable.removeColumn(jtable.getColumnModel().getColumn(6));
        jtable.revalidate();
//        jtable.addMouseListener(new MouseAdapter() {
//            @Override
//            public void mouseClicked(MouseEvent e) {
//                final int i = jtable.getSelectedRow();
//                if (jtable.getModel().getValueAt(i, 0) != null && jtable.getModel().getValueAt(i, 1) != null) {
//                    appointNumber = ""+jtable.getModel().getValueAt(i, 0);
//                    appointId = ""+jtable.getModel().getValueAt(i, 6);
//                }
//              }
//        });
        return jtable;
    }

     public JComponent getScrollTable(JComponent jt) {
        jtable = (JTable) jt;
        scrollPane.add(jtable);
        scrollPane.setViewportView(jtable);
        return scrollPane;
    }

     public void clearData(int rowCount) {
        DefaultTableModel model = (DefaultTableModel) jtable.getModel();
        model.getDataVector().removeAllElements();
        for(int i=0; i <rowCount;i++) {
            addRow();
        }
        jtable.revalidate();
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) jtable.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < jtable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(jtable.getRowCount(), datas);
    }
    
    public void loadAppointmentTable(AppointmentModel appointModel) {
        List<AppointmentModel> appointment = new ArrayList<AppointmentModel>();
        try {
            com.vanuston.medeil.implementation.Appointment appointmentController = (com.vanuston.medeil.implementation.Appointment) RegistryFactory.getClientStub (RegistryConstants.Appointment) ;
            AppointmentModel appointmentModel = new AppointmentModel();
            int i = 0;            
            appointment  = (List<AppointmentModel>) appointmentController.viewRecord(appointModel) ;
            if(appointment.size () > 7) {
                clearData(appointment.size());
            }
            else {
                clearData(7);
            }
//            if (appointment.size () > 7) {
//                DefaultTableModel model = (DefaultTableModel) jtable.getModel();
//                model.getDataVector().removeAllElements();
//                jtable.revalidate();
//                for (int j = 0; j < appointment.size (); j++) {
//                    addRow();
//                }
//            }
            while (i < appointment.size ()) {
                appointmentModel = appointment.get (i) ;
                jtable.getModel().setValueAt(appointmentModel.getAppointmentId(), i, 0);
                jtable.getModel().setValueAt(DateUtils.normalFormatDate(appointmentModel.getAppointmentDate()), i, 1);
                jtable.getModel().setValueAt(appointmentModel.getPatientName(), i, 2);
                jtable.getModel().setValueAt(appointmentModel.getDoctorName(), i, 3);
                jtable.getModel().setValueAt(appointmentModel.getAppointmentFromTime(), i, 4);
                jtable.getModel().setValueAt(appointmentModel.getAppointmentToTime(), i, 5);
                jtable.getModel().setValueAt(appointmentModel.getId(), i, 6);
                jtable.getModel().setValueAt(appointmentModel.getStatus(), i, 7);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
            String msg = "Class : AppointmentTable Method : LoadappointmentTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }
}
