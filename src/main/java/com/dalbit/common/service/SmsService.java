package com.dalbit.common.service;

import com.dalbit.common.code.ErrorStatus;
import com.dalbit.common.dao.SmsDao;
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
    @Autowired com.dalbit.common.proc.SmsService smsService;

    /**
     * SMS 문자 발송 - 타겟
     * */
    public int sendSms(SmsVo smsVo)throws GlobalException{

        if(DalbitUtil.isEmpty(smsVo.getPhoneNo())){
            return 0;
        }

        SmsProcVO smsProcVO = new SmsProcVO();

        smsVo.setPhoneNo(smsVo.getPhoneNo().replaceAll("-", ""));

        if(!DalbitUtil.isSmsPhoneNoChk(smsVo.getPhoneNo())){
            throw new GlobalException(ErrorStatus.휴대폰번호검증오류);
        }
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsProcVO.setSendPhone(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("0");
        smsProcVO.setMsgSlct("S");
        smsProcVO.setRcvPhone(smsVo.getPhoneNo());
        smsProcVO.setTitleConts(smsVo.getSubject());
        smsVo.setCinfo(DalbitUtil.isEmpty(smsVo.getCinfo()) ? "" : smsVo.getCinfo());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsVo.setMsgBody(cont);
            smsProcVO.setMsgBody(cont);
        }

        smsProcVO.setRsrvDt(smsVo.getSend_time());
        smsProcVO.setTranSlct(Integer.parseInt(smsVo.getVxmlFile()));

        return smsService.sendSms(smsProcVO);
    }


    /**
     * LMS 문자 발송 - 타겟
     * */
    public int sendMms(SmsVo smsVo)throws GlobalException{

        if(DalbitUtil.isEmpty(smsVo.getPhoneNo())){
            return 0;
        }

        smsVo.setPhoneNo(smsVo.getPhoneNo().replaceAll("-", ""));

        if(!DalbitUtil.isSmsPhoneNoChk(smsVo.getPhoneNo())){
            throw new GlobalException(ErrorStatus.휴대폰번호검증오류);
        }
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("5");
        smsVo.setVxmlFile(smsVo.getVxmlFile());
        smsVo.setCinfo(DalbitUtil.isEmpty(smsVo.getCinfo()) ? "" : smsVo.getCinfo());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsVo.setMsgBody(cont);
        }

        return smsDao.sendSms(smsVo);
    }


    /**
     * SMS 문자 발송 - 테스트 계정 전체
     * */
    public int sendSmsTargetTest(SmsVo smsVo)throws GlobalException{
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("0");
        smsVo.setVxmlFile(smsVo.getVxmlFile());
        smsVo.setCinfo(DalbitUtil.isEmpty(smsVo.getCinfo()) ? "" : smsVo.getCinfo());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsVo.setMsgBody(cont);
        }

        return smsDao.sendSmsTargetTest(smsVo);
    }


    /**
     * LMS 문자 발송 - 테스트 계정 전체
     * */
    public int sendMmsTargetTest(SmsVo smsVo)throws GlobalException{
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("5");
        smsVo.setVxmlFile(smsVo.getVxmlFile());
        smsVo.setCinfo(DalbitUtil.isEmpty(smsVo.getCinfo()) ? "" : smsVo.getCinfo());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsVo.setMsgBody(cont);
        }

        return smsDao.sendSmsTargetTest(smsVo);
    }


    /**
     * SMS 문자 발송 - 모든 유저 전체
     * */
    public int sendSmsTargetMemberAll(SmsVo smsVo)throws GlobalException{
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("0");
        smsVo.setVxmlFile(smsVo.getVxmlFile());
        smsVo.setCinfo(DalbitUtil.isEmpty(smsVo.getCinfo()) ? "" : smsVo.getCinfo());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsVo.setMsgBody(cont);
        }

        return smsDao.sendSmsTargetMemberAll(smsVo);
    }


    /**
     * LMS 문자 발송 - 모든 유저 전체
     * */
    public int sendMmsTargetMemberAll(SmsVo smsVo)throws GlobalException{
        smsVo.setSendPhoneNo(DalbitUtil.getProperty("sms.send.phone.no"));
        smsVo.setUmId(DalbitUtil.getProperty("sms.umid"));
        smsVo.setMsgType("5");
        smsVo.setVxmlFile(smsVo.getVxmlFile());
        smsVo.setCinfo(DalbitUtil.isEmpty(smsVo.getCinfo()) ? "" : smsVo.getCinfo());

        // 내부 개발 테스트 표시 추가 2020.07.01
        if("local".equals(DalbitUtil.getActiveProfile())){
            String cont = "[내부개발] " + smsVo.getMsgBody();
            smsVo.setMsgBody(cont);
        }

        return smsDao.sendSmsTargetMemberAll(smsVo);
    }

}
