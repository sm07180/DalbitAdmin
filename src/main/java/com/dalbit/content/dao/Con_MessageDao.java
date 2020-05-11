package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_MessageDao {
    @Transactional(readOnly = true)
    ArrayList<P_MessageListOutputVo> callContentsMessageList(P_MessageListInputVo pMessageListInputVo);
    @Transactional(readOnly = true)
    int callContentsMessageListCnt(P_MessageListInputVo pMessageListInputVo);
    @Transactional(readOnly = true)
    P_MessageDetailOutputVo callContentsMessageDetail(P_MessageDetailInputVo pMessageDetailInputVo);


    int callContentsMessageAdd(P_MessageInsertVo pMessageInsertVo);
}
