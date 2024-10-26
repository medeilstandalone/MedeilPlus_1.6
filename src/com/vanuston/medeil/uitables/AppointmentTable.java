package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.model.AppointmentModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.List;
import java.util.Vector;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JOptionPane;
import javax.swing.KeyStroke;

public class AppointmentTable {

    public JTable appointmentTable;
    public JScrollPane scrollPane = new JScrollPane();
    public String acc_no;
    public Logger log = Logger.getLogger(AppointmentTable.class, "Add Appointment");
    public KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    // Create Dynamic Table
    public JComponent createViewTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        appointmentTable = new JTable();
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
            appointmentTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : AppointmentTable  Method : createViewTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
        appointmentTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        appointmentTable.getTableHeader().setBackground(new Color(226, 238, 244));
        appointmentTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        appointmentTable.setShowGrid(true);
        appointmentTable.getTableHeader().setReorderingAllowed(false);
        appointmentTable.setSelectionMode(0);
        appointmentTable.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            appointmentTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        appointmentTable.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                final int i = appointmentTable.getSelectedRow();
                if (appointmentTable.getModel().getValueAt(i, 0) != null && appointmentTable.getModel().getValueAt(i, 1) != null ) {
                    acc_no = (String) appointmentTable.getModel().getValueAt(i, 1);
                }else{
                     acc_no="";
                }
            }
        });
        
        appointmentTable.getInputMap().put(save, "action");
        appointmentTable.getInputMap().put(edit, "action");
        appointmentTable.getInputMap().put(update, "action");
        appointmentTable.getInputMap().put(del, "action");
        appointmentTable.getInputMap().put(reset, "action");
        appointmentTable.getInputMap().put(can, "action");
        appointmentTable.getInputMap().put(back, "action");
        appointmentTable.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                appointmentTable.transferFocus();
            }
        });
        appointmentTable.setGridColor(new java.awt.Color(204, 204, 255));
        appointmentTable.setCellSelectionEnabled(false);
        appointmentTable.setRowSelectionAllowed(true);
        appointmentTable.setRowHeight(20);
        appointmentTable.setSelectionBackground(Color.LIGHT_GRAY);
        appointmentTable.setSelectionForeground(Color.RED);
        appointmentTable.revalidate();
        return appointmentTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        appointmentTable = (JTable) jt;
        scrollPane.add(appointmentTable);
        scrollPane.setViewportView(appointmentTable);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) appointmentTable.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < appointmentTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(appointmentTable.getRowCount(), datas);
    }

    public void removeRow() {
        int i = appointmentTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) appointmentTable.getModel();
            model.removeRow(i);
            appointmentTable.getModel().setValueAt(i, i - 1, 0);
            appointmentTable.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(null, "Please select row to remove...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) appointmentTable.getModel();
        model.getDataVector().removeAllElements();
        for(int i=0; i <10;i++) {
            addRow();
        }
        appointmentTable.revalidate();
    }

    public void focusSet(int row, int col) {
        appointmentTable.requestFocus();
        appointmentTable.changeSelection(row, col, false, false);
        appointmentTable.setCellSelectionEnabled(true);
    }

    public void focusSet() {
        appointmentTable.requestFocus();
        appointmentTable.changeSelection(0, 1, false, false);
        appointmentTable.getModel().setValueAt("1", 0, 0);
        appointmentTable.setCellSelectionEnabled(true);
    }

    public void loadAppointmentTable(AppointmentModel appointModel) {
        try {
            com.vanuston.medeil.implementation.Appointment appointmentController = (com.vanuston.medeil.implementation.Appointment) RegistryFactory.getClientStub (RegistryConstants.Appointment) ;
            AppointmentModel appointmentModel = new AppointmentModel();
            int i = 0;
            clearData();
            List<AppointmentModel> appointment  = (List<AppointmentModel>) appointmentController.viewRecord(appointModel) ;
            if (appointment.size () > 10) {
                DefaultTableModel model = (DefaultTableModel) appointmentTable.getModel();
                model.getDataVector().removeAllElements();
                appointmentTable.revalidate();
                for (int j = 0; j < appointment.size (); j++) {
                    addRow();
                }
            }
            while (i < appointment.size ()) {
                appointmentModel = appointment.get (i) ;
                appointmentTable.getModel().setValueAt(appointmentModel.getAppointmentId(), i, 0);
                appointmentTable.getModel().setValueAt(appointmentModel.getPatientName(), i, 1);
                appointmentTable.getModel().setValueAt(appointmentModel.getAppointmentFromTime(), i, 2);
                appointmentTable.getModel().setValueAt(appointmentModel.getAppointmentToTime(), i, 3);
                i++;                
            }
        } catch (Exception e) {
            e.printStackTrace();
            String msg = "Class : AppointmentTable Method : LoadappointmentTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }
}
