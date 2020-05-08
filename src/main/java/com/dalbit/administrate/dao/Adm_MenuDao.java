package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Adm_MenuDao {

    @Transactional(readOnly = true)
    ArrayList<P_MenuListOutputVo> callMenuList();

    @Transactional(readOnly = true)
    HashMap<P_MenuInfoOutputVo,String> callMenuInfo(P_MenuInfoInputVo pMenuInfoInputVo);

    @Transactional(readOnly = true)
    int callMenuSel(P_MenuUpdateInputVo pMenuUpdateInputVo);

    int callMenuUpdate(P_MenuUpdateInputVo pMenuUpdateInputVo);
    int callMenuInsert(P_MenuUpdateInputVo pMenuUpdateInputVo);
    int callMenuInfoUpdate(P_MenuInfoUpdateInputVo pMenuInfoUpdateInputVo);
    int callMenuDelete(P_MenuDeleteInputVo pMenuDeleteInputVo);
}
