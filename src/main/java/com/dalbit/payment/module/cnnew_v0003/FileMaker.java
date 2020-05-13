package com.dalbit.payment.module.cnnew_v0003;

import java.io.*;
import java.util.Date;
import java.util.Properties;

public class FileMaker {

    private String propertiesName;
    private FileInputStream fis;
    private OutputStreamWriter osw;
    private String logLevel;
    private String serverIp;
    private String switchIp;
    private int serverPort;
    private int recvTimeOut;
    private String fileDir;
    private String fileName;
    private String resultcd;
    private String resultmsg;
    private String Ver;
    private String Key1;
    private String Key2;
    private String CryptGB;
    private String KeySeq;
    private String CipherKey;
    private String UserEncode;
    private boolean isManualConfig;

    public FileMaker(final String ver, final String serverIp, final String switchIp, final int serverPort, final int recvTimeOut, final String logDir, final String KeySeq, final String Key, final String UserEncode, final String logLevel) {
        this.propertiesName = "Mcash.properties";
        this.logLevel = "";
        this.serverIp = "";
        this.switchIp = "";
        this.serverPort = 0;
        this.fileDir = "";
        this.fileName = "";
        this.resultcd = "";
        this.resultmsg = "";
        this.Ver = "";
        this.Key1 = "";
        this.Key2 = "";
        this.CryptGB = "";
        this.KeySeq = "";
        this.CipherKey = "";
        this.UserEncode = "";
        this.isManualConfig = false;
        this.isManualConfig = true;
        this.Ver = ver;
        this.serverIp = serverIp;
        this.switchIp = switchIp;
        this.serverPort = serverPort;
        this.recvTimeOut = recvTimeOut;
        this.fileDir = logDir;
        this.fileName = String.valueOf(this.fileDir) + this.makeFileName();
        this.UserEncode = UserEncode;
        if (this.UserEncode == null || "".equals(this.UserEncode)) {
            this.UserEncode = "EUC-KR";
        }
        this.makeFile();
        this.KeySeq = KeySeq;
        if (logLevel == null || logLevel.equals("")) {
            this.logLevel = "2";
        }
        if (this.fileName.equals("")) {
            this.resultcd = "9002";
            this.resultmsg = "[9002]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4. LogFile \uba85\uce6d\uc124\uc815 \uc624\ub958";
            System.out.println("[MCASH] Error : LogFile \uc124\uc815 \uc624\ub958 - [" + this.fileName + "]");
            return;
        }
        if (this.serverIp.equals("")) {
            this.resultcd = "9003";
            this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
            System.out.println("[MCASH] Error : SERVER_IP \uc124\uc815 \uc624\ub958 - [" + this.serverIp + "]");
            return;
        }
        if (this.switchIp.equals("")) {
            this.resultcd = "9003";
            this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4. SWITCH_IP \uc124\uc815 \uc624\ub958";
            System.out.println("[MCASH] Error : SWITCH_IP \uc124\uc815 \uc624\ub958 - [" + this.switchIp + "]");
            return;
        }
        if (this.serverPort == 0) {
            this.resultcd = "9003";
            this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4. SERVER_PORT \uc124\uc815 \uc624\ub958";
            System.out.println("[MCASH] Error : SERVER_PORT \uc124\uc815 \uc624\ub958 - [" + this.serverPort + "]");
            return;
        }
        if (this.Ver.length() != 4) {
            this.resultcd = "9004";
            this.resultmsg = "[9004]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
            System.out.println("[MCASH] Error : VER \uc124\uc815 \uc624\ub958 - [" + this.Ver + "]");
            return;
        }
        if (!this.KeySeq.equals("0") && !this.KeySeq.equals("1") && !this.KeySeq.equals("2")) {
            this.resultcd = "9005";
            this.resultmsg = "[9005]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
            System.out.println("[MCASH] Error : CURKEY \uc124\uc815 \uc624\ub958 - [" + this.KeySeq + "]");
            return;
        }
        if (this.KeySeq.equals("1")) {
            this.Key1 = Key;
            if (this.Key1.equals("") || this.Key1.length() != 8) {
                this.resultcd = "9005";
                this.resultmsg = "[9005]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                System.out.println("[MCASH] Error : KEY1 \uc124\uc815 \uc624\ub958 - [" + this.Key1 + "]");
            }
        }
        else if (this.KeySeq.equals("2")) {
            this.Key2 = Key;
            if (this.Key2.equals("") || this.Key2.length() != 8) {
                this.resultcd = "9005";
                this.resultmsg = "[9005]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                System.out.println("[MCASH] Error : KEY2 \uc124\uc815 \uc624\ub958" + this.Key2 + "]");
            }
        }
    }

    public FileMaker() {
        this.propertiesName = "Mcash.properties";
        this.logLevel = "";
        this.serverIp = "";
        this.switchIp = "";
        this.serverPort = 0;
        this.fileDir = "";
        this.fileName = "";
        this.resultcd = "";
        this.resultmsg = "";
        this.Ver = "";
        this.Key1 = "";
        this.Key2 = "";
        this.CryptGB = "";
        this.KeySeq = "";
        this.CipherKey = "";
        this.UserEncode = "";
        if (!(this.isManualConfig = false)) {
            this.propertiesLoad();
        }
        if (this.resultcd.equals("0000")) {
            this.makeFile();
        }
    }

    public FileMaker(final String configDirPath, final String logDir) {
        this.propertiesName = "Mcash.properties";
        this.logLevel = "";
        this.serverIp = "";
        this.switchIp = "";
        this.serverPort = 0;
        this.fileDir = "";
        this.fileName = "";
        this.resultcd = "";
        this.resultmsg = "";
        this.Ver = "";
        this.Key1 = "";
        this.Key2 = "";
        this.CryptGB = "";
        this.KeySeq = "";
        this.CipherKey = "";
        this.UserEncode = "";
        this.isManualConfig = false;
        if (logDir != null && !"".equals(logDir)) {
            this.fileDir = logDir;
            this.fileName = String.valueOf(this.fileDir) + this.makeFileName();
            this.resultcd = "0000";
        }
        else if (!this.isManualConfig) {
            this.propertiesLoad(configDirPath);
        }
        if (this.resultcd.equals("0000")) {
            this.makeFile();
        }
    }

    public String makeFile() {
        try {
            if (!"".equals(this.fileDir)) {
                final File f = new File(this.fileDir);
                if (!f.exists()) {
                    f.mkdir();
                }
                this.osw = new OutputStreamWriter(new FileOutputStream(this.fileName, true));
            }
            return this.resultcd = "0000";
        }
        catch (IOException ex) {
            System.err.println("[MCASH] Error : \ub514\ub809\ud1a0\ub9ac, \ud30c\uc77c \uc0dd\uc131 \uc624\ub958 - [" + this.fileName + "]" + ex.toString());
            this.resultcd = "9002";
            this.resultmsg = "[9002]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4. \ud30c\uc77c \uc0dd\uc131 \uc624\ub958. \ub514\ub809\ud1a0\ub9ac \uc720\ubb34 \ub610\ub294  \ub514\ub809\ud1a0\ub9ac \uad8c\ud55c \uc624\ub958";
            return "9002";
        }
    }

    public void propertiesLoad() {
        this.propertiesLoad(null);
    }

    public void propertiesLoad(final String configDirPath) {
        InputStream is = null;
        final Properties dbProps = new Properties();
        try {
            Label_0142: {
                if (configDirPath != null && !"".equals(configDirPath)) {
                    try {
                        is = new FileInputStream(new File(configDirPath));
                        dbProps.load(is);
                        is.close();
                        break Label_0142;
                    }
                    catch (Exception e) {
                        this.resultcd = "9003";
                        this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                        System.out.println("[MCASH] Error : \ud658\uacbd \uc124\uc815 \ud30c\uc77c \uc77d\uae30 \uc624\ub958 - [" + configDirPath + "]");
                        return;
                    }
                }
                System.out.println(">>>>>>>>" + this.propertiesName);
                is = this.getClass().getClassLoader().getResourceAsStream(this.propertiesName);
                dbProps.load(is);
                is.close();
            }
            this.fileDir = dbProps.getProperty("LogFile", "");
            this.fileName = String.valueOf(this.fileDir) + this.makeFileName();
            this.serverIp = dbProps.getProperty("SERVER_IP", "");
            if (this.serverIp.equals("")) {
                this.resultcd = "9003";
                this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                System.out.println("[MCASH] Error : SERVER_IP \uc124\uc815 \uc624\ub958 - [" + this.serverIp + "]");
                return;
            }
            this.switchIp = dbProps.getProperty("SWITCH_IP", "");
            if (this.switchIp.equals("")) {
                this.resultcd = "9003";
                this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4. SWITCH_IP \uc124\uc815 \uc624\ub958";
                System.out.println("[MCASH] Error : SWITCH_IP \uc124\uc815 \uc624\ub958 - [" + this.switchIp + "]");
                return;
            }
            try {
                this.serverPort = new Integer(dbProps.getProperty("SERVER_PORT", "0"));
            }
            catch (Exception ex) {
                this.serverPort = 0;
            }
            if (this.serverPort == 0) {
                this.resultcd = "9003";
                this.resultmsg = "[9003]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4. SERVER_PORT \uc124\uc815 \uc624\ub958";
                System.out.println("[MCASH] Error : SERVER_PORT \uc124\uc815 \uc624\ub958 - [" + this.serverPort + "]");
                return;
            }
            try {
                this.recvTimeOut = new Integer(dbProps.getProperty("RECV_TIMEOUT", "0"));
            }
            catch (Exception ex) {
                this.recvTimeOut = 0;
            }
            this.Ver = dbProps.getProperty("VER", "");
            if (this.Ver.length() != 4) {
                this.resultcd = "9004";
                this.resultmsg = "[9004]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                System.out.println("[MCASH] Error : VER \uc124\uc815 \uc624\ub958 - [" + this.Ver + "]");
                return;
            }
            this.KeySeq = "0";
            if (!this.KeySeq.equals("0") && !this.KeySeq.equals("1") && !this.KeySeq.equals("2")) {
                this.resultcd = "9005";
                this.resultmsg = "[9005]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                System.out.println("[MCASH] Error : CURKEY \uc124\uc815 \uc624\ub958 - [" + this.KeySeq + "]");
                return;
            }
            if (this.KeySeq.equals("1")) {
                this.Key1 = dbProps.getProperty("KEY1", "");
                if (this.Key1.equals("") || this.Key1.length() != 8) {
                    this.resultcd = "9005";
                    this.resultmsg = "[9005]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                    System.out.println("[MCASH] Error : KEY1 \uc124\uc815 \uc624\ub958 - [" + this.Key1 + "]");
                    return;
                }
            }
            else if (this.KeySeq.equals("2")) {
                this.Key2 = dbProps.getProperty("KEY2", "");
                if (this.Key2.equals("") || this.Key2.length() != 8) {
                    this.resultcd = "9005";
                    this.resultmsg = "[9005]\uc2dc\uc2a4\ud15c \uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
                    System.out.println("[MCASH] Error : KEY2 \uc124\uc815 \uc624\ub958" + this.Key2 + "]");
                    return;
                }
            }
            else {
                this.logLevel = dbProps.getProperty("logLevel", "2");
            }
            this.UserEncode = dbProps.getProperty("UserEncode", "");
            if (this.UserEncode.equals("")) {
                this.UserEncode = "EUC-KR";
            }
        }
        catch (Exception e) {
            this.resultcd = "9001";
            this.resultmsg = "[9001]\uc2dc\uc2a4\ud15c\uc124\uc815 \uc624\ub958\uc785\ub2c8\ub2e4.";
            System.out.println("[MCASH] Error : Mcash.properties \uacbd\ub85c \uc124\uc815 \uc624\ub958");
            e.printStackTrace();
            return;
        }
        this.resultcd = "0000";
    }

    public String makeFileName() {
        final Date dt = new Date();
        final String year = String.valueOf(dt.getYear() + 1900);
        String month = String.valueOf(dt.getMonth() + 1);
        String day = String.valueOf(dt.getDate());
        if (dt.getMonth() < 9) {
            month = "0" + month;
        }
        if (dt.getDate() < 10) {
            day = "0" + day;
        }
        return "Mcash_" + year + month + day + ".txt";
    }

    public void write(final String tmp) {
        try {
            if (!"".equals(this.fileDir)) {
                this.osw.write(tmp);
            }
        }
        catch (Exception ex) {
            System.err.println("[MCASH] Error : Can't write the log file");
        }
    }

    public void writeln(String tmp) {
        tmp = String.valueOf(this.dateStr()) + " => " + tmp + "\n";
        try {
            if (!"".equals(this.fileDir)) {
                this.osw.write(tmp);
            }
        }
        catch (Exception ex) {
            System.err.println("[MCASH] Error : Can't write the log file");
        }
    }

    public void errorln(String tmp) {
        tmp = String.valueOf(this.dateStr()) + " => " + tmp + "\n";
        try {
            if (!"".equals(this.fileDir)) {
                this.osw.write(tmp);
            }
            else {
                System.out.println(tmp);
            }
        }
        catch (Exception ex) {
            System.err.println("[MCASH] Error : Can't write the log file");
        }
    }

    public String dateStr() {
        final Date dt = new Date();
        String hour = String.valueOf(dt.getHours());
        String minute = String.valueOf(dt.getMinutes());
        String second = String.valueOf(dt.getSeconds());
        if (dt.getHours() < 10) {
            hour = "0" + hour;
        }
        if (dt.getMinutes() < 10) {
            minute = "0" + minute;
        }
        if (dt.getSeconds() < 10) {
            second = "0" + second;
        }
        return String.valueOf(hour) + ":" + minute + ":" + second;
    }

    public void close() {
        try {
            if (this.fis != null) {
                this.fis.close();
            }
        }
        catch (IOException ex) {
            System.err.println("[MCASH] Error : Can't close the log file");
        }
        try {
            if (this.osw != null) {
                this.osw.close();
            }
        }
        catch (IOException ex) {
            System.err.println("[MCASH] Error : Can't close the log file");
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

    public String getswitchIp() {
        return this.switchIp;
    }

    public String getResultcd() {
        return this.resultcd;
    }

    public String getResultmsg() {
        return this.resultmsg;
    }

    public int getServerPort() {
        return this.serverPort;
    }

    public String getVer() {
        return this.Ver;
    }

    public String getCryptGB() {
        return this.CryptGB;
    }

    public String getKeySeq() {
        return this.KeySeq;
    }

    public String getKey1() {
        return this.Key1;
    }

    public String getKey2() {
        return this.Key2;
    }

    public String getCipherKey() {
        return this.CipherKey;
    }

    public void setCipherKey(final String tmp) {
        this.CipherKey = tmp;
    }

    public String getUserEncode() {
        return this.UserEncode;
    }

    public void setUserEncode(final String userEncode) {
        this.UserEncode = userEncode;
    }

    public int getRecvTimeOut() {
        return this.recvTimeOut;
    }
}
