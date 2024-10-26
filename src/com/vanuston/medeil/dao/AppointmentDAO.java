/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Appointment;
import com.vanuston.medeil.model.AppointmentModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author muralikrishnan
 */
public class AppointmentDAO implements Appointment {

    static Logger log = Logger.getLogger(AppointmentDAO.class, "com.vanuston.probilz.dao.AppointmentDAO");

    @Override
    public Object createRecord(Object object) throws RemoteException {
        Boolean isCreate = false;
        Session sn = null;
        Transaction ta = null;
        try {
            AppointmentModel model = (AppointmentModel) object;
            sn = DBConnection.getSessionFactory().openSession();
            ta = sn.beginTransaction();
            sn.merge(model);
            sn.getTransaction().commit();
            isCreate = true;
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:AppointmentDAO createRecord() Exception:" + e.getMessage());
            if (ta != null) {
                ta.rollback();
            }
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return isCreate;
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        AppointmentModel model = (AppointmentModel) object;
        List<AppointmentModel> appointmentList = new ArrayList<AppointmentModel>();
        System.out.println("viewRecord");
        Session sn = null;
        Transaction ta = null;
        try {
            if (model != null) {
                sn = DBConnection.getSessionFactory().openSession();
                ta = sn.beginTransaction();
                if (model.getUpdatedBy().equals("time")) {
                    /*Query qry = sn.createQuery("SELECT m FROM AppointmentModel m  where doctor_name='"+model.getDoctorName()+"' and "
                    + "appointment_date='"+DateUtils.changeFormatDate(model.getAppointmentDate())+"' "
                    + "and STR_TO_DATE(appoint_fromtime,'%h:%i %p') between STR_TO_DATE('"+model.getAppointmentFromTime()+"','%h:%i%p') and STR_TO_DATE('"+model.getAppointmentToTime()+"','%h:%i%p') "
                    + "and STR_TO_DATE(appoint_totime,'%h:%i %p') between STR_TO_DATE('"+model.getAppointmentFromTime()+"','%h:%i%p') and STR_TO_DATE('"+model.getAppointmentToTime()+"','%h:%i%p') order by appoint_no");*/
                    Query qry = sn.createQuery("FROM AppointmentModel m  where is_active=:isActive and app_status!=2  and  doctor_name=:doctorName and appointment_date=:date"
                            + "and STR_TO_DATE(appoint_fromtime,'%h:%i %p') between STR_TO_DATE(:fromTime,'%h:%i%p') and STR_TO_DATE(:toTime,'%h:%i%p') "
                            + "and STR_TO_DATE(appoint_totime,'%h:%i %p') between STR_TO_DATE(:fromTime,'%h:%i%p') and STR_TO_DATE(:toTime,'%h:%i%p') order by appoint_no");
                    qry.setParameter("doctorName", model.getDoctorName());
                    qry.setParameter("date", DateUtils.changeFormatDate(model.getAppointmentDate()));
                    qry.setParameter("fromTime", model.getAppointmentFromTime());
                    qry.setParameter("toTime", model.getAppointmentToTime());
                    qry.setParameter("isActive", model.getIsActive());
                    appointmentList = qry.list();
                } else if (model.getUpdatedBy().equals("date")) {
                    Criteria criteria = sn.createCriteria(AppointmentModel.class);
                    criteria.add(Restrictions.eq("appointmentDate", model.getAppointmentDate()));
                    criteria.add(Restrictions.eq("isActive", 0));
                    appointmentList = criteria.list();
                    sn.getTransaction().commit();
                } else if (model.getUpdatedBy().equals("patientName")) {
                    Criteria criteria = sn.createCriteria(AppointmentModel.class);
                    criteria.add(Restrictions.like("patientName", "%" + model.getPatientName() + "%"));
                    criteria.add(Restrictions.eq("isActive", 0));
                    appointmentList = criteria.list();
                    sn.getTransaction().commit();
                } else if (model.getUpdatedBy().equals("doctorNameSearch")) {
                    Criteria criteria = sn.createCriteria(AppointmentModel.class);
                    criteria.add(Restrictions.like("doctorName", "%" + model.getDoctorName() + "%"));
                    criteria.add(Restrictions.eq("isActive", 0));
                    criteria.addOrder(Order.desc("appointmentDate"));
                    criteria.addOrder(Order.asc("id"));
                    appointmentList = criteria.list();
                    sn.getTransaction().commit();
                } else if (model.getUpdatedBy().equals("doctorName")) {
                    Criteria criteria = sn.createCriteria(AppointmentModel.class);
                    criteria.add(Restrictions.eq("doctorName", model.getDoctorName()));
                    criteria.add(Restrictions.eq("appointmentDate", model.getAppointmentDate()));
                    criteria.add(Restrictions.eq("isActive", 0));
                    appointmentList = criteria.list();
                    sn.getTransaction().commit();
                } else if (model.getUpdatedBy().equals("doctorNameUpdate")) {
                    Criteria criteria = sn.createCriteria(AppointmentModel.class);
                    criteria.add(Restrictions.eq("doctorName", model.getDoctorName()));
                    criteria.add(Restrictions.eq("appointmentDate", model.getAppointmentDate()));
                    criteria.add(Restrictions.eq("isActive", 0));
                    criteria.add(Restrictions.ne("id", model.getId()));
                    appointmentList = criteria.list();
                    sn.getTransaction().commit();
                } else {
                    Criteria criteria = sn.createCriteria(AppointmentModel.class);
                    criteria.add(Restrictions.eq("isActive", 0));
                    appointmentList = criteria.list();
                    sn.getTransaction().commit();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:AppointmentDAO viewRecord() Exception:" + e.getMessage());
            if (ta != null) {
                ta.rollback();
            }
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return appointmentList;
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        Boolean isCreate = false;
        Session sn = null;
        Transaction ta = null;
        try {
            AppointmentModel model = (AppointmentModel) object;
            sn = DBConnection.getSessionFactory().openSession();
            ta = sn.beginTransaction();
            model.setStatus("YET To MEET");
            sn.update(model);
            sn.getTransaction().commit();
            isCreate = true;
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:AppointmentDAO createRecord() Exception:" + e.getMessage());
            if (ta != null) {
                ta.rollback();
            }
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return isCreate;
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

//     @Override
//    public String selectQrys(String query) {
//        String returnString = "";
//        Session sn = DBConnection.getSessionFactory().openSession();
//        Query qry;
//        try {
////            if (queryType.equals("sql")) {
////                qry = sn.createSQLQuery(query);
////            } else {
//                qry = sn.createQuery(query);
////            }
//
////            List list = qry.list();
////            if (list.size() > 0) {
//                returnString = qry.toString();
//                System.out.println(returnString);
////            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            log.debug("class:AppointmentDAO selectQry() Exception:" + e.getMessage());
//        } finally {
//            if (sn != null) {
//                sn.close();
//            }
//            DBConnection.getSessionFactory().close();
//        }
//        return returnString;
//    }
//
//

@Override
public int selectQrys(String query) {

     int result = 0;
        Session sn = null;
        Transaction ta = null;
        try {
            sn = DBConnection.getSessionFactory().openSession();
            ta = sn.beginTransaction();
            Query q = sn.createSQLQuery(query);
            result = q.executeUpdate();
            sn.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:AppointmentDAO insertQry() Exception:" + e.getMessage());
            if (ta != null) {
                ta.rollback();
            }
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return result;
    }



    @Override
    public String selectQry(String query, int limit, String queryType) {
        String returnString = "";
        Session sn = DBConnection.getSessionFactory().openSession();
        Query qry;
        try {
            if (queryType.equals("sql")) {
                qry = sn.createSQLQuery(query);
            } else {
                qry = sn.createQuery(query);
            }
            if (limit > 0) {
                qry.setMaxResults(limit);
            }
            List list = qry.list();
            if (list.size() > 0) {
                returnString = "" + list.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:AppointmentDAO selectQry() Exception:" + e.getMessage());
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return returnString;
    }

    @Override
    public int insertQry(String query) {
        int result = 0;
        Session sn = null;
        Transaction ta = null;
        try {
            sn = DBConnection.getSessionFactory().openSession();
            ta = sn.beginTransaction();
            Query q = sn.createSQLQuery(query);
            result = q.executeUpdate();
            sn.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            log.debug("class:AppointmentDAO insertQry() Exception:" + e.getMessage());
            if (ta != null) {
                ta.rollback();
            }
        } finally {
            if (sn != null) {
                sn.close();
            }
            DBConnection.getSessionFactory().close();
        }
        return result;
    }

    public void checkDoctorAvailability(String doctorName, String toTime, String dayOfWeek){
        String query = "select * from medp_visithours_mt where doctor_name ='"+doctorName+"'";
        Session sn = DBConnection.getSessionFactory().openSession();
        Transaction ta = sn.beginTransaction();
         Query qry = sn.createQuery(query);
    }
    
}
