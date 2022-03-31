package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.dao.Con_RebrandEventDao;
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
public class Con_RebrandEventService {
    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_RebrandEventDao con_rebrandEventDao;

    /**
     * 리브랜딩 댓글이벤트 목록
     *
     * @param pRebrandCommentSearchInputVo
     * @return
     */
    public String getComments(P_RebrandCommentSearchInputVo pRebrandCommentSearchInputVo) {
        List<Object> getList = con_rebrandEventDao.selectComments(pRebrandCommentSearchInputVo);
        List<P_RebrandCommentListOutputVo> list = DBUtil.getList(getList, P_RebrandCommentListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 리브랜딩 댓글이벤트 삭제
     *
     * @param pRebrandCommentDeleteInputVo
     * @return
     */
    public String removeComment(P_RebrandCommentDeleteInputVo pRebrandCommentDeleteInputVo) {
        int resultCnt = con_rebrandEventDao.deleteComment(pRebrandCommentDeleteInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 리브랜드 이벤트 - 공감 목록
     *
     * @param pRebrandShareSearchInputVo
     * @return
     */
    public String getShares(P_RebrandShareSearchInputVo pRebrandShareSearchInputVo) {
        List<Object> getList = con_rebrandEventDao.selectShares(pRebrandShareSearchInputVo);
        List<P_RebrandShareListOutputVo> list = DBUtil.getList(getList, P_RebrandShareListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 회차별 순위 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    public String getCollectRankList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        List<Object> getList = con_rebrandEventDao.selectCollectRankList(pRebrandCollectSearchInputVo);
        List<P_RebrandCollectRankListOutputVo> list = DBUtil.getList(getList, P_RebrandCollectRankListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 회차별 뽑기 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    public String getCollectList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        List<Object> getList = con_rebrandEventDao.selectCollectList(pRebrandCollectSearchInputVo);
        List<P_RebrandCollectListOutputVo> list = DBUtil.getList(getList, P_RebrandCollectListOutputVo.class);
        P_RebrandCollectSummaryOutputVo summary = DBUtil.getData(getList, P_RebrandCollectSummaryOutputVo.class);
        P_RebrandCollectCntOutputVo cnt = DBUtil.getData(getList, P_RebrandCollectCntOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", cnt.getCnt());
        resHashMap.put("listData", list);
        resHashMap.put("summary", summary);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 종합순위 목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    public String getCollectTotalList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        List<Object> getList = con_rebrandEventDao.selectCollectTotalList(pRebrandCollectSearchInputVo);
        List<P_RebrandCollectTotalListOutputVo> list = DBUtil.getList(getList, P_RebrandCollectTotalListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 지급목록
     *
     * @param pRebrandCollectSearchInputVo
     * @return
     */
    public String getCollectLogList(P_RebrandCollectSearchInputVo pRebrandCollectSearchInputVo) {
        List<Object> getList = con_rebrandEventDao.selectCollectLogList(pRebrandCollectSearchInputVo);
        List<P_RebrandCollectLogListOutputVo> list = DBUtil.getList(getList, P_RebrandCollectLogListOutputVo.class);
        int listCnt = DBUtil.getData(getList, Integer.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", listCnt);
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스톤지급
     *
     * @param pRebrandCollectInputVo
     * @return
     */
    public String createCollect(P_RebrandCollectInputVo pRebrandCollectInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pRebrandCollectInputVo.setChrgrMemName(chrgrName);
        int resultCnt = con_rebrandEventDao.insertCollectIns(pRebrandCollectInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
