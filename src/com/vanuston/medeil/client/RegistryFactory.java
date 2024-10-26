package com.vanuston.medeil.client;

import java.rmi.ConnectException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import com.vanuston.medeil.implementation.*;
//import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.StubType;
import java.net.InetAddress;
import java.net.UnknownHostException;
import javax.swing.JOptionPane;


public class RegistryFactory {
    
    public static int errCnt = 0;
    public static String serverHostIP;

    public static Integer serverPort = 30602;
    public static Logger log = Logger.getLogger(RegistryFactory.class, "RegistryFactory");
    private RegistryFactory() {
        super();
    }
    public static Object getClientStub(String moduleTypeString) throws RemoteException, NotBoundException {
        Registry clientRegistry = null;
        try {
        if (serverHostIP == null || serverPort == null || serverHostIP.equals("")) {            
            serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
            serverPort = 30602;
        }
        if(! serverHostIP.equals((InetAddress.getLocalHost()).getHostAddress())) {
		serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
                log.debug("system host sddress has been changed restart clients with this IP :"+serverHostIP +" and Port:"+serverPort);
		JOptionPane.showMessageDialog(null, "system host sddress has been changed restart clients with this IP :"+serverHostIP +" and Port:"+serverPort);
	}
        } catch (UnknownHostException ex) {
                Logger.getLogger(RegistryFactory.class,"RegistryFactory").debug("Method:getClientStub UnknownHostException_1:"+ex.getMessage());
        }
        clientRegistry = LocateRegistry.getRegistry(serverHostIP, serverPort);
        StubType stubType = StubType.valueOf(moduleTypeString);
        try {
            BaseImplements baseImplementsStub;
            CommonImplements commonImplementsStub;
            Settings configurationStub;
            Customer customerStub;
            DicomImplementation dicomImplemetationStub;
            CustomerAlerts customerAlertsStub;
            Doctor doctorStub;
            Employee employeeStub;
            EmployeeSalary employeeSalaryStub;
            Hospital hospitalStub;
            MaintenanceCost maintenanceCostStub;
            PrintSettings printSettingsStub;
            StoreInformation storeInformationStub;
            UserInformation userInformationStub;
            Drug drugStub;
            Prescription prescriptionFormatStub;
            Appointment appointmentStub;
            Customer1 customerStub1;//sabarish
            Sales salesStub;//sabarish
            switch (stubType) {

                case BaseImplementsStub:
                    baseImplementsStub = (com.vanuston.medeil.implementation.BaseImplements) clientRegistry.lookup(RegistryConstants.BaseImplements);
                    return baseImplementsStub;
                case CommonImplementsStub:
                    commonImplementsStub = (com.vanuston.medeil.implementation.CommonImplements) clientRegistry.lookup(RegistryConstants.CommonImplements);
                    return commonImplementsStub;
                case ConfigurationStub:
                    configurationStub = (com.vanuston.medeil.implementation.Settings) clientRegistry.lookup(RegistryConstants.Configuration);
                    return configurationStub;
                case CustomerStub:
                    customerStub = (com.vanuston.medeil.implementation.Customer) clientRegistry.lookup(RegistryConstants.Customer);
                    return customerStub;
                case CustomerAlertsStub:
                    customerAlertsStub = (com.vanuston.medeil.implementation.CustomerAlerts) clientRegistry.lookup(RegistryConstants.CustomerAlerts);
                    return customerAlertsStub;
                case DoctorStub:
                    doctorStub = (com.vanuston.medeil.implementation.Doctor) clientRegistry.lookup(RegistryConstants.Doctor);
                    return doctorStub;
                case EmployeeStub:
                    employeeStub = (com.vanuston.medeil.implementation.Employee) clientRegistry.lookup(RegistryConstants.Employee);
                    return employeeStub;
                case EmployeeSalaryStub:
                    employeeSalaryStub = (com.vanuston.medeil.implementation.EmployeeSalary) clientRegistry.lookup(RegistryConstants.EmployeeSalary);
                    return employeeSalaryStub;
                case HospitalStub:
                    hospitalStub = (com.vanuston.medeil.implementation.Hospital) clientRegistry.lookup(RegistryConstants.Hospital);
                    return hospitalStub;
                case MaintenanceCostStub:
                    maintenanceCostStub = (com.vanuston.medeil.implementation.MaintenanceCost) clientRegistry.lookup(RegistryConstants.MaintenanceCost);
                    return maintenanceCostStub;
                case PrintSettingsStub:
                    printSettingsStub = (com.vanuston.medeil.implementation.PrintSettings) clientRegistry.lookup(RegistryConstants.PrintSettings);
                    return printSettingsStub;
                case StoreInformationStub:
                    storeInformationStub = (com.vanuston.medeil.implementation.StoreInformation) clientRegistry.lookup(RegistryConstants.StoreInformation);
                    return storeInformationStub;
                case UserInformationStub:
                    userInformationStub = (com.vanuston.medeil.implementation.UserInformation) clientRegistry.lookup(RegistryConstants.UserInformation);
                    return userInformationStub;
                case DrugStub:
                    drugStub = (com.vanuston.medeil.implementation.Drug) clientRegistry.lookup(RegistryConstants.Drug);
                    return drugStub;
                case PrescriptionFormatStub:
                    prescriptionFormatStub = (com.vanuston.medeil.implementation.Prescription) clientRegistry.lookup(RegistryConstants.PrescriptionFormat);
                    return prescriptionFormatStub;
                case AppointmentStub:
                    appointmentStub = (com.vanuston.medeil.implementation.Appointment) clientRegistry.lookup(RegistryConstants.Appointment);
                    return appointmentStub;
                //sabarish starting
                case CustomerStub1:
                    customerStub1 = (com.vanuston.medeil.implementation.Customer1) clientRegistry.lookup(RegistryConstants.Customer1);
                    return customerStub1;
                 case SalesStub:
                    salesStub = (com.vanuston.medeil.implementation.Sales) clientRegistry.lookup(RegistryConstants.Sales);
                    return salesStub;
                 case DicomImplementationStub:
                    dicomImplemetationStub = (com.vanuston.medeil.implementation.DicomImplementation) clientRegistry.lookup(RegistryConstants.DicomImplementation);
                    return dicomImplemetationStub;
                   //end
                default:
                    // Add logger
                    return null;
            }
        } catch (ConnectException e) {       
            try {
                 serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
                 errCnt = 10;
            } catch (UnknownHostException ex) {
                Logger.getLogger(RegistryFactory.class,"RegistryFactory").debug("Method:getClientStub UnknownHostException_2:"+ex.getMessage());                
                ex.printStackTrace();
            }
        }
        return null;
    }
}
