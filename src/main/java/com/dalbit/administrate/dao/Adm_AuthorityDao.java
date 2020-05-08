package com.dalbit.administrate.dao;

import com.dalbit.common.vo.MenuAuthVo;
import com.dalbit.common.vo.MenuVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Adm_AuthorityDao {

    void deleteMenuAuth(int empNo);
    void insertMenuAuth(MenuAuthVo menuAuthVo);
    @Transactional(readOnly = true)
    List<MenuVo> getMemberAuthInfo(int empNo);
}
