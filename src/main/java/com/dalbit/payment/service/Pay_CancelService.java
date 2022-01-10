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
     *  신용카드 결제 취소
     */
    public String payCancelCard(Pay_CancelCardVo payCancelCardVo) throws GlobalException{

        String result;
        try{
            String mode			= "CN07";   //거래모드
            String recordKey	= CommonUtil.Decode(DalbitUtil.getProperty("pay.site.url"));    //사이트URL
            String svcId		= CommonUtil.Decode(DalbitUtil.getProperty("card.service.id")); //서비스아이디
            String tradeId		= CommonUtil.Decode(payCancelCardVo.getTradeid());              //거래번호(달빛)
            String mobilId		= CommonUtil.Decode(payCancelCardVo.getMobilid());              //거래번호(모빌리언스)
            String prdtPrice	= CommonUtil.Decode(payCancelCardVo.getPrdtprice());            //취소금액
            String partCancelYn	= CommonUtil.Decode(payCancelCardVo.getPartCancelYn());         //부분취소여부

            McashManager mm = new McashManager();
            AckParam ap = mm.McashApprv(
                    mode,			/* 거래모드 */
                    recordKey,		/* 사이트URL */
                    svcId,			/* 서비스아이디 */
                    mobilId,		/* 모빌리언스거래번호 */
                    tradeId,		/* 가맹점거래번호 */
                    prdtPrice,		/* 상품금액 */
                    "",		/* 자동결제키 */
                    partCancelYn	/* 부분취소여부 */
            );

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(ap.getResultCd().equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(ap.getTradeId());
                cancelVo.setCancel_dt(DalbitUtil.stringToDate(ap.getSignDate()));
                cancelVo.setFail_msg("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelCardVo.getMemno());
                pCancelVo.setOrder_id(payCancelCardVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelCardVo.getMemno(), payCancelCardVo.getPaycd(), payCancelCardVo.getOkdt()
                            , payCancelCardVo.getOktime(), payCancelCardVo.getPaycode(), payCancelCardVo.getItemamt()
                            , payCancelCardVo.getCardno(), payCancelCardVo.getCardnm(), payCancelCardVo.getMemBirth()
                            , payCancelCardVo.getPrdtprice(), payCancelCardVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelCard 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result =  gsonUtil.toJson(new JsonOutputVo((Status)resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("신용카드 취소코드: {}", ap.getResultCd());
                log.info("Fail Msg: {}", ap.getResultMsg());
                log.info("=====================================");

                cancelVo.setOrder_id(ap.getTradeId());
                cancelVo.setCancel_dt("");
                cancelVo.setFail_msg(ap.getResultMsg());
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state(ap.getResultCd().equals("M231") ? "y" :"f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }
            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     *  휴대폰 결제 취소
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
            if(res_cd.equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(tradeId);
                cancelVo.setCancel_dt(DalbitUtil.getDate("yyyy-MM-dd")+" "+DalbitUtil.getDate("HH:mm:ss"));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");
                cancelVo.setFail_msg("");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelPhoneVo.getMemno());
                pCancelVo.setOrder_id(payCancelPhoneVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelPhoneVo.getMemno(), payCancelPhoneVo.getPaycd(), payCancelPhoneVo.getOkdt()
                            , payCancelPhoneVo.getOktime(), payCancelPhoneVo.getPaycode(), payCancelPhoneVo.getItemamt()
                            , payCancelPhoneVo.getCardno(), payCancelPhoneVo.getCardnm(), payCancelPhoneVo.getMemBirth()
                            , payCancelPhoneVo.getPrdtprice(), payCancelPhoneVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelPhone 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result =  gsonUtil.toJson(new JsonOutputVo((Status)resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("휴대폰 취소코드: {}", res_cd);
                log.info("=====================================");

                cancelVo.setOrder_id(tradeId);
                cancelVo.setCancel_dt("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state(res_cd.equals(CancelPhoneCode.이미취소된자료.getCode()) ? "y" :"f");

                String resultMsg = "";
                boolean checked = false;
                for (CancelPhoneCode code : CancelPhoneCode.values()) {
                    /*log.info("코드일치여부: {}", res_cd.equals(code.getCode()));
                    log.info("실패 메시지 코드: {}", code.getCode());*/
                    if(!checked) {
                        if (res_cd.equals(code.getCode())) {
                            resultMsg = code.getDesc();
                            checked = true;
                        } else {
                            resultMsg = "알수없음";
                            checked = false;
                        }
                    }
                }
                cancelVo.setFail_msg(resultMsg);
                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }

            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 페이레터 결제취소
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
                    payJsonCancelVo.setClient_id(DalbitUtil.getProperty("payletter.cashbee.tmoney.client.id")); //캐시비, 티머니일 경우
                    apiKey = DalbitUtil.getProperty("payletter.cashbee.tmoney.api.key");
                } else {
                    payJsonCancelVo.setClient_id(DalbitUtil.getProperty("payletter.payco.kakao.client.id"));     //페이코, 카카오페이 경우
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
            // Response Parameters (성공시) : tid, cid, amount, cancel_date
            if(objURLConnection.getResponseCode() == 200 ) {
                objReader = new BufferedReader(new InputStreamReader(objURLConnection.getInputStream()));
            }else{// Response Parameters (실패시) : code, message
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

                cancelVo.setOrder_id(payCancelPayletterVo.getTradeid());
                cancelVo.setCancel_dt(cancel_date);
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");
                cancelVo.setFail_msg("");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelPayletterVo.getMemno());
                pCancelVo.setOrder_id(payCancelPayletterVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelPayletterVo.getMemno(), payCancelPayletterVo.getPaycd(), payCancelPayletterVo.getOkdt()
                            , payCancelPayletterVo.getOktime(), payCancelPayletterVo.getPaycode(), payCancelPayletterVo.getItemamt()
                            , payCancelPayletterVo.getCardno(), payCancelPayletterVo.getCardnm(), payCancelPayletterVo.getMemBirth()
                            , payCancelPayletterVo.getPrdtprice(), payCancelPayletterVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payletterCancel 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {    //Response Parameters (실패시) : code, message
                log.error("[payletter] cancel error =====>>> ResponseCode: {}, ResponseMsg: {}", objURLConnection.getResponseCode(), objURLConnection.getResponseMessage());

                //String code = parsingMap.get("code");
                String message = parsingMap.get("message");

                cancelVo.setOrder_id(payCancelPayletterVo.getTradeid());
                cancelVo.setCancel_dt("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("f");
                cancelVo.setFail_msg(message);
                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }
            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 문화상품권 결제 취소
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
            if(cnclRslt.getProperty("resultCd").equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFail_msg("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelGm 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[문화상품권] 취소코드: {}", cnclRslt.getProperty("resultCd"));
                log.info("[문화상품권] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt("");
                cancelVo.setFail_msg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("f");
                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }
            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 게임문화상품권 결제 취소
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
            if(cnclRslt.getProperty("resultCd").equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFail_msg("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelGg 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[게임문화상품권] 취소코드: {}", cnclRslt.getProperty("resultCd"));
                log.info("[게임문화상품권] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt("");
                cancelVo.setFail_msg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }

            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 도서문화상품권 결제 취소
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
            if(cnclRslt.getProperty("resultCd").equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFail_msg("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelGc 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[도서문화상품권] 취소코드: {}", cnclRslt.getProperty("resultCd"));
                log.info("[도서문화상품권] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt("");
                cancelVo.setFail_msg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }

            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 해피머니상품권 결제 취소
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
            if(cnclRslt.getProperty("resultCd").equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt(DalbitUtil.stringToDate(cnclRslt.getProperty("actDate")));
                cancelVo.setFail_msg("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelGiftVo.getMemno());
                pCancelVo.setOrder_id(payCancelGiftVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelGiftVo.getMemno(), payCancelGiftVo.getPaycd(), payCancelGiftVo.getOkdt()
                            , payCancelGiftVo.getOktime(), payCancelGiftVo.getPaycode(), payCancelGiftVo.getItemamt()
                            , payCancelGiftVo.getCardno(), payCancelGiftVo.getCardnm(), payCancelGiftVo.getMemBirth()
                            , payCancelGiftVo.getPrdtprice(), payCancelGiftVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelHm 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {

                log.info("=====================================");
                log.info("[해피머니상품권] 취소코드: {}", cnclRslt.getProperty("resultCd"));
                log.info("[해피머니상품권] Result Msg: {}", cnclRslt.getProperty("resultMsg"));
                log.info("=====================================");

                cancelVo.setOrder_id(cnclRslt.getProperty("tradeId"));
                cancelVo.setCancel_dt("");
                cancelVo.setFail_msg(cnclRslt.getProperty("resultMsg"));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }
            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 결제취소 달 차감
     */
    public HashMap dalCancel(P_CancelVo pCancelVo){
        ProcedureVo procedureVo = new ProcedureVo(pCancelVo);
        payCancelDao.dalCancel(procedureVo);
        HashMap result = new HashMap();
        if(Status.달차감_성공.getMessageCode().equals(procedureVo.getRet())) {
            result.put("status", Status.달차감_성공);
        }else if(Status.달차감_주문번호없음.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.달차감_주문번호없음);
        }else if(Status.달차감_회원번호오류.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.달차감_회원번호오류);
        }else if(Status.달차감_결제완료아님.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.달차감_결제완료아님);
        }else if(Status.달차감_이미취소됨.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.달차감_이미취소됨);
        }else if(Status.달차감_보유달부족.getMessageCode().equals(procedureVo.getRet())){
            result.put("status", Status.달차감_보유달부족);
        }else {
            result.put("status", Status.달차감_실패);
        }
        return result;
    }

    /**
     * 미성년자 법정대리인에게 결제 취소 이메일 발송
     */

    // 만나이
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

    // 성인 구분
    private String isAdultYn(String birth) {
        String isAdultYn = "n"; // 미성년자
        try {
            SimpleDateFormat sd = new SimpleDateFormat("yyyy");
            Date time = new Date();
            int now = Integer.parseInt(sd.format(time));
            String[] splitedBirth = birth.split("-");
            int birthYear = Integer.parseInt(splitedBirth[0]);
            int birthMonth = Integer.parseInt(splitedBirth[1]);
            int birthDay = Integer.parseInt(splitedBirth[2]);
            int americanAge = birthToAmericanAge(birthYear, birthMonth, birthDay);

            if(now - americanAge >= 19) isAdultYn = "y"; // 성인
        } catch (Exception e) {
            log.error("Pay_CancelService / sendPayCancelMail 시간 / 나이 변환 에러 : ", e);
        }

        return isAdultYn;
    }

    // 메일 발송
    private void sendPayCancelMail(PayCancelSendEmailVo payCancelSendEmailVo) {
        // 나이 체크 (미성년자만 이메일 발송)
        if(StringUtils.equals(isAdultYn(payCancelSendEmailVo.getMemBirth()), "y")) return;

        String memNo = payCancelSendEmailVo.getMemNo();
        String sHtml = "";
        StringBuffer mailContent = new StringBuffer();
        BufferedReader in = null;

        try{
            // 법정대리인 인증 정보
            ParentsAuthSelVo parentsAuthSelVo = common.parentsAuthSel(memNo);

            // 인증 정보 없음
            if(parentsAuthSelVo == null) {
                log.error("Pay_CancelService / sendPayCancelMail 법정대리인 인증 정보 없음 => memNo: {}", memNo);
                return;
            }

            // 결제 취소 메일 발송
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

            msgCont = mailContent.toString().replaceAll("@@cancelUserName@@", parentsAuthSelVo.getMem_name()); // 유저 이름
            msgCont = msgCont.replaceAll("@@paymentDate@@", payCancelSendEmailVo.getOkdt()); // 거래일시
            msgCont = msgCont.replaceAll("@@paymentMethod@@", payCancelSendEmailVo.getPaycdName()); // 결제수단
            msgCont = msgCont.replaceAll("@@paymentAccount@@", payCancelSendEmailVo.getHideCardNo()); // 결제정보1
            msgCont = msgCont.replaceAll("@@paymentBank@@", payCancelSendEmailVo.getCardnm()); // 결제정보2
            msgCont = msgCont.replaceAll("@@paymentProduct@@", payCancelSendEmailVo.getPaycode()); // 결제상품
            msgCont = msgCont.replaceAll("@@paymentQuantity@@", payCancelSendEmailVo.getItemamt()); // 결제수량
            msgCont = msgCont.replaceAll("@@paymentPrice@@", payCancelSendEmailVo.getItemPrice()); // 결제금액
            msgCont = msgCont.replaceAll("@@cancelDate@@", today); // 취소일시
            msgCont = msgCont.replaceAll("@@cancelPrice@@", payCancelSendEmailVo.getItemPrice()); // 취소금액

            EmailInputVo emailInputVo = new EmailInputVo();
            emailInputVo.setTitle("달빛라이브 결제 취소 알림");
            emailInputVo.setMsgCont(msgCont);
            emailInputVo.setRcvMail(parentsAuthSelVo.getParents_mem_email());
            emailService.sendEmail(emailInputVo);

            // 메일 발송 성공 로그 ins
            ParentsEmailLogInsVo parentsEmailLogInsVo = new ParentsEmailLogInsVo();
            parentsEmailLogInsVo.setMemNo(memNo);
            parentsEmailLogInsVo.setMailSlct("c");

            String cancelUserName = parentsAuthSelVo.getMem_name();
            String cancelUserLastLetterReplace = cancelUserName.substring(0, cancelUserName.length()-1) + "*"; // 이름 마지막 글자 * 처리
            String cancelAccount = payCancelSendEmailVo.getCardno();

            JSONObject mailEtcInfo = new JSONObject();
            mailEtcInfo.put("cancelUserName", cancelUserLastLetterReplace); // 회원이름 마지막 글자 *
            mailEtcInfo.put("paymentDate", payCancelSendEmailVo.getOkdt());
            mailEtcInfo.put("paymentMethod", payCancelSendEmailVo.getPaycdName());
            mailEtcInfo.put("paymentAccount", payCancelSendEmailVo.getHideCardNo()); // 계좌번호 *처리(카드결제)
            mailEtcInfo.put("paymentBank", payCancelSendEmailVo.getCardnm());
            mailEtcInfo.put("paymentProduct", payCancelSendEmailVo.getPaycode());
            mailEtcInfo.put("paymentQuantity", payCancelSendEmailVo.getItemamt());
            mailEtcInfo.put("paymentPrice", payCancelSendEmailVo.getItemPrice());
            mailEtcInfo.put("cancelDate", today);
            mailEtcInfo.put("cancelPrice", payCancelSendEmailVo.getItemPrice());
            mailEtcInfo.put("cancelUserFullName", cancelUserName); // 회원 이름
            mailEtcInfo.put("cancelAccountFullName", cancelAccount); // 결제 계좌번호

            parentsEmailLogInsVo.setMailEtc(mailEtcInfo.toString());
            parentsEmailLogInsVo.setPMemEmail(parentsAuthSelVo.getParents_mem_email());
            common.parentsAuthEmailLogIns(parentsEmailLogInsVo);
        }
        catch(Exception e){
            log.error("Pay_CancelService / sendPayCancelMail 미성년자 결제 취소 이메일 발송 에러 : ", e);
        }
    }

    /**
     * 카카오페이(머니) 결제 취소
     */
    public String payCancelKakaoMoney(Pay_CancelKakaoPayVo payCancelKakaoPayVo) throws GlobalException{
        String result;
        // 서버로 요청할 Body
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
                cancelVo.setOrder_id(payCancelKakaoPayVo.getTradeid());
                cancelVo.setCancel_dt(kakaoPayCancelResVo.getCanceled_at().replace("T", " "));
                cancelVo.setFail_msg("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");

                //결제취소 달 차감
                P_CancelVo pCancelVo = new P_CancelVo();
                pCancelVo.setMem_no(payCancelKakaoPayVo.getMemno());
                pCancelVo.setOrder_id(payCancelKakaoPayVo.getTradeid());
                HashMap resultMap = dalCancel(pCancelVo);

                if(resultMap.get("status").equals(Status.달차감_성공)){
                    try {
                        PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                            payCancelKakaoPayVo.getMemno(), payCancelKakaoPayVo.getPaycd(), payCancelKakaoPayVo.getOkdt()
                            , payCancelKakaoPayVo.getOktime(), payCancelKakaoPayVo.getPaycode(), payCancelKakaoPayVo.getItemamt()
                            , payCancelKakaoPayVo.getCardno(), payCancelKakaoPayVo.getCardnm(), payCancelKakaoPayVo.getMemBirth()
                            , payCancelKakaoPayVo.getPrdtprice(), payCancelKakaoPayVo.getHideCardNo()
                        );
                        sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                    } catch (Exception e) {
                        log.error("Pay_CancelService / payCancelKakaoMoney 미성년자 결제 취소 이메일 발송 에러 : ", e);
                    }
                    result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
                }else {
                    result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
                }
            } else {
                FailVo failVo = new Gson().fromJson(data, FailVo.class);
                log.info("=====================================");
                log.info("[카카오페이(머니)] 취소코드: {}", failVo.getCode());
//                log.info("[카카오페이(머니)] Result Msg: {}", failVo.getExtras().getMethod_result_message());
                log.info("=====================================");

                cancelVo.setOrder_id(payCancelKakaoPayVo.getTradeid());
                cancelVo.setCancel_dt("");
                cancelVo.setFail_msg(Integer.toString(failVo.getCode()));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("f");

                result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
            }
            //취소 업데이트
            payCancelDao.sendPayCancel(cancelVo);

        }catch (RestClientException | IOException e) {
            throw new GlobalException(Status.비즈니스로직오류, e);
        }
        return result;
    }

    /**
     * 간편결제(계좌) 결제 취소
     */
    public String payCancelSimple(Pay_CancelSimplePayVo payCancelSimplePayVo) throws NoSuchPaddingException, UnsupportedEncodingException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, IllegalBlockSizeException, BadPaddingException, InvalidKeyException, GlobalException, ParseException {

        //String ci = “asdjaslkdj21j3120mlqkwdj1092dj12dj12odjlkdj1”; //sms 본인인증 ci
        String ID = DalbitUtil.getProperty("simple.service.id");
        String API_ID = DalbitUtil.getProperty("simple.cancel.api.id");
        String CRYPT_KEY = DalbitUtil.getProperty("simple.crypt.key");
        String trx_dt = payCancelSimplePayVo.getOkdt().replace("-", "");    //거래일자
        String trx_tm = payCancelSimplePayVo.getOktime().replace(":", "");  //거래시각

        JSONObject param = new JSONObject();
        param.put("ci", ""); //선택
        param.put("order_tr_dt", SecurityUtil.null2void(trx_dt, ""));
        param.put("order_tr_no", SecurityUtil.null2void(payCancelSimplePayVo.getTradeid(), ""));
        param.put("amt", SecurityUtil.null2void(payCancelSimplePayVo.getPrdtprice(), ""));
        param.put("proc_dv", "C"); //취소처리구분 C:쿠콘자체처리, S:제휴사자체처리
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
            con.setConnectTimeout(2 * 60 * 1000); // 2분

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
            throw new GlobalException(Status.비즈니스로직오류, e);
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
        if(Status.결제취소성공.getMessageCode().equals(rtn.get("RC"))){
            cancelVo.setOrder_id(payCancelSimplePayVo.getTradeid());
            cancelVo.setCancel_dt(DalbitUtil.stringToDatePattern((String)rtn.get("RS_DTIME"), "yyyyMMddHHmmss", "yyyy-MM-dd HH:mm:ss"));
            cancelVo.setFail_msg("");
            cancelVo.setOp_name(MemberVo.getMyMemNo());
            cancelVo.setCancel_state("y");

            //결제취소 달 차감
            P_CancelVo pCancelVo = new P_CancelVo();
            pCancelVo.setMem_no(payCancelSimplePayVo.getMemno());
            pCancelVo.setOrder_id(payCancelSimplePayVo.getTradeid());
            HashMap resultMap = dalCancel(pCancelVo);

            if(resultMap.get("status").equals(Status.달차감_성공)){
                try {
                    PayCancelSendEmailVo payCancelSendEmailVo = new PayCancelSendEmailVo(
                        payCancelSimplePayVo.getMemno(), payCancelSimplePayVo.getPaycd(), payCancelSimplePayVo.getOkdt()
                        , payCancelSimplePayVo.getOktime(), payCancelSimplePayVo.getPaycode(), payCancelSimplePayVo.getItemamt()
                        , payCancelSimplePayVo.getCardno(), payCancelSimplePayVo.getCardnm(), payCancelSimplePayVo.getMemBirth()
                        , payCancelSimplePayVo.getPrdtprice(), payCancelSimplePayVo.getHideCardNo()
                    );
                    sendPayCancelMail(payCancelSendEmailVo); // 미성년자 결제취소 법정대리인한테 메일 발송
                } catch (Exception e) {
                    log.error("Pay_CancelService / payCancelSimple 미성년자 결제 취소 이메일 발송 에러 : ", e);
                }
                result =  gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo((Status) resultMap.get("status")));
            }
        }else{
            log.info("=====================================");
            log.info("[간편결제] 취소코드: {}", DalbitUtil.isEmpty(rtn.get("RC")) ? "없음" : rtn.get("RC"));
            log.info("[간편결제] 결과메시지: {}", DalbitUtil.isEmpty(rtn.get("RM")) ? "없음" : rtn.get("RM"));
            log.info("=====================================");

            cancelVo.setOrder_id(payCancelSimplePayVo.getTradeid());
            cancelVo.setCancel_dt("");
            cancelVo.setFail_msg((String) rtn.get("RM"));
            cancelVo.setOp_name(MemberVo.getMyMemNo());
            cancelVo.setCancel_state("f");

            result = gsonUtil.toJson(new JsonOutputVo(Status.결제취소실패));
        }
        //취소 업데이트
        payCancelDao.sendPayCancel(cancelVo);

        return result;
    }
}
