package com.dalbit.member.service;


import com.dalbit.common.code.Code;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.exception.GlobalException;
//import com.dalbit.rest.service.RestService;
import com.dalbit.member.dao.M_MemberDao;
import com.dalbit.member.vo.*;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
//    @Autowired
//    RestService restService;
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
        List<MemberListVo> list = mMemberDao.callMemberList(memberListVo);
        int total = mMemberDao.callMemberList_cnt(memberListVo);
        log.info("total : " + total);
        if(list.size() > 0) {
            list.get(0).setTotalCnt(total);
        }
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
        List<MemberInfoVo> list = mMemberDao.callMemberInfo(memberInfoVo);
        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, list)));
        return result;
    }

    /**
     * 프로필 편집
     */
    public int callMemberEdit(MemberInfoVo memberInfoVo) {
        Boolean isDone = false;
        String profImg = memberInfoVo.getProfileImage();
        log.info("profImg      > " + profImg);
        if(DalbitUtil.isEmpty(profImg)){
            profImg = Code.포토_프로필_디폴트_PREFIX.getCode()+"/"+Code.프로필이미지_파일명_PREFIX.getCode()+memberInfoVo.getMemSex()+".jpg";
        }else{
            if(profImg.startsWith(Code.포토_프로필_임시_PREFIX.getCode())){
                isDone = true;
            }
            log.info("replacePath -----");
            profImg = DalbitUtil.replacePath(profImg);
        }
        memberInfoVo.setProfileImage(profImg.replace(SERVER_PHOTO_URL,""));
//        ProcedureVo procedureVo = new ProcedureVo(memberInfoVo);

        log.info("-----------------------------------------------------------");
        log.info("getProfileImage      > " + memberInfoVo.getProfileImage());
        log.info("getProfileImageGrade > " + String.valueOf(memberInfoVo.getProfileImageGrade()));
        log.info("getProfImgDel        > " + memberInfoVo.getProfImgDel());
        int result = 0;
//        result = mMemberDao.callMemberEdit(memberInfoVo);
//        String result;
//        if (procedureVo.getRet().equals(Status.회원정보보기_성공.getMessageCode())) {
//            if(isDone){
//                try{
//                    restService.imgDone(DalbitUtil.replaceDonePath(memberInfoVo.getProfileImage()), memberInfoVo.getProfImgDel());
//                }catch (GlobalException e){
//                    TODO 이미지 서버 오류 시 처리
//                    e.printStackTrace();
//                }
//            }
//            result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공)));
//        } else{
//            result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_실패)));
//        }
        log.info("update result : " + result);
        return result;
    }
}