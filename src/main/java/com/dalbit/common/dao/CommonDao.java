package com.dalbit.common.dao;

import com.dalbit.common.vo.CodeListVo;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.MenuVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public interface CommonDao {

    @Transactional(readOnly = true)
    List<Map> callCodeDefineSelect();

    @Transactional(readOnly = true)
    List<MenuVo> getMenuInfo(MenuVo menuVo);

    @Transactional(readOnly = true)
    ArrayList<CodeListVo> getCodeList(CodeListVo codeListVo);

    ProcedureVo saveErrorLog(ProcedureVo procedureVo);
}
