package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_noticeDetailOutputVo;
import com.dalbit.content.vo.procedure.P_noticeListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface NoticeDao {
    ArrayList<P_noticeListOutputVo> callServiceCenterNoticeList(ProcedureVo procedureVo);
    P_noticeDetailOutputVo callServiceCenterNoticeListDetail(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterNoticeAdd(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterNoticeUpdate(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterNoticeDelete(ProcedureVo procedureVo);
}
