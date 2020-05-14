package com.dalbit.payment.module.ucCancel_v0001;

public class CancelUc {
    private AckParam ap;

    public AckParam cancelProc(String cashGb, String recordKey, String svcId, String tradeId, String prdtPrice, String mobilId) {
        FileMaker fm = new FileMaker();
        if (!fm.getResultCd().equals("0000")) {
            this.ap.setResultCd(fm.getResultCd());
            this.ap.setResultMsg(fm.getResultMsg());
            fm.writeln("Error : ErrCode[" + fm.getResultCd() + "]" + "ErrMsg[" + fm.getResultMsg() + "]");
            fm.close();
            return this.ap;
        } else {
            fm.writeln("<============ INFO : JSP - VER[" + fm.getVer() + "] SEND START ============>");
            this.ap = new AckParam(cashGb, recordKey, svcId, tradeId, prdtPrice, mobilId, fm.getServerIp(), fm.getServerEncode(), fm.getClientEncode(), fm.getVer(), fm.getServerPort());
            PacketInspect pi = new PacketInspect();
            pi.writeClientLog(this.ap);
            this.ap = pi.checkRequest(this.ap);
            if (!this.ap.getResultCd().equals("0000")) {
                fm.writeln(this.ap.getResultMsg());
                fm.close();
                return this.ap;
            } else {
                ConnectSocket cs = new ConnectSocket();
                cs.Connect(this.ap.getServerIp(), this.ap.getServerPort());
                if (!cs.getResultcd().equals("0000")) {
                    this.ap.setResultCd(cs.getResultcd());
                    this.ap.setResultMsg("[" + cs.getResultcd() + "]Connection Error.");
                    fm.writeln("Error : ErrCode[" + cs.getResultcd() + "] Main[" + this.ap.getServerIp() + "] Port[" + this.ap.getServerPort() + "] 접속오류");
                    fm.close();
                    cs.close();
                    return this.ap;
                } else {
                    try {
                        cs.setSocket(this.ap.getSendPacket(), this.ap.getServerEncode());
                    } catch (Exception var14) {
                        this.ap.setResultCd("9903");
                        this.ap.setResultMsg("[9903]Send Packet Error.");
                        fm.writeln("[9903]Send Packet Error. \n" + var14.toString());
                        fm.close();
                        cs.close();
                        return this.ap;
                    }

                    if (!cs.getResultcd().equals("0000")) {
                        this.ap.setResultCd(cs.getResultcd());
                        this.ap.setResultMsg("[" + cs.getResultcd() + "]Send Packet Error.");
                        fm.writeln("[" + cs.getResultcd() + "]Send Packet Error.");
                        fm.close();
                        cs.close();
                        return this.ap;
                    } else {
                        try {
                            cs.getSocket(this.ap.getServerEncode());
                        } catch (Exception var13) {
                            this.ap.setResultCd("9904");
                            this.ap.setResultMsg("[9904]Receive Packet Error.");
                            fm.writeln("[9904]Receive Packet Error. \n" + var13.toString());
                            fm.close();
                            cs.close();
                            return this.ap;
                        }

                        if (!cs.getResultcd().equals("0000")) {
                            this.ap.setResultCd(cs.getResultcd());
                            this.ap.setResultMsg("[" + cs.getResultcd() + "]Receive Packet Error.");
                            fm.writeln("[" + cs.getResultcd() + "]Receive Packet Error.");
                            fm.close();
                            cs.close();
                            return this.ap;
                        } else {
                            String packet = cs.getResult();
                            cs.close();

                            try {
                                this.ap.getReceiveData(packet);
                            } catch (Exception var12) {
                                this.ap.setResultCd("9907");
                                this.ap.setResultMsg("[9907]Receive Packet Parsing Error.");
                                fm.writeln("[9907]Receive Packet Parsing Error. \n" + var12.toString());
                                fm.close();
                                return this.ap;
                            }

                            if (!this.ap.getResultCd().equals("0000")) {
                                fm.writeln(this.ap.getResultMsg());
                                fm.close();
                                return this.ap;
                            } else {
                                fm.writeln("<============ INFO : JSP - VER[" + fm.getVer() + "] SEND END ============>");
                                fm.close();
                                return this.ap;
                            }
                        }
                    }
                }
            }
        }
    }
}
