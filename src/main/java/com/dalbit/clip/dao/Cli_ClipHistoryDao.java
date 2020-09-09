package com.dalbit.clip.dao;

import com.dalbit.clip.vo.*;
import com.dalbit.customer.vo.BlockAdmVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Cli_ClipHistoryDao {

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryVo> selectClipHistoryList(ClipHistoryVo clipHistoryVo);
    @Transactional(readOnly = true)
    int selectClipHistoryListCnt(ClipHistoryVo clipHistoryVo);

    int updateHide(ClipHistoryVo clipHistoryVo);

    int deleteClip(ClipHistoryVo clipHistoryVo);

    int insertClipEditHistory(ClipEditHistoryVo clipEditHistoryVo);

    @Transactional(readOnly = true)
    ArrayList<ClipHistoryReplyVo> selectReplyList(ClipHistoryReplyVo clipHistoryReplyVo);

    @Transactional(readOnly = true)
    int selectClipHistoryListenListCnt(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ArrayList<ClipHistoryListenVo> selectClipHistoryListenList(ClipHistoryListenVo clipHistoryListenVo);
    @Transactional(readOnly = true)
    ClipHistoryListenTotalVo selectClipHistoryListenTotalCnt(ClipHistoryListenVo clipHistoryListenVo);

    @Transactional(readOnly = true)
    int selectClipHistoryRemoveListCnt(ClipHistoryRemoveVo clipHistoryRemoveVo);
    @Transactional(readOnly = true)
    ArrayList<ClipHistoryRemoveVo> selectClipHistoryRemoveList(ClipHistoryRemoveVo clipHistoryRemoveVo);


    int insertBlock(BlockAdmVo blockAdmVo);

    @Transactional(readOnly = true)
    BlockAdmVo selectBlockDetail(BlockAdmVo blockAdmVo);
    int insertBlockHistory(BlockAdmVo blockAdmVo);

    int deleteBlock(BlockAdmVo blockAdmVo);
    int insertDelBlockHistory(BlockAdmVo blockAdmVo);

    BlockAdmVo selectBlockInfo(String idx);

    @Transactional(readOnly = true)
    ArrayList<BlockAdmVo> selectBlockHistList(BlockAdmVo blockAdmVo);

    @Transactional(readOnly = true)
    int selectBlockHistListCnt(BlockAdmVo blockAdmVo);



}
