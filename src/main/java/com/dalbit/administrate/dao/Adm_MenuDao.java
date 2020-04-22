package com.dalbit.administrate.dao;

import com.dalbit.administrate.vo.procedure.P_MenuInfoInputVo;
import com.dalbit.administrate.vo.procedure.P_MenuInfoOutputVo;
import com.dalbit.administrate.vo.procedure.P_MenuListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Repository
public interface Adm_MenuDao {
    ArrayList<P_MenuListOutputVo> callMenuList();

    HashMap<P_MenuInfoOutputVo,String> callMenuInfo(P_MenuInfoInputVo pMenuInfoInputVo);
}
