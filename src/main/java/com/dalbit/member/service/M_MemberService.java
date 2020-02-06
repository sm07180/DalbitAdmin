package com.dalbit.member.service;


import com.dalbit.common.code.Status;
import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.dao.M_MemberDao;
import com.dalbit.member.vo.*;

import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    public List<MemberListVo> getMemberList(){
        List<MemberListVo> list = mMemberDao.getMemberList();
        return list;
    }


    /**
     * 회원 정보 조회
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
        List<Map<String,Object>> returnList = new ArrayList<>();
        for (int i=0; i<list.size(); i++) {
            HashMap returnMap = new HashMap();
            returnMap.put("gubun", list.get(i).getGubun());
            returnMap.put("level", list.get(i).getLevel());
            returnMap.put("grade", list.get(i).getGrade());
            returnMap.put("exp", list.get(i).getExp());
            returnList.add(returnMap);
        }
        procedureVo.setData(returnList);
        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));

        log.info(" ### 호출결과 ###" + result);

        return result;
    }
    public String callMemberInfo(P_MemberInfoVo pMemberInfo) {
        ProcedureVo procedureVo = new ProcedureVo();
        List<P_MemberInfoVo> list = mMemberDao.callMemberInfo(pMemberInfo);

        for (int i=0; i<list.size(); i++) {
            HashMap returnMap = new HashMap();
            returnMap.put("mem_no", list.get(i).getMem_no());
            returnMap.put("memId", list.get(i).getMemId());
            returnMap.put("phone", list.get(i).getPhone());
            returnMap.put("passwd", list.get(i).getPasswd());
            returnMap.put("nickName", list.get(i).getNickName());
            returnMap.put("memSex", list.get(i).getMemSex());
            returnMap.put("birthYear", list.get(i).getBirthYear());
            returnMap.put("birthMonth", list.get(i).getBirthMonth());
            returnMap.put("birthDay", list.get(i).getBirthDay());
            returnMap.put("slct", list.get(i).getSlct());
            returnMap.put("adid", list.get(i).getAdid());
            returnMap.put("state", list.get(i).getState());
//            log.info("list.get(i).getJoin_date() : " + list.get(i).getJoin_date());
//            log.info("list.get(i).getJoin_date() : " + DalbitUtil.getUTCFormat(list.get(i).getJoin_date()));
            returnMap.put("join_date", list.get(i).getMem_join_date());
            returnMap.put("upd_date", list.get(i).getLast_upd_date());
            returnMap.put("name", list.get(i).getName());
            returnMap.put("email", list.get(i).getEmail());
            returnMap.put("profileImage", new ImageVo(list.get(i).getProfileImage(), list.get(i).getMemSex(), DalbitUtil.getProperty("server.photo.url")));
            returnMap.put("age", Integer.toString(DalbitUtil.ageCalculation(Integer.parseInt(list.get(i).getBirthYear()))));
            returnMap.put("level", list.get(i).getLevel());
            returnMap.put("grade", list.get(i).getGrade());
            returnMap.put("exp", list.get(i).getExp());
            returnMap.put("broadcastingCnt", list.get(i).getBroadcastingCnt());
            returnMap.put("listeningCnt", list.get(i).getListeningCnt());
            returnMap.put("starCnt", list.get(i).getStarCnt());
            returnMap.put("fanCnt", list.get(i).getFanCnt());
            procedureVo.setData(returnMap);
        }

//
//        ProcedureOutputVo procedureOutputVo;
//        if(DalbitUtil.isEmpty(list)){
//            procedureOutputVo = null;
//        }else{
//            List<MemberInfoOutVo> outVoList = new ArrayList<>();
//            for (int i=0; i<list.size(); i++){
//                HashMap returnMap = new HashMap();
//                returnMap.put(list.get(i).getNickName());
//                procedureVo.setData(returnMap);
//
//
//                outVoList.add(new MemberInfoOutVo(list.get(i)));
//            }
//            procedureOutputVo = new ProcedureOutputVo(procedureVo, outVoList);
//        }
//        HashMap roomList = new HashMap();
//        roomList.put("list", procedureOutputVo.getOutputBox());

        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));

        log.info(" ### 호출결과 ###" + result);

        return result;
    }


}
