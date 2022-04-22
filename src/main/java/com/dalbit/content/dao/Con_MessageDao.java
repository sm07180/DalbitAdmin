package com.dalbit.content.dao;

import com.dalbit.broadcast.vo.procedure.P_BroadcastListOutputVo;
import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface Con_MessageDao {
    @Transactional(readOnly = true)
    ArrayList<P_MessageListOutputVo> callContentsMessageList(P_MessageListInputVo pMessageListInputVo);
    @Transactional(readOnly = true)
    int callContentsMessageListCnt(P_MessageListInputVo pMessageListInputVo);
    @Transactional(readOnly = true)
    P_MessageDetailOutputVo callContentsMessageDetail(P_MessageDetailInputVo pMessageDetailInputVo);

    @Transactional(readOnly = true)
    List<P_BroadcastListOutputVo> callContentsMessageSendRoomList(List<String> arrRooms);

    int callContentsMessageAdd(P_MessageInsertVo pMessageInsertVo);

    int callContentsMessageDel(P_MessageDeleteVo pMessageDeleteVo);
}
