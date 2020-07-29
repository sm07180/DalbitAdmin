package com.dalbit.common.dao;

import com.dalbit.common.vo.EmailVo;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public interface EmailDao {
    @Qualifier("emailDataSource")
    @Resource(name="email")
    int sendEmail(EmailVo emailVo);
}
