package com.dalbit.payment.module.cnnew_v0003;

import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

@Slf4j
public class AckParam implements Serializable {
    private String mode;
    private String recordKey;
    private String svcId;
    private String mobilId;
    private String tradeId;
    private String prdtPrice;
    private String billKey;
    private String partCancelYn;
    private String rmk;
    private String resultCd;
    private String resultMsg;
    private String signDate;
    private String trdDate;
    private String trdTime;
    private String interest;
    private String mrctOtp;
    private String cardCode;
    private String cardName;
    private String apprNo;
    private String cardNum;
    private String pkLength;
    private String ver;
    private String cryptGb;
    private String keySeq;
    private String cipherKey;
    private String prdtNm;
    private String authType;
    private String currency;
    private String taxDiv;
    private String taxPrice;
    private String taxFreePrice;
    private String noIntFlag;
    private String cardNo;
    private String exprDt;
    private String cardPw;
    private String socialNo;
    private String pointDiv;
    private String userId;
    private String userNm;
    private String userEmail;
    private String userIp;
    private String autoBillDate;
    private String autoBillEndDate;
    private String svcKind;
    private String posMode;
    private String cavv;
    private String xid;
    private String sessKey;
    private String encData;
    private String userPhoneNo;
    private String essPhoneNo;
    private String essEmail;
    private String mrctFld;
    private String subBizNum;
    private String notiType;
    private String notiInfo;
    private String kvpCardCode;
    private String cardKind;
    private String cnclSeq;
    private String payMethod;
    private String couponPrice;
    McashSeed seed;

    public AckParam() {
        this.mode = "";
        this.recordKey = "";
        this.svcId = "";
        this.mobilId = "";
        this.tradeId = "";
        this.prdtPrice = "";
        this.billKey = "";
        this.partCancelYn = "";
        this.rmk = "";
        this.resultCd = "";
        this.resultMsg = "";
        this.signDate = "";
        this.trdDate = "";
        this.trdTime = "";
        this.interest = "";
        this.mrctOtp = "";
        this.cardCode = "";
        this.cardName = "";
        this.apprNo = "";
        this.cardNum = "";
        this.pkLength = "";
        this.ver = "";
        this.cryptGb = "1";
        this.keySeq = "";
        this.prdtNm = "";
        this.authType = "01";
        this.currency = "KRW";
        this.taxDiv = "";
        this.taxPrice = "";
        this.taxFreePrice = "";
        this.noIntFlag = "";
        this.cardNo = "";
        this.exprDt = "";
        this.cardPw = "";
        this.socialNo = "";
        this.pointDiv = "";
        this.userId = "";
        this.userNm = "";
        this.userEmail = "";
        this.userIp = "";
        this.autoBillDate = "";
        this.autoBillEndDate = "";
        this.svcKind = "00";
        this.posMode = "";
        this.cavv = "";
        this.xid = "";
        this.sessKey = "";
        this.encData = "";
        this.userPhoneNo = "";
        this.essPhoneNo = "";
        this.essEmail = "";
        this.mrctFld = "";
        this.subBizNum = "";
        this.notiType = "00";
        this.notiInfo = "";
        this.kvpCardCode = "";
        this.cardKind = "";
        this.cnclSeq = "";
        this.payMethod = "";
        this.couponPrice = "";
        this.seed = new McashSeed();
    }

    public AckParam(final String mode, final String recordKey, final String svcId, final String mobilId, final String tradeId, final String prdtPrice, final String billKey, final String partCancelYn) {
        this.mode = "";
        this.recordKey = "";
        this.svcId = "";
        this.mobilId = "";
        this.tradeId = "";
        this.prdtPrice = "";
        this.billKey = "";
        this.partCancelYn = "";
        this.rmk = "";
        this.resultCd = "";
        this.resultMsg = "";
        this.signDate = "";
        this.trdDate = "";
        this.trdTime = "";
        this.interest = "";
        this.mrctOtp = "";
        this.cardCode = "";
        this.cardName = "";
        this.apprNo = "";
        this.cardNum = "";
        this.pkLength = "";
        this.ver = "";
        this.cryptGb = "1";
        this.keySeq = "";
        this.prdtNm = "";
        this.authType = "01";
        this.currency = "KRW";
        this.taxDiv = "";
        this.taxPrice = "";
        this.taxFreePrice = "";
        this.noIntFlag = "";
        this.cardNo = "";
        this.exprDt = "";
        this.cardPw = "";
        this.socialNo = "";
        this.pointDiv = "";
        this.userId = "";
        this.userNm = "";
        this.userEmail = "";
        this.userIp = "";
        this.autoBillDate = "";
        this.autoBillEndDate = "";
        this.svcKind = "00";
        this.posMode = "";
        this.cavv = "";
        this.xid = "";
        this.sessKey = "";
        this.encData = "";
        this.userPhoneNo = "";
        this.essPhoneNo = "";
        this.essEmail = "";
        this.mrctFld = "";
        this.subBizNum = "";
        this.notiType = "00";
        this.notiInfo = "";
        this.kvpCardCode = "";
        this.cardKind = "";
        this.cnclSeq = "";
        this.payMethod = "";
        this.couponPrice = "";
        this.seed = new McashSeed();
        this.mode = CommonUtil.nullChk(mode).trim();
        this.recordKey = CommonUtil.nullChk(recordKey).trim();
        this.svcId = CommonUtil.nullChk(svcId).trim();
        this.mobilId = CommonUtil.nullChk(mobilId).trim();
        this.tradeId = CommonUtil.nullChk(tradeId).trim();
        this.prdtPrice = CommonUtil.nullChk(prdtPrice).trim();
        this.billKey = CommonUtil.nullChk(billKey).trim();
        this.partCancelYn = CommonUtil.nullChk(partCancelYn).trim();
    }

    public AckParam(final String mode, final String recordKey, final String svcId, final String mobilId, final String tradeId, final String prdtPrice, final String billKey, final String partCancelYn, final String prdtNm, final String authType, final String currency, final String taxDiv, final String taxPrice, final String taxFreePrice, final String nointFlag, final String cardNo, final String exprDt, final String interest, final String cardPw, final String socialNo, final String pointDiv, final String userId, final String userNm, final String userEmail, final String userIp, final String autobillDate, final String autobillEndDate) {
        this.mode = "";
        this.recordKey = "";
        this.svcId = "";
        this.mobilId = "";
        this.tradeId = "";
        this.prdtPrice = "";
        this.billKey = "";
        this.partCancelYn = "";
        this.rmk = "";
        this.resultCd = "";
        this.resultMsg = "";
        this.signDate = "";
        this.trdDate = "";
        this.trdTime = "";
        this.interest = "";
        this.mrctOtp = "";
        this.cardCode = "";
        this.cardName = "";
        this.apprNo = "";
        this.cardNum = "";
        this.pkLength = "";
        this.ver = "";
        this.cryptGb = "1";
        this.keySeq = "";
        this.prdtNm = "";
        this.authType = "01";
        this.currency = "KRW";
        this.taxDiv = "";
        this.taxPrice = "";
        this.taxFreePrice = "";
        this.noIntFlag = "";
        this.cardNo = "";
        this.exprDt = "";
        this.cardPw = "";
        this.socialNo = "";
        this.pointDiv = "";
        this.userId = "";
        this.userNm = "";
        this.userEmail = "";
        this.userIp = "";
        this.autoBillDate = "";
        this.autoBillEndDate = "";
        this.svcKind = "00";
        this.posMode = "";
        this.cavv = "";
        this.xid = "";
        this.sessKey = "";
        this.encData = "";
        this.userPhoneNo = "";
        this.essPhoneNo = "";
        this.essEmail = "";
        this.mrctFld = "";
        this.subBizNum = "";
        this.notiType = "00";
        this.notiInfo = "";
        this.kvpCardCode = "";
        this.cardKind = "";
        this.cnclSeq = "";
        this.payMethod = "";
        this.couponPrice = "";
        this.seed = new McashSeed();
        this.mode = CommonUtil.nullChk(mode).trim();
        this.recordKey = CommonUtil.nullChk(recordKey).trim();
        this.svcId = CommonUtil.nullChk(svcId).trim();
        this.mobilId = CommonUtil.nullChk(mobilId).trim();
        this.tradeId = CommonUtil.nullChk(tradeId).trim();
        this.prdtPrice = CommonUtil.nullChk(prdtPrice).trim();
        this.billKey = CommonUtil.nullChk(billKey).trim();
        this.partCancelYn = ("Y".equals(CommonUtil.nullChk(partCancelYn).trim()) ? "Y" : "N");
        this.prdtNm = CommonUtil.nullChk(prdtNm).trim();
        this.authType = CommonUtil.nullChk(authType).trim();
        this.currency = CommonUtil.nullChk(currency).trim();
        this.taxDiv = CommonUtil.nullChk(taxDiv).trim();
        this.taxPrice = CommonUtil.nullChk(taxPrice).trim();
        this.taxFreePrice = CommonUtil.nullChk(taxFreePrice).trim();
        this.noIntFlag = CommonUtil.nullChk(nointFlag).trim();
        this.cardNo = CommonUtil.nullChk(cardNo).trim();
        this.exprDt = CommonUtil.nullChk(exprDt).trim();
        this.interest = CommonUtil.nullChk(interest).trim();
        this.cardPw = CommonUtil.nullChk(cardPw).trim();
        this.socialNo = CommonUtil.nullChk(socialNo).trim();
        this.pointDiv = CommonUtil.nullChk(pointDiv).trim();
        this.userId = CommonUtil.nullChk(userId).trim();
        this.userNm = CommonUtil.nullChk(userNm).trim();
        this.userEmail = CommonUtil.nullChk(userEmail).trim();
        this.userIp = CommonUtil.nullChk(userIp).trim();
        this.autoBillDate = CommonUtil.nullChk(autobillDate).trim();
        this.autoBillEndDate = CommonUtil.nullChk(autobillEndDate).trim();
    }

    public String getRmk() {
        return this.rmk;
    }

    public void setRmk(final String rmk) {
        this.rmk = rmk;
    }

    public String getPartCancelYn() {
        return this.partCancelYn;
    }

    public void setPartCancelYn(final String partCancelYn) {
        this.partCancelYn = partCancelYn;
    }

    public String getPkLength() {
        return this.pkLength;
    }

    public void setPkLength(final String pkLength) {
        this.pkLength = pkLength;
    }

    public String getMode() {
        return this.mode;
    }

    public void setMode(final String mode) {
        this.mode = mode;
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

    public String getMobilId() {
        return this.mobilId;
    }

    public void setMobilId(final String mobilId) {
        this.mobilId = mobilId;
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

    public String getBillKey() {
        return this.billKey;
    }

    public void setBillKey(final String billKey) {
        this.billKey = billKey;
    }

    public McashSeed getSeed() {
        return this.seed;
    }

    public void setSeed(final McashSeed seed) {
        this.seed = seed;
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

    public String getSignDate() {
        return this.signDate;
    }

    public void setSignDate(final String signDate) {
        this.signDate = signDate;
    }

    public String getTrdDate() {
        return this.trdDate;
    }

    public void setTrdDate(final String trdDate) {
        this.trdDate = trdDate;
    }

    public String getTrdTime() {
        return this.trdTime;
    }

    public void setTrdTime(final String trdTime) {
        this.trdTime = trdTime;
    }

    public String getInterest() {
        return this.interest;
    }

    public void setInterest(final String interest) {
        this.interest = interest;
    }

    public String getMrctOtp() {
        return this.mrctOtp;
    }

    public void setMrctOtp(final String mrctOtp) {
        this.mrctOtp = mrctOtp;
    }

    public String getCardCode() {
        return this.cardCode;
    }

    public void setCardCode(final String cardCode) {
        this.cardCode = cardCode;
    }

    public String getCardName() {
        return this.cardName;
    }

    public void setCardName(final String cardName) {
        this.cardName = cardName;
    }

    public String getApprNo() {
        return this.apprNo;
    }

    public void setApprNo(final String apprNo) {
        this.apprNo = apprNo;
    }

    public String getCardNum() {
        return this.cardNum;
    }

    public void setCardNum(final String cardNum) {
        this.cardNum = cardNum;
    }

    public String getVer() {
        return this.ver;
    }

    public void setVer(final String ver) {
        this.ver = ver;
    }

    public String getCryptGb() {
        return this.cryptGb;
    }

    public void setCryptGb(final String cryptGb) {
        this.cryptGb = cryptGb;
    }

    public String getKeySeq() {
        return this.keySeq;
    }

    public void setKeySeq(final String keySeq) {
        this.keySeq = keySeq;
    }

    public String getCipherKey() {
        return this.cipherKey;
    }

    public void setCipherKey(final String cipherKey) {
        this.cipherKey = cipherKey;
    }

    public String getPrdtNm() {
        return this.prdtNm;
    }

    public void setPrdtNm(final String prdtNm) {
        this.prdtNm = prdtNm;
    }

    public String getAuthType() {
        return this.authType;
    }

    public void setAuthType(final String authType) {
        this.authType = authType;
    }

    public String getCurrency() {
        return this.currency;
    }

    public void setCurrency(final String currency) {
        this.currency = currency;
    }

    public String getTaxDiv() {
        return this.taxDiv;
    }

    public void setTaxDiv(final String taxDiv) {
        this.taxDiv = taxDiv;
    }

    public String getTaxPrice() {
        return this.taxPrice;
    }

    public void setTaxPrice(final String taxPrice) {
        this.taxPrice = taxPrice;
    }

    public String getTaxFreePrice() {
        return this.taxFreePrice;
    }

    public void setTaxFreePrice(final String taxFreePrice) {
        this.taxFreePrice = taxFreePrice;
    }

    public String getNoIntFlag() {
        return this.noIntFlag;
    }

    public void setNoIntFlag(final String noIntFlag) {
        this.noIntFlag = noIntFlag;
    }

    public String getCardNo() {
        return this.cardNo;
    }

    public void setCardNo(final String cardNo) {
        this.cardNo = cardNo;
    }

    public String getExprDt() {
        return this.exprDt;
    }

    public void setExprDt(final String exprDt) {
        this.exprDt = exprDt;
    }

    public String getCardPw() {
        return this.cardPw;
    }

    public void setCardPw(final String cardPw) {
        this.cardPw = cardPw;
    }

    public String getSocialNo() {
        return this.socialNo;
    }

    public void setSocialNo(final String socialNo) {
        this.socialNo = socialNo;
    }

    public String getPointDiv() {
        return this.pointDiv;
    }

    public void setPointDiv(final String pointDiv) {
        this.pointDiv = pointDiv;
    }

    public String getUserId() {
        return this.userId;
    }

    public void setUserId(final String userId) {
        this.userId = userId;
    }

    public String getUserNm() {
        return this.userNm;
    }

    public void setUserNm(final String userNm) {
        this.userNm = userNm;
    }

    public String getUserEmail() {
        return this.userEmail;
    }

    public void setUserEmail(final String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserIp() {
        return this.userIp;
    }

    public void setUserIp(final String userIp) {
        this.userIp = userIp;
    }

    public String getAutoBillDate() {
        return this.autoBillDate;
    }

    public void setAutoBillDate(final String autoBillDate) {
        this.autoBillDate = autoBillDate;
    }

    public String getAutoBillEndDate() {
        return this.autoBillEndDate;
    }

    public void setAutoBillEndDate(final String autoBillEndDate) {
        this.autoBillEndDate = autoBillEndDate;
    }

    public String getSvcKind() {
        return this.svcKind;
    }

    public void setSvcKind(final String svcKind) {
        this.svcKind = svcKind;
    }

    public String getPosMode() {
        return this.posMode;
    }

    public void setPosMode(final String posMode) {
        this.posMode = posMode;
    }

    public String getCavv() {
        return this.cavv;
    }

    public void setCavv(final String cavv) {
        this.cavv = cavv;
    }

    public String getXid() {
        return this.xid;
    }

    public void setXid(final String xid) {
        this.xid = xid;
    }

    public String getSessKey() {
        return this.sessKey;
    }

    public void setSessKey(final String sessKey) {
        this.sessKey = sessKey;
    }

    public String getEncData() {
        return this.encData;
    }

    public void setEncData(final String encData) {
        this.encData = encData;
    }

    public String getUserPhoneNo() {
        return this.userPhoneNo;
    }

    public void setUserPhoneNo(final String userPhoneNo) {
        this.userPhoneNo = userPhoneNo;
    }

    public String getEssPhoneNo() {
        return this.essPhoneNo;
    }

    public void setEssPhoneNo(final String essPhoneNo) {
        this.essPhoneNo = essPhoneNo;
    }

    public String getEssEmail() {
        return this.essEmail;
    }

    public void setEssEmail(final String essEmail) {
        this.essEmail = essEmail;
    }

    public String getMrctFld() {
        return this.mrctFld;
    }

    public void setMrctFld(final String mrctFld) {
        this.mrctFld = mrctFld;
    }

    public String getSubBizNum() {
        return this.subBizNum;
    }

    public void setSubBizNum(final String subBizNum) {
        this.subBizNum = subBizNum;
    }

    public String getNotiType() {
        return this.notiType;
    }

    public void setNotiType(final String notiType) {
        this.notiType = notiType;
    }

    public String getNotiInfo() {
        return this.notiInfo;
    }

    public void setNotiInfo(final String notiInfo) {
        this.notiInfo = notiInfo;
    }

    public String getKvpCardCode() {
        return this.kvpCardCode;
    }

    public void setKvpCardCode(final String kvpCardCode) {
        this.kvpCardCode = kvpCardCode;
    }

    public String getCardKind() {
        return this.cardKind;
    }

    public void setCardKind(final String cardKind) {
        this.cardKind = cardKind;
    }

    public String getCnclSeq() {
        return this.cnclSeq;
    }

    public void setCnclSeq(final String cnclSeq) {
        this.cnclSeq = cnclSeq;
    }

    public String getPayMethod() {
        return this.payMethod;
    }

    public void setPayMethod(final String payMethod) {
        this.payMethod = payMethod;
    }

    public String getCouponPrice() {
        return this.couponPrice;
    }

    public void setCouponPrice(final String couponPrice) {
        this.couponPrice = couponPrice;
    }

    public String getSocketStr(final String UserEncode) {
        final StringBuffer strBuffer = new StringBuffer();
        final StringBuffer appdBuffer = new StringBuffer();
        String szamt = "";
        String szPrdtprice = "";
        String szTaxPrice = "";
        String szTaxFreePrice = "";
        String szSocialNo = "";
        String szCardNo = "";
        int lengCnt = 0;
        szPrdtprice = CommonUtil.szmakeStr(this.prdtPrice, 10, "0", "left");
        szTaxPrice = CommonUtil.szmakeStr(this.taxPrice, 10, "0", "left");
        szTaxFreePrice = CommonUtil.szmakeStr(this.taxFreePrice, 10, "0", "left");
        szamt = McashSeed.encodeString(szPrdtprice, this.cipherKey.getBytes());
        szTaxPrice = McashSeed.encodeString(szTaxPrice, this.cipherKey.getBytes());
        szTaxFreePrice = McashSeed.encodeString(szTaxFreePrice, this.cipherKey.getBytes());
        szSocialNo = McashSeed.encodeString(this.socialNo, this.cipherKey.getBytes());
        szCardNo = McashSeed.encodeString(this.cardNo, this.cipherKey.getBytes());
        appdBuffer.append(CommonUtil.makePacketStr(this.mode, 4));
        lengCnt += 4;
        appdBuffer.append(CommonUtil.makePacketStr(this.ver, 4));
        lengCnt += 4;
        appdBuffer.append(CommonUtil.makePacketStr(this.cryptGb, 1));
        ++lengCnt;
        appdBuffer.append(CommonUtil.makePacketStr(this.keySeq, 1));
        ++lengCnt;
        appdBuffer.append(CommonUtil.makePacketStr(this.recordKey, 20));
        lengCnt += 20;
        appdBuffer.append(CommonUtil.makePacketStr(this.svcId, 12));
        lengCnt += 12;
        if ("CN05".equals(this.mode) || "CN08".equals(this.mode)) {
            appdBuffer.append(CommonUtil.makePacketStr(this.tradeId, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(this.svcKind, 2));
            lengCnt += 2;
            appdBuffer.append(CommonUtil.makePacketStr(this.prdtNm, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(this.authType, 2));
            lengCnt += 2;
            appdBuffer.append(CommonUtil.makePacketStr(this.currency, 3));
            lengCnt += 3;
            appdBuffer.append(CommonUtil.makePacketStr(this.taxDiv, 2));
            lengCnt += 2;
            appdBuffer.append(CommonUtil.makePacketStr(szamt, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(szTaxPrice, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(szTaxFreePrice, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(this.cardCode, 3));
            lengCnt += 3;
            appdBuffer.append(CommonUtil.makePacketStr(this.noIntFlag, 1));
            ++lengCnt;
            appdBuffer.append(CommonUtil.makePacketStr(szCardNo, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(this.exprDt, 8));
            lengCnt += 8;
            appdBuffer.append(CommonUtil.makePacketStr(this.interest, 2));
            lengCnt += 2;
            appdBuffer.append(CommonUtil.makePacketStr(this.cardPw, 4));
            lengCnt += 4;
            appdBuffer.append(CommonUtil.makePacketStr(this.posMode, 3));
            lengCnt += 3;
            appdBuffer.append(CommonUtil.makePacketStr(this.cavv, 28));
            lengCnt += 28;
            appdBuffer.append(CommonUtil.makePacketStr(this.xid, 28));
            lengCnt += 28;
            appdBuffer.append(CommonUtil.makePacketStr(szSocialNo, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(this.pointDiv, 2));
            lengCnt += 2;
            appdBuffer.append(CommonUtil.makePacketStr(this.sessKey, 512));
            lengCnt += 512;
            appdBuffer.append(CommonUtil.makePacketStr(this.encData, 4096));
            lengCnt += 4096;
            appdBuffer.append(CommonUtil.makePacketStr(this.userPhoneNo, 20));
            lengCnt += 20;
            appdBuffer.append(CommonUtil.makePacketStr(this.userId, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(this.userNm, 20));
            lengCnt += 20;
            appdBuffer.append(CommonUtil.makePacketStr(this.userEmail, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(this.userIp, 20));
            lengCnt += 20;
            appdBuffer.append(CommonUtil.makePacketStr(this.essPhoneNo, 15));
            lengCnt += 15;
            appdBuffer.append(CommonUtil.makePacketStr(this.essEmail, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(this.mrctFld, 1024));
            lengCnt += 1024;
            if ("CN05".equals(this.mode)) {
                appdBuffer.append(CommonUtil.makePacketStr("", 267));
                lengCnt += 267;
                appdBuffer.append(CommonUtil.makePacketStr(this.subBizNum, 12));
                lengCnt += 12;
            }
            else {
                appdBuffer.append(CommonUtil.makePacketStr(this.autoBillDate, 2));
                lengCnt += 2;
                appdBuffer.append(CommonUtil.makePacketStr(this.autoBillEndDate, 8));
                lengCnt += 8;
                appdBuffer.append(CommonUtil.makePacketStr(this.notiType, 2));
                lengCnt += 2;
                appdBuffer.append(CommonUtil.makePacketStr(this.notiInfo, 255));
                lengCnt += 255;
                appdBuffer.append(CommonUtil.makePacketStr("", 12));
                lengCnt += 12;
            }
            appdBuffer.append(CommonUtil.makePacketStr(this.kvpCardCode, 20));
            lengCnt += 20;
        }
        if ("CN06".equals(this.mode) || "CN09".equals(this.mode)) {
            appdBuffer.append(CommonUtil.makePacketStr(this.mobilId, 20));
            lengCnt += 20;
            appdBuffer.append(CommonUtil.makePacketStr(this.tradeId, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(szamt, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(this.billKey, 40));
            lengCnt += 40;
        }
        if ("CN07".equals(this.mode)) {
            appdBuffer.append(CommonUtil.makePacketStr(this.tradeId, 50));
            lengCnt += 50;
            appdBuffer.append(CommonUtil.makePacketStr(this.mobilId, 20));
            lengCnt += 20;
            appdBuffer.append(CommonUtil.makePacketStr(szamt, 32));
            lengCnt += 32;
            appdBuffer.append(CommonUtil.makePacketStr(this.partCancelYn, 1));
            ++lengCnt;
            appdBuffer.append(CommonUtil.makePacketStr(this.rmk, 255));
            lengCnt += 255;
        }
        this.pkLength = String.valueOf(lengCnt);
        strBuffer.append(CommonUtil.paddingN(this.pkLength, 6));
        strBuffer.append(appdBuffer);
        return strBuffer.toString();
    }

    public String setSocketStr(final String tmp, final String serverEncode) {
        int count = 0;
        byte[] bt = new byte[1024];
        try {
            bt = tmp.getBytes("EUC-KR");
            String szPrdtprice = "";
            String szAmt = "";
            String szCouponprice = "";
            this.pkLength = CommonUtil.trim(new String(bt, count, 6));
            count += 6;
            this.mode = CommonUtil.trim(new String(bt, count, 4));
            count += 4;
            this.ver = CommonUtil.trim(new String(bt, count, 4));
            count += 4;
            this.cryptGb = CommonUtil.trim(new String(bt, count, 1));
            ++count;
            this.keySeq = CommonUtil.trim(new String(bt, count, 1));
            ++count;
            this.recordKey = CommonUtil.trim(new String(bt, count, 20));
            count += 20;
            this.svcId = CommonUtil.trim(new String(bt, count, 12));
            count += 12;
            this.resultCd = CommonUtil.trim(new String(bt, count, 4));
            count += 4;
            this.resultMsg = CommonUtil.trim(new String(bt, count, 100, serverEncode));
            count += 100;
            if ("CN15".equals(this.mode) || "CN18".equals(this.mode)) {
                this.tradeId = CommonUtil.trim(new String(bt, count, 50));
                count += 50;
                szPrdtprice = new String(bt, count, 32);
                count += 32;
                if (szPrdtprice != null && !"".equals(szPrdtprice.trim())) {
                    szAmt = McashSeed.decodeString(szPrdtprice, this.cipherKey.getBytes()).trim();
                    this.prdtPrice = String.valueOf(Integer.parseInt(szAmt));
                }
                this.mobilId = CommonUtil.trim(new String(bt, count, 20));
                count += 20;
                this.billKey = CommonUtil.trim(new String(bt, count, 40));
                count += 40;
                this.cardCode = CommonUtil.trim(new String(bt, count, 3));
                count += 3;
                this.cardKind = CommonUtil.trim(new String(bt, count, 2));
                count += 2;
            }
            if ("CN16".equals(this.mode) || "CN19".equals(this.mode)) {
                this.tradeId = CommonUtil.trim(new String(bt, count, 50));
                count += 50;
                szPrdtprice = new String(bt, count, 32);
                count += 32;
                if (szPrdtprice != null && !"".equals(szPrdtprice.trim())) {
                    szAmt = McashSeed.decodeString(szPrdtprice, this.cipherKey.getBytes()).trim();
                    this.prdtPrice = String.valueOf(Integer.parseInt(szAmt));
                }
                this.mobilId = CommonUtil.trim(new String(bt, count, 20));
                count += 20;
                this.signDate = CommonUtil.trim(new String(bt, count, 14));
                count += 14;
                this.interest = CommonUtil.trim(new String(bt, count, 2));
                count += 2;
                this.mrctOtp = CommonUtil.trim(new String(bt, count, 32));
                count += 32;
                this.cardCode = CommonUtil.trim(new String(bt, count, 3));
                count += 3;
                this.cardName = CommonUtil.trim(new String(bt, count, 50, serverEncode));
                count += 50;
                count += 53;
                this.apprNo = CommonUtil.trim(new String(bt, count, 8));
                count += 8;
                count += 1024;
                this.cardNum = CommonUtil.trim(new String(bt, count, 20));
                count += 20;
                this.payMethod = CommonUtil.trim(new String(bt, count, 10));
                count += 10;
                szCouponprice = CommonUtil.trim(new String(bt, count, 10));
                count += 10;
                if (szCouponprice != null && !"".equals(szCouponprice.trim())) {
                    this.couponPrice = String.valueOf(Integer.parseInt(szCouponprice));
                }
            }
            if ("CN17".equals(this.mode)) {
                this.tradeId = CommonUtil.trim(new String(bt, count, 50));
                count += 50;
                szPrdtprice = new String(bt, count, 32);
                count += 32;
                if (szPrdtprice != null && !"".equals(szPrdtprice.trim())) {
                    szAmt = McashSeed.decodeString(szPrdtprice, this.cipherKey.getBytes()).trim();
                    this.prdtPrice = String.valueOf(Integer.parseInt(szAmt));
                }
                this.mobilId = CommonUtil.trim(new String(bt, count, 20));
                count += 20;
                this.signDate = CommonUtil.trim(new String(bt, count, 14));
                count += 14;
                this.cnclSeq = CommonUtil.trim(new String(bt, count, 50));
                count += 50;
                this.payMethod = CommonUtil.trim(new String(bt, count, 10));
                count += 10;
                szCouponprice = CommonUtil.trim(new String(bt, count, 10));
                count += 10;
                if (szCouponprice != null && !"".equals(szCouponprice.trim())) {
                    this.couponPrice = String.valueOf(Integer.parseInt(szCouponprice));
                }
            }
        }
        catch (Exception ex) {
            ex.printStackTrace();
            log.error("MCASH-Error = setSocketStr(UserEncode) " + ex.toString());
            this.resultCd = "-1";
            this.resultMsg = "SYSTEM ERROR";
            return "-1";
        }
        return "0000";
    }
}
