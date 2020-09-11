package com.dalbit.clip.service;

import com.dalbit.clip.dao.Cli_ClipHistoryDao;
import com.dalbit.clip.vo.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Slf4j
@Service
public class Cli_ClipHistoryService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cli_ClipHistoryDao cliClipHistoryDao;

    /**
     * 클립 리스트 조회
     */
    public String selectClipHistoryList(ClipHistoryVo clipHistoryVo) {
        int count = cliClipHistoryDao.selectClipHistoryListCnt(clipHistoryVo);
        clipHistoryVo.setTotalCnt(count);
        ArrayList<ClipHistoryVo> list = cliClipHistoryDao.selectClipHistoryList(clipHistoryVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(clipHistoryVo.getTotalCnt())));
    }


    /**
     * 클립 리스트 조회
     */
    public String callClipHistoryList(ClipHistoryVo clipHistoryVo) {
        ProcedureVo procedureVo = new ProcedureVo(clipHistoryVo);
        ArrayList<ClipHistoryVo> list = cliClipHistoryDao.callClipHistoryList(procedureVo);
        ClipHistoryTotalVo summary = new Gson().fromJson(procedureVo.getExt(), ClipHistoryTotalVo.class);

        if(list.size() > 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()), summary));
        }else if(list.size() == 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, list, new PagingVo(procedureVo.getRet()), summary));
        }else {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }


    /**
     * 클립 리스트 조회
     */
    public String callClipHistoryMemberList(ClipHistoryMemberVo clipHistoryMemberVo) {
        ProcedureVo procedureVo = new ProcedureVo(clipHistoryMemberVo);
        ArrayList<ClipHistoryMemberVo> list = cliClipHistoryDao.callClipHistoryMemberList(procedureVo);
        ClipHistoryTotalVo summary = new Gson().fromJson(procedureVo.getExt(), ClipHistoryTotalVo.class);

        if(list.size() > 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()), summary));
        }else if(list.size() == 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, list, new PagingVo(procedureVo.getRet()), summary));
        }else {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

    /**
     * 클립 숨기기/해제
     */
    @Transactional
    public String updateHide(ClipHistoryVo clipHistoryVo) {
        int result = cliClipHistoryDao.updateHide(clipHistoryVo);

        if(result > 0) {
            ClipEditHistoryVo clipEditHistoryVo = new ClipEditHistoryVo();
            clipEditHistoryVo.setCastNo(clipHistoryVo.getCastNo());
            clipEditHistoryVo.setOp_name(MemberVo.getMyMemNo());

            if(clipHistoryVo.getHide().equals("0")){ // 해제
                clipEditHistoryVo.setEdit_contents("Clip 숨기기 해제 : " + clipHistoryVo.getCastNo());
                clipEditHistoryVo.setEdit_type("0");
            }else if(clipHistoryVo.getHide().equals("1")){  //숨기기
                clipEditHistoryVo.setEdit_contents("Clip 숨기기 : " + clipHistoryVo.getCastNo());
                clipEditHistoryVo.setEdit_type("1");
            }

            cliClipHistoryDao.insertClipEditHistory(clipEditHistoryVo);

            return gsonUtil.toJson(new JsonOutputVo(Status.클립숨기기수정_성공));
        }else{
            return gsonUtil.toJson(new JsonOutputVo(Status.클립숨기기수정_에러));
        }
    }

    /**
     * 클립 삭제
     */
    @Transactional
    public String deleteClip(ClipHistoryVo clipHistoryVo) {
        int result = cliClipHistoryDao.deleteClip(clipHistoryVo);

        if(result > 0) {
            ClipEditHistoryVo clipEditHistoryVo = new ClipEditHistoryVo();
            clipEditHistoryVo.setCastNo(clipHistoryVo.getCastNo());
            clipEditHistoryVo.setOp_name(MemberVo.getMyMemNo());
            clipEditHistoryVo.setEdit_contents("Clip 삭제(어드민) : " + clipHistoryVo.getCastNo());
            clipEditHistoryVo.setEdit_type("4");

            cliClipHistoryDao.insertClipEditHistory(clipEditHistoryVo);

            return gsonUtil.toJson(new JsonOutputVo(Status.클립삭제_성공));
        }else{
            return gsonUtil.toJson(new JsonOutputVo(Status.클립삭제_에러));
        }

    }


    /**
     * 클립 청취자 리스트 조회
     */
    public String selectClipHistoryListenList(ClipHistoryListenVo clipHistoryListenVo) {
        int count = cliClipHistoryDao.selectClipHistoryListenListCnt(clipHistoryListenVo);
        clipHistoryListenVo.setTotalCnt(count);
        ArrayList<ClipHistoryListenVo> list = cliClipHistoryDao.selectClipHistoryListenList(clipHistoryListenVo);
        ClipHistoryTotalVo total = cliClipHistoryDao.selectClipHistoryListenTotalCnt(clipHistoryListenVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(clipHistoryListenVo.getTotalCnt()), total));
    }

    /**
     * 클립 청취자 리스트 조회
     */
    public String callClipHistoryListenList(ClipHistoryListenVo clipHistoryListenVo) {
        ProcedureVo procedureVo = new ProcedureVo(clipHistoryListenVo);
        ArrayList<ClipHistoryListenVo> list = cliClipHistoryDao.callClipHistoryListenList(procedureVo);
        ClipHistoryTotalVo summary = new Gson().fromJson(procedureVo.getExt(), ClipHistoryTotalVo.class);

        if(list.size() > 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()), summary));
        }else if(list.size() == 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, list, new PagingVo(procedureVo.getRet()), summary));
        }else {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }

    /**
     * 클립 선물 리스트 조회
     */
    public String callClipHistoryGiftList(ClipHistoryGiftVo clipHistoryGiftVo) {
        ProcedureVo procedureVo = new ProcedureVo(clipHistoryGiftVo);
        ArrayList<ClipHistoryGiftVo> list = cliClipHistoryDao.callClipHistoryGiftList(procedureVo);
        ClipHistoryGiftTotalVo summary = new Gson().fromJson(procedureVo.getExt(), ClipHistoryGiftTotalVo.class);

        if(list.size() > 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()), summary));
        }else if(list.size() == 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, list, new PagingVo(procedureVo.getRet()), summary));
        }else {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }


    /**
     * 클립 삭제 리스트 조회
     */
    public String selectClipHistoryRemoveList(ClipHistoryRemoveVo clipHistoryRemoveVo) {
        int count = cliClipHistoryDao.selectClipHistoryRemoveListCnt(clipHistoryRemoveVo);
        clipHistoryRemoveVo.setTotalCnt(count);
        ArrayList<ClipHistoryRemoveVo> list = cliClipHistoryDao.selectClipHistoryRemoveList(clipHistoryRemoveVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(clipHistoryRemoveVo.getTotalCnt())));
    }


    /**
     * 클립 삭제 리스트 조회
     */
    public String callClipHistoryRemoveList(ClipHistoryRemoveVo clipHistoryRemoveVo) {
        ProcedureVo procedureVo = new ProcedureVo(clipHistoryRemoveVo);
        ArrayList<ClipHistoryRemoveVo> list = cliClipHistoryDao.callClipHistoryRemoveList(procedureVo);
        ClipHistoryTotalVo summary = new Gson().fromJson(procedureVo.getExt(), ClipHistoryTotalVo.class);

        if(list.size() > 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()), summary));
        }else if(list.size() == 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, list, new PagingVo(procedureVo.getRet()), summary));
        }else {
            return gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
    }


    /**
     * 클립 댓글 리스트 조회
     */
    public String selectReplyList(ClipHistoryReplyVo clipHistoryReplyVo) {
        ArrayList<ClipHistoryReplyVo> list = cliClipHistoryDao.selectReplyList(clipHistoryReplyVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }

}
