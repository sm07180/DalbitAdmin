package com.dalbit.common.service;

import com.dalbit.common.dao.EmailDao;
import com.dalbit.common.vo.EmailVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;

@Slf4j
@Service
public class EmailService {

    @Autowired
    EmailDao emailDao;

    /**
     * 이메일 발송 - 타겟
     * */
    public int sendEmail() throws UnsupportedEncodingException {

        String title = new String("제목".getBytes("utf-8"), "euc-kr");
        String rcvMail = new String("leejaeho114@gmail.com".getBytes("utf-8"), "euc-kr");
        String msgCont = new String("내용".getBytes("utf-8"), "euc-kr");

        return emailDao.sendEmail(new EmailVo(title, rcvMail, msgCont));
    }
}
