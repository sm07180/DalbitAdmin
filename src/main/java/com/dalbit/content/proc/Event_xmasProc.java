package com.dalbit.content.proc;

import com.dalbit.content.vo.procedure.*;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Event_xmasProc {
    @ResultMap({"ResultMap.P_XmasTreeStatusOutputVo", "ResultMap.P_XmasTreeStoryListOutputVo",
            "ResultMap.P_XmasTreeStoryListOutputVo", "ResultMap.P_XmasTreeStoryListOutputVo", "ResultMap.integer", "ResultMap.P_XmasAllStoryListOutputVo",})
    @Select("CALL rd_admin.p_adm_evt_like_tree_list(#{pageNo},#{pagePerCnt})")
    List<Object> getTreeList(P_XmasTreeListInputVo pXmasTreeListInputVo);


    @ResultMap({"ResultMap.integer", "ResultMap.P_XmasAllDelStoryListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_like_tree_mem_story_del_list(#{pageNo},#{pagePerCnt})")
    List<Object> getDelTreeStoryList(P_XmasTreeListInputVo pXmasTreeListInputVo);

    @ResultMap({"ResultMap.integer"})
    @Select("CALL rd_admin.p_adm_evt_like_tree_mem_story_decoration_upd(#{storyNo},#{decorationNo})")
    int setDecoStoryToTree(P_XmasTreeSetDecoStoryInputVo pXmasTreeSetDecoStoryInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.P_XmasAllReportListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_like_tree_mem_story_rpt_list(#{pageNo},#{pagePerCnt})")
    List<Object> getReportList(P_XmasTreeListInputVo pXmasTreeListInputVo);

    @ResultMap({"ResultMap.integer"})
    @Select("CALL rd_data.p_evt_like_tree_mem_story_del(#{storyNo},#{delChrgrName},#{delSlct})")
    int delStory(P_XmasTreeDelStoryInputVo pXmasTreeDelStoryInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.P_XmasLoverListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_like_tree_rank_list(#{seqNo},#{pageNo},#{pagePerCnt})")
    List<Object> getLoverList(P_XmasLoverListInputVo pXmasTreeListInputVo);

    @ResultMap({"ResultMap.integer", "ResultMap.P_XmasDetailLoverScoreListOutputVo"})
    @Select("CALL rd_admin.p_adm_evt_like_tree_rank_log_list(#{memNo},#{scoreSlct},#{seqNo},#{pageNo},#{pagePerCnt})")
    List<Object> getDetailLoverScoreList(P_XmasDetailLoverScoreListInputVo pXmasDetailLoverScoreListInputVo);

}
