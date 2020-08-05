package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_EmoticonDao {

    @Transactional(readOnly = true)
    ArrayList<P_EmoticonCategoryListOutputVo> callAdminEmoticonCategorySelect(ProcedureVo procedureVo);

    ProcedureVo callAdminEmoticonCategoryEdit(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    ArrayList<P_EmoticonListOutputVo> callAdminEmoticonSelect(ProcedureVo procedureVo);

    ProcedureVo callAdminEmoticonAdd(ProcedureVo procedureVo);
    ArrayList<P_EmoticonListOutputVo> callAdminEmoticonEdit(ProcedureVo procedureVo);

}
