/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.util;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Settings;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 *
 * @author Assen
 */
public class SmsSender {
    String userName = "";
    String apikey = "";
    String senderid = "";
    String RetMsg = "";

    public SmsSender()
    {
        try
        {
         Settings controller;
         controller = (Settings) RegistryFactory.getClientStub(RegistryConstants.Configuration);
         String[] config = controller.getsmsConfiguration();
         userName = config[0];
         senderid = config[1];
         apikey = config[2];
        }catch(Exception e)
        {

        }
    }

    public Boolean Configured()
    {
        Boolean ret = true;

        if( apikey== null || apikey.equals(""))
        {
            RetMsg ="NC";
            return false;
        }else if(userName == null || userName.equals(""))
        {
            RetMsg ="NC";
            return false;
        }
        else if(senderid == null || senderid.equals(""))
        {
            RetMsg ="NC";
            return false;
        }

        return ret;
    }

    public Boolean Connectivity()
    {
        Boolean ret = false;

            try {
                URL url = new URL("http://www.google.com");
                System.out.println(url.getHost());
                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.connect();
                if (con.getResponseCode() == 200){
                    return true;
                }
            } catch (Exception exception) {
                RetMsg = "NI";
                return false;
            }

        return ret;
    }

    public String SendSms(String mobileNO, String Header ,String message, String Footer, String routetype) {
        String rsp = "Sent";

        if(Configured() && Connectivity())
        {
        String retval = "";

        try {
           String FullMessage = Header+"\n"+message+"\n"+Footer;
           String urlenco = "http://smshorizon.co.in/api/sendsms.php?user="+
                             URLEncoder.encode(this.userName,"UTF8")+
                             "&apikey="+URLEncoder.encode(this.apikey,"UTF8")+
                             "&mobile="+URLEncoder.encode(mobileNO,"UTF8")+
                             "&message="+URLEncoder.encode(FullMessage, "UTF8")+
                             "&senderid="+URLEncoder.encode(this.senderid,"UTF8")+"&type=txt";

           URL url = new URL(urlenco);
           URLConnection conn = url.openConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }       
    }
    else{
            rsp = RetMsg;
     }

         return rsp;
    }

}
