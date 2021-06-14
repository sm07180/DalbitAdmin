package com.dalbit.common.service;

import com.dalbit.common.code.ErrorStatus;
import com.dalbit.common.dao.SmsDao;
import com.dalbit.common.proc.SmsProc;
import com.dalbit.common.vo.SmsProcVO;
import com.dalbit.common.vo.SmsVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.util.DalbitUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class SmsService {

    @Autowired SmsDao smsDao;
    @Autowired SmsProc smsProc;

    /**
     * SMS 문자 발송 - 타겟
     * */
    public int sendSms(SmsVo smsVo) throws GlobalException {
        return sendSmsCommon(smsVo, "S");
    }

    private int sendSmsCommon(SmsVo smsVo, String msgSlct) throws GlobalException {
        if(DalbitUtil.isEmpty(smsVo.getPhoneNo())){
            return 0;
        }

        SmsProcVO smsProcVO = new SmsProcVO();
        smsVo.setPhoneNo(smsVo.getPhoneNo().replaceAll("-", ""));

        if(!DalbitUtil.isSmsPhoneNoChk(smsVo.getPhoneNo())){
            throw new GlobalException(ErrorStatus.휴대폰번호검증오류);
        }
        smsProcVO.setSendPhone("1522-0251");
        smsProcVO.setMsgSlct(msgSlct);
        smsProcVO.setRcvPhone(smsVo.getPhoneNo());
        smsProcVO.setTitleConts(smsVo.getSubject());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsProcVO.setMsgBody(cont);
        }

        smsProcVO.setRsrvDt(smsVo.getSend_time());
        smsProcVO.setTranSlct(Integer.parseInt(smsVo.getVxmlFile()));

        return smsProc.sendSms(smsProcVO);
    }

    /**
     * LMS 문자 발송 - 타겟
     * */
    public int sendMms(SmsVo smsVo)throws GlobalException{
        log.error("@@@@@@@@@@@@@@@ 발송 log 확인  ===> {}", smsVo);
        return sendSmsCommon(smsVo, "L");
    }

    private int sendSmsTestCommon(SmsVo smsVo, String msgSlct, boolean isAll) {
        SmsProcVO smsProcVO = new SmsProcVO();

        smsProcVO.setSendPhone("1522-0251");
        smsProcVO.setMsgSlct(msgSlct);
        smsProcVO.setTitleConts(smsVo.getSubject());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsProcVO.setMsgBody(cont);
        }

        smsProcVO.setTestYn(isAll ? "n" : "y");
        smsProcVO.setRsrvDt(smsVo.getSend_time());
        smsProcVO.setTranSlct(Integer.parseInt(smsVo.getVxmlFile()));

        return smsProc.sendSmsBroadcast(smsProcVO);
    }

    /**
     * SMS 문자 발송 - 테스트 계정 전체
     * */
    public int sendSmsTargetTest(SmsVo smsVo)throws GlobalException{
        return sendSmsTestCommon(smsVo, "S", false);
    }

    /**
     * LMS 문자 발송 - 테스트 계정 전체
     * */
    public int sendMmsTargetTest(SmsVo smsVo)throws GlobalException{
        return sendSmsTestCommon(smsVo, "L", false);
    }


    /**
     * SMS 문자 발송 - 모든 유저 전체
     * */
    public int sendSmsTargetMemberAll(SmsVo smsVo)throws GlobalException{
        return sendSmsTestCommon(smsVo, "S", true);
    }


    /**
     * LMS 문자 발송 - 모든 유저 전체
     * */
    public int sendMmsTargetMemberAll(SmsVo smsVo)throws GlobalException{
        return sendSmsTestCommon(smsVo, "L", true);
    }

}
