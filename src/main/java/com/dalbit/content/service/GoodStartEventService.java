package com.dalbit.content.service;

import com.dalbit.content.proc.Event_goodStartProc;
import com.dalbit.content.vo.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class GoodStartEventService {
    @Autowired Event_goodStartProc event_goodStartProc;
    @Autowired GsonUtil gsonUtil;

    /**
     * dj 데이터
     */
    public String getGoodStartDjData(GoodStartDataInputVo goodStartDataInputVo) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 이벤트 전체 회차 정보
            result.put("goodNoInfo", goodStartNoSel("2"));

            // DJ 랭킹
            if(StringUtils.equals(goodStartDataInputVo.getMemNo(), "0")) { // 전체 조회
                List<Object> djRankObj = event_goodStartProc.goodStartDjList(goodStartDataInputVo);
                List<GoodStartDjRankVo> djRankList = DBUtil.getList(djRankObj, GoodStartDjRankVo.class);
                Integer djRankListCnt = DBUtil.getData(djRankObj, Integer.class);
                result.put("rankList", djRankList);
                result.put("rankListCnt", djRankListCnt);
            }else { // 특정 회원 조회
                List<GoodStartDjRankVo> list = new ArrayList<>();
                GoodStartDjRankVo goodStartDjRankVo = event_goodStartProc.goodStartBjSel(goodStartDataInputVo);
                list.add(goodStartDjRankVo);
                result.put("rankList", list);
                result.put("rankListCnt", 1);
            }
        } catch (Exception e) {
            log.error("GoodStartEventService / getGoodStartDjData error : ", e);
        }

        return gsonUtil.toJson(result);
    }

    /**
     * 팬 데이터
     */
    public String getGoodStartFanData(GoodStartDataInputVo goodStartDataInputVo) {
        Map<String, Object> result = new HashMap<>();

        try {
            // 이벤트 전체 회차 정보
            result.put("goodNoInfo", goodStartNoSel("2"));

            // fan 랭킹
            if(StringUtils.equals(goodStartDataInputVo.getMemNo(), "0")) { // 전체 조회
                List<Object> fanRankObj = event_goodStartProc.goodStartFanList(goodStartDataInputVo);
                List<GoodStartFanRankVo> fanRankList = DBUtil.getList(fanRankObj, GoodStartFanRankVo.class);
                Integer fanRankListCnt = DBUtil.getData(fanRankObj, Integer.class);
                result.put("rankList", fanRankList);
                result.put("rankListCnt", fanRankListCnt);
            }else { // 특정 회원 조회
                List<GoodStartFanRankVo> list = new ArrayList<>();
                GoodStartFanRankVo goodStartFanRankVo = event_goodStartProc.goodStartFanSel(goodStartDataInputVo);
                list.add(goodStartFanRankVo);
                result.put("rankList", list);
                result.put("rankListCnt", 1);
            }

            // 현재 회차 정보
            GoodStartNoInfoVo nowInfo = goodStartNoSel("1").get(0);
            result.put("currentInfo", nowInfo);

        } catch (Exception e) {
            log.error("GoodStartEventService / getGoodStartFanData error : ", e);
        }

        return gsonUtil.toJson(result);
    }

    /**
     * 회차 정보
     */
    public List<GoodStartNoInfoVo> goodStartNoSel(String noSlct) {
        return event_goodStartProc.goodStartNoSel(noSlct);
    }

    /**
     * 회차 정보
     */
    public List<GoodStartFanSpecialVo> goodStartFanSpecialSel(GoodStartDataInputVo goodStartDataInputVo) {
        return event_goodStartProc.goodStartFanSpecialSel(goodStartDataInputVo);
    }
}
