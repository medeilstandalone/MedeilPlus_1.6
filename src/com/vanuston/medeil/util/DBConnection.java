package com.vanuston.medeil.util;

import com.vanuston.medeil.model.AppointmentModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

public class DBConnection {

    public final String NAME = "NAME";
    static Logger log = Logger.getLogger(DBConnection.class, "Utilities");
    private static Connection con = null;
    private static Connection conT = null;
    private static Statement stmt = null;
    private static String protocal = "jdbc:mysql";
    private static String host = "localhost";
    private static String db = "medeil_plus";
    private static String dbuser = "root";
    private static String port = "4466";
    private static String driver = "com.mysql.jdbc.Driver";
    static long totalMem = 0 ;
    private static final SessionFactory sessionFactory = buildSessionFactory();
    public static Connection getConnection() {
        if(Runtime.getRuntime().totalMemory()/(1024*1024) > totalMem) {
            log.debug("Method:getConnection Entry Free:"+Runtime.getRuntime().freeMemory()/(1024*1024)+", Total:"+Runtime.getRuntime().totalMemory()/(1024*1024)+", Max:"+Runtime.getRuntime().maxMemory()/(1024*1024));            
        }
        totalMem = Runtime.getRuntime().totalMemory()/(1024*1024);
        long maxMem = (Runtime.getRuntime().maxMemory()/(1024*1024));
        if(totalMem > ( maxMem - ( (10/100) * maxMem))) {
            log.debug("VM has reached a maximum reserved space of the system.Restart the medeil to be avoid data loss/crash");
        }
        if (conT == null) {
            makeTransConnection();
        }
        return conT;
    }
    private static SessionFactory buildSessionFactory() {
        SessionFactory sf = null;
		try {

                    // Create the SessionFactory from hibernate.cfg.xml
//                        Configuration config = new Configuration().configure("/hibernate.cfg.xml");
			sf = getConfig().buildSessionFactory();
		} catch (Throwable ex) {
                    // Make sure you log the exception, as it might be swallowed
                        ex.printStackTrace();
			log.debug("Initial SessionFactory creation failed." + ex);
			throw new ExceptionInInitializerError(ex);
		}
        return  sf;
	}
    public static SessionFactory getSessionFactory(){
//        System.out.println("sessionFactory.isClosed():"+sessionFactory.isClosed());
        if(sessionFactory.isClosed()){
            return buildSessionFactory();
        } else {
            return sessionFactory;
        }
    }
    
    private static Configuration getConfig() {
        Configuration con =null;
        try {
            String tmp=new LogReg().temp();
            con = new AnnotationConfiguration();
            Properties prop= new Properties();
            prop.setProperty("hibernate.connection.driver_class", "com.mysql.jdbc.Driver");
            prop.setProperty("hibernate.connection.url", "jdbc:mysql://localhost:4466/medeil_plus");
            prop.setProperty("hibernate.connection.username", "root");
            prop.setProperty("hibernate.connection.password", tmp);
            prop.setProperty("hibernate.connection.pool_size", "2");
            prop.setProperty("hibernate.hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
            prop.setProperty("hibernate.current_session_context_class", "thread");
            prop.setProperty("hibernate.cache.provider_class", "org.hibernate.cache.NoCacheProvider");
            prop.setProperty("hibernate.show_sql", "false");
            prop.setProperty("hibernate.hbm2ddl.auto", "validate");
            con.addPackage("com.vanuston.medeil.model");
            con.addProperties(prop);
            con.addAnnotatedClass(AppointmentModel.class);
        } catch(Exception e) {
            e.printStackTrace();
            log.debug("getConfig Exception:"+e.getMessage());
        }
        return con;
    }

    
    public static Statement getStatement() {
        try {
            stmt = getConnection().createStatement();
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : getStatement     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return stmt;
    }

    private static void regDriver() {
        try {
            Class.forName(driver);
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : regDriver  Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }
    private static String getDBConURL() {
        return protocal+"://"+host+":"+port+"/"+db;
    }
    private static Connection makeTransConnection() {
        log.debug("Class:DBConnection Method:makeTransConnection Entry Free:"+Runtime.getRuntime().freeMemory()/(1024*1024)+", Total:"+Runtime.getRuntime().totalMemory()/(1024*1024)+", Max:"+Runtime.getRuntime().maxMemory()/(1024*1024));
        try {
            String tmp ="MEdeiLDemO@2010";
            if (!tmp.equals("Error")) {
                regDriver();
                conT = DriverManager.getConnection(getDBConURL(), dbuser, tmp);
            }
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : makeTransConnection  Exception :" + ex.getMessage();
            log.debug(ss);

        }
        log.debug("Class:DBConnection Method:makeTransConnection Exit Max:"+Runtime.getRuntime().totalMemory()/(1024*1024));
        return conT;
    }

    public static Boolean testConnection() {
        Boolean s = true;
        try {

          String tmp ="MEdeiLDemO@2010";
            if (!tmp.equals("Error")) {
                regDriver();
                Connection cn =null;
                cn = DriverManager.getConnection(getDBConURL(), dbuser, tmp);
                if (cn != null) {
                    s = false;
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : testConnection  Exception :" + ex;
            log.debug(ss);

        }
        return s;
    }

    public static void closeAllConnections() {
        try {
            if (con != null) {
                con.close();
            }
            con = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : closeAllConnections     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        try {
            if (conT != null) {
                conT.close();
            }
            conT = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : closeAllConnections     Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }

    @Override
    public void finalize() {
        try {
            if (con != null) {
                con.close();
            }
            con = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : finalize     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        try {
            if (conT != null) {
                conT.close();
            }
            conT = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : finalize     Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }
}
