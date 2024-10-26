package com.vanuston.medeil.server;

import java.io.Serializable;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import com.vanuston.medeil.controller.*;
import com.vanuston.medeil.implementation.*;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Logger;
import java.lang.management.ManagementFactory;

public class ServerSkeletonFactory extends UnicastRemoteObject implements Serializable {

    /**
     *
     */

    private static final long serialVersionUID = 1L;

    public ServerSkeletonFactory() throws RemoteException {
        super();
    }

    public static void run(Integer serverPort) throws RemoteException, NotBoundException {
        try {
	    Logger.getLogger(ServerSkeletonFactory.class, "ServerSkeletonFactory").debug("IP:" + (InetAddress.getLocalHost()).getHostAddress() + ", port:"+serverPort);
	} catch (UnknownHostException ex) {
	    Logger.getLogger(ServerSkeletonFactory.class, "ServerSkeletonFactory").debug("Method:run UnknownHostException:"+ex.getMessage());
	}
        long memorySize = ((com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean()).getTotalPhysicalMemorySize();
        Registry serverRegistry = LocateRegistry.createRegistry(serverPort);

        CommonImplements commonImplementsSkeleton = new CommonController();
        serverRegistry.rebind(RegistryConstants.CommonImplements, commonImplementsSkeleton);

        Settings configurationSkeleton = new SettingsController();
        serverRegistry.rebind(RegistryConstants.Configuration, configurationSkeleton);

        Customer customerSkeleton = new CustomerController();
        serverRegistry.rebind(RegistryConstants.Customer, customerSkeleton);

        CustomerAlerts customerAlertsSkeleton = new CustomerAlertsController();
        serverRegistry.rebind(RegistryConstants.CustomerAlerts, customerAlertsSkeleton);

        Doctor doctorSkeleton = new DoctorController();
        serverRegistry.rebind(RegistryConstants.Doctor, doctorSkeleton);

        Employee employeeSkeleton = new EmployeeController();
        serverRegistry.rebind(RegistryConstants.Employee, employeeSkeleton);

        EmployeeSalary employeeSalarySkeleton = new EmployeeSalaryController();
        serverRegistry.rebind(RegistryConstants.EmployeeSalary, employeeSalarySkeleton);
        
        Hospital hospitalSkeleton = new HospitalController();
        serverRegistry.rebind(RegistryConstants.Hospital, hospitalSkeleton);

        MaintenanceCost maintenanceCostSkeleton = new MaintenanceCostController();
        serverRegistry.rebind(RegistryConstants.MaintenanceCost, maintenanceCostSkeleton);

        PrintSettings printSettingsSkeleton = new PrintSettingsController();
        serverRegistry.rebind(RegistryConstants.PrintSettings, printSettingsSkeleton);

        StoreInformation storeInformationSkeleton = new StoreInformationController();
        serverRegistry.rebind(RegistryConstants.StoreInformation, storeInformationSkeleton);

        UserInformation userInformationSkeleton = new UserInformationController();
        serverRegistry.rebind(RegistryConstants.UserInformation, userInformationSkeleton);

        Drug drugSkeleton = new DrugController();
        serverRegistry.rebind(RegistryConstants.Drug, drugSkeleton);

        Prescription prescriptionSkeleton = new PrescriptionController();
        serverRegistry.rebind(RegistryConstants.PrescriptionFormat, prescriptionSkeleton);

        Appointment appointmentSkeleton = new AppointmentController();
        serverRegistry.rebind(RegistryConstants.Appointment, appointmentSkeleton);

         Customer1 customerSkeleton1 = new CustomerController1();//sabarish
        serverRegistry.rebind(RegistryConstants.Customer1, customerSkeleton1);//sabarish

        Sales salesSkeleton = new SalesController();//sabarish
        serverRegistry.rebind(RegistryConstants.Sales, salesSkeleton);//sabarish

        DicomImplementation dicomImplementSkeleton = new DicomController();
        serverRegistry.rebind(RegistryConstants.DicomImplementation, dicomImplementSkeleton);
    }

    public String getIPAddress() {
        String serverHostIP = "";
        try {
            serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
        } catch (UnknownHostException e) {
            Logger.getLogger(ServerSkeletonFactory.class, "ServerSkeletonFactory").debug("Method:getIPAddress Exception:"+e.getMessage());
        }
        return serverHostIP;
    }
//	public static void main(String[] args) throws RemoteException,NotBoundException {
//		ServerSkeletonFactory.run(20202);
//		ServerSkeletonFactory factory = new ServerSkeletonFactory();

//	}
}
