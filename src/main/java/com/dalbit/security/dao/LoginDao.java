package com.dalbit.security.dao;

import com.dalbit.common.vo.UserVo;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDao {
    UserVo login(String userId);
}
