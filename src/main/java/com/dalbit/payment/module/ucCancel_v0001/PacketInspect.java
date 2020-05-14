package com.dalbit.payment.module.ucCancel_v0001;

public class PacketInspect {

    public AckParam checkRequest(AckParam ap) {
        FileMaker fm = new FileMaker();
        ap.setResultCd("0000");
        if (CommonUtil.strLength(ap.getCashGb()) != 2) {
            ap.setResultCd("9101");
            ap.setResultMsg("[9101] 결제요청자료(cashGb) 오류입니다.");
            fm.errorln("Error : cashGb[결제수단] 확인 요망 - [" + ap.getCashGb() + "]");
            fm.close();
            return ap;
        } else if (CommonUtil.strLength(ap.getRecordKey()) >= 5 && CommonUtil.strLength(ap.getRecordKey()) <= 20) {
            if (CommonUtil.strLength(ap.getSvcId()) == 12 && !CommonUtil.qStrDigit(ap.getSvcId()).equals("-1")) {
                if (CommonUtil.strLength(ap.getTradeId()) >= 4 && CommonUtil.strLength(ap.getTradeId()) <= 40) {
                    if (CommonUtil.qStrDigit(ap.getPrdtPrice()).equals("-1")) {
                        ap.setResultCd("9110");
                        ap.setResultMsg("[9110] 결제요청자료(prdtPrice) 오류입니다.");
                        fm.errorln("Error : prdtPrice[상품금액] 확인 요망 - [" + ap.getPrdtPrice() + "]");
                        fm.close();
                        return ap;
                    } else if (Integer.parseInt(ap.getPrdtPrice()) >= 1 && Integer.parseInt(ap.getPrdtPrice()) <= 999999999) {
                        if (CommonUtil.strLength(ap.getMobilId()) != 15) {
                            ap.setResultCd("9117");
                            ap.setResultMsg("[9117] 결제요청자료(mobilId) 오류입니다.");
                            fm.errorln("Error : mobilId[인증번호] 확인 요망 - [" + ap.getMobilId() + "]");
                            fm.close();
                            return ap;
                        } else {
                            fm.close();
                            return ap;
                        }
                    } else {
                        ap.setResultCd("9110");
                        ap.setResultMsg("[9110] 결제요청자료(prdtPrice) 오류입니다.");
                        fm.errorln("Error : prdtPrice[상품금액] 확인 요망 - [" + ap.getPrdtPrice() + "]");
                        fm.close();
                        return ap;
                    }
                } else {
                    ap.setResultCd("9107");
                    ap.setResultMsg("[9107] 결제요청자료(tradeId) 오류입니다.");
                    fm.errorln("Error : tradeId[상점거래번호] 확인 요망 - [" + ap.getTradeId() + "]");
                    fm.close();
                    return ap;
                }
            } else {
                ap.setResultCd("9103");
                ap.setResultMsg("[9103] 결제요청자료(svcId) 오류입니다.");
                fm.errorln("Error : svcId[서비스ID] 확인 요망 - [" + ap.getSvcId() + "]");
                fm.close();
                return ap;
            }
        } else {
            ap.setResultCd("9102");
            ap.setResultMsg("[9102] 결제요청자료(recordKey) 오류입니다.");
            fm.errorln("Error : recordKey[레코드키] 확인 요망 - [" + ap.getRecordKey() + "]");
            fm.close();
            return ap;
        }
    }

    public void writeClientLog(AckParam ap) {
        FileMaker fm = new FileMaker();
        fm.writeln("====================== SEND DATA ======================");
        fm.writeln("cashGb : " + ap.getCashGb());
        fm.writeln("recordKey : " + ap.getRecordKey());
        fm.writeln("svcId : " + ap.getSvcId());
        fm.writeln("tradeId : " + ap.getTradeId());
        fm.writeln("prdtPrice : " + ap.getPrdtPrice());
        fm.writeln("mobilId : " + ap.getMobilId());
        fm.writeln("======================");
        fm.writeln("ver : " + ap.getVer());
        fm.writeln("serverIp : " + ap.getServerIp());
        fm.writeln("serverPort : " + ap.getServerPort());
        fm.writeln("serverEncode : " + ap.getServerEncode());
        fm.writeln("clientEncode : " + ap.getClientEncode());
        fm.writeln("====================== SEND DATA ======================");
        fm.close();
    }
}
