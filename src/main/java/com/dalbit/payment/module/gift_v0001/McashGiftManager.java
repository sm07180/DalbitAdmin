package com.dalbit.payment.module.gift_v0001;

public class McashGiftManager {
    private String serverIp = "";
    private String switchIP = "";
    private int serverPort = 0;
    private String userEncode = "EUC-KR";
    private String ver = "";

    public McashGiftManager() {
    }

    public AckParam McasApprv(String mode, String recordKey, String svcId, String tradeId, String prdtCd, String prdtNm, String prdtPrice, String userId, String userName, String userPhoneno, String userSocNo, String userEmail, String userIp, String emailFlag, String item, String mobilId, String cUser, String cPass, String authType, String authNo, String scratchNo, String card1, String card2, String card3, String card4, String card5) {
        return this.McashApprv(mode, recordKey, svcId, tradeId, prdtCd, prdtNm, prdtPrice, userId, userName, userPhoneno, userSocNo, userEmail, userIp, emailFlag, item, mobilId, (String)null, cUser, cPass, authType, authNo, scratchNo, card1, (String)null, card2, (String)null, card3, (String)null, card4, (String)null, card5, (String)null, "GM");
    }

    public AckParam McasApprv(String mode, String recordKey, String svcId, String tradeId, String prdtCd, String prdtNm, String prdtPrice, String userId, String userEmail, String userIp, String emailFlag, String item, String mobilId, String hmUser, String hmPass, String scratchCnt, String card1, String cardPw1, String card2, String cardPw2, String card3, String cardPw3, String card4, String cardPw4, String card5, String cardPw5, String ex1, String ex2) {
        return this.McashApprv(mode, recordKey, svcId, tradeId, prdtCd, prdtNm, prdtPrice, userId, (String)null, (String)null, (String)null, userEmail, userIp, emailFlag, item, mobilId, (String)null, hmUser, hmPass, (String)null, (String)null, scratchCnt, card1, cardPw1, card2, cardPw2, card3, cardPw3, card4, cardPw4, card5, cardPw5, "HM");
    }

    public AckParam McasApprv(String mode, String recordKey, String svcId, String tradeId, String prdtCd, String prdtNm, String prdtPrice, String userId, String userName, String userPhoneno, String userSocNo, String userEmail, String userIp, String emailFlag, String item, String mobilId, String bnlId, String bnlPass, String scratchNo, String card1, String cardPw1, String card2, String cardPw2, String card3, String cardPw3, String card4, String cardPw4, String card5, String cardPw5) {
        return this.McashApprv(mode, recordKey, svcId, tradeId, prdtCd, prdtNm, prdtPrice, userId, userName, userPhoneno, userSocNo, userEmail, userIp, emailFlag, item, mobilId, (String)null, bnlId, bnlPass, (String)null, (String)null, scratchNo, card1, cardPw1, card2, cardPw2, card3, cardPw3, card4, cardPw4, card5, cardPw5, "GC");
    }

    public AckParam McasApprv(String mode, String recordKey, String svcId, String tradeId, String prdtCd, String prdtNm, String prdtPrice, String userId, String userName, String userPhoneno, String userSocNo, String emailFlag, String userEmail, String userIp, String item, String mobilId, String scratchNo, String card1, String cardPw1, String card2, String cardPw2, String card3, String cardPw3, String card4, String cardPw4, String card5, String cardPw5) {
        return this.McashApprv(mode, recordKey, svcId, tradeId, prdtCd, prdtNm, prdtPrice, userId, userName, userPhoneno, userSocNo, userEmail, userIp, emailFlag, item, mobilId, (String)null, (String)null, (String)null, (String)null, (String)null, scratchNo, card1, (String)null, card2, (String)null, card3, (String)null, card4, (String)null, card5, (String)null, "GG");
    }

    public AckParam McasApprv(String mode, String recordKey, String svcId, String tradeId, String prdtNm, String prdtPrice, String userId, String userName, String userPhoneno, String userSocNo, String userEmail, String userIp, String emailFlag, String item, String scratchNo, String card1, String card2, String card3, String card4, String card5) {
        return this.McashApprv(mode, recordKey, svcId, tradeId, (String)null, prdtNm, prdtPrice, userId, userName, userPhoneno, userSocNo, userEmail, userIp, emailFlag, item, (String)null, (String)null, (String)null, (String)null, (String)null, (String)null, scratchNo, card1, (String)null, card2, (String)null, card3, (String)null, card4, (String)null, card5, (String)null, "FC");
    }

    public AckParam McasApprv(String mode, String recordKey, String svcId, String tradeId, String prdtPrice, String mobilId, String reqCards, String subReq1, String card1, String price1, String subReq2, String card2, String price2, String subReq3, String card3, String price3, String subReq4, String card4, String price4, String subReq5, String card5, String price5) {
        return this.McashApprv(mode, recordKey, svcId, tradeId, (String)null, (String)null, prdtPrice, (String)null, (String)null, (String)null, (String)null, (String)null, (String)null, (String)null, (String)null, mobilId, subReq1, subReq2, subReq3, subReq4, subReq5, reqCards, card1, price1, card2, price2, card3, price3, card4, price4, card5, price5, "FC");
    }

    public AckParam McashApprv(String mode, String recordKey, String svcId, String tradeId, String prdtCd, String prdtNm, String prdtPrice, String userId, String userName, String userPhoneno, String userSocNo, String userEmail, String userIp, String emailFlag, String item, String mobilId, String payType, String user, String pass, String authType, String authNo, String scratchCnt, String card1, String cardPw1, String card2, String cardPw2, String card3, String cardPw3, String card4, String cardPw4, String card5, String cardPw5, String cashGb) {
        AckParam ack = new AckParam();
        ack.setMode(mode);
        ack.setRecordkey(recordKey);
        ack.setSvcid(svcId);
        ack.setTradeid(tradeId);
        if (cashGb != "FC") {
            ack.setPrdtcd(prdtCd);
        }

        ack.setPrdtnm(prdtNm);
        ack.setPrdtprice(prdtPrice);
        ack.setUserid(userId);
        ack.setUsername(userName);
        ack.setUserphoneno(userPhoneno);
        ack.setUsersocialno(userSocNo);
        ack.setUseremail(userEmail);
        ack.setUserhost(userIp);
        ack.setEmailflag(emailFlag);
        ack.setItem(item);
        ack.setMobilid(mobilId);
        if (cashGb == "GM" || cashGb == "GC" || cashGb == "HM") {
            ack.setUser(user);
            ack.setPass(pass);
        }

        if (cashGb == "GM") {
            ack.setAuthtype(authType);
            ack.setAuthno(authNo);
        }

        ack.setReqcards(scratchCnt);
        ack.setPinno1(card1);
        ack.setPinno2(card2);
        ack.setPinno3(card3);
        ack.setPinno4(card4);
        ack.setPinno5(card5);
        if (cashGb == "HM" || cashGb == "GC") {
            ack.setPinpw1(cardPw1);
            ack.setPinpw2(cardPw2);
            ack.setPinpw3(cardPw3);
            ack.setPinpw4(cardPw4);
            ack.setPinpw5(cardPw5);
        }

        if (cashGb == "FC") {
            ack.setSubreq1(payType);
            ack.setSubreq2(user);
            ack.setSubreq3(pass);
            ack.setSubreq4(authType);
            ack.setSubreq5(authNo);
            ack.setCardprice1(cardPw1);
            ack.setCardprice2(cardPw2);
            ack.setCardprice3(cardPw3);
            ack.setCardprice4(cardPw4);
            ack.setCardprice5(cardPw5);
        }

        if (cashGb == "GM") {
            this.ver = "9001";
            this.serverPort = 35201;
        } else if (cashGb == "GC") {
            this.ver = "0001";
            this.serverPort = 35401;
        } else if (cashGb == "GG") {
            this.ver = "0001";
            this.serverPort = 35701;
        } else if (cashGb == "HM") {
            this.ver = "9001";
            this.serverPort = 35501;
        } else if (cashGb == "FC") {
            this.ver = "9001";
            this.serverPort = 35101;
        }

        FileMaker localFileMaker = new FileMaker();
        if (!localFileMaker.getResultcd().equals("0000")) {
            ack.setResultcd(localFileMaker.getResultcd());
            ack.setResultmsg(localFileMaker.getResultmsg());
            localFileMaker.writeln("Error : ErrCode[" + localFileMaker.getResultcd() + "]" + "ErrMsg[" + localFileMaker.getResultmsg() + "]");
            localFileMaker.close();
            return ack;
        } else {
            localFileMaker.writeln("iNFO : CASHGB [ " + cashGb + " ] - VER [ " + this.ver + " ] SEND DATA ============>");
            this.serverIp = localFileMaker.getServerIp();
            this.switchIP = localFileMaker.getSwitchIp();
            this.userEncode = localFileMaker.getUserEncode();
            PacketInspect localPacketInspect = new PacketInspect();
            ack = localPacketInspect.checkRequest(ack, cashGb);
            if (!ack.getResultcd().equals("0000")) {
                localFileMaker.close();
                return ack;
            } else {
                ack.setVer(this.ver);
                ack.setKeySeq(localFileMaker.getKeySeq());
                if (localFileMaker.getKeySeq().equals("0")) {
                    ack.setCipherKey(ack.getSvcid().substring(0, 8) + ack.getSvcid().substring(0, 8));
                } else if (localFileMaker.getKeySeq().equals("1")) {
                    ack.setCipherKey(localFileMaker.getKey1() + ack.getSvcid().substring(0, 8));
                } else {
                    ack.setCipherKey(localFileMaker.getKey2() + ack.getSvcid().substring(0, 8));
                }

                localPacketInspect.writeClientLog(ack, cashGb);
                ConnectSocket localConnectSocket = new ConnectSocket();
                localConnectSocket.Connect(this.serverIp, this.switchIP, this.serverPort);
                if (!localConnectSocket.getResultcd().equals("0000")) {
                    ack.setResultcd(localConnectSocket.getResultcd());
                    ack.setResultmsg("[9902]통신 오류입니다.");
                    localFileMaker.writeln("Error : ErrCode[" + localConnectSocket.getResultcd() + "] 메인 [" + this.serverIp + "] DR[" + this.switchIP + "] PORT[" + this.serverPort + "] 접속오류");
                    localFileMaker.close();
                    localConnectSocket.close();
                    return ack;
                } else {
                    try {
                        localConnectSocket.setSocket(ack.getSocketStr("EUC-KR", cashGb));
                    } catch (Exception var40) {
                        var40.printStackTrace();
                        ack.setResultcd("9903");
                        ack.setResultmsg("[9903]통신 오류입니다.");
                        localFileMaker.writeln("Error : ErrCode[" + localConnectSocket.getResultcd() + "] PACKET SEND EXCEPTION - " + var40.toString());
                        localFileMaker.close();
                        localConnectSocket.close();
                        return ack;
                    }

                    if (!localConnectSocket.getResultcd().equals("0000")) {
                        ack.setResultcd(localConnectSocket.getResultcd());
                        ack.setResultmsg("[9903]통신 오류입니다.");
                        localFileMaker.writeln("Error : ErrCode[" + localConnectSocket.getResultcd() + "] PACKET SEND TCP/IP SOCKET 통신 오류");
                        localFileMaker.close();
                        localConnectSocket.close();
                        return ack;
                    } else {
                        try {
                            localConnectSocket.getSocket(this.userEncode);
                        } catch (Exception var39) {
                            ack.setResultcd("9904");
                            ack.setResultmsg("[9904]통신 오류입니다.");
                            localFileMaker.writeln("Error : ErrCode[" + localConnectSocket.getResultcd() + "] PACKET RECV EXCEPTION - " + var39.toString());
                            localFileMaker.close();
                            localConnectSocket.close();
                            return ack;
                        }

                        if (!localConnectSocket.getResultcd().equals("0000")) {
                            ack.setResultcd(localConnectSocket.getResultcd());
                            ack.setResultmsg("[9904]통신 오류입니다.");
                            localFileMaker.writeln("Error : ErrCode[" + localConnectSocket.getResultcd() + "] PACKET RECV 통신 오류");
                            localFileMaker.close();
                            localConnectSocket.close();
                            return ack;
                        } else {
                            ack.setSocketStr(localConnectSocket.getResult(), this.userEncode, cashGb);
                            localConnectSocket.close();
                            localPacketInspect.writeServerLog(ack, cashGb);
                            localFileMaker.close();
                            return ack;
                        }
                    }
                }
            }
        }
    }
}
