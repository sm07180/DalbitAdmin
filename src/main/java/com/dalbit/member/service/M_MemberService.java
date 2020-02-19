package com.dalbit.member.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.M_MemberDao;
import com.dalbit.member.vo.*;

import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class M_MemberService {

    @Autowired
    M_MemberDao mMemberDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;

    @Value("${server.photo.url}")
    private String SERVER_PHOTO_URL;

    public ProcedureVo callMemberLogin(P_LoginVo pLoginVo) {
        ProcedureVo procedureVo = new ProcedureVo(pLoginVo);
        mMemberDao.callMemberLogin(procedureVo);
        return procedureVo;
    }

    /**
     * 회원 리스트
     */
    public List<MemberListVo> getMemberList(MemberListVo memberListVo){
        log.info("@@@@@@@@@@@@ > " + memberListVo.getStartCnt() +" / "+ memberListVo.getEndCnt());
        List<MemberListVo> list = mMemberDao.callMemberList(memberListVo);
        int total = mMemberDao.callMemberList_cnt(memberListVo);
        list.get(0).setTotalCnt(total);
        return list;
    }

    /**
     * 회원 레벨 목록
     */
    public String callMemberLevelList(MemberInfoLevelListVo memberInfoLevelListVo) {
        List<MemberInfoLevelListVo> list = new ArrayList<>();
        log.info("memberInfoLevelListVo.getLevel() {} " + memberInfoLevelListVo.getLevel());
        if(memberInfoLevelListVo.getLevel().equals("level")){
            list = mMemberDao.callMemberLevelList(memberInfoLevelListVo);
        } else if(memberInfoLevelListVo.getLevel().equals("grade")){
            list = mMemberDao.callMemberGradeList(memberInfoLevelListVo);
        }
        ProcedureVo procedureVo = new ProcedureVo();
        procedureVo.setData(list);
        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }

    /**
     * 선택 회원 정보
     */
    public String callMemberInfo(MemberInfoVo memberInfoVo) {
        ProcedureVo procedureVo = new ProcedureVo();
        List<MemberInfoVo> list = mMemberDao.callMemberInfo(memberInfoVo);
        List<MemberInfoOutVo> outVoList = new ArrayList<>();
        for (int i = 0; i< list.size(); i++){
            outVoList.add(new MemberInfoOutVo(list.get(i)));
        }
        procedureVo.setData(outVoList.get(0));
        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }

}