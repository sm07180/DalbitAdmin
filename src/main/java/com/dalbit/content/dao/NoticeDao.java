package com.dalbit.content.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.vo.procedure.P_noticeDetailOutputVo;
import com.dalbit.content.vo.procedure.P_noticeListOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface NoticeDao {

//    @Transactional(readOnly = true)
    ArrayList<P_noticeListOutputVo> callServiceCenterNoticeList(ProcedureVo procedureVo);

    @Transactional(readOnly = true)
    P_noticeDetailOutputVo callServiceCenterNoticeListDetail(ProcedureVo procedureVo);

    ProcedureVo callServiceCenterNoticeAdd(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterNoticeUpdate(ProcedureVo procedureVo);
    ProcedureVo callServiceCenterNoticeDelete(ProcedureVo procedureVo);
}
