package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.*;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Adm_MenuDao {
    ArrayList<P_MenuListOutputVo> callMenuList();

    HashMap<P_MenuInfoOutputVo,String> callMenuInfo(P_MenuInfoInputVo pMenuInfoInputVo);
    int callMenuSel(P_MenuUpdateInputVo pMenuUpdateInputVo);
    int callMenuUpdate(P_MenuUpdateInputVo pMenuUpdateInputVo);
    int callMenuInsert(P_MenuUpdateInputVo pMenuUpdateInputVo);
    int callMenuInfoUpdate(P_MenuInfoUpdateInputVo pMenuInfoUpdateInputVo);
}
