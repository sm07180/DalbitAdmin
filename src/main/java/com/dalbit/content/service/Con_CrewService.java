package com.dalbit.content.service;

import com.dalbit.content.dao.Con_CrewDao;
import com.dalbit.content.vo.CrewInsertVo;
import com.dalbit.content.vo.CrewListVo;
import com.dalbit.content.vo.CrewMemberInsertVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.vo.CrewMemberListVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.dalbit.common.code.Status;

import java.util.ArrayList;

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
        crewInsertVo.setCrewName(crewInsertVo.getCrewName());

        int result = crewDao.insertCrewName(crewInsertVo);

        if (result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루명등록_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루명등록_실패));
        }
    }

    /**
     * 크루명 조회
     */
    public String selectCrewInfo(CrewListVo crewListVo) {
        int count = crewDao.selectCrewInfoCnt(crewListVo);
        crewListVo.setTotalCnt(count);
        crewListVo.setCrewIdx(crewListVo.getCrewIdx());
        ArrayList<CrewListVo> crewList = crewDao.selectCrewInfo(crewListVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, crewList, new PagingVo(crewListVo.getTotalCnt(), crewListVo.getPageStart(), crewListVo.getPageCnt())));

        return result;
    }

    /**
     * mem_no 조회를 위한 간단 조회
     */
    public String selectMemNo(String memInfo) {
        String result = crewDao.selectMemberInfo(memInfo);
        return result;
    }

    /**
     * 크루원 등록
     */
    public String insertCrewMember(CrewMemberInsertVo crewMemberInsertVo) {
        crewMemberInsertVo.setOpName(MemberVo.getMyMemNo());
        crewMemberInsertVo.setCrewIdx(crewMemberInsertVo.getCrewIdx());
        String memNo = selectMemNo(crewMemberInsertVo.getMemInfo());
        crewMemberInsertVo.setMemNo(memNo);

        int result = crewDao.insertCrewMember(crewMemberInsertVo);

        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루원등록_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.크루원등록_실패));
        }
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
}
