package com.dalbit.payment.module.gift_v0001;

import com.dalbit.payment.module.gift_v0001.AckParam;
import com.dalbit.payment.module.gift_v0001.McashGiftManager;
import java.util.Properties;

public class giftCncl {
    McashGiftManager mm = new McashGiftManager();

    public giftCncl() {
    }

    public Properties revokePayGM(String siteUrl, String svcId, String tradeId, String prdtPrice, String mobilId) throws Exception {
        Properties rsltProp = new Properties();
        AckParam ap = this.mm.McasApprv("30", siteUrl, svcId, tradeId, "", "", prdtPrice, "", "", "", "", "", "", "", "", mobilId, "", "", "", "", "0", "", "", "", "", "");
        rsltProp.setProperty("resultCd", ap.getResultcd() != null ? ap.getResultcd() : "");
        rsltProp.setProperty("resultMsg", ap.getResultmsg() != null ? ap.getResultmsg() : "");
        rsltProp.setProperty("tradeId", ap.getTradeid() != null ? ap.getTradeid() : "");
        rsltProp.setProperty("mobilId", ap.getMobilid() != null ? ap.getMobilid() : "");
        rsltProp.setProperty("actDate", ap.getActdate() != null ? ap.getActdate() : "");
        System.out.println("resultCd = " + ap.getResultcd());
        System.out.println("resultMsg = " + ap.getResultmsg());
        System.out.println("tradeId = " + ap.getTradeid());
        System.out.println("mobilId = " + ap.getMobilid());
        System.out.println("actDate = " + ap.getActdate());
        return rsltProp;
    }

    public Properties revokePayGC(String siteUrl, String svcId, String tradeId, String prdtPrice, String mobilId) throws Exception {
        Properties rsltProp = new Properties();
        AckParam ap = this.mm.McasApprv("030", siteUrl, svcId, tradeId, "", "", prdtPrice, "", "", "", "", "", "", "", "", mobilId, "", "", "", "", "", "", "", "", "", "", "", "", "");
        rsltProp.setProperty("resultCd", ap.getResultcd() != null ? ap.getResultcd() : "");
        rsltProp.setProperty("resultMsg", ap.getResultmsg() != null ? ap.getResultmsg() : "");
        rsltProp.setProperty("tradeId", ap.getTradeid() != null ? ap.getTradeid() : "");
        rsltProp.setProperty("mobilId", ap.getMobilid() != null ? ap.getMobilid() : "");
        rsltProp.setProperty("actDate", ap.getActdate() != null ? ap.getActdate() : "");
        System.out.println("resultCd = " + ap.getResultcd());
        System.out.println("resultMsg = " + ap.getResultmsg());
        System.out.println("tradeId = " + ap.getTradeid());
        System.out.println("mobilId = " + ap.getMobilid());
        System.out.println("actDate = " + ap.getActdate());
        return rsltProp;
    }

    public Properties revokePayGG(String siteUrl, String svcId, String tradeId, String prdtPrice, String mobilId) throws Exception {
        Properties rsltProp = new Properties();
        AckParam ap = this.mm.McasApprv("030", siteUrl, svcId, tradeId, "", "", prdtPrice, "", "", "", "", "", "", "", "", mobilId, "0", "", "", "", "", "", "", "", "", "", "");
        rsltProp.setProperty("resultCd", ap.getResultcd() != null ? ap.getResultcd() : "");
        rsltProp.setProperty("resultMsg", ap.getResultmsg() != null ? ap.getResultmsg() : "");
        rsltProp.setProperty("tradeId", ap.getTradeid() != null ? ap.getTradeid() : "");
        rsltProp.setProperty("mobilId", ap.getMobilid() != null ? ap.getMobilid() : "");
        rsltProp.setProperty("actDate", ap.getActdate() != null ? ap.getActdate() : "");
        System.out.println("resultCd = " + ap.getResultcd());
        System.out.println("resultMsg = " + ap.getResultmsg());
        System.out.println("tradeId = " + ap.getTradeid());
        System.out.println("mobilId = " + ap.getMobilid());
        System.out.println("actDate = " + ap.getActdate());
        return rsltProp;
    }

    public Properties revokePayHM(String siteUrl, String svcId, String tradeId, String prdtPrice, String mobilId) throws Exception {
        Properties rsltProp = new Properties();
        AckParam ap = this.mm.McasApprv("40", siteUrl, svcId, tradeId, "", "prdtnm", prdtPrice, "", "", "", "", "", mobilId, "", "", "0", "", "", "", "", "", "", "", "", "", "", "", "");
        rsltProp.setProperty("resultCd", ap.getResultcd() != null ? ap.getResultcd() : "");
        rsltProp.setProperty("resultMsg", ap.getResultmsg() != null ? ap.getResultmsg() : "");
        rsltProp.setProperty("tradeId", ap.getTradeid() != null ? ap.getTradeid() : "");
        rsltProp.setProperty("mobilId", ap.getMobilid() != null ? ap.getMobilid() : "");
        rsltProp.setProperty("actDate", ap.getActdate() != null ? ap.getActdate() : "");
        System.out.println("resultCd = " + ap.getResultcd());
        System.out.println("resultMsg = " + ap.getResultmsg());
        System.out.println("tradeId = " + ap.getTradeid());
        System.out.println("mobilId = " + ap.getMobilid());
        System.out.println("actDate = " + ap.getActdate());
        return rsltProp;
    }

    public Properties revokePayFC(String siteUrl, String svcId, String tradeId, String prdtPrice, String mobilId) throws Exception {
        Properties rsltProp = new Properties();
        AckParam ap = this.mm.McasApprv("30", siteUrl, svcId, tradeId, prdtPrice, mobilId, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "");
        rsltProp.setProperty("resultCd", ap.getResultcd() != null ? ap.getResultcd() : "");
        rsltProp.setProperty("resultMsg", ap.getResultmsg() != null ? ap.getResultmsg() : "");
        rsltProp.setProperty("tradeId", ap.getTradeid() != null ? ap.getTradeid() : "");
        rsltProp.setProperty("mobilId", ap.getMobilid() != null ? ap.getMobilid() : "");
        rsltProp.setProperty("actDate", ap.getActdate() != null ? ap.getActdate() : "");
        System.out.println("resultCd = " + ap.getResultcd());
        System.out.println("resultMsg = " + ap.getResultmsg());
        System.out.println("tradeId = " + ap.getTradeid());
        System.out.println("mobilId = " + ap.getMobilid());
        System.out.println("actDate = " + ap.getActdate());
        return rsltProp;
    }
}