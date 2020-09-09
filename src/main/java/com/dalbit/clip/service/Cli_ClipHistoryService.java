package com.dalbit.clip.service;

import com.dalbit.clip.dao.Cli_ClipHistoryDao;
import com.dalbit.clip.vo.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.customer.vo.BlockAdmVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;

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
        ClipHistoryListenTotalVo total = cliClipHistoryDao.selectClipHistoryListenTotalCnt(clipHistoryListenVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(clipHistoryListenVo.getTotalCnt()), total));
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
     * 클립 댓글 리스트 조회
     */
    public String selectReplyList(ClipHistoryReplyVo clipHistoryReplyVo) {
        ArrayList<ClipHistoryReplyVo> list = cliClipHistoryDao.selectReplyList(clipHistoryReplyVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }









    /**
     * 차단 내역 메시지 상세보기
     */
    public String selectBlockDetail(BlockAdmVo blockAdmVo) {
        BlockAdmVo blockDetail = cliClipHistoryDao.selectBlockDetail(blockAdmVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, blockDetail));
    }

    /**
     * IP/Uuid 차단 (Modal)
     */
    public String insertBlock(BlockAdmVo blockAdmVo) {
        blockAdmVo.setOp_name(MemberVo.getMyMemNo());

        blockAdmVo.setEdit_type(0);
        if(blockAdmVo.getRadioBlock() == 1) {
            blockAdmVo.setEdit_contents("deviceUuid 차단 등록 : " + blockAdmVo.getBlock_text());
        } else {
            blockAdmVo.setEdit_contents("ip 차단 등록 : " + blockAdmVo.getBlock_text());
        }

        int result = 0;
        if(!DalbitUtil.isEmpty(blockAdmVo.getBlock_text())){
            cliClipHistoryDao.insertBlockHistory(blockAdmVo);
            result = cliClipHistoryDao.insertBlock(blockAdmVo);
        }


        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.회원ipUuid차단_성공));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.회원ipUuid차단_실패));
        }
    }

    /**
     * 차단 내역 삭제 (차단 해지)
     */
    public String deleteBlock(BlockAdmVo blockAdmVo) {
        blockAdmVo.setOp_name(MemberVo.getMyMemNo());

        int sucCnt = 0;
        int failCnt = 0;

        String[] idxs = blockAdmVo.getBlockIdxs().split(",");
        for(int i=0; i<idxs.length; i++) {

            if(!DalbitUtil.isEmpty(idxs[i])){
                // rd_admin.tb_login_block_history에 insert하기 위함
                BlockAdmVo history = blockInfo(idxs[i]);
                String temp_blockType;
                if(history.getBlock_type() == 1) {
                    temp_blockType = "deviceUuid";
                } else {
                    temp_blockType = "ip";
                }
                blockAdmVo.setEdit_contents(temp_blockType + " 차단 해지 : " + history.getBlock_text());
                blockAdmVo.setEdit_type(1);
                if(!DalbitUtil.isEmpty(history.getReport_idx())) {
                    blockAdmVo.setReport_idx(history.getReport_idx());
                }
                cliClipHistoryDao.insertDelBlockHistory(blockAdmVo);

                // rd_admin.tb_login_block에서 delete하기 위함
                blockAdmVo.setIdx(idxs[i]);

                int status = cliClipHistoryDao.deleteBlock(blockAdmVo);
                if(status > 0) {
                    sucCnt++;
                } else {
                    failCnt++;
                }
            }
        }
        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(sucCnt > 0) {
             return gsonUtil.toJson(new JsonOutputVo(Status.회원ipUuid차단해지_성공, resultMap));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.회원ipUuid차단해지_실패, resultMap));
        }
    }

    /**
     * 간편 조회
     */
    public BlockAdmVo blockInfo(String idx) {
        BlockAdmVo info = cliClipHistoryDao.selectBlockInfo(idx);
        return info;
    }

    /**
     * 로그인 차단/해지 내역 조회
     */
    public String selectBlockHistList(BlockAdmVo blockAdmVo) {
        int count = cliClipHistoryDao.selectBlockHistListCnt(blockAdmVo);
        ArrayList<BlockAdmVo> list = cliClipHistoryDao.selectBlockHistList(blockAdmVo);
        blockAdmVo.setTotalCnt(count);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(blockAdmVo.getTotalCnt(), blockAdmVo.getPageStart(), blockAdmVo.getPageCnt())));
    }



}
