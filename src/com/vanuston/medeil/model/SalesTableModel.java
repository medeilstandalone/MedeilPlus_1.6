/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.uitables;

import java.util.Vector;

/**
 *
 * @author muralikrishnan
 */
public class SalesTableModel extends javax.swing.table.DefaultTableModel {
      SalesTableModel(Vector data,Vector cols,Class[] types,boolean[] canEditCols) {
            super(data,cols);
            this.type=types;
            this.canEditCol=canEditCols;
       }
       Class[] type;
       boolean[] canEditCol;

       @Override
       public Class getColumnClass(int columnIndex) {
            return type[columnIndex];
       }

       @Override
       public boolean isCellEditable(int rowIndex, int columnIndex) {
            return canEditCol[columnIndex];
       }
       public void setCellEditable(int row, int col, boolean value) {
            this.canEditCol[col]=value;
            this.fireTableCellUpdated(row, col);
       }
        public void addColumn(String columnName, Object[] columnData) {
        super.addColumn(columnName, columnData);
         Class[] newTypes = new Class[type.length + 1];
    System.arraycopy(type, 0, newTypes, 0, type.length);
    newTypes[type.length] = java.lang.Object.class; // Default type for new column
    this.type = newTypes;

    }
        public void setCanEditCols(boolean[] canEditCols) {
        this.canEditCol = canEditCols;
        fireTableStructureChanged(); // Notify the table structure has changed
    }
}
