package com.dalbit.payment.module.gift_v0001;

import com.dalbit.util.DalbitUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

public class FileMaker {
    //private final String PROPERTY_NAME = "/mobilians/"+ DalbitUtil.getActiveProfile()+"/McashGift.properties"; //local, dev
    private final String PROPERTY_NAME = "/mobilians/local/McashGift.properties"; //local, dev

    private FileInputStream fis;
    private FileOutputStream fos;
    private String logLevel;
    private String serverIp;
    private String switchIp = "";
    private int serverPort = 0;
    private String userEncode = "EUC-KR";
    private String propertiesName = PROPERTY_NAME;
    private String fileDir = "";
    private String fileName = "";
    private String resultcd = "";
    private String resultmsg = "";
    private String Key1 = "";
    private String Key2 = "";
    private String CryptGB = "";
    private String KeySeq = "";
    private String CipherKey = "";


    public FileMaker() {
        this.propertiesLoad();
        this.makeFile();
    }

    public String makeFile() {
        try {
            File localFile = new File(this.fileDir);
            if (!localFile.exists()) {
                localFile.mkdir();
            }

            this.fos = new FileOutputStream(this.fileName, true);
            this.resultcd = "0000";
            return this.resultcd;
        } catch (IOException var2) {
            this.errorln("[MCASH] Error : 디렉토리, 파일 생성 오류 - [" + this.fileName + "]" + var2.toString());
            this.resultcd = "9002";
            this.resultmsg = "[9002]로그파일 생성 실패 오류입니다.";
            return this.resultcd;
        }
    }

    public void propertiesLoad() {
        InputStream localInputStream = null;
        Properties localProperties = new Properties();

        try {
            localInputStream = super.getClass().getResourceAsStream(this.propertiesName);
            localProperties.load(localInputStream);
            this.fileDir = localProperties.getProperty("LogFile", "");
            if (this.fileDir.equals("")) {
                this.resultcd = "9002";
                this.resultmsg = "[9002]로그파일 설정 오류입니다.";
                this.errorln("[MCASH] Error : 로그파일 설정 오류 - [" + this.fileDir + "]");
                return;
            }

            this.fileName = this.fileDir + this.makeFileName();
            if (this.fileName.equals("")) {
                this.resultcd = "9002";
                this.resultmsg = "[9002]로그파일 설정 오류입니다.";
                this.errorln("[MCASH] Error : 로그파일 설정 오류 - [" + this.fileName + "]");
                return;
            }

            this.makeFile();
            this.serverIp = localProperties.getProperty("SERVER_IP", "");
            if (this.serverIp.equals("")) {
                this.resultcd = "9002";
                this.resultmsg = "[9003]서버 설정 오류입니다.";
                this.errorln("[MCASH] Error : SERVER_IP 설정 오류 - [" + this.serverIp + "]");
                return;
            }

            this.switchIp = localProperties.getProperty("SWITCH_IP", "");
            if (this.switchIp.equals("")) {
                this.resultcd = "9003";
                this.resultmsg = "[9003]서버 설정 오류입니다.";
                this.errorln("[MCASH] Error : SWITCH_IP 설정 오류 - [" + this.switchIp + "]");
                return;
            }

            this.userEncode = localProperties.getProperty("UserEncode", "");
            if (this.userEncode.equals("")) {
                this.resultcd = "9004";
                this.resultmsg = "[9004]인코딩 설정 오류입니다.";
                this.errorln("[MCASH] Error : UserEncode 설정 오류 - [" + this.userEncode + "]");
                return;
            }

            this.KeySeq = localProperties.getProperty("CURKEY", "");
            if (!this.KeySeq.equals("0") && !this.KeySeq.equals("1") && !this.KeySeq.equals("2")) {
                this.resultcd = "9005";
                this.resultmsg = "[9005]CURKEY 설정 오류입니다.";
                this.errorln("[MCASH] Error : CURKEY 설정 오류 - [" + this.KeySeq + "]");
                return;
            }

            if (this.KeySeq.equals("1")) {
                this.Key1 = localProperties.getProperty("KEY1", "");
                if (this.Key1.equals("") || this.Key1.length() != 8) {
                    this.resultcd = "9005";
                    this.resultmsg = "[9005]CURKEY 설정 오류입니다.";
                    this.errorln("[MCASH] Error : KEY1 설정 오류 - [" + this.Key1 + "]");
                    return;
                }
            } else if (this.KeySeq.equals("2")) {
                this.Key2 = localProperties.getProperty("KEY2", "");
                if (this.Key2.equals("") || this.Key2.length() != 8) {
                    this.resultcd = "9005";
                    this.resultmsg = "[9005]CURKEY 설정 오류입니다.";
                    this.errorln("[MCASH] Error : KEY2 설정 오류" + this.Key2 + "]");
                    return;
                }
            } else {
                this.logLevel = localProperties.getProperty("logLevel", "2");
            }
        } catch (Exception var4) {
            this.resultcd = "9001";
            this.resultmsg = "[9001]설정파일을 찾을 수 없습니다.";
            this.errorln("[MCASH] Error : properties 경로 설정 오류");
            return;
        }

        this.resultcd = "0000";
    }

    public String makeFileName() {
        Date localDate = new Date();
        String str1 = String.valueOf(localDate.getYear() + 1900);
        String str2 = String.valueOf(localDate.getMonth() + 1);
        String str3 = String.valueOf(localDate.getDate());
        if (localDate.getMonth() < 9) {
            str2 = "0" + str2;
        }

        if (localDate.getDate() < 10) {
            str3 = "0" + str3;
        }

        return "McashGift_" + str1 + str2 + str3 + ".txt";
    }

    public void write(String paramString) {
        try {
            this.fos.write(paramString.getBytes());
        } catch (Exception var3) {
            this.errorln("[MCASH] Error : Can't write the log file");
        }

    }

    public void writeln(String paramString) {
        paramString = this.dateStr() + " => " + paramString + "\n";

        try {
            this.fos.write(paramString.getBytes());
        } catch (Exception var3) {
            this.errorln("[MCASH] Error : Can't write the log file");
        }

    }

    public void errorln(String paramString) {
        paramString = this.dateStr() + "    Error => " + paramString + "\n";

        try {
            this.fos.write(paramString.getBytes());
        } catch (Exception var3) {
            this.errorln("[MCASH] Error : Can't write the log file");
        }

    }

    public String dateStr() {
        Date localDate = new Date();
        String str1 = String.valueOf(localDate.getHours());
        String str2 = String.valueOf(localDate.getMinutes());
        String str3 = String.valueOf(localDate.getSeconds());
        if (localDate.getHours() < 10) {
            str1 = "0" + str1;
        }

        if (localDate.getMinutes() < 10) {
            str2 = "0" + str2;
        }

        if (localDate.getSeconds() < 10) {
            str3 = "0" + str3;
        }

        return str1 + ":" + str2 + ":" + str3;
    }

    public void close() {
        try {
            if (this.fis != null) {
                this.fis.close();
            }
        } catch (IOException var3) {
            this.errorln("[MCASH] Error : Can't close the log file");
        }

        try {
            if (this.fos != null) {
                this.fos.close();
            }
        } catch (IOException var2) {
            this.errorln("[MCASH] Error : Can't close the log file");
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

    public String getSwitchIp() {
        return this.switchIp;
    }

    public String getUserEncode() {
        return this.userEncode;
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

    public void setCipherKey(String paramString) {
        this.CipherKey = paramString;
    }
}