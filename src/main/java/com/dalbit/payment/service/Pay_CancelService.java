package com.dalbit.payment.service;

import com.checkpay.util.SecurityUtil;
import com.dalbit.common.code.CancelPhoneCode;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.EmailService;
import com.dalbit.common.vo.EmailInputVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.payment.dao.Pay_CancelDao;
import com.dalbit.payment.module.cnnew_v0003.AckParam;
import com.dalbit.payment.module.cnnew_v0003.CommonUtil;
import com.dalbit.payment.module.cnnew_v0003.McashManager;
import com.dalbit.payment.module.gift_v0001.giftCncl;
import com.dalbit.payment.module.mcCancel_v0001.MC_Cancel;
import com.dalbit.common.proc.Common;
import com.dalbit.payment.vo.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.OkHttpClientUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Slf4j
@Service
public class Pay_CancelService {

    @Autowired
    Pay_CancelDao payCancelDao;

    @Autowired
    Mem_MemberDao mem_MemberDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired Common common;
    @Autowired EmailService emailService;

    /**
     *  ???????????? ?????? ??????
     */
    public String payCancelCard(Pay_CancelCardVo payCancelCardVo) throws GlobalException{

        String result;
        try{
            String mode			= "CN07";   //????????????
            String recordKey	= CommonUtil.Decode(DalbitUtil.getProperty("pay.site.url"));    //?????????URL
            String svcId		= CommonUtil.Decode(DalbitUtil.getProperty("card.service.id")); //??????????????????
            String tradeId		= CommonUtil.Decode(payCancelCardVo.getTradeid());              //????????????(??????)
            String mobilId		= CommonUtil.Decode(payCancelCardVo.getMobilid());              //????????????(???????????????)
            String prdtPrice	= CommonUtil.Decode(payCancelCardVo.getPrdtprice());            //????????????
            String partCancelYn	= CommonUtil.Decode(payCancelCardVo.getPartCancelYn());         //??????????????????

            McashManager mm = new McashManager();
            AckParam ap = mm.McashApprv(
                    mode,			/* ???????????? */
                    recordKey,		/* ?????????URL */
                    svcId,			/* ?????????????????? */
                    mobilId,		/* ??????????????????????????? */
                    tradeId,		/* ????????????????????? */
                    prdtPrice,		/* ???????????? */
                    "",		/* ??????????????? */
                    partCancelYn	/* ?????????????????? */
            );

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(ap.getResultCd().equals(Status.??????????????????.getMessageCode())){
                cancelVo.setOrderId(ap.getTradeId());
                cancelVo.setCancelDt(DalbitUtil.stringToDate(ap.getSignDate()));
                cancelVo.setFailMsg("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelCardVo.getMemno());
                pCancelVo.setOrder_id(payCancelCardVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelCardVo.getMemno(), payCancelCardVo.getPaycd(), payCancelCardVo.getOkdt()
                            , payCancelCardVo.getOktime(), payCancelCardVo.getPaycode(), payCancelCardVo.getItemamt()
                            , payCancelCardVo.getCardno(), payCancelCardVo.getCardnm(), payCancelCardVo.getMemBirth()
                            , payCancelCardVo.getPrdtprice(), payCancelCardVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelCard ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result =  gsonUtil.toJson(new JsonOutputVo((Status)resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("???????????? ????????????: {}", ap.getResultCd());
                log.info("Fail Msg: {}", ap.getResultMsg());
                log.info("=====================================");

                cancelVo.setOrderId(ap.getTradeId());
                cancelVo.setCancelDt("");
                cancelVo.setFailMsg(ap.getResultMsg());
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState(ap.getResultCd().equals("M231") ? "y" :"f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }
            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     *  ????????? ?????? ??????
     */
    public String payCancelPhone(Pay_CancelPhoneVo payCancelPhoneVo) throws GlobalException{

        String result;

        try{
            String mrchId    = payCancelPhoneVo.getMrchid();
            String svcId     = DalbitUtil.getProperty("phone.service.id");
            String tradeId   = payCancelPhoneVo.getTradeid();
            String prdtPrice = payCancelPhoneVo.getPrdtprice();
            String mobilId   = payCancelPhoneVo.getMobilid();

            MC_Cancel cancel = new MC_Cancel();
            String res_cd = cancel.cancel_attempt(mrchId, svcId, tradeId, prdtPrice, mobilId);

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(res_cd.equals(Status.??????????????????.getMessageCode())){
                cancelVo.setOrderId(tradeId);
                cancelVo.setCancelDt(DalbitUtil.getDate("yyyy-MM-dd")+" "+DalbitUtil.getDate("HH:mm:ss"));
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");
                cancelVo.setFailMsg("");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelPhoneVo.getMemno());
                pCancelVo.setOrder_id(payCancelPhoneVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelPhoneVo.getMemno(), payCancelPhoneVo.getPaycd(), payCancelPhoneVo.getOkdt()
                            , payCancelPhoneVo.getOktime(), payCancelPhoneVo.getPaycode(), payCancelPhoneVo.getItemamt()
                            , payCancelPhoneVo.getCardno(), payCancelPhoneVo.getCardnm(), payCancelPhoneVo.getMemBirth()
                            , payCancelPhoneVo.getPrdtprice(), payCancelPhoneVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelPhone ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result =  gsonUtil.toJson(new JsonOutputVo((Status)resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("????????? ????????????: {}", res_cd);
                log.info("=====================================");

                cancelVo.setOrderId(tradeId);
                cancelVo.setCancelDt("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState(res_cd.equals(CancelPhoneCode.?????????????????????.getCode()) ? "y" :"f");

                String resultMsg = "";
                boolean checked = false;
                for (CancelPhoneCode code : CancelPhoneCode.values()) {
                    /*log.info("??????????????????: {}", res_cd.equals(code.getCode()));
                    log.info("?????? ????????? ??????: {}", code.getCode());*/
                    if(!checked) {
                        if (res_cd.equals(code.getCode())) {
                            resultMsg = code.getDesc();
                            checked = true;
                        } else {
                            resultMsg = "????????????";
                            checked = false;
                        }
                    }
                }
                cancelVo.setFailMsg(resultMsg);
                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }

            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     * ???????????? ????????????
     */
    public String payletterCancel(Pay_CancelPayletterVo payCancelPayletterVo, HttpServletRequest request) throws GlobalException {
        String activeProperties = System.getProperty("spring.profiles.active");
        log.info("activeProperties: {}", activeProperties);
        String result;

        try{
            log.debug("payletter.cancel.url: {}", DalbitUtil.getProperty("payletter.cancel.url"));
            URL objUrl = new URL(DalbitUtil.getProperty("payletter.cancel.url"));
            String apiKey = "";

            Pay_JsonCancelVo payJsonCancelVo = new Pay_JsonCancelVo();
            payJsonCancelVo.setPgcode(payCancelPayletterVo.getPaycd());

            payJsonCancelVo.setClient_id(DalbitUtil.getProperty("payletter.client.id"));
            if(!activeProperties.equals("dev")){
                payJsonCancelVo.setClient_id(DalbitUtil.getProperty("payletter.client.id"));
                apiKey = DalbitUtil.getProperty("payletter.api.key");
            }else {
                if(payCancelPayletterVo.getPaycd().equals("cashbee") || payCancelPayletterVo.getPaycd().equals("tmoney")){
                    payJsonCancelVo.setClient_id(DalbitUtil.getProperty("payletter.cashbee.tmoney.client.id")); //?????????, ???????????? ??????
                    apiKey = DalbitUtil.getProperty("payletter.cashbee.tmoney.api.key");
                } else {
                    payJsonCancelVo.setClient_id(DalbitUtil.getProperty("payletter.payco.kakao.client.id"));     //?????????, ??????????????? ??????
                    apiKey = DalbitUtil.getProperty("payletter.payco.kakao.api.key");
                }
            }

            payJsonCancelVo.setUser_id(payCancelPayletterVo.getMemno());
            payJsonCancelVo.setTid(payCancelPayletterVo.getMobilid());
            payJsonCancelVo.setAmount(Integer.parseInt(payCancelPayletterVo.getPrdtprice()));
            payJsonCancelVo.setIp_addr(DalbitUtil.getIp(request));

            String jsonData = new Gson().toJson(payJsonCancelVo);
            log.debug("jsonData: {}", jsonData);
            HttpURLConnection objURLConnection = (HttpURLConnection)objUrl.openConnection();

            objURLConnection.setDoOutput(true);
            objURLConnection.setDoInput(true);
            objURLConnection.setRequestMethod("POST");
            objURLConnection.setRequestProperty("Content-Type", "application/json");
            objURLConnection.setRequestProperty("Authorization","PLKEY "+apiKey);

            OutputStream objOutputStream = objURLConnection.getOutputStream();

            objOutputStream.write(jsonData.getBytes());
            objOutputStream.flush();
            objOutputStream.close();

            log.debug("objURLConnection.getResponseCode(): {}", objURLConnection.getResponseCode());

            BufferedReader objReader = null;
            // Response Parameters (?????????) : tid, cid, amount, cancel_date
            if(objURLConnection.getResponseCode() == 200 ) {
                objReader = new BufferedReader(new InputStreamReader(objURLConnection.getInputStream()));
            }else{// Response Parameters (?????????) : code, message
                objReader = new BufferedReader(new InputStreamReader(objURLConnection.getErrorStream()));
            }

            String strInputLine;
            StringBuffer objStringBuffer = new StringBuffer();

            while ((strInputLine = objReader.readLine()) != null) {
                objStringBuffer.append(strInputLine);
            }
            objReader.close();
            objURLConnection.disconnect();

            log.info("bufferString: {}", objStringBuffer.toString());
            HashMap<String, String> parsingMap = new Gson().fromJson(objStringBuffer.toString(), HashMap.class);
            Pay_CancelVo cancelVo = new Pay_CancelVo();

            if(objURLConnection.getResponseCode() == 200){

                /*String tid = parsingMap.get("tid");
                String cid = parsingMap.get("cid");
                String amount = parsingMap.get("amount");*/
                String cancel_date = parsingMap.get("cancel_date");

                cancelVo.setOrderId(payCancelPayletterVo.getTradeid());
                cancelVo.setCancelDt(cancel_date);
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");
                cancelVo.setFailMsg("");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelPayletterVo.getMemno());
                pCancelVo.setOrder_id(payCancelPayletterVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelPayletterVo.getMemno(), payCancelPayletterVo.getPaycd(), payCancelPayletterVo.getOkdt()
                            , payCancelPayletterVo.getOktime(), payCancelPayletterVo.getPaycode(), payCancelPayletterVo.getItemamt()
                            , payCancelPayletterVo.getCardno(), payCancelPayletterVo.getCardnm(), payCancelPayletterVo.getMemBirth()
                            , payCancelPayletterVo.getPrdtprice(), payCancelPayletterVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payletterCancel ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {    //Response Parameters (?????????) : code, message
                log.error("[payletter] cancel error =====>>> ResponseCode: {}, ResponseMsg: {}", objURLConnection.getResponseCode(), objURLConnection.getResponseMessage());

                //String code = parsingMap.get("code");
                String message = parsingMap.get("message");

                cancelVo.setOrderId(payCancelPayletterVo.getTradeid());
                cancelVo.setCancelDt("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("f");
                cancelVo.setFailMsg(message);
                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }
            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     * ??????????????? ?????? ??????
     */
    public String payCancelGm(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException{

        String result;

        try{
            String svcId = DalbitUtil.getProperty("gm.service.id");
            String siteUrl = DalbitUtil.getProperty("pay.site.url");
            String tradeId = payCancelGiftVo.getTradeid();
            String prdtPrice = payCancelGiftVo.getPrdtprice();
            String mobilId = payCancelGiftVo.getMobilid();

            giftCncl gc = new giftCncl();
            Properties cnclRslt = gc.revokePayGM(siteUrl, svcId, tradeId, prdtPrice, mobilId);

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(cnclRslt.getProperty("resultCd").equals(Status.??????????????????.getMessageCode())){
                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFailMsg("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelGm ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[???????????????] ????????????: {}", cnclRslt.getProperty("resultCd"));
                log.info("[???????????????] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt("");
                cancelVo.setFailMsg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("f");
                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }
            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     * ????????????????????? ?????? ??????
     */
    public String payCancelGg(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException{

        String result;

        try{
            String svcId = DalbitUtil.getProperty("gg.service.id");
            String siteUrl = DalbitUtil.getProperty("pay.site.url");
            String tradeId = payCancelGiftVo.getTradeid();
            String prdtPrice = payCancelGiftVo.getPrdtprice();
            String mobilId = payCancelGiftVo.getMobilid();

            giftCncl gc = new giftCncl();
            Properties cnclRslt = gc.revokePayGG(siteUrl, svcId, tradeId, prdtPrice, mobilId);

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(cnclRslt.getProperty("resultCd").equals(Status.??????????????????.getMessageCode())){
                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFailMsg("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelGg ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[?????????????????????] ????????????: {}", cnclRslt.getProperty("resultCd"));
                log.info("[?????????????????????] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt("");
                cancelVo.setFailMsg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }

            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     * ????????????????????? ?????? ??????
     */
    public String payCancelGc(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException{

        String result;

        try{
            String svcId = DalbitUtil.getProperty("gc.service.id");
            String siteUrl = DalbitUtil.getProperty("pay.site.url");
            String tradeId = payCancelGiftVo.getTradeid();
            String prdtPrice = payCancelGiftVo.getPrdtprice();
            String mobilId = payCancelGiftVo.getMobilid();

            giftCncl gc = new giftCncl();
            Properties cnclRslt = gc.revokePayGC(siteUrl, svcId, tradeId, prdtPrice, mobilId);

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(cnclRslt.getProperty("resultCd").equals(Status.??????????????????.getMessageCode())){
                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFailMsg("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelGc ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[?????????????????????] ????????????: {}", cnclRslt.getProperty("resultCd"));
                log.info("[?????????????????????] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt("");
                cancelVo.setFailMsg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }

            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     * ????????????????????? ?????? ??????
     */
    public String payCancelHm(Pay_CancelGiftVo payCancelGiftVo) throws GlobalException{

        String result;

        try{
            String svcId = DalbitUtil.getProperty("hm.service.id");
            String siteUrl = DalbitUtil.getProperty("pay.site.url");
            String tradeId = payCancelGiftVo.getTradeid();
            String prdtPrice = payCancelGiftVo.getPrdtprice();
            String mobilId = payCancelGiftVo.getMobilid();

            giftCncl gc = new giftCncl();
            Properties cnclRslt = gc.revokePayHM(siteUrl, svcId, tradeId, prdtPrice, mobilId);

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(cnclRslt.getProperty("resultCd").equals(Status.??????????????????.getMessageCode())){
                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFailMsg("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelHm ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[?????????????????????] ????????????: {}", cnclRslt.getProperty("resultCd"));
                log.info("[?????????????????????] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrderId(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancelDt("");
                cancelVo.setFailMsg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }
            //?????? ????????????
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.????????????????????????);
        }

        return result;
    }


    /**
     * ???????????? ??? ??????
     */
    public HashMap dalCancel(P_CancelVo pCancelVo){
        ProcedureVo procedureVo = new ProcedureVo(pCancelVo);
        payCancelDao.dalCancel(procedureVo);
        HashMap result = new HashMap();
        if(Status.?????????_??????.getMessageCode().equals(procedureVo.getRet())) {
            result.put("status", Status.?????????_??????);
        }else if(Status.?????????_??????????????????.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.?????????_??????????????????);
        }else if(Status.?????????_??????????????????.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.?????????_??????????????????);
        }else if(Status.?????????_??????????????????.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.?????????_??????????????????);
        }else if(Status.?????????_???????????????.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.?????????_???????????????);
        }else if(Status.?????????_???????????????.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.?????????_???????????????);
        }else {
            result.put("status", Status.?????????_??????);
        }
        return result;
    }

    /**
     * ???????????? ????????????????????? ?????? ?????? ????????? ??????
     */

    // ?????????
    private int birthToAmericanAge(int birthYear, int birthMonth, int birthDay) {
        Calendar cal = Calendar.getInstance();
        int nowYear = cal.get(Calendar.YEAR);
        int nowMonth = cal.get(Calendar.MONTH) + 1;
        int nowDay = cal.get(Calendar.DAY_OF_MONTH);
        int monthAndDay = Integer.parseInt(nowMonth + "" + nowDay);

        int birthMonthAndDay = Integer.parseInt(birthMonth + "" + birthDay);
        int yearDiff = nowYear - birthYear;
        int monthAndDayDiff = monthAndDay - birthMonthAndDay;
        int manAge = yearDiff;

        if(monthAndDayDiff < 0) {
            manAge--;
        }

        return manAge;
    }

    // ?????? ??????
    private String isAdultYn(String birth) {
        String isAdultYn = "n"; // ????????????
        try {
            String[] splitedBirth = birth.split("-");
            int birthYear = Integer.parseInt(splitedBirth[0]);
            int birthMonth = Integer.parseInt(splitedBirth[1]);
            int birthDay = Integer.parseInt(splitedBirth[2]);
            int americanAge = birthToAmericanAge(birthYear, birthMonth, birthDay);

            if(americanAge >= 19) isAdultYn = "y"; // ??????
        } catch (Exception e) {
            log.error("Pay_CancelService / sendPayCancelMail ?????? / ?????? ?????? ?????? : ", e);
        }

        return isAdultYn;
    }

    // ?????? ??????
    private void sendPayCancelMail(PayCancelSendEmailVo payCancelSendEmailVo) {
        // ?????? ?????? (??????????????? ????????? ??????)
        if(StringUtils.equals(isAdultYn(payCancelSendEmailVo.getMemBirth()), "y")) return;

        String memNo = payCancelSendEmailVo.getMemNo();
        String sHtml = "";
        StringBuffer mailContent = new StringBuffer();
        BufferedReader in = null;

        try{
            // ??????????????? ?????? ??????
            ParentsAuthSelVo parentsAuthSelVo = common.parentsAuthSel(memNo);

            // ?????? ?????? ??????
            if(parentsAuthSelVo == null) {
                log.error("Pay_CancelService / sendPayCancelMail ??????????????? ?????? ?????? ?????? => memNo: {}", memNo);
                return;
            }

            // ?????? ?????? ?????? ??????
            URL url = new URL("http://image.dalbitlive.com/resource/mailForm/payCancel.txt");
            URLConnection urlconn = url.openConnection();
            in = new BufferedReader(new InputStreamReader(urlconn.getInputStream(),"utf-8"));

            while((sHtml = in.readLine()) != null){
                mailContent.append("\n");
                mailContent.append(sHtml);
            }

            String msgCont;
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String today = dateFormat.format(new Date());

            DecimalFormat formatter = new DecimalFormat("###,###");
            int payPrice = Integer.parseInt(payCancelSendEmailVo.getItemPrice());
            String priceComma = formatter.format(payPrice);

            String cancelUserName = parentsAuthSelVo.getMem_name();
            String cancelUserLastLetterReplace = "";
            if(cancelUserName != null) {
                cancelUserLastLetterReplace = cancelUserName.substring(0, cancelUserName.length()-1) + "*"; // ?????? ????????? ?????? * ??????
            }else {
                log.error("sendPayCancelMail / mem_name??? null?????????. memNo: {} (??????????????? ???????????? ????????? ??????????????? ??????????????? ??????)", memNo);
                cancelUserLastLetterReplace = "***";
            }

            msgCont = mailContent.toString().replaceAll("@@cancelUserName@@", cancelUserLastLetterReplace); // ?????? ??????
            msgCont = msgCont.replaceAll("@@paymentDate@@", payCancelSendEmailVo.getOkdt()); // ????????????
            msgCont = msgCont.replaceAll("@@paymentMethod@@", payCancelSendEmailVo.getPaycdName()); // ????????????
            msgCont = msgCont.replaceAll("@@paymentAccount@@", payCancelSendEmailVo.getHideCardNo()); // ????????????1
            msgCont = msgCont.replaceAll("@@paymentBank@@", payCancelSendEmailVo.getCardnm()); // ????????????2
            msgCont = msgCont.replaceAll("@@paymentProduct@@", payCancelSendEmailVo.getPaycode()); // ????????????
            msgCont = msgCont.replaceAll("@@paymentQuantity@@", payCancelSendEmailVo.getItemamt()); // ????????????
            msgCont = msgCont.replaceAll("@@paymentPrice@@", priceComma + "???"); // ????????????
            msgCont = msgCont.replaceAll("@@cancelDate@@", today); // ????????????
            msgCont = msgCont.replaceAll("@@cancelPrice@@", priceComma + "???"); // ????????????

            EmailInputVo emailInputVo = new EmailInputVo();
            emailInputVo.setTitle("??????????????? ?????? ?????? ??????");
            emailInputVo.setMsgCont(msgCont);
            emailInputVo.setRcvMail(parentsAuthSelVo.getParents_mem_email());
            emailService.sendEmail(emailInputVo);

            // ?????? ?????? ?????? ?????? ins
            ParentsEmailLogInsVo parentsEmailLogInsVo = new ParentsEmailLogInsVo();
            parentsEmailLogInsVo.setMemNo(memNo);
            parentsEmailLogInsVo.setMailSlct("c");

            String cancelAccount = payCancelSendEmailVo.getCardno();

            JSONObject mailEtcInfo = new JSONObject();
            mailEtcInfo.put("cancelUserName", cancelUserLastLetterReplace); // ???????????? ????????? ?????? *
            mailEtcInfo.put("paymentDate", payCancelSendEmailVo.getOkdt());
            mailEtcInfo.put("paymentMethod", payCancelSendEmailVo.getPaycdName());
            mailEtcInfo.put("paymentAccount", payCancelSendEmailVo.getHideCardNo()); // ???????????? *??????(????????????)
            mailEtcInfo.put("paymentBank", payCancelSendEmailVo.getCardnm());
            mailEtcInfo.put("paymentProduct", payCancelSendEmailVo.getPaycode());
            mailEtcInfo.put("paymentQuantity", payCancelSendEmailVo.getItemamt());
            mailEtcInfo.put("paymentPrice", payPrice + "???");
            mailEtcInfo.put("cancelDate", today);
            mailEtcInfo.put("cancelPrice", payPrice + "???");
            mailEtcInfo.put("cancelUserFullName", cancelUserName); // ?????? ??????
            mailEtcInfo.put("cancelAccountFullName", cancelAccount); // ?????? ????????????

            parentsEmailLogInsVo.setMailEtc(mailEtcInfo.toString());
            parentsEmailLogInsVo.setPMemEmail(parentsAuthSelVo.getParents_mem_email());
            common.parentsAuthEmailLogIns(parentsEmailLogInsVo);
        }
        catch(Exception e){
            log.error("Pay_CancelService / sendPayCancelMail ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
        }
    }

    /**
     * ???????????????(??????) ?????? ??????
     */
    public String payCancelKakaoMoney(Pay_CancelKakaoPayVo payCancelKakaoPayVo) throws GlobalException{
        String result;
        // ????????? ????????? Body
        RequestBody formBody = new FormBody.Builder()
                .add("cid", DalbitUtil.getProperty("kakao.cid"))
                .add("tid", payCancelKakaoPayVo.getMobilid())
                .add("cancel_amount", String.valueOf(payCancelKakaoPayVo.getPrdtprice()))
                .add("cancel_tax_free_amount","0")
                .build();

        try{
            OkHttpClientUtil okHttpClientUtil = new OkHttpClientUtil();
            Response response = okHttpClientUtil.sendKakaoPost(DalbitUtil.getProperty("kakao.host") + "/v1/payment/cancel", formBody);
            String data = response.body().string();

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(response.code() == 200){
                KakaoPayCancelResVo kakaoPayCancelResVo = new Gson().fromJson(data, KakaoPayCancelResVo.class);
                cancelVo.setOrderId(payCancelKakaoPayVo.getTradeid());
                cancelVo.setCancelDt(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                cancelVo.setFailMsg("");
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("y");

                //???????????? ??? ??????
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelKakaoPayVo.getMemno());
                pCancelVo.setOrder_id(payCancelKakaoPayVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.?????????_??????)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelKakaoPayVo.getMemno(), payCancelKakaoPayVo.getPaycd(), payCancelKakaoPayVo.getOkdt()
                            , payCancelKakaoPayVo.getOktime(), payCancelKakaoPayVo.getPaycode(), payCancelKakaoPayVo.getItemamt()
                            , payCancelKakaoPayVo.getCardno(), payCancelKakaoPayVo.getCardnm(), payCancelKakaoPayVo.getMemBirth()
                            , payCancelKakaoPayVo.getPrdtprice(), payCancelKakaoPayVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelKakaoMoney ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {
                FailVo failVo = new Gson().fromJson(data, FailVo.class);
                log.info("=====================================");
                log.warn("[???????????????(??????)] ????????????: {}", failVo.getCode());
//                log.warn("[???????????????(??????)] Result Msg: {}", failVo.getExtras().getMethod_result_message());
                log.info("=====================================");

                cancelVo.setOrderId(payCancelKakaoPayVo.getTradeid());
                cancelVo.setCancelDt(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
                cancelVo.setFailMsg(Integer.toString(failVo.getCode()));
                cancelVo.setOpName(MemberVo.getMyMemNo());
                cancelVo.setCancelState("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }
            //?????? ????????????
            Integer success = payCancelDao.sendPayCancel(cancelVo);

        }catch (RestClientException | IOException e) {
            throw new GlobalException(Status.????????????????????????, e);
        }
        return result;
    }

    /**
     * ????????????(??????) ?????? ??????
     */
    public String payCancelSimple(Pay_CancelSimplePayVo payCancelSimplePayVo) throws NoSuchPaddingException, UnsupportedEncodingException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidKeyException, GlobalException, ParseException {

        //String ci = ???asdjaslkdj21j3120mlqkwdj1092dj12dj12odjlkdj1???; //sms ???????????? ci
        String ID = DalbitUtil.getProperty("simple.service.id");
        String API_ID = DalbitUtil.getProperty("simple.cancel.api.id");
        String CRYPT_KEY = DalbitUtil.getProperty("simple.crypt.key");
        String trx_dt = payCancelSimplePayVo.getOkdt().replace("-", "");    //????????????
        String trx_tm = payCancelSimplePayVo.getOktime().replace(":", "");  //????????????

        JSONObject param = new JSONObject();
        param.put("ci", ""); //??????
        param.put("order_tr_dt", SecurityUtil.null2void(trx_dt, ""));
        param.put("order_tr_no", SecurityUtil.null2void(payCancelSimplePayVo.getTradeid(), ""));
        param.put("amt", SecurityUtil.null2void(payCancelSimplePayVo.getPrdtprice(), ""));
        param.put("proc_dv", "C"); //?????????????????? C:??????????????????, S:?????????????????????
        String EV = SecurityUtil.EncryptAesBase64(trx_dt + trx_tm + param.toString(), CRYPT_KEY, true);
        String VV = SecurityUtil.getHmacSha256(param.toString(), CRYPT_KEY, true);
        String url = DalbitUtil.getProperty("simple.pay.url")+ "/" + API_ID + "?ID=" + ID
                + "&RQ_DTIME=" + trx_dt + trx_tm
                + "&TNO=" + trx_dt + trx_tm
                + "&EV=" + EV
                + "&VV=" + VV
                + "&EM=AES"
                + "&VM=HmacSHA256";
        HttpURLConnection con = null;
        BufferedWriter bwriter = null;
        DataInputStream in = null;
        ByteArrayOutputStream bout = null;

        try {
            URL req = new URL(url);
            con = (HttpURLConnection) req.openConnection();
            con.setConnectTimeout(2 * 60 * 1000); // 2???

            con.setDoOutput(true);
            con.setDoInput(true);

            bwriter = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
            bwriter.flush();
            log.info("LinkTestProc:response code ::" + con.getResponseCode());
            log.info("LinkTestProc:response msg ::" + con.getResponseMessage());
            in = new DataInputStream(con.getInputStream());
            bout = new ByteArrayOutputStream();

            while (true) {
                byte[] buf = new byte[2048];
                int n = in.read(buf);
                if (n == -1) break;
                bout.write(buf, 0, n);
            }
            bout.flush();
        } catch (Exception e) {
            e.printStackTrace();
            throw new GlobalException(Status.????????????????????????, e);
        } finally {
            try {
                if (bwriter != null) bwriter.close();
                if (in != null) in.close();
                if (bout != null) bout.close();
                if (con != null) con.disconnect();
            } catch (Exception se) {

            }
        }
        String result = "";
        String respData = new String(bout.toByteArray());
        JSONObject rtn = JSONObject.fromObject(respData);
        log.info("rtn: {}", rtn);
        Pay_CancelVo cancelVo = new Pay_CancelVo();
        if(Status.??????????????????.getMessageCode().equals(rtn.get("RC"))){
            cancelVo.setOrderId(payCancelSimplePayVo.getTradeid());
            cancelVo.setCancelDt(DalbitUtil.stringToDatePattern((String)rtn.get("RS_DTIME"), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss"));
            cancelVo.setFailMsg("");
            cancelVo.setOpName(MemberVo.getMyMemNo());
            cancelVo.setCancelState("y");

            //???????????? ??? ??????
            P_CancelVo pCancelVo = new P_CancelVo();
            pCancelVo.setMem_no(payCancelSimplePayVo.getMemno());
            pCancelVo.setOrder_id(payCancelSimplePayVo.getTradeid());
            HashMap resultMap = dalCancel(pCancelVo);

            if(resultMap.get("status").equals(Status.?????????_??????)){
                try {
                    PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                        payCancelSimplePayVo.getMemno(), payCancelSimplePayVo.getPaycd(), payCancelSimplePayVo.getOkdt()
                        , payCancelSimplePayVo.getOktime(), payCancelSimplePayVo.getPaycode(), payCancelSimplePayVo.getItemamt()
                        , payCancelSimplePayVo.getCardno(), payCancelSimplePayVo.getCardnm(), payCancelSimplePayVo.getMemBirth()
                        , payCancelSimplePayVo.getPrdtprice(), payCancelSimplePayVo.getHideCardNo()
                    );
                    sendPayCancelMail(payCancelSendEmailVo); // ???????????? ???????????? ????????????????????? ?????? ??????
                } catch (Exception e) {
                    log.error("Pay_CancelService / payCancelSimple ???????????? ?????? ?????? ????????? ?????? ?????? : ", e);
                }
                result =  gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
            }
        }else{
            log.info("=====================================");
            log.info("[????????????] ????????????: {}", DalbitUtil.isEmpty(rtn.get("RC")) ? "??????" : rtn.get("RC"));
            log.info("[????????????] ???????????????: {}", DalbitUtil.isEmpty(rtn.get("RM")) ? "??????" : rtn.get("RM"));
            log.info("=====================================");

            cancelVo.setOrderId(payCancelSimplePayVo.getTradeid());
            cancelVo.setCancelDt("");
            cancelVo.setFailMsg((String) rtn.get("RM"));
            cancelVo.setOpName(MemberVo.getMyMemNo());
            cancelVo.setCancelState("f");

            result = gsonUtil.toJson(new JsonOutputVo(Status.??????????????????));
        }
        //?????? ????????????
        payCancelDao.sendPayCancel(cancelVo);

        return result;
    }
}
