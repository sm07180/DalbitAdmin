package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.dao.Men_StarDao;
import com.dalbit.menu.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Men_StarService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_StarDao menStarDao;

    /**
     * 스타 dj 등록 후 달/부스터/아이템 지급
     *
     * @param pStarInputVo
     * @return
     */
    public String createStarDJ(P_StarInputVo pStarInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pStarInputVo.setChrgrName(chrgrName);
        int resultCnt = menStarDao.insertStarDJ(pStarInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타 dj 삭제
     *
     * @param pStarInputVo
     * @return
     */
    public String removeStarDJ(P_StarInputVo pStarInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pStarInputVo.setChrgrName(chrgrName);
        int resultCnt = menStarDao.deleteStarDJ(pStarInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타DJ 가산점 점수 수정
     *
     * @param pStarScoreInputVo
     * @return
     */
    public String modifyPointStarDJ(P_StarScoreInputVo pStarScoreInputVo) {
        int resultCnt = menStarDao.updatePointStarDJ(pStarScoreInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.수정));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타 DJ 신청 리스트
     *
     * @param pStarSearchInputVo
     * @return
     */
    public String findReqStarDJ(P_StarSearchInputVo pStarSearchInputVo) {
        List<Object> getList = menStarDao.selectReqStarDJ(pStarSearchInputVo);
        P_StarTotalCntVo total = DBUtil.getData(getList, P_StarTotalCntVo.class);
        List<P_StarReqListOutputVo> list = DBUtil.getList(getList, P_StarReqListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", total.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타 DJ 리스트
     *
     * @param pStarSearchInputVo
     * @return
     */
    public String findStarDJ(P_StarSearchInputVo pStarSearchInputVo) {
        List<Object> getList = menStarDao.selectStarDJ(pStarSearchInputVo);
        P_StarTotalCntVo total = DBUtil.getData(getList, P_StarTotalCntVo.class);
        List<P_StarListOutputVo> list = DBUtil.getList(getList, P_StarListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", total.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
