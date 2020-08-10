package com.dalbit.common.service;

import com.dalbit.common.dao.EmailDao;
import com.dalbit.common.vo.EmailVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.validation.constraints.Email;
import java.io.UnsupportedEncodingException;

@Slf4j
@Service
public class EmailService {

    @Autowired
    EmailDao emailDao;

    /**
     * 이메일 발송 - 타겟
     * */
    public int sendEmail(EmailVo emailVo) throws UnsupportedEncodingException {
        EmailVo sendEmailVo = new EmailVo(emailVo.getTitle(), emailVo.getRcvMail(), emailVo.getMsgCont());
        return emailDao.sendEmail(sendEmailVo);
    }
}
