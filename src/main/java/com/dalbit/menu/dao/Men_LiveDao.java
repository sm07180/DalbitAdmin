package com.dalbit.menu.dao;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.menu.vo.LiveVo;
import com.dalbit.menu.vo.procedure.P_RoomListVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface Men_LiveDao {
    @Transactional(readOnly = true)
    List<P_RoomListVo> callBroadCastRoomList(ProcedureVo procedureVo);
    List<LiveVo> getLiveList(LiveVo liveVo);
    int getLiveListCnt(LiveVo liveVo);
}
