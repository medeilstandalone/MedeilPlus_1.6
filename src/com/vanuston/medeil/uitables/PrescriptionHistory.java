
package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Prescription;
import com.vanuston.medeil.model.PrescriptionModel;
import com.vanuston.medeil.util.DatePicker;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
/**
 *
 * @author muralikrishnan
 */
public class PrescriptionHistory extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(PrescriptionHistory.class, "com.vanuston.medeil.uitables.PrescriptionHistory");
    public JTable jcomp;
    public String doctorName;
    public String patientName;
    public String age;
    public String gender;
    public String weight;
    public String temperature;
    public String bloodSugar;
    public String bloodPressure;
    public String diagnosis;
    public String remarks;
    public String consultationFee;
    public String nextVisit;
    public String prescriptionId;
    public int tableValues=0;
    public String searchType="id";
    public JTable panel;
    public String importType;
    public String pid;
    /** Creates new form PrescriptionDetails */
    public PrescriptionHistory(JTable jTable,String importType) {
        this.importType = importType;
        initComponents();        
        setModal(true);
        jTable1.setRowSelectionAllowed(true);
        panel = jTable1;        
        jcomp=jTable;
        isLoaded = false;
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Prescription History");
        setResizable(false);

        jPanel1.setPreferredSize(new java.awt.Dimension(1200, 500));

        jLabel1.setText("Patient Name");

        jTextField1.setEditable(false);
        jTextField1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTextField1MouseClicked(evt);
            }
        });
        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField1KeyPressed(evt);
            }
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }
        });

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Prescription Number", "Prescription Date", "Doctor Name", "Diagnosis", "Medicine Name", "Morning", "Afternoon", "Evening", "Night", "Food", "Days", "Instruction", "Remarks"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.setColumnSelectionAllowed(true);
        jTable1.setMaximumSize(new java.awt.Dimension(2147483647, 44));
        jTable1.setRowHeight(22);
        jTable1.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);
        jTable1.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jPanel1Layout.createSequentialGroup()
                        .add(161, 161, 161)
                        .add(jLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 151, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 233, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(jScrollPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 1002, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(22, 22, 22)
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                    .add(jLabel1)
                    .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 203, Short.MAX_VALUE)
                .add(16, 16, 16))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 1012, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 267, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(24, Short.MAX_VALUE))
        );

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width-1048)/2, (screenSize.height-341)/2, 1048, 341);
    }// </editor-fold>//GEN-END:initComponents


    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
        if (evt.getKeyCode() == KeyEvent.VK_DOWN || evt.getKeyCode() == KeyEvent.VK_ENTER || evt.getKeyCode() == KeyEvent.VK_TAB) {
            int r = jTable1.getRowCount();
            if (r > 0) {
                jTable1.requestFocus();
            }
            } else if (evt.getKeyCode() == KeyEvent.VK_ESCAPE) {
            this.dispose();
         }
        loadValues(jTextField1.getText());
    }//GEN-LAST:event_jTextField1KeyReleased
     public void loadfirstValues (String searchValue) {
         System.out.println("patienthistory3");
         Prescription prescriptionController;
         jTextField1.setText(searchValue);
        try {
            prescriptionController = (Prescription) RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat);
         List<PrescriptionModel> prescItems = new ArrayList<PrescriptionModel>();
                prescItems=(List<PrescriptionModel>) prescriptionController.viewfirstAllRecord(searchValue);
                 PrescriptionModel prescModel;
                DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
                jTable1.revalidate();
                for (int j = 0; j < prescItems.size(); j++) {
                    addRow();
                }
                 System.out.println("patienthistory14");
                for(int i=0;i<prescItems.size();i++) {
                    System.out.println("patienthistory15");
                prescModel = prescItems.get(i);
                System.out.println("patienthistory16");
                System.out.println(prescModel.getPrescriptionId());
                System.out.println("patienthistory17");
                jTable1.getModel().setValueAt(prescModel.getPrescriptionId(), i,0 );
                jTable1.getModel().setValueAt(DateUtils.normalFormatDate(prescModel.getDate()), i, 1);
                jTable1.getModel().setValueAt(prescModel.getDoctorName(), i, 2);
                //jTable1.getModel().setValueAt(prescModel.getPatientName(), i, 3 );
                jTable1.getModel().setValueAt(prescModel.getDiagnosis(), i, 3 );
                jTable1.getModel().setValueAt(prescModel.getMedicineName(), i, 4 );
                jTable1.getModel().setValueAt(prescModel.getMorning(), i, 5 );
                jTable1.getModel().setValueAt(prescModel.getAfternoon(), i, 6 );
                jTable1.getModel().setValueAt(prescModel.getEvening(), i, 7 );
                jTable1.getModel().setValueAt(prescModel.getNight(), i, 8 );
                jTable1.getModel().setValueAt(prescModel.getFood(), i, 9 );
                jTable1.getModel().setValueAt(prescModel.getDays(), i, 10 );
                jTable1.getModel().setValueAt(prescModel.getDose(), i, 11 );
                jTable1.getModel().setValueAt(prescModel.getRemarks(), i, 12 );
                System.out.println("patienthistory18");
                }

              jTable1.clearSelection();
        } catch (RemoteException ex) {
            java.util.logging.Logger.getLogger(PrescriptionDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NotBoundException ex) {
            java.util.logging.Logger.getLogger(PrescriptionDetails.class.getName()).log(Level.SEVERE, null, ex);
        }

     }





    public void loadValues (String searchValue) {
         try {
             
        
                Prescription prescriptionController = (Prescription) RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat);
                List<PrescriptionModel> prescItems = new ArrayList<PrescriptionModel>();
                prescItems=(List<PrescriptionModel>) prescriptionController.viewAllRecord(searchValue,searchType);
                PrescriptionModel prescModel;
                DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
               model.getDataVector().removeAllElements();
                jTable1.revalidate();
                for (int j = 0; j < prescItems.size(); j++) {
                    addRow();
                }                
                for(int i=0;i<prescItems.size();i++) {
                prescModel = prescItems.get(i);
                jTable1.getModel().setValueAt(prescModel.getPrescriptionId(), i,0 );
                jTable1.getModel().setValueAt(DateUtils.normalFormatDate(prescModel.getDate()), i, 1);
                jTable1.getModel().setValueAt(prescModel.getDoctorName(), i, 2);
                jTable1.getModel().setValueAt(prescModel.getPatientName(), i, 3 );
                }



        } catch (Exception ex) {
            String ss = "Method: loadValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }
    
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        int row=jTable1.getSelectedRow();
        if(jTable1.getValueAt(row,1)!=null) {
           // jComboBox1ItemStateChanged1(evt,"v");
          //  loadValues("ve");
            setValues();
        }
    }//GEN-LAST:event_jTable1MouseClicked

    public Boolean isLoaded = false;
    public void setValues() {

        int row=jTable1.getSelectedRow();
        if (jcomp.getCellEditor() != null) {
        jcomp.getCellEditor().stopCellEditing();
        }
        try {
        Prescription prescriptionController = (Prescription) RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat);
        List<PrescriptionModel> prescItems = new ArrayList<PrescriptionModel>();
        PrescriptionModel model = (PrescriptionModel) prescriptionController.viewRecord(jTable1.getModel().getValueAt(row, 0));
        prescItems=model.getPrescriptionListItems();
        doctorName = model.getDoctorName();
        patientName = model.getPatientName();
        age = ""+model.getAge();
        if(age.equals("0")) {
            age="";
        }
        gender = ""+model.getGender();
        weight = model.getWeight();
        temperature=model.getTemperature();
        bloodSugar=model.getBloodSugar();
        bloodPressure=model.getBloodPressure();
        diagnosis=model.getDiagnosis();
        remarks=model.getRemarks();
        consultationFee=""+model.getConsultationFee();
        nextVisit=model.getNextVisit();
        prescriptionId = ""+model.getPrescriptionId();
        PrescriptionModel prescModel;
        tableValues = 1;        
        if(importType.equals("Prescribtion")){
            if(prescItems.size() > jcomp.getRowCount()) {
            for(int i=jcomp.getRowCount(); i<prescItems.size();i++) {
                    DefaultTableModel tableModel = (DefaultTableModel) jcomp.getModel();
                    Vector datas = new Vector();
                    for (int j = 0; j < jcomp.getModel().getColumnCount(); j++) {
                        datas.addElement(null);
                    }
                    tableModel.insertRow(jcomp.getRowCount(), datas);
            }
        }
        for(int i=0;i<prescItems.size();i++) {
                prescModel = prescItems.get(i);
                jcomp.getModel().setValueAt(i+1, i, 0);
                jcomp.getModel().setValueAt(prescModel.getMedicineName(), i, 1);
                jcomp.getModel().setValueAt(prescModel.getMorning(), i, 2);
                jcomp.getModel().setValueAt(prescModel.getAfternoon(), i, 3);
                jcomp.getModel().setValueAt(prescModel.getEvening(), i, 4);
                jcomp.getModel().setValueAt(prescModel.getNight(), i, 5);
                jcomp.getModel().setValueAt(prescModel.getFood(), i, 6);
                jcomp.getModel().setValueAt(prescModel.getDose(), i, 7);
                jcomp.getModel().setValueAt(prescModel.getTotalMedications(), i, 8);
                jcomp.getModel().setValueAt(prescModel.getDays(), i, 9);
                this.dispose();
                jcomp.requestFocus();
                jcomp.changeSelection(i, 8, false, false);
                jcomp.setEditingColumn(4);
         }
        isLoaded = true;;
        tableValues = 0;
        } /*else if(importType == "SalesInvoice"){
            if(prescItems.size() > jcomp.getRowCount()) {
                for(int i=jcomp.getRowCount(); i<prescItems.size();i++) {
                        DefaultTableModel tableModel = (DefaultTableModel) jcomp.getModel();
                        Vector datas = new Vector();
                        for (int j = 0; j < jcomp.getModel().getColumnCount(); j++) {
                            datas.addElement(null);
                        }
                        tableModel.insertRow(jcomp.getRowCount(), datas);
                }
            }
            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
            SalesModel sModel ;
            for(int i=0;i<prescItems.size();i++) {
                prescModel = prescItems.get(i);
                String dName = prescModel.getMedicineName();
                dName.substring(0, dName.indexOf("_"));
                sModel= salesController.getStockItem(prescModel.getMedicineName(), prescModel.getTotalMedications());
                if(sModel != null){
                    jcomp.getModel().setValueAt(i+1, i, 0);
                    jcomp.getModel().setValueAt(sModel.getItemCode(), i, 1);
                    jcomp.getModel().setValueAt(sModel.getItemName(), i, 2);
                    jcomp.getModel().setValueAt(sModel.getFormulation(), i, 3);
                    jcomp.getModel().setValueAt(sModel.getQuantity(), i, 4);
                    jcomp.getModel().setValueAt(sModel.getBatchNumber(), i, 5);                    
                    jcomp.getModel().setValueAt(sModel.getExpiryDate(), i, 6);
                    jcomp.getModel().setValueAt(sModel.getUnitPrice(), i, 7);
                    jcomp.getModel().setValueAt(sModel.getMrp(), i, 8);
                    jcomp.getModel().setValueAt(sModel.getUnitDiscount(), i, 9);
                    jcomp.getModel().setValueAt(sModel.getUnitVAT(), i, 11);
                    jcomp.getModel().setValueAt(0, i, 13);
                    this.dispose();
                    jcomp.requestFocus();
                    jcomp.changeSelection(i, 4, false, false);
                }
            }
            isLoaded = true;;
            tableValues = 0;
        }*/
        }
        catch(Exception e) {
            String ss = "Method: setValues    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }

    public Boolean isLoaded1 = false;
    public void setValues1() {

        int row=jTable1.getSelectedRow();
        if (jcomp.getCellEditor() != null) {
        jcomp.getCellEditor().stopCellEditing();
        }
        try {
        Prescription prescriptionController = (Prescription) RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat);
        List<PrescriptionModel> prescItems = new ArrayList<PrescriptionModel>();
        PrescriptionModel model = (PrescriptionModel) prescriptionController.viewRecord(jTable1.getModel().getValueAt(row, 0));
        prescItems=model.getPrescriptionListItems();
        doctorName = model.getDoctorName();
        patientName = model.getPatientName();

        temperature=model.getTemperature();
        bloodSugar=model.getBloodSugar();
        bloodPressure=model.getBloodPressure();
        diagnosis=model.getDiagnosis();
        remarks=model.getRemarks();
        consultationFee=""+model.getConsultationFee();
        
        prescriptionId = ""+model.getPrescriptionId();
        PrescriptionModel prescModel;
        tableValues = 1;
        if(importType.equals("Prescribtion")){
            if(prescItems.size() > jcomp.getRowCount()) {
            for(int i=jcomp.getRowCount(); i<prescItems.size();i++) {
                    DefaultTableModel tableModel = (DefaultTableModel) jcomp.getModel();
                    Vector datas = new Vector();
                    for (int j = 0; j < jcomp.getModel().getColumnCount(); j++) {
                        datas.addElement(null);
                    }
                    tableModel.insertRow(jcomp.getRowCount(), datas);
            }
        }
        for(int i=0;i<prescItems.size();i++) {
                prescModel = prescItems.get(i);
                jcomp.getModel().setValueAt(i+1, i, 0);
                jcomp.getModel().setValueAt(prescModel.getMedicineName(), i, 1);
                jcomp.getModel().setValueAt(prescModel.getMorning(), i, 2);
                jcomp.getModel().setValueAt(prescModel.getAfternoon(), i, 3);
                jcomp.getModel().setValueAt(prescModel.getEvening(), i, 4);
                jcomp.getModel().setValueAt(prescModel.getNight(), i, 5);
                jcomp.getModel().setValueAt(prescModel.getFood(), i, 6);
                jcomp.getModel().setValueAt(prescModel.getDose(), i, 7);
                jcomp.getModel().setValueAt(prescModel.getTotalMedications(), i, 8);
                jcomp.getModel().setValueAt(prescModel.getDays(), i, 9);
                this.dispose();
                jcomp.requestFocus();
                jcomp.changeSelection(i, 8, false, false);
                jcomp.setEditingColumn(4);
         }
        isLoaded = true;;
        tableValues = 0;
        } /*else if(importType == "SalesInvoice"){
            if(prescItems.size() > jcomp.getRowCount()) {
                for(int i=jcomp.getRowCount(); i<prescItems.size();i++) {
                        DefaultTableModel tableModel = (DefaultTableModel) jcomp.getModel();
                        Vector datas = new Vector();
                        for (int j = 0; j < jcomp.getModel().getColumnCount(); j++) {
                            datas.addElement(null);
                        }
                        tableModel.insertRow(jcomp.getRowCount(), datas);
                }
            }
            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
            SalesModel sModel ;
            for(int i=0;i<prescItems.size();i++) {
                prescModel = prescItems.get(i);
                String dName = prescModel.getMedicineName();
                dName.substring(0, dName.indexOf("_"));
                sModel= salesController.getStockItem(prescModel.getMedicineName(), prescModel.getTotalMedications());
                if(sModel != null){
                    jcomp.getModel().setValueAt(i+1, i, 0);
                    jcomp.getModel().setValueAt(sModel.getItemCode(), i, 1);
                    jcomp.getModel().setValueAt(sModel.getItemName(), i, 2);
                    jcomp.getModel().setValueAt(sModel.getFormulation(), i, 3);
                    jcomp.getModel().setValueAt(sModel.getQuantity(), i, 4);
                    jcomp.getModel().setValueAt(sModel.getBatchNumber(), i, 5);
                    jcomp.getModel().setValueAt(sModel.getExpiryDate(), i, 6);
                    jcomp.getModel().setValueAt(sModel.getUnitPrice(), i, 7);
                    jcomp.getModel().setValueAt(sModel.getMrp(), i, 8);
                    jcomp.getModel().setValueAt(sModel.getUnitDiscount(), i, 9);
                    jcomp.getModel().setValueAt(sModel.getUnitVAT(), i, 11);
                    jcomp.getModel().setValueAt(0, i, 13);
                    this.dispose();
                    jcomp.requestFocus();
                    jcomp.changeSelection(i, 4, false, false);
                }
            }
            isLoaded = true;;
            tableValues = 0;
        }*/
        }
        catch(Exception e) {
            String ss = "Method: setValues    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }




    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        if(evt.getKeyCode()== KeyEvent.VK_ENTER) {
            int row=jTable1.getSelectedRow();
            if(row!=-1) {
                if(jTable1.getValueAt(row,1)!=null) {
                setValues();
                }
            }
        }
        else if(evt.getKeyCode() == KeyEvent.VK_ESCAPE) {
            this.dispose();
        }
    }//GEN-LAST:event_jTable1KeyPressed
private void jComboBox1ItemStateChanged1(java.awt.event.ItemEvent evt, String string) {
   // jLabel1.setText("Enter Patient Name");
          searchType="customer_name";
          jTextField1.setText(string);
          //clearData(); 
}

    public void clearData () {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();
        jTable1.revalidate();
    }

    private void jTextField1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTextField1MouseClicked
//        if(jComboBox1.getSelectedIndex()==3) {
//            DatePicker dt = new DatePicker(jPanel1);
//            jTextField1.setText(dt.setPickedDate());
//            loadValues(jTextField1.getText());
//          }
    }//GEN-LAST:event_jTextField1MouseClicked

    private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyPressed
//        if(jComboBox1.getSelectedIndex()==3) {
//            DatePicker dt = new DatePicker(jPanel1);
//            jTextField1.setText(dt.setPickedDate());
//            loadValues(jTextField1.getText());
//          }
    }//GEN-LAST:event_jTextField1KeyPressed

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    public  void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
            Vector datas = new Vector();
            for (int i = 0; i < jTable1.getModel().getColumnCount(); i++) {                
                    datas.addElement(null);                
            }
            model.insertRow(jTable1.getRowCount(), datas);
        } catch (Exception ex) {
            String ss = "Method: addRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables



    

    

}
