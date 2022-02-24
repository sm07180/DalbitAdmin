package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.dao.Con_RebrandEventDao;
import com.dalbit.content.vo.procedure.P_RebrandCommentDeleteInputVo;
import com.dalbit.content.vo.procedure.P_RebrandCommentListOutputVo;
import com.dalbit.content.vo.procedure.P_RebrandCommentSearchInputVo;
import com.dalbit.content.vo.procedure.P_WelcomeTotalListOutputVo;
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
}
