package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_noticeListOutputVo;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeDao {
    P_noticeListOutputVo callServiceCenterNoticeList(ProcedureVo procedureVo);
    //ProcedureVo callServiceCenterNoticeAdd(ProcedureVo procedureVo);
}
