package com.dalbit.payment.module.ucCancel_v0001;

import com.dalbit.util.DalbitUtil;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

public class FileMaker {
    private final String PROPERTY_NAME = "mobilians/"+ DalbitUtil.getActiveProfile()+"/CancelUc.properties"; //local, dev

    private FileInputStream fis;
    private FileOutputStream fos;
    private String propertiesName = PROPERTY_NAME;
    private String logLevel = "";
    private String serverIp = "";
    private String fileDir = "";
    private String fileName = "";
    private String resultCd = "";
    private String resultMsg = "";
    private String ver = "";
    private String status = "A";
    private String serverEncode = "";
    private String clientEncode = "";
    private int serverPort;


    public FileMaker() {
        this.propertiesLoad();
        if (this.resultCd.equals("0000")) {
            this.makeFile();
        }

    }

    public void propertiesLoad() {
        InputStream is = null;
        Properties dbProps = new Properties();

        try {
            is = this.getClass().getResourceAsStream(this.propertiesName);
            dbProps.load(is);
            this.fileDir = dbProps.getProperty("LOG_FILE", "");
            if (this.fileDir.equals("")) {
                this.resultCd = "9002";
                this.resultMsg = "[9002]시스템 설정(LOG_FILE) 오류입니다.";
                System.err.println("Error : LOG_FILE 설정 오류 - [" + this.fileDir + "]");
                return;
            }

            this.fileName = this.fileDir + this.makeFileName();
            if (this.fileName.equals("")) {
                this.resultCd = "9002";
                this.resultMsg = "[9002]시스템 설정(LOG_FILE) 오류입니다.";
                System.err.println("Error : LOG_FILE 설정 오류 - [" + this.fileName + "]");
                return;
            }

            this.serverIp = dbProps.getProperty("SERVER_IP", "");
            if (this.serverIp.equals("")) {
                this.resultCd = "9006";
                this.resultMsg = "[9006]시스템 설정(SERVER_IP) 오류입니다.";
                System.err.println("Error : SERVER_IP 설정 오류 - [" + this.serverIp + "]");
                return;
            }

            try {
                this.serverPort = new Integer(dbProps.getProperty("SERVER_PORT", "0"));
            } catch (Exception var4) {
                this.serverPort = 0;
            }

            if (this.serverPort == 0) {
                this.resultCd = "9006";
                this.resultMsg = "[9006]시스템 설정(SERVER_PORT) 오류입니다.";
                System.err.println("Error : SERVER_PORT 설정 오류 - [" + this.serverPort + "]");
                return;
            }

            this.logLevel = dbProps.getProperty("LOG_LEVEL", "1");
            this.serverEncode = dbProps.getProperty("SERVER_ENCODE", "");
            if ("".equals(this.serverEncode)) {
                this.resultCd = "9007";
                this.resultMsg = "[9007]시스템 설정(SERVER_ENCODE) 오류입니다.";
                System.err.println("Error : SERVER_ENCODE 설정 오류 - [" + this.serverEncode + "]");
                return;
            }

            this.clientEncode = dbProps.getProperty("CLIENT_ENCODE", "");
            if ("".equals(this.clientEncode)) {
                this.resultCd = "9008";
                this.resultMsg = "[9008]시스템 설정(CLIENT_ENCODE) 오류입니다.";
                System.err.println("Error : CLIENT_ENCODE 설정 오류 - [" + this.clientEncode + "]");
                return;
            }

            this.ver = dbProps.getProperty("VER", "");
            if (this.ver.length() != 4) {
                this.resultCd = "9009";
                this.resultMsg = "[9009]시스템 설정(VER) 오류입니다.";
                System.out.println("Error : VER 설정 오류 - [" + this.ver + "]");
                return;
            }
        } catch (Exception var5) {
            this.status = "B";
            this.resultCd = "9013";
            this.resultMsg = "[9013] CancelUc.properties not found";
            System.err.println("[9013] CancelUc.properties not found");
            return;
        }

        this.resultCd = "0000";
        this.resultMsg = "[0000]Properties load complete.";
    }

    public String makeFileName() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String today = dateFormat.format(new Date());
        return "CancelUc_" + today + ".txt";
    }

    public void makeFile() {
        try {
            File f = new File(this.fileDir);
            if (!f.exists()) {
                f.mkdir();
            }

            this.fos = new FileOutputStream(this.fileName, true);
            this.resultCd = "0000";
        } catch (IOException var2) {
            this.resultCd = "9225";
            this.resultMsg = "Mobilians CancelUc Error ==> Can't make the log file";
            System.err.println("Mobilians CancelUc Error ==> Can't make the log file");
        }

    }

    public void write(String tmp) {
        try {
            if ("2".equals(this.logLevel)) {
                this.fos.write(tmp.getBytes());
            }
        } catch (Exception var3) {
            System.err.println("Mobilians CancelUc Error ==> Can't write the log file");
        }

    }

    public void writeln(String tmp) {
        tmp = this.dateStr() + " => " + tmp + "\n";

        try {
            if ("2".equals(this.logLevel)) {
                this.fos.write(tmp.getBytes());
            }
        } catch (Exception var3) {
            System.err.println("Mobilians CancelUc Error ==> Can't write the log file");
        }

    }

    public void errorln(String tmp) {
        tmp = this.dateStr() + "    Error => " + tmp + "\n";

        try {
            if ("2".equals(this.logLevel) || "1".equals(this.logLevel)) {
                this.fos.write(tmp.getBytes());
            }
        } catch (Exception var3) {
            System.err.println("Mobilians CancelUc Error ==> Can't write the log file");
        }

    }

    public String dateStr() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("HHmmss");
        String thisTime = dateFormat.format(new Date());
        String hour = thisTime.substring(0, 2);
        String minute = thisTime.substring(2, 4);
        String second = thisTime.substring(4, 6);
        return hour + ":" + minute + ":" + second;
    }

    public void close() {
        try {
            if (this.fis != null) {
                this.fis.close();
            }
        } catch (IOException var3) {
            System.err.println("Mobilians CancelUc Error ==> Can't close the log file");
        }

        try {
            if (this.fos != null) {
                this.fos.close();
            }
        } catch (IOException var2) {
            System.err.println("Mobilians CancelUc Error ==> Can't close the log file");
        }

    }

    public String getVer() {
        return this.ver;
    }

    public String getLogLevel() {
        return this.logLevel;
    }

    public String getServerIp() {
        return this.serverIp;
    }

    public String getResultCd() {
        return this.resultCd;
    }

    public String getResultMsg() {
        return this.resultMsg;
    }

    public String getServerEncode() {
        return this.serverEncode;
    }

    public String getClientEncode() {
        return this.clientEncode;
    }

    public int getServerPort() {
        return this.serverPort;
    }

    public String getStatus() {
        return this.status;
    }
}
