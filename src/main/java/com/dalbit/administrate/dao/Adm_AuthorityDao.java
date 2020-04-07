package com.dalbit.administrate.dao;

import com.dalbit.common.vo.MenuAuthVo;
import com.dalbit.common.vo.MenuVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Adm_AuthorityDao {

    void deleteMenuAuth(int empNo);
    void insertMenuAuth(MenuAuthVo menuAuthVo);
    List<MenuVo> getMemberAuthInfo(int empNo);
}
