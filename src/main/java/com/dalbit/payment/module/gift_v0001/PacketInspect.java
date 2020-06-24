package com.dalbit.payment.module.gift_v0001;

public class PacketInspect {
    public PacketInspect() {
    }

    public AckParam checkRequest(AckParam ack, String cashGb) throws NullPointerException {
        FileMaker filemaker = new FileMaker();
        ack.setResultcd("0000");
        if ("GM".equals(cashGb)) {
            if (!ack.getMode().equals("00") && !ack.getMode().equals("10") && !ack.getMode().equals("20") && !ack.getMode().equals("30") && !ack.getMode().equals("40")) {
                ack.setResultcd("9101");
                ack.setResultmsg("[9101] 결제요청자료(Mode) 오류입니다.");
                filemaker.errorln("Error : Mode[기능식별자] 확인 요망 - [" + ack.getMode() + "]");
                filemaker.close();
                return ack;
            }
        } else if ("GC".equals(cashGb)) {
            if (!ack.getMode().equals("050") && !ack.getMode().equals("040") && !ack.getMode().equals("010") && !ack.getMode().equals("030") && !ack.getMode().equals("888")) {
                ack.setResultcd("9101");
                ack.setResultmsg("[9101] 결제요청자료(Mode) 오류입니다.");
                filemaker.errorln("Error : Mode[기능식별자] 확인 요망 - [" + ack.getMode() + "]");
                filemaker.close();
                return ack;
            }
        } else if ("GG".equals(cashGb)) {
            if (!ack.getMode().equals("010") && !ack.getMode().equals("020") && !ack.getMode().equals("030")) {
                ack.setResultcd("9101");
                ack.setResultmsg("[9101] 결제요청자료(Mode) 오류입니다.");
                filemaker.errorln("Error : Mode[기능식별자] 확인 요망 - [" + ack.getMode() + "]");
                filemaker.close();
                return ack;
            }
        } else if ("HM".equals(cashGb)) {
            if (!ack.getMode().equals("10") && !ack.getMode().equals("20") && !ack.getMode().equals("30") && !ack.getMode().equals("40")) {
                ack.setResultcd("9101");
                ack.setResultmsg("[9101] 결제요청자료(Mode) 오류입니다.");
                filemaker.errorln("Error : Mode[기능식별자] 확인 요망 - [" + ack.getMode() + "]");
                filemaker.close();
                return ack;
            }
        } else if ("FC".equals(cashGb) && !ack.getMode().equals("10") && !ack.getMode().equals("20") && !ack.getMode().equals("30")) {
            ack.setResultcd("9101");
            ack.setResultmsg("[9101] 결제요청자료(Mode) 오류입니다.");
            filemaker.errorln("Error : Mode[기능식별자] 확인 요망 - [" + ack.getMode() + "]");
            filemaker.close();
            return ack;
        }

        if (CommonUtil.strLength(ack.getRecordkey()) <= 20 && CommonUtil.strLength(ack.getRecordkey()) >= 1) {
            if (CommonUtil.strLength(ack.getSvcid()) == 12 && CommonUtil.qStrDigit(ack.getSvcid()) != "-1") {
                if (CommonUtil.strLength(ack.getTradeid()) >= 1 && CommonUtil.strLength(ack.getTradeid()) <= 40) {
                    if ((CommonUtil.strLength(ack.getPrdtnm()) < 1 || CommonUtil.strLength(ack.getPrdtnm()) > 30) && !ack.getMode().equals("10") && !ack.getMode().equals("20") && !ack.getMode().equals("30") && !ack.getMode().equals("40") && !ack.getMode().equals("020") && !ack.getMode().equals("030")) {
                        ack.setResultcd("9109");
                        ack.setResultmsg("[9109] 결제요청자료(Prdtnm) 오류입니다.");
                        filemaker.errorln("Error : Prdtnm[상품명] 확인 요망 -  [" + ack.getPrdtnm() + "]");
                        filemaker.close();
                        return ack;
                    } else if (CommonUtil.strLength(ack.getPrdtprice()) >= 1 && CommonUtil.strLength(ack.getPrdtprice()) <= 9 && CommonUtil.qStrDigit(ack.getPrdtprice()) != "-1") {
                        if (CommonUtil.strLength(ack.getPrdtprice()) >= 1 && CommonUtil.strLength(ack.getUserid()) <= 20) {
                            if (CommonUtil.strLength(ack.getUseremail()) > 30) {
                                ack.setResultcd("9114");
                                ack.setResultmsg("[9114] 결제요청자료(Email) 오류입니다.");
                                filemaker.errorln("Error : Email[이메일] 확인 요망 -  [" + ack.getUseremail() + "]");
                                filemaker.close();
                                return ack;
                            } else if (CommonUtil.strLength(ack.getUsername()) > 30) {
                                ack.setResultcd("9113");
                                ack.setResultmsg("[9113] 결제요청자료(Name) 오류입니다.");
                                filemaker.errorln("Error : Name[사용자명] 확인 요망 -  [" + ack.getUsername() + "]");
                                filemaker.close();
                                return ack;
                            } else if (CommonUtil.strLength(ack.getUserhost()) > 20) {
                                ack.setResultcd("9115");
                                ack.setResultmsg("[9115] 결제요청자료(Userhost) 오류입니다.");
                                filemaker.errorln("Error : Userhost[사용자IP] 확인 요망 -  [" + ack.getUserhost() + "]");
                                filemaker.close();
                                return ack;
                            } else {
                                return ack;
                            }
                        } else {
                            ack.setResultcd("9111");
                            ack.setResultmsg("[9111] 결제요청자료(Userid) 오류입니다.");
                            filemaker.errorln("Error : Userid[사용자ID] 확인 요망 -  [" + ack.getUserid() + "]");
                            filemaker.close();
                            return ack;
                        }
                    } else {
                        ack.setResultcd("9110");
                        ack.setResultmsg("[9110] 결제요청자료(Prdtprice) 오류입니다.");
                        filemaker.errorln("Error : Prdtprice[상품가격] 확인 요망 -  [" + ack.getPrdtprice() + "]");
                        filemaker.close();
                        return ack;
                    }
                } else {
                    ack.setResultcd("9107");
                    ack.setResultmsg("[9107] 결제요청자료(Tradeid) 오류입니다.");
                    filemaker.errorln("Error : Tradeid[거래번호] 확인 요망 -  [" + ack.getTradeid() + "]");
                    filemaker.close();
                    return ack;
                }
            } else {
                ack.setResultcd("9103");
                ack.setResultmsg("[9103] 결제요청자료(Svcid) 오류입니다.");
                filemaker.errorln("Error : Svcid[서비스ID]  확인 요망 -  [" + ack.getSvcid() + "]");
                filemaker.close();
                return ack;
            }
        } else {
            ack.setResultcd("9102");
            ack.setResultmsg("[9102] 결제요청자료(Recordkey) 오류입니다.");
            filemaker.errorln("Error : Recordkey[URL] 확인 요망 - [" + ack.getRecordkey() + "]");
            filemaker.close();
            return ack;
        }
    }

    public void writeClientLog(AckParam ack, String cashGb) {
        FileMaker filemaker = new FileMaker();
        if (cashGb == "GM") {
            filemaker.writeln("iNFO : CASHGB [ " + cashGb + " ] Mode [ " + ack.getMode() + " ] Svcid [ " + ack.getSvcid() + " ] Tradeid [ " + ack.getTradeid() + " ] Name [ " + ack.getUsername() + " ] Socialno [ " + ack.getUsersocialno() + " ] Username [ " + ack.getUsername() + " ] Userhost [ " + ack.getUserhost() + " ] Userid [ " + ack.getUserid() + " ] Userphoneno [ " + ack.getUserphoneno() + " ] Email [ " + ack.getUseremail() + " ] Prdtcd [ " + ack.getPrdtcd() + " ] Prdtnm [ " + ack.getPrdtnm() + " ] Prdtprice [ " + ack.getPrdtprice() + " ] Cultureuser [ " + ack.getUser() + " ] CurKey [ " + ack.getKeySeq() + " ] CipherKey [ " + ack.getCipherKey() + " ]");
        } else if (cashGb == "GC") {
            filemaker.writeln("iNFO : CASHGB [ " + cashGb + " ] Mode [ " + ack.getMode() + " ] Svcid [ " + ack.getSvcid() + " ] Tradeid [ " + ack.getTradeid() + " ] Name [ " + ack.getUsername() + " ] Socialno [ " + ack.getUsersocialno() + " ] Username [ " + ack.getUsername() + " ] Userhost [ " + ack.getUserhost() + " ] Userid [ " + ack.getUserid() + " ] Userphoneno [ " + ack.getUserphoneno() + " ] Email [ " + ack.getUseremail() + " ] Prdtcd [ " + ack.getPrdtcd() + " ] Prdtnm [ " + ack.getPrdtnm() + " ] Prdtprice [ " + ack.getPrdtprice() + " ] Cultureuser [ " + ack.getUser() + " ] CurKey [ " + ack.getKeySeq() + " ] CipherKey [ " + ack.getCipherKey() + " ]");
        }

        filemaker.close();
    }

    public void writeServerLog(AckParam ack, String cashGb) {
        FileMaker filemaker = new FileMaker();
        filemaker.writeln("iNFO : CASHGB [ " + cashGb + " ] RECV DATA ============>");
        if (cashGb == "GM") {
            filemaker.writeln("iNFO : Mode [ " + ack.getMode() + " ] Svcid [ " + ack.getSvcid() + " ] Tradeid [ " + ack.getTradeid() + " ]  Mobilid [ " + ack.getMobilid() + " ] Actdate [ " + ack.getActdate() + " ] Name [ " + ack.getUsername() + " ] Socialno [ " + ack.getUsersocialno() + " ] Prdtcd [ " + ack.getPrdtcd() + " ] Prdtnm [ " + ack.getPrdtnm() + " ] Prdtprice [ " + ack.getPrdtprice() + " ] Resultcd [ " + ack.getResultcd() + " ] Resultmsg [ " + ack.getResultmsg() + " ] Entpnm [ " + ack.getEntpnm() + " ] Cultureuser [ " + ack.getUser() + " ] Chargeamt [ " + ack.getChargeamt() + " ] Remainamt [ " + ack.getRemainamt() + " ] Paycards [ " + ack.getPaycards() + " ]");
            if ("11".equals(ack.getMode())) {
                filemaker.writeln("iNFO : ScratchNo1 [ " + ack.getScratchNo1() + " ] ScratchResCd1 [ " + ack.getScratchResCd1() + " ] ScratchResMsg1 [ " + ack.getScratchResMsg1() + " ] ScratchPrice1 [ " + ack.getScratchPrice1() + " ]");
                filemaker.writeln("iNFO : ScratchNo2 [ " + ack.getScratchNo2() + " ] ScratchResCd2 [ " + ack.getScratchResCd2() + " ] ScratchResMsg2 [ " + ack.getScratchResMsg2() + " ] ScratchPrice2 [ " + ack.getScratchPrice2() + " ]");
                filemaker.writeln("iNFO : ScratchNo3 [ " + ack.getScratchNo3() + " ] ScratchResCd3 [ " + ack.getScratchResCd3() + " ] ScratchResMsg3 [ " + ack.getScratchResMsg3() + " ] ScratchPrice3 [ " + ack.getScratchPrice3() + " ]");
                filemaker.writeln("iNFO : ScratchNo4 [ " + ack.getScratchNo4() + " ] ScratchResCd4 [ " + ack.getScratchResCd4() + " ] ScratchResMsg4 [ " + ack.getScratchResMsg4() + " ] ScratchPrice4 [ " + ack.getScratchPrice4() + " ]");
                filemaker.writeln("iNFO : ScratchNo5 [ " + ack.getScratchNo5() + " ] ScratchResCd5 [ " + ack.getScratchResCd5() + " ] ScratchResMsg5 [ " + ack.getScratchResMsg5() + " ] ScratchPrice5 [ " + ack.getScratchPrice5() + " ]");
            }
        } else if (cashGb == "GC") {
            filemaker.writeln("iNFO : Mode [ " + ack.getMode() + " ] Svcid [ " + ack.getSvcid() + " ] Tradeid [ " + ack.getTradeid() + " ]  Mobilid [ " + ack.getMobilid() + " ] Actdate [ " + ack.getActdate() + " ] Name [ " + ack.getUsername() + " ] Socialno [ " + ack.getUsersocialno() + " ] Prdtcd [ " + ack.getPrdtcd() + " ] Prdtnm [ " + ack.getPrdtnm() + " ] Prdtprice [ " + ack.getPrdtprice() + " ] Resultcd [ " + ack.getResultcd() + " ] Resultmsg [ " + ack.getResultmsg() + " ] Entpnm [ " + ack.getEntpnm() + " ] Cultureuser [ " + ack.getUser() + " ] Chargeamt [ " + ack.getChargeamt() + " ] Remainamt [ " + ack.getRemainamt() + " ] Paycards [ " + ack.getPaycards() + " ]");
        }

        filemaker.close();
    }
}