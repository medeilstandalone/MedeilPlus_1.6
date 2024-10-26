/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class ReportModel implements Serializable{

private static final long serialVersionUID = 1L;

private Connection connection;

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }


}
