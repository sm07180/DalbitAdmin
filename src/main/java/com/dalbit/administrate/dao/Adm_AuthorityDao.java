package com.dalbit.administrate.dao;

import com.dalbit.common.vo.MenuAuthVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Adm_AuthorityDao {

    void deleteMenuAuth(int empNo);
    void insertMenuAuth(MenuAuthVo menuAuthVo);
    List<MenuAuthVo> getMemberAuthInfo(int empNo);
}
