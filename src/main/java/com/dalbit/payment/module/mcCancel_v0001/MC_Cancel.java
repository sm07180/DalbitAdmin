package com.dalbit.payment.module.mcCancel_v0001;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketTimeoutException;

@Slf4j
public class MC_Cancel {

    private Socket sk;
    private SocketAddress socketAddress;
    private BufferedWriter bw;
    private OutputStreamWriter osw;
    private BufferedReader br;
    private InputStreamReader inr;
    private InputStream in;
    private String result = "";
    private String mcht_id;
    private String svc_id;
    String trade_id;
    String prdt_price;
    String mobil_id;
    String result_cd = "";
    String returnMsg;
    String serverIp;
    int serverPort;
    String switchIp;
    int recvTimeOut = 0;
    FileMaker fm = new FileMaker();
    private String configPath = "";

    public MC_Cancel() {
        this.serverIp = this.fm.getServerIp();
        this.serverPort = this.fm.getServerPort();
        this.switchIp = this.fm.getSwitchIp();
    }

    public void setConfigFileDir(String dirPath) {
        this.configPath = dirPath;
        this.fm = new FileMaker(this.configPath);
        this.serverIp = this.fm.getServerIp();
        this.serverPort = this.fm.getServerPort();
        this.switchIp = this.fm.getSwitchIp();
    }

    public void setServerInfo(String serverIp, int serverPort, String switchIp, int recvTimeOut, String logDir) {
        this.serverIp = serverIp;
        this.serverPort = serverPort;
        this.switchIp = switchIp;
        this.recvTimeOut = recvTimeOut;
        this.fm = new FileMaker(serverIp, serverPort, switchIp, recvTimeOut, logDir, "2");
    }

    public String cancel_attempt(String mcht_id, String svc_id, String trade_id, String prdt_price, String mobil_id) throws IOException {
        this.fm.writeln("== CANCEL INFO ==");
        this.serverIp = this.fm.getServerIp();
        this.serverPort = this.fm.getServerPort();
        this.switchIp = this.fm.getSwitchIp();
        if (svc_id != null && svc_id.length() == 12) {
            if (mcht_id == null || mcht_id.length() != 8) {
                mcht_id = svc_id.substring(0, 8);
            }

            this.fm.writeln("== SEND - MCHTID [" + mcht_id + "] SVCID [" + svc_id + "] TRADEID [" + trade_id + "] PRDTPRICE [" + prdt_price + "] MOBILID [" + mobil_id + "]");
            if (trade_id.length() != 40) {
                trade_id = this.fixPacket(40, trade_id);
            }

            if (prdt_price.length() != 10) {
                prdt_price = this.fixPacket_home(10, prdt_price);
            }

            if (mobil_id.length() != 10) {
                mobil_id = this.fixPacket(10, mobil_id);
            }

            String sendData = mcht_id + svc_id + trade_id + prdt_price + mobil_id + "0000";

            String var9;
            try {
                this.Connect();
                if (!this.result_cd.equals("0000")) {
                    var9 = this.result_cd;
                    return var9;
                }

                this.setSocket(sendData);
                if (this.result_cd.equals("0000")) {
                    this.getSocket();
                    if (!this.result_cd.equals("0000")) {
                        var9 = this.result_cd;
                        return var9;
                    }

                    String temp = this.returnMsg;
                    var9 = temp;
                    return var9;
                }

                var9 = this.result_cd;
            } finally {
                this.close();
            }

            return var9;
        } else {
            this.fm.writeln("INVALID_SVCID :[" + svc_id + "]");
            return "204";
        }
    }

    private String fixPacket(int size, String w) {
        StringBuffer sb = new StringBuffer();
        sb.append(w);

        for(int i = 0; i < size - w.length(); ++i) {
            sb.append(" ");
        }

        return sb.toString();
    }

    private String fixPacket_home(int size, String w) {
        StringBuffer sb = new StringBuffer();

        for(int i = 0; i < size - w.length(); ++i) {
            sb.append("0");
        }

        sb.append(w);
        return sb.toString();
    }

    public void Connect() {
        int count = 2;

        while(count > 0) {
            try {
                this.socketAddress = new InetSocketAddress(this.serverIp, this.serverPort);
                this.sk = new Socket();
                this.sk.connect(this.socketAddress, 3000);
                this.fm.writeln("== CONNECT OK SERVER_IP == [" + this.fm.getServerIp() + " : " + this.fm.getServerPort() + "]");
                this.result_cd = "0000";
                if (this.fm.getRecvTimeOut() > 0) {
                    this.sk.setSoTimeout(this.fm.getRecvTimeOut());
                }

                return;
            } catch (Exception var5) {
                if (count == 1) {
                    try {
                        this.socketAddress = new InetSocketAddress(this.switchIp, this.serverPort);
                        this.sk = new Socket();
                        this.sk.connect(this.socketAddress, 3000);
                        this.fm.writeln("== CONNECT OK SWITCH_IP == [" + this.fm.getSwitchIp() + " : " + this.fm.getServerPort() + "]");
                        this.result_cd = "0000";
                        if (this.fm.getRecvTimeOut() > 0) {
                            this.sk.setSoTimeout(this.fm.getRecvTimeOut());
                        }

                        return;
                    } catch (Exception var4) {
                        log.error("connect fail");
                        this.fm.writeln("== CONNECT FAIL == " + this.serverIp + ": " + this.serverPort);
                        this.result_cd = "101";
                    }
                }

                --count;
            }
        }

    }

    public void setSocket(String tmp) {
        try {
            this.osw = new OutputStreamWriter(this.sk.getOutputStream());
            this.bw = new BufferedWriter(this.osw);
            this.bw.write(tmp);
            this.bw.newLine();
            this.bw.flush();
            this.result_cd = "0000";
        } catch (IOException var3) {
            this.result_cd = "102";
        }

    }

    public void getSocket() {
        try {
            this.inr = new InputStreamReader(this.sk.getInputStream(), "EUC-KR");
            this.br = new BufferedReader(this.inr);
            this.result = this.br.readLine();
            this.result_cd = "0000";
            this.returnMsg = this.result.substring(this.result.length() - 4);
            this.fm.writeln("== RECV - RESULTCD [" + this.result.substring(this.result.length() - 4) + "]");
        } catch (SocketTimeoutException var2) {
            this.fm.writeln("== ERROE RECV TIMEOUT == ");
            this.result_cd = "105";
        } catch (Exception var3) {
            var3.printStackTrace();
            this.result_cd = "103";
        }

    }

    public void close() {
        try {
            if (this.osw == null) {
                this.osw.close();
            }
        } catch (Exception var6) {
        }

        try {
            if (this.bw == null) {
                this.bw.close();
            }
        } catch (Exception var5) {
        }

        try {
            if (this.in == null) {
                this.in.close();
            }
        } catch (Exception var4) {
        }

        try {
            if (this.sk == null) {
                this.sk.close();
            }
        } catch (Exception var3) {
        }

        try {
            if (this.fm == null) {
                this.fm.close();
            }
        } catch (Exception var2) {
        }

    }

    public String getResult() {
        return this.result;
    }

    public String getResultcd() {
        return this.result_cd;
    }

    public static void main(String[] args) {
        MC_Cancel temp = new MC_Cancel();
        temp.mcht_id = "00073001";
        temp.svc_id = "000730010001";
        temp.trade_id = "날짜_아이디";
        temp.prdt_price = "100";
        temp.mobil_id = "125114432";

        try {
            temp.cancel_attempt(temp.mcht_id, temp.svc_id, temp.trade_id, temp.prdt_price, temp.mobil_id);
        } catch (Exception var3) {
            var3.printStackTrace();
        }

    }

}
