package com.dalbit.content.service;

import com.dalbit.content.dao.Con_CrewDao;
import com.dalbit.content.vo.*;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.Status;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@Service
public class Con_CrewService {

    @Autowired
    Con_CrewDao crewDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    /**
     * 크루명 등록
     */
    public String insertCrewName(CrewInsertVo crewInsertVo) {
        crewInsertVo.setOpName(MemberVo.getMyMemNo());
        int result = 0;
        if(!DalbitUtil.isEmpty(crewInsertVo.getCrewName())) {
            result = crewDao.insertCrewName(crewInsertVo);
        }
        if (result > 0) {
             return gsonUtil.toJson(new JsonOutputVo(Status.크루등록_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루등록_실패));
        }
    }


    /**
     * 크루명 등록
     */
    public String updateCrewMemo(CrewUpdateVo crewUpdateVo) {
        crewUpdateVo.setOpName(MemberVo.getMyMemNo());
        int result = 0;
        result = crewDao.updateCrewMemo(crewUpdateVo);

        if (result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루명수정_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루명수정_실패));
        }
    }


    /**
     * 크루명 조회
     */
    public String selectCrewInfo(CrewListVo crewListVo) {
        int count = crewDao.selectCrewInfoCnt(crewListVo);
        crewListVo.setTotalCnt(count);
        ArrayList<CrewListVo> crewList = crewDao.selectCrewInfo(crewListVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, crewList, new PagingVo(count, crewListVo.getPageStart(), crewListVo.getPageCnt())));

        return result;
    }

    /**
     * mem_no 조회를 위한 간단 조회
     */
    public String selectMemNo(CrewMemberInsertVo crewMemberInsertVo) {
        String result = crewDao.selectMemberInfo(crewMemberInsertVo);
        return result;
    }

    /**
     * 크루원 중복 등록 체크
     */
    public int duplicateCheckCnt(CrewMemberInsertVo crewMemberInsertVo) {
        int result = crewDao.duplicateCheckCnt(crewMemberInsertVo);
        return result;
    }

    /**
     * 크루원 등록
     */
    public String insertCrewMember(CrewMemberInsertVo crewMemberInsertVo) {
        crewMemberInsertVo.setOpName(MemberVo.getMyMemNo());

        String result;
        int val = 0;
        int val2 = 0;
        if(!DalbitUtil.isEmpty(crewMemberInsertVo.getMemInfo()) && crewMemberInsertVo.getCrewIdx() != 0) {
            String memNo = selectMemNo(crewMemberInsertVo);
            crewMemberInsertVo.setMemNo(memNo);

            if(!DalbitUtil.isEmpty(memNo)) {
                val2 = duplicateCheckCnt(crewMemberInsertVo);
                if(val2 == 0) {
                    val = crewDao.insertCrewMember(crewMemberInsertVo);
                }
            }

            if(val2 > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.크루원등록_이미등록된회원));
            } else if(val > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.크루원등록_성공));
            } else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.크루원등록_해당회원정보없음));
            }
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.크루원등록_실패));
        }
         return result;
    }

    /**
     * 크루원 조회
     */
    public String selectCrewMemberInfo(CrewMemberListVo crewMemberListVo) {
        int count = crewDao.selectCrewMemberInfoCnt(crewMemberListVo);
        crewMemberListVo.setTotalCnt(count);
        ArrayList<CrewMemberListVo> memberList = crewDao.selectCrewMemberInfo(crewMemberListVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, memberList, new PagingVo(crewMemberListVo.getTotalCnt(), crewMemberListVo.getPageStart(), crewMemberListVo.getPageCnt())));

        return result;
    }

    /**
     * 크루장 지정
     */
    public String updateCrewLeader(CrewMemberInsertVo crewMemberInsertVo) {
        crewMemberInsertVo.setLastOpName(MemberVo.getMyMemNo());
        Status status;

        // leader_yn이 0이면 그냥 0으로 치면 됨
        if(crewMemberInsertVo.getLeader_yn() == 1){
            crewDao.updateResetCrewLeader(crewMemberInsertVo);
        }

        int val = crewDao.updateCrewLeader(crewMemberInsertVo);
        if(val > 0) {
            if(crewMemberInsertVo.getLeader_yn() == 1){
                status = Status.크루장지정_성공;
            }else{
                status = Status.크루장취소_성공;
            }

        }else{
            if(crewMemberInsertVo.getLeader_yn() == 1){
                status = Status.크루장지정_실패;
            }else{
                status = Status.크루장취소_실패;
            }
        }
        String result = gsonUtil.toJson(new JsonOutputVo(status));
        return result;
    }

    /**
     * 크루 삭제
     */
    public String updateDelStateCrew(CrewUpdateDelStateVo crewUpdateDelStateVo) {

        int sucCnt = 0;
        int failCnt = 0;

        String result;

        String[] crewIdx = crewUpdateDelStateVo.getCrewIdxs().split(",");
        for(int i=0; i<crewIdx.length; i++) {
            if(!DalbitUtil.isEmpty(crewUpdateDelStateVo.getCrewIdxs())) {
                int val = crewDao.updateDelStateCrew(new CrewUpdateDelStateVo(crewIdx[i], MemberVo.getMyMemNo()));
                if(val > 0) {
                    sucCnt++;
                } else {
                    failCnt++;
                }
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.크루삭제_성공, resultMap));
        }
        else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.크루삭제_실패, resultMap));
        }
        return result;
    }

    /**
     * 크루원 삭제
     */
    public String deleteCrewMember(CrewMemberDeleteVo crewMemberDeleteVo) {
        crewMemberDeleteVo.setLastOpName(MemberVo.getMyMemNo());

        int sucCnt = 0;
        int failCnt = 0;

        String result;

        String[] crewMemberIdx = crewMemberDeleteVo.getCrewMemberIdxs().split(",");
        for(int i=0; i<crewMemberIdx.length; i++) {
            if(!DalbitUtil.isEmpty(crewMemberDeleteVo.getCrewMemberIdxs())) {
                int val = crewDao.deleteCrewMember(new CrewMemberDeleteVo(crewMemberIdx[i]));
                if(val > 0) {
                    sucCnt++;
                } else {
                    failCnt++;
                }
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.크루원삭제_성공, resultMap));
        }
        else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.크루원삭제_실패, resultMap));
        }
        return result;
    }

    public String updateState(CrewListVo crewListVo) {
        crewListVo.setOpName(MemberVo.getMyMemNo());
        int goodResult = crewDao.updateState(crewListVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.수정, goodResult));
    }


}
