package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_ChampionEventDao;
import com.dalbit.content.proc.Event_championProc;
import com.dalbit.content.vo.ChampionshipVO;
import com.dalbit.content.vo.procedure.P_ChampionsShipVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_ChampionEventService {

    @Autowired
    Con_ChampionEventDao con_championEventDao;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    Event_championProc event_championProc;


    public String callChampionList(P_ChampionsShipVo p_championsShipVo) {
        List<Object> list = event_championProc.championshipList(p_championsShipVo);
        List<ChampionshipVO> championshipVOList = DBUtil.getList(list, ChampionshipVO.class);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, championshipVOList));
        return result;
    }
}
