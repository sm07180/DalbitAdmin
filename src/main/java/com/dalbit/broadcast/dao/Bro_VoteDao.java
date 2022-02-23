package com.dalbit.broadcast.dao;

import com.dalbit.broadcast.vo.procedure.P_VoteInputVo;
import com.dalbit.broadcast.vo.procedure.P_VoteItemOutputVo;
import com.dalbit.broadcast.vo.procedure.P_VoteListOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Bro_VoteDao {
    @Transactional(readOnly = true)
    ArrayList<P_VoteListOutputVo> callVoteList(P_VoteInputVo pVoteInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_VoteItemOutputVo> callVoteItemList(P_VoteInputVo pVoteInputVo);
}
