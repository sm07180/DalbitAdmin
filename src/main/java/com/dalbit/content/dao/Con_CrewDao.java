package com.dalbit.content.dao;

import com.dalbit.content.vo.CrewInsertVo;
import com.dalbit.content.vo.CrewListVo;
import com.dalbit.content.vo.CrewMemberInsertVo;
import com.dalbit.content.vo.CrewMemberListVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_CrewDao {

    int insertCrewName(CrewInsertVo crewInsertVo);

    @Transactional(readOnly = true)
    ArrayList<CrewListVo> selectCrewInfo(CrewListVo crewListVo);
    @Transactional(readOnly = true)
    int selectCrewInfoCnt(CrewListVo crewListVo);

    int insertCrewMember(CrewMemberInsertVo crewMemberInsertVo);

    @Transactional(readOnly = true)
    String selectMemberInfo(CrewMemberInsertVo crewMemberInsertVo);

    @Transactional(readOnly = true)
    ArrayList<CrewMemberListVo> selectCrewMemberInfo(CrewMemberListVo crewMemberListVo);
    @Transactional(readOnly = true)
    int selectCrewMemberInfoCnt(CrewMemberListVo crewMemberListVo);

    int updateCrewLeader(CrewMemberInsertVo crewMemberInsertVo);

    int updateResetCrewLeader(CrewMemberInsertVo crewMemberInsertVo);
}
