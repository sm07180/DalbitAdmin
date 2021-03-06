package com.dalbit.content.dao;

import com.dalbit.content.vo.*;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Con_CrewDao {

    int insertCrewName(CrewInsertVo crewInsertVo);

    int updateCrewMemo(CrewUpdateVo crewUpdateVo);

    @Transactional(readOnly = true)
    ArrayList<CrewListVo> selectCrewInfo(CrewListVo crewListVo);
    @Transactional(readOnly = true)
    int selectCrewInfoCnt(CrewListVo crewListVo);

    int insertCrewMember(CrewMemberInsertVo crewMemberInsertVo);

    @Transactional(readOnly = true)
    String selectMemberInfo(CrewMemberInsertVo crewMemberInsertVo);

    @Transactional(readOnly = true)
    int duplicateCheckCnt(CrewMemberInsertVo crewMemberInsertVo);

    @Transactional(readOnly = true)
    ArrayList<CrewMemberListVo> selectCrewMemberInfo(CrewMemberListVo crewMemberListVo);
    @Transactional(readOnly = true)
    int selectCrewMemberInfoCnt(CrewMemberListVo crewMemberListVo);

    int updateCrewLeader(CrewMemberInsertVo crewMemberInsertVo);

    int updateResetCrewLeader(CrewMemberInsertVo crewMemberInsertVo);

    int updateDelStateCrew(CrewUpdateDelStateVo crewUpdateDelStateVo);

    int deleteCrewMember(CrewMemberDeleteVo crewMemberDeleteVo);

    int updateState(CrewListVo crewListVo);
}
