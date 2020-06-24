package com.dalbit.payment.module.gift_v0001;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;

public class ConnectSocket {
    private SocketAddress socketAddress;
    private Socket sk;
    private BufferedWriter bw;
    private OutputStreamWriter osw;
    private BufferedReader br;
    private InputStreamReader inr;
    private String result = "";
    private String resultcd = "";

    public ConnectSocket() {
    }

    public void Connect(String paramString1, String paramString2, int paramInt) {
        try {
            FileMaker localFileMaker = new FileMaker();
            int i = 2;

            while(i > 0) {
                try {
                    this.socketAddress = new InetSocketAddress(paramString1, paramInt);
                    this.sk = new Socket();
                    this.sk.connect(this.socketAddress, 3000);
                    localFileMaker.writeln("CONNECT : SERVER IP = [" + paramString1 + "] PORT = [" + paramInt + "]");
                    this.resultcd = "0000";
                    return;
                } catch (Exception var9) {
                    if (i == 1) {
                        try {
                            this.socketAddress = new InetSocketAddress(paramString2, paramInt);
                            this.sk = new Socket();
                            this.sk.connect(this.socketAddress, 3000);
                            localFileMaker.writeln("CONNECT : SWITCH IP = [" + paramString2 + "] PORT = [" + paramInt + "]");
                            this.resultcd = "0000";
                            return;
                        } catch (Exception var8) {
                        }
                    }

                    --i;
                }
            }
        } catch (Exception var10) {
            this.resultcd = "9902";
        }

    }

    public void setSocket(String paramString) {
        try {
            this.osw = new OutputStreamWriter(this.sk.getOutputStream(), "EUC-KR");
            this.bw = new BufferedWriter(this.osw);
            this.bw.write(paramString);
            this.bw.newLine();
            this.bw.flush();
            this.resultcd = "0000";
        } catch (Exception var3) {
            this.resultcd = "9903";
        }

    }

    public void getSocket(String encodeMethod) {
        try {
            this.inr = new InputStreamReader(this.sk.getInputStream(), encodeMethod);
            this.br = new BufferedReader(this.inr);
            this.result = this.br.readLine();
        } catch (IOException var3) {
            this.resultcd = "9904";
        }

    }

    public void close() {
        try {
            if (this.osw == null) {
                this.osw.close();
            }

            if (this.bw == null) {
                this.bw.close();
            }

            if (this.br == null) {
                this.br.close();
            }

            if (this.inr == null) {
                this.inr.close();
            }

            if (this.sk != null) {
                this.sk.close();
            }

            this.resultcd = "0000";
        } catch (Exception var2) {
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
