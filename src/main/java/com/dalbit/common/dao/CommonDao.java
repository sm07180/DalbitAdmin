package com.dalbit.common.dao;

import com.dalbit.common.vo.MenuVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository
public interface CommonDao {

    @Transactional(readOnly = true)
    List<Map> callCodeDefineSelect();

    @Transactional(readOnly = true)
    List<MenuVo> getMenuInfo(MenuVo menuVo);
}
