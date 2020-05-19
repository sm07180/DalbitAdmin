package com.dalbit.payment.module.mcCancel_v0001;

import java.io.*;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Properties;

public class FileMaker {

    private FileInputStream fis;
    private FileOutputStream fos;
    private String logLevel;
    private String serverIp;
    private String switchIp;
    private String propertiesName;
    private String fileDir;
    private String fileName;
    private int serverPort;
    private int recvTimeOut;
    private String configDirPath;

    public FileMaker() {
        this.logLevel = "";
        this.serverIp = "";
        this.switchIp = "";
        this.propertiesName = "/mobilians/MCash_Cancel.properties";
        this.fileDir = "";
        this.fileName = "";
        if (this.propertiesLoad().equals("0000")) {
            this.makeFile();
        }
    }

    public FileMaker(final String configDirPath) {
        this.logLevel = "";
        this.serverIp = "";
        this.switchIp = "";
        this.propertiesName = "/mobilians/MCash_Cancel.properties";
        this.fileDir = "";
        this.fileName = "";
        this.configDirPath = configDirPath;
        if (this.propertiesLoad(configDirPath).equals("0000")) {
            this.makeFile();
        }
    }

    public FileMaker(final String serverIp, final int serverPort, final String switchIp, final int recvTimeOut, final String logFile, final String logLevel) {
        this.logLevel = "";
        this.serverIp = "";
        this.switchIp = "";
        this.propertiesName = "/mobilians/MCash_Cancel.properties";
        this.fileDir = "";
        this.fileName = "";
        this.fileDir = logFile;
        this.fileName = String.valueOf(this.fileDir) + this.makeFileName();
        this.logLevel = logLevel;
        this.serverIp = serverIp;
        this.serverPort = serverPort;
        this.switchIp = switchIp;
        this.recvTimeOut = recvTimeOut;
        this.makeFile();
    }

    public String makeFile() {
        String rtnCd = "";
        try {
            final File f = new File(this.fileDir);
            if (!f.exists()) {
                f.mkdir();
            }
            this.fos = new FileOutputStream(this.fileName, true);
            rtnCd = "0000";
        }
        catch (IOException ex) {
            System.out.println("Mobilians Mcash Error ==> Can't make the log file");
            this.writeln("Mobilians Mcash Error ==> Can't make the log file");
            rtnCd = "225";
        }
        return rtnCd;
    }

    public String propertiesLoad() {
        return this.propertiesLoad(null);
    }

    public String propertiesLoad(final String configDirPath) {
        InputStream is = null;
        final Properties dbProps = new Properties();
        try {
            Label_0122: {
                if (configDirPath != null && !"".equals(configDirPath)) {
                    try {
                        is = new FileInputStream(new File(configDirPath));
                        dbProps.load(is);
                        is.close();
                        break Label_0122;
                    }
                    catch (Exception e) {
                        System.err.println("Can't read the properties file. Make sure Mcash.properties is in the CLASSPATH");
                        this.writeln("Can't read the properties file.");
                        return "9999";
                    }
                }
                System.out.println("default properties load...." + this.propertiesName);
                is = this.getClass().getClassLoader().getResourceAsStream(this.propertiesName);
                dbProps.load(is);
                System.out.println(dbProps);
            }
            this.fileDir = dbProps.getProperty("LogFile", "");
            this.fileName = String.valueOf(this.fileDir) + this.makeFileName();
            this.logLevel = dbProps.getProperty("logLevel", "2");
            this.serverIp = dbProps.getProperty("SERVER_IP", "");
            this.serverPort = new Integer(dbProps.getProperty("SERVER_PORT", "7500"));
            this.switchIp = dbProps.getProperty("SWITCH_IP", "");
            this.recvTimeOut = new Integer(dbProps.getProperty("RECV_TIMEOUT", "0"));
            return "0000";
        }
        catch (Exception e) {
            System.err.println("Can't read the properties file. Make sure Mcash.properties is in the CLASSPATH");
            this.writeln("Can't read the properties file.");
            return "9999";
        }
    }

    public String makeFileName() {
        final Calendar c = new GregorianCalendar();
        c.setTimeInMillis(System.currentTimeMillis());
        String year = new StringBuilder(String.valueOf(c.get(1))).toString();
        String mon = new StringBuilder(String.valueOf(c.get(2) + 1)).toString();
        String day = new StringBuilder(String.valueOf(c.get(5))).toString();
        if (Integer.parseInt(year) < 10) {
            year = "0" + year;
        }
        if (Integer.parseInt(mon) < 10) {
            mon = "0" + mon;
        }
        if (Integer.parseInt(day) < 10) {
            day = "0" + day;
        }
        return "Mcash_cancel_" + year + mon + day + ".txt";
    }

    public void write(final String tmp) {
        try {
            this.fos.write(tmp.getBytes());
        }
        catch (Exception ex) {
            System.err.println("Mobilians Mcash Error ==> Can't write the log file");
        }
    }

    public void writeln(String tmp) {
        tmp = String.valueOf(this.dateStr()) + " => " + tmp + "\n";
        try {
            this.fos.write(tmp.getBytes());
        }
        catch (Exception ex) {
            System.err.println("Mobilians Mcash Error ==> Can't write the log file");
        }
    }

    public void errorln(String tmp) {
        tmp = String.valueOf(this.dateStr()) + "    Error => " + tmp + "\n";
        try {
            this.fos.write(tmp.getBytes());
        }
        catch (Exception ex) {
            System.err.println("Mobilians Mcash Error ==> Can't write the log file");
        }
    }

    public String dateStr() {
        final Calendar c = new GregorianCalendar();
        c.setTimeInMillis(System.currentTimeMillis());
        String hor = new StringBuilder(String.valueOf(c.get(11))).toString();
        String min = new StringBuilder(String.valueOf(c.get(12))).toString();
        String sec = new StringBuilder(String.valueOf(c.get(13))).toString();
        if (Integer.parseInt(min) < 10) {
            min = "0" + min;
        }
        if (Integer.parseInt(hor) < 10) {
            hor = "0" + hor;
        }
        if (Integer.parseInt(sec) < 10) {
            sec = "0" + sec;
        }
        return String.valueOf(hor) + ":" + min + ":" + sec;
    }

    public void close() {
        try {
            if (this.fis != null) {
                this.fis.close();
            }
        }
        catch (IOException ex) {
            System.err.println("Mobilians Mcash Error ==> Can't close the log file");
        }
        try {
            if (this.fos != null) {
                this.fos.close();
            }
        }
        catch (IOException ex) {
            System.err.println("Mobilians Mcash Error ==> Can't close the log file");
        }
    }

    public String getFileName() {
        return this.fileName;
    }

    public String getLogLevel() {
        return this.logLevel;
    }

    public String getServerIp() {
        return this.serverIp;
    }

    public int getServerPort() {
        return this.serverPort;
    }

    public String getSwitchIp() {
        return this.switchIp;
    }

    public int getRecvTimeOut() {
        return this.recvTimeOut;
    }
}
