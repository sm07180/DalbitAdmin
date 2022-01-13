package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.proc.Event_xmasProc;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_xmasEventService {
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Event_xmasProc eventXmasProc;

    public String callXmasEventTreeList(P_XmasTreeListInputVo pXmasTreeListInputVo) {
        List<Object> getList = eventXmasProc.getTreeList(pXmasTreeListInputVo);
        P_XmasTreeStatusOutputVo treeStatusData = DBUtil.getData(getList, P_XmasTreeStatusOutputVo.class);
        List<P_XmasTreeStoryListOutputVo> tree1StoryList = DBUtil.getList(getList, P_XmasTreeStoryListOutputVo.class, 1);
        List<P_XmasTreeStoryListOutputVo> tree2StoryList = DBUtil.getList(getList, P_XmasTreeStoryListOutputVo.class, 2);
        List<P_XmasTreeStoryListOutputVo> tree3StoryList = DBUtil.getList(getList, P_XmasTreeStoryListOutputVo.class, 3);
        int allStoryListCnt = DBUtil.getData(getList, Integer.class);
        List<P_XmasAllStoryListOutputVo> allStoryList = DBUtil.getList(getList, P_XmasAllStoryListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("treeStatusData", treeStatusData);
        resHashMap.put("totalCnt", allStoryListCnt);

        HashMap treeStoryData = new HashMap();
        treeStoryData.put("tree1StoryList", tree1StoryList);
        treeStoryData.put("tree2StoryList", tree2StoryList);
        treeStoryData.put("tree3StoryList", tree3StoryList);
        treeStoryData.put("allStoryList", allStoryList);

        resHashMap.put("listData", treeStoryData);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callXmasEventAllDelStoryList(P_XmasTreeListInputVo pXmasTreeListInputVo) {
        List<Object> getList = eventXmasProc.getDelTreeStoryList(pXmasTreeListInputVo);
        int allStoryListCnt = DBUtil.getData(getList, Integer.class);
        List<P_XmasAllDelStoryListOutputVo> allDelStoryList = DBUtil.getList(getList, P_XmasAllDelStoryListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", allStoryListCnt);
        resHashMap.put("listData", allDelStoryList);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callXmasEventSetDecoStory(P_XmasTreeSetDecoStoryInputVo pXmasTreeSetDecoStoryInputVo) {
        int resCode = eventXmasProc.setDecoStoryToTree(pXmasTreeSetDecoStoryInputVo);
        HashMap resHashMap = new HashMap();
        if (resCode != 1) {
            resHashMap.put("result", new JsonOutputVo(Status.비즈니스로직오류));
        } else {
            resHashMap.put("result", new JsonOutputVo(Status.수정));
        }
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callXmasEventGetReportList(P_XmasTreeListInputVo pGetReportListInputVo) {
        List<Object> getList = eventXmasProc.getReportList(pGetReportListInputVo);
        int allReportListCnt = DBUtil.getData(getList, Integer.class);
        List<P_XmasAllReportListOutputVo> allReportList = DBUtil.getList(getList, P_XmasAllReportListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", allReportListCnt);
        resHashMap.put("listData", allReportList);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callXmasEventDelStory(P_XmasTreeDelStoryInputVo pXmasTreeDelStoryInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pXmasTreeDelStoryInputVo.setDelChrgrName(chrgrName);

        int resCode = eventXmasProc.delStory(pXmasTreeDelStoryInputVo);
        HashMap resHashMap = new HashMap();
        if (resCode != 1) {
            resHashMap.put("result", new JsonOutputVo(Status.비즈니스로직오류));
        } else {
            resHashMap.put("result", new JsonOutputVo(Status.삭제));
        }
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }

    public String callXmasEventGetLoverList(P_XmasLoverListInputVo pXmasLoverListInputVo) {
        List<Object> getList = eventXmasProc.getLoverList(pXmasLoverListInputVo);
        int allLoverListCnt = DBUtil.getData(getList, Integer.class);
        List<P_XmasLoverListOutputVo> allLoverList = DBUtil.getList(getList, P_XmasLoverListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", allLoverListCnt);
        resHashMap.put("listData", allLoverList);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }
    public String callXmasEventGetDetailLoverScoreList(P_XmasDetailLoverScoreListInputVo pXmasDetailLoverScoreListInputVo) {
        List<Object> getList = eventXmasProc.getDetailLoverScoreList(pXmasDetailLoverScoreListInputVo);
        int detailLoverScoreListCnt = DBUtil.getData(getList, Integer.class);
        List<P_XmasDetailLoverScoreListOutputVo> detailLoverScoreList = DBUtil.getList(getList, P_XmasDetailLoverScoreListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", detailLoverScoreListCnt);
        resHashMap.put("listData", detailLoverScoreList);
        String result = gsonUtil.toJson(resHashMap);

        return result;
    }
}
