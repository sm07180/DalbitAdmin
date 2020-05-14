package com.dalbit.payment.module.ucCancel_v0001;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;

public class AckParam implements Serializable {
    private static final long serialVersionUID = 1L;
    private String cashGb;
    private String recordKey;
    private String svcId;
    private String tradeId;
    private String prdtPrice;
    private String mobilId;
    private String resultCd;
    private String resultMsg;
    private String serverIp;
    private String serverEncode;
    private String clientEncode;
    private String ver;
    private int serverPort;
    private String mobilDt;

    public AckParam() {
        this.cashGb = "";
        this.recordKey = "";
        this.svcId = "";
        this.tradeId = "";
        this.prdtPrice = "";
        this.mobilId = "";
        this.resultCd = "";
        this.resultMsg = "";
        this.serverIp = "";
        this.serverEncode = "";
        this.clientEncode = "";
        this.ver = "";
        this.serverPort = 0;
        this.mobilDt = "";
    }

    public AckParam(final String cashGb, final String recordKey, final String svcId, final String tradeId, final String prdtPrice, final String mobilId, final String serverIp, final String serverEncode, final String clientEncode, final String ver, final int serverPort) {
        this.cashGb = CommonUtil.nullChk(cashGb);
        this.recordKey = CommonUtil.nullChk(recordKey);
        this.svcId = CommonUtil.nullChk(svcId);
        this.tradeId = CommonUtil.nullChk(tradeId);
        this.prdtPrice = CommonUtil.nullChk(prdtPrice);
        this.mobilId = CommonUtil.nullChk(mobilId);
        this.serverIp = CommonUtil.nullChk(serverIp);
        this.serverEncode = CommonUtil.nullChk(serverEncode);
        this.clientEncode = CommonUtil.nullChk(clientEncode);
        this.ver = CommonUtil.nullChk(ver);
        this.serverPort = serverPort;
    }

    public String getSendPacket() {
        final StringBuffer strBuffer = new StringBuffer();
        strBuffer.append(CommonUtil.makePacketStr(this.ver, 4));
        strBuffer.append(CommonUtil.makePacketStr("0", 1));
        strBuffer.append(CommonUtil.makePacketStr("0", 1));
        strBuffer.append(CommonUtil.makePacketStr(this.cashGb, 2));
        strBuffer.append(CommonUtil.makePacketStr(this.recordKey, 20));
        strBuffer.append(CommonUtil.makePacketStr(this.svcId, 12));
        strBuffer.append(CommonUtil.makePacketStr(this.tradeId, 40));
        strBuffer.append(CommonUtil.makePacketStr(this.prdtPrice, 32));
        strBuffer.append(CommonUtil.makePacketStr(this.mobilId, 15));
        strBuffer.append(CommonUtil.makePacketStr("", 73));
        return strBuffer.toString();
    }

    public void getReceiveData(final String packet) {
        byte[] bt = new byte[58];
        int count = 0;
        try {
            bt = packet.getBytes(this.getClientEncode());
        }
        catch (UnsupportedEncodingException e) {
            this.setResultCd("9907");
            this.setResultMsg("[9907]Receive Packet Parsing Error. \n" + e.toString());
        }
        try {
            this.ver = CommonUtil.trim(new String(bt, count, 4));
            count += 4;
            ++count;
            ++count;
            this.cashGb = CommonUtil.trim(new String(bt, count, 2));
            count += 2;
            this.recordKey = CommonUtil.trim(new String(bt, count, 20));
            count += 20;
            this.svcId = CommonUtil.trim(new String(bt, count, 12));
            count += 12;
            this.tradeId = CommonUtil.trim(new String(bt, count, 40));
            count += 40;
            this.prdtPrice = CommonUtil.trim(new String(bt, count, 32));
            count += 32;
            this.mobilId = CommonUtil.trim(new String(bt, count, 15));
            count += 15;
            this.mobilDt = CommonUtil.trim(new String(bt, count, 14));
            count += 14;
            this.resultCd = CommonUtil.trim(new String(bt, count, 4));
            count += 4;
            this.resultMsg = CommonUtil.trim(new String(bt, count, 100));
            count += 100;
            final int temp_price = Integer.parseInt(this.prdtPrice);
            this.prdtPrice = Integer.toString(temp_price);
        }
        catch (Exception e2) {
            this.setResultCd("9907");
            this.setResultMsg("[9907]Receive Packet Parsing Error. \n" + e2.toString());
        }
    }

    public String getCashGb() {
        return this.cashGb;
    }

    public void setCashGb(final String cashGb) {
        this.cashGb = cashGb;
    }

    public String getRecordKey() {
        return this.recordKey;
    }

    public void setRecordKey(final String recordKey) {
        this.recordKey = recordKey;
    }

    public String getSvcId() {
        return this.svcId;
    }

    public void setSvcId(final String svcId) {
        this.svcId = svcId;
    }

    public String getTradeId() {
        return this.tradeId;
    }

    public void setTradeId(final String tradeId) {
        this.tradeId = tradeId;
    }

    public String getPrdtPrice() {
        return this.prdtPrice;
    }

    public void setPrdtPrice(final String prdtPrice) {
        this.prdtPrice = prdtPrice;
    }

    public String getMobilId() {
        return this.mobilId;
    }

    public void setMobilId(final String mobilId) {
        this.mobilId = mobilId;
    }

    public String getResultCd() {
        return this.resultCd;
    }

    public void setResultCd(final String resultCd) {
        this.resultCd = resultCd;
    }

    public String getResultMsg() {
        return this.resultMsg;
    }

    public void setResultMsg(final String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public String getServerIp() {
        return this.serverIp;
    }

    public void setServerIp(final String serverIp) {
        this.serverIp = serverIp;
    }

    public String getServerEncode() {
        return this.serverEncode;
    }

    public void setServerEncode(final String serverEncode) {
        this.serverEncode = serverEncode;
    }

    public String getClientEncode() {
        return this.clientEncode;
    }

    public void setClientEncode(final String clientEncode) {
        this.clientEncode = clientEncode;
    }

    public String getVer() {
        return this.ver;
    }

    public void setVer(final String ver) {
        this.ver = ver;
    }

    public int getServerPort() {
        return this.serverPort;
    }

    public void setServerPort(final int serverPort) {
        this.serverPort = serverPort;
    }

    public String getMobilDt() {
        return this.mobilDt;
    }

    public void setMobilDt(final String mobilDt) {
        this.mobilDt = mobilDt;
    }
}