package com.dalbit.payment.service;

import com.dalbit.common.code.CancelPhoneCode;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.procedure.P_MemberEditorVo;
import com.dalbit.payment.dao.Pay_CancelDao;
import com.dalbit.payment.module.cnnew_v0003.AckParam;
import com.dalbit.payment.module.cnnew_v0003.CommonUtil;
import com.dalbit.payment.module.cnnew_v0003.McashManager;
import com.dalbit.payment.module.mcCancel_v0001.MC_Cancel;
import com.dalbit.payment.module.ucCancel_v0001.CancelUc;
import com.dalbit.payment.vo.Pay_CancelBankVo;
import com.dalbit.payment.vo.Pay_CancelCardVo;
import com.dalbit.payment.vo.Pay_CancelPhoneVo;
import com.dalbit.payment.vo.Pay_CancelVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.ParseException;

@Slf4j
@Service
public class Pay_CancelService {

    @Autowired
    Pay_CancelDao payCancelDao;

    @Autowired
    Mem_MemberDao mem_MemberDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     *  신용카드 결제 취소
     */
    public int payCancelCard(Pay_CancelCardVo payCancelCardVo) throws GlobalException{

        int result = 0;

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
            }

            //취소 업데이트
            result = payCancelDao.sendPayCancel(cancelVo);

            P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
            pMemberEditorVo.setMem_no(payCancelCardVo.getMemno());
            pMemberEditorVo.setMinusDalCnt(payCancelCardVo.getDalcnt());
            getMemberDalMinus(pMemberEditorVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     *  휴대폰 결제 취소
     */
    public int payCancelPhone(Pay_CancelPhoneVo payCancelPhoneVo) throws GlobalException{

        int result = 0;

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
            }

            //취소 업데이트
            result = payCancelDao.sendPayCancel(cancelVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }

    /**
     *  실계좌이체 결제 취소
     */
    public int payCancelBank(Pay_CancelBankVo payCancelBankVo) throws GlobalException{

        int result = 0;

        try{
            String cashGb    = CommonUtil.trim("RA");
            String recordKey = CommonUtil.trim(CommonUtil.Decode(DalbitUtil.getProperty("pay.site.url")));
            String svcId     = CommonUtil.trim(DalbitUtil.getProperty("bank.service.id"));
            String tradeId   = CommonUtil.trim(payCancelBankVo.getTradeid());
            String prdtPrice = CommonUtil.trim(payCancelBankVo.getPrdtprice());
            String mobilId   = CommonUtil.trim(payCancelBankVo.getMobilid());

            CancelUc can = new CancelUc();
            com.dalbit.payment.module.ucCancel_v0001.AckParam ap = can.cancelProc(cashGb, recordKey, svcId, tradeId, prdtPrice, mobilId);

            Pay_CancelVo cancelVo = new Pay_CancelVo();
            if(ap.getResultCd().equals(Status.결제취소성공.getMessageCode())){
                cancelVo.setOrder_id(tradeId);
                cancelVo.setCancel_dt(DalbitUtil.getDate("yyyy-MM-dd")+" "+DalbitUtil.getDate("HH:mm:ss"));
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state("y");
                cancelVo.setFail_msg("");
            } else {
                log.info("=====================================");
                log.info("실계좌이체 취소코드: {}", ap.getResultCd());
                log.info("Fail Msg: {}", ap.getResultMsg());
                log.info("=====================================");

                cancelVo.setOrder_id(tradeId);
                cancelVo.setCancel_dt("");
                cancelVo.setOp_name(MemberVo.getMyMemNo());
                cancelVo.setCancel_state(ap.getResultCd().equals("0087") ? "y" :"f");
                cancelVo.setFail_msg(ap.getResultMsg());
            }

            //취소 업데이트
            result = payCancelDao.sendPayCancel(cancelVo);

            P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
            pMemberEditorVo.setMem_no(payCancelBankVo.getMemno());
            pMemberEditorVo.setMinusDalCnt(payCancelBankVo.getDalcnt());
            getMemberDalMinus(pMemberEditorVo);

        }catch (Exception e){
            throw new GlobalException(Status.비즈니스로직오류);
        }

        return result;
    }


    /**
     * 결제 취소 달 차감
     */
    public String getMemberDalMinus(P_MemberEditorVo pMemberEditorVo) {

        // 가지고 있는 dal
        int beforDalCnt = mem_MemberDao.callMemberBeforDelCnt(pMemberEditorVo);
        int afterDalCnt = beforDalCnt - pMemberEditorVo.getMinusDalCnt();

        // 보유한 달 보다 차감되는 달이 많을 경우
        if(beforDalCnt < pMemberEditorVo.getMinusDalCnt()){
            return gsonUtil.toJson(new JsonOutputVo(Status.보유달부족));
        }

        // 달 set
        pMemberEditorVo.setBeforDalCnt(beforDalCnt);
        pMemberEditorVo.setAfterDalCnt(afterDalCnt);
        pMemberEditorVo.setUse_contents("결제취소 : 달 " + pMemberEditorVo.getMinusDalCnt() + " 차감");

        // 달 차감
        mem_MemberDao.callMemberAddDal(pMemberEditorVo);
        // 달 차감 로그
        mem_MemberDao.callMemberMinusDal_history(pMemberEditorVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.결제취소성공));
    }

}
