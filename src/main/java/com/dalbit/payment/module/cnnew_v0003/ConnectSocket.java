package com.dalbit.payment.module.cnnew_v0003;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketTimeoutException;

public class ConnectSocket {
    private SocketAddress socketAddress;
    private Socket sk;
    private BufferedWriter bw;
    private OutputStreamWriter osw;
    private BufferedReader br;
    private InputStreamReader inr;
    private String result;
    private String resultcd;
    private String configPath;

    public ConnectSocket(final String configPath) {
        this.result = "";
        this.resultcd = "";
        this.configPath = "";
        this.configPath = configPath;
    }

    public void Connect(final String fmServerIP, final String fmswitchIp, final int fmServerPort, final int recvTimeOut, final String logDir) {
        try {
            final FileMaker fm = new FileMaker(this.configPath, logDir);
            int count = 2;
            while (count > 0) {
                try {
                    this.socketAddress = new InetSocketAddress(fmServerIP, fmServerPort);
                    (this.sk = new Socket()).connect(this.socketAddress, 3000);
                    this.resultcd = "0000";
                    fm.writeln("INFO : connect ok Serverip[" + fmServerIP + "] Port[" + fmServerPort + "]");
                    fm.close();
                    if (recvTimeOut > 0) {
                        this.sk.setSoTimeout(recvTimeOut);
                    }
                }
                catch (Exception e) {
                    if (count == 1) {
                        try {
                            this.socketAddress = new InetSocketAddress(fmswitchIp, fmServerPort);
                            (this.sk = new Socket()).connect(this.socketAddress, 3000);
                            this.resultcd = "0000";
                            fm.writeln("INFO : connect ok Serverip[" + fmswitchIp + "] Port[" + fmServerPort + "]");
                            fm.close();
                            if (recvTimeOut > 0) {
                                this.sk.setSoTimeout(recvTimeOut);
                            }
                            return;
                        }
                        catch (Exception ex2) {
                            this.resultcd = "9902";
                        }
                    }
                    --count;
                }
            }
        }
        catch (Exception ex3) {
            this.resultcd = "9902";
        }
    }

    public void setSocket(final String tmp) {
        try {
            this.osw = new OutputStreamWriter(this.sk.getOutputStream());
            (this.bw = new BufferedWriter(this.osw)).write(tmp);
            this.bw.newLine();
            this.bw.flush();
            this.resultcd = "0000";
        }
        catch (Exception ex2) {
            this.resultcd = "9903";
        }
    }

    public void setSocket(final String tmp, final String EncodeMethod, final String logDir) {
        try {
            final FileMaker fm = new FileMaker(this.configPath, logDir);
            fm.writeln("DEBUG : SEND setSocket length[" + tmp.getBytes().length + "] PACKET[" + tmp.toString() + "]");
            this.osw = new OutputStreamWriter(this.sk.getOutputStream(), EncodeMethod);
            (this.bw = new BufferedWriter(this.osw)).write(tmp);
            this.bw.newLine();
            this.bw.flush();
            this.resultcd = "0000";
            fm.close();
        }
        catch (Exception ex2) {
            this.resultcd = "9903";
        }
    }

    public void getSocket(final String EncodeMethod, final String logDir) {
        try {
            this.inr = new InputStreamReader(this.sk.getInputStream(), EncodeMethod);
            this.br = new BufferedReader(this.inr);
            this.result = this.br.readLine();
            final FileMaker fm = new FileMaker(this.configPath, logDir);
            fm.writeln("DEBUG : RECV getSocket length[" + this.result.getBytes(EncodeMethod).length + "] PACKET[" + this.result.toString() + "]");
            this.resultcd = "0000";
            fm.close();
        }
        catch (SocketTimeoutException se) {
            this.resultcd = "9905";
        }
        catch (IOException ex) {
            this.resultcd = "9904";
        }
    }

    public void close() {
        try {
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
        }
        catch (Exception ex) {
            this.resultcd = "9999";
        }
    }

    public String getResult() {
        return this.result;
    }

    public String getResultcd() {
        return this.resultcd;
    }
}
