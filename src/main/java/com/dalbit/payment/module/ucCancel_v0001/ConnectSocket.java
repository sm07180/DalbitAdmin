package com.dalbit.payment.module.ucCancel_v0001;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.net.Socket;

@Slf4j
public class ConnectSocket {
    private Socket sk;
    private BufferedWriter bw;
    private BufferedReader br;
    private OutputStreamWriter osw;
    private InputStreamReader inr;
    private String result = "";
    private String resultcd = "";
    private OutputStream os = null;

    public ConnectSocket() {
    }

    public void Connect(String serverIp, int serverPort) {
        try {
            this.sk = new Socket(serverIp, serverPort);
            this.resultcd = "0000";
        } catch (Exception var4) {
            this.resultcd = "9902";
            var4.printStackTrace();
            log.error(var4.toString());
        }

    }

    public void setSocket(String tmp, String encodingType) {
        try {
            FileMaker fm = new FileMaker();
            this.osw = new OutputStreamWriter(this.sk.getOutputStream(), encodingType);
            this.bw = new BufferedWriter(this.osw);
            fm.writeln("================ setSocket_encode ================");
            fm.writeln("param encode: " + encodingType);
            fm.writeln("this encode: " + this.osw.getEncoding());
            fm.writeln("utf-8 length: " + tmp.getBytes("UTF-8").length);
            fm.writeln("euc-kr length: " + tmp.getBytes("EUC-KR").length);
            fm.writeln("default length: " + tmp.getBytes().length);
            fm.writeln("string length: " + tmp.length());
            fm.writeln("packet [\n" + tmp + "\n]");
            fm.writeln("================ setSocket_encode ================");
            this.bw.write(tmp);
            this.bw.newLine();
            this.bw.flush();
            fm.close();
            this.resultcd = "0000";
        } catch (IOException var4) {
            this.resultcd = "9903";
        }

    }

    public void getSocket(String encodingType) {
        char[] buf = new char[1024];
        StringBuffer sbuf = new StringBuffer();

        try {
            FileMaker fm = new FileMaker();
            this.inr = new InputStreamReader(this.sk.getInputStream(), encodingType);

            int rtn;
            do {
                rtn = this.inr.read(buf, 0, buf.length);
                if (rtn != -1) {
                    sbuf.append(new String(buf, 0, rtn));
                }
            } while(rtn == buf.length);

            this.result = sbuf.toString();
            fm.writeln("================ getSocket_encode ================");
            fm.writeln("param encode: " + encodingType);
            fm.writeln("this encode: " + this.inr.getEncoding());
            fm.writeln("utf-8 length: " + this.result.getBytes("UTF-8").length);
            fm.writeln("euc-kr length: " + this.result.getBytes("EUC-KR").length);
            fm.writeln("default length: " + this.result.getBytes().length);
            fm.writeln("string length: " + this.result.length());
            fm.writeln("packet [\n" + this.result + "\n]");
            fm.writeln("================ getSocket_encode ================");
            fm.close();
            this.resultcd = "0000";
        } catch (IOException var6) {
            var6.printStackTrace();
            this.resultcd = "9904";
        }

    }

    public void close() {
        try {
            if (this.os != null) {
                this.os.close();
            }

            if (this.osw != null) {
                this.osw.close();
            }

            if (this.bw != null) {
                this.bw.close();
            }

            if (this.br != null) {
                this.br.close();
            }

            if (this.inr != null) {
                this.inr.close();
            }

            if (this.sk != null) {
                this.sk.close();
            }

            this.resultcd = "0000";
        } catch (Exception var2) {
            this.resultcd = "9999";
            log.error("Mobilians CancelUc Error ==> Can't close the connection");
        }

    }

    public String getResult() {
        return this.result;
    }

    public String getResultcd() {
        return this.resultcd;
    }
}
