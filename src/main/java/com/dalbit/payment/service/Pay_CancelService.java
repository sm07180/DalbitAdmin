package com.dalbit.payment.service;

import com.dalbit.common.code.CancelPhoneCode;
import com.dalbit.common.code.Status;
import com.dalbit.member.vo.MemberVo;
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

@Slf4j
@Service
public class Pay_CancelService {

    @Autowired
    Pay_CancelDao payCancelDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     *  신용카드 결제 취소
     */
    public int payCancelCard(Pay_CancelCardVo payCancelCardVo) throws IOException {

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
            /*cancelVo.setCancel_dt(ap.getSignDate());*/
            cancelVo.setCancel_dt(DalbitUtil.getDate("yyyy-MM-dd")+" "+DalbitUtil.getDate("HH:mm:ss"));
            cancelVo.setFail_msg("");
            cancelVo.setOp_name(MemberVo.getMyMemNo());
            cancelVo.setCancel_state("y");
        } else {
            cancelVo.setOrder_id(ap.getTradeId());
            cancelVo.setCancel_dt("");
            cancelVo.setFail_msg(ap.getResultMsg());
            cancelVo.setOp_name(MemberVo.getMyMemNo());
            cancelVo.setCancel_state(ap.getResultCd().equals("M231") ? "y" :"f");
        }

        int result = payCancelDao.sendPayCancel(cancelVo);
        return result;
    }


    /**
     *  휴대폰 결제 취소
     */
    public int payCancelPhone(Pay_CancelPhoneVo payCancelPhoneVo) throws IOException {

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
            cancelVo.setOrder_id(tradeId);
            cancelVo.setCancel_dt("");
            cancelVo.setOp_name(MemberVo.getMyMemNo());
            cancelVo.setCancel_state(res_cd.equals(CancelPhoneCode.이미취소된자료.getCode()) ? "y" :"f");

            String resultMsg = "";
            for (CancelPhoneCode code : CancelPhoneCode.values()) {
                if(res_cd.equals(code.getCode())){
                    resultMsg = code.getDesc();
                } else {
                    resultMsg = "알수없음";
                }
            }
            cancelVo.setFail_msg(resultMsg);
        }

        int result = payCancelDao.sendPayCancel(cancelVo);
        return result;
    }

    /**
     *  실계좌이체 결제 취소
     */
    public int payCancelBank(Pay_CancelBankVo payCancelBankVo) {

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
            cancelVo.setOrder_id(tradeId);
            cancelVo.setCancel_dt("");
            cancelVo.setOp_name(MemberVo.getMyMemNo());
            cancelVo.setCancel_state(ap.getResultCd().equals("0087") ? "y" :"f");
            cancelVo.setFail_msg(ap.getResultMsg());
        }

        int result = payCancelDao.sendPayCancel(cancelVo);
        return result;
    }
}
