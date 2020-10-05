package com.dalbit.common.dao;

import com.dalbit.common.vo.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
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

    List<FanBadgeVo> callMemberBadgeSelect(HashMap param);

    List<FanBadgeVo> callLiveBadgeSelect(HashMap param);

}
