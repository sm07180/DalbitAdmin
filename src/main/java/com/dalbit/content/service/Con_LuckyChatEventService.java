package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.dao.Con_LuckyChatEventDao;
import com.dalbit.content.vo.procedure.P_LuckyChatInputVo;
import com.dalbit.content.vo.procedure.P_LuckyChatMemListOuputVo;
import com.dalbit.content.vo.procedure.P_LuckyChatMemSelOuputVo;
import com.dalbit.content.vo.procedure.P_LuckyChatTotalCntVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_LuckyChatEventService {
    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_LuckyChatEventDao con_luckyChatEventDao;

    /**
     * 중복회원
     *
     * @param pLuckyChatInputVo
     * @return
     */
    public String getDuplicat(P_LuckyChatInputVo pLuckyChatInputVo) {
        List<P_LuckyChatMemListOuputVo> list = con_luckyChatEventDao.selectLuckyChatDuplicatMemList(pLuckyChatInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 당첨목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    public String getChatMemList(P_LuckyChatInputVo pLuckyChatInputVo) {
        List<Object> getList = con_luckyChatEventDao.selectLuckyChatMemList(pLuckyChatInputVo);
        P_LuckyChatTotalCntVo totalCntVo = DBUtil.getData(getList, P_LuckyChatTotalCntVo.class);
        List<P_LuckyChatMemListOuputVo> list = DBUtil.getList(getList, P_LuckyChatMemListOuputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 보너스 목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    public String getBouns(P_LuckyChatInputVo pLuckyChatInputVo) {
        List<Object> getList = con_luckyChatEventDao.selectLuckyChatBounsMemList(pLuckyChatInputVo);
        P_LuckyChatTotalCntVo totalCntVo = DBUtil.getData(getList, P_LuckyChatTotalCntVo.class);
        List<P_LuckyChatMemListOuputVo> list = DBUtil.getList(getList, P_LuckyChatMemListOuputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 채팅 내역
     *
     * @param pLuckyChatInputVo
     * @return
     */
    public String getChats(P_LuckyChatInputVo pLuckyChatInputVo) {
        List<Object> getList = con_luckyChatEventDao.selectLuckyChatList(pLuckyChatInputVo);
        P_LuckyChatTotalCntVo totalCntVo = DBUtil.getData(getList, P_LuckyChatTotalCntVo.class);
        List<P_LuckyChatMemSelOuputVo> list = DBUtil.getList(getList, P_LuckyChatMemSelOuputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
