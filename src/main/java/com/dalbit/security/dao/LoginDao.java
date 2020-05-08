package com.dalbit.security.dao;

import com.dalbit.member.vo.MemberVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface LoginDao {

    @Transactional(readOnly = true)
    MemberVo loginUseMemId(MemberVo memberVo);

    @Transactional(readOnly = true)
    MemberVo loginUseMemNo(String userId);
}
