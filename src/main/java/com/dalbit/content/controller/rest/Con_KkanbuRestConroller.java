package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_KkanbuEventService;
import com.dalbit.content.vo.procedure.P_KkanbuBetListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/event/kkanbu")
public class Con_KkanbuRestConroller {

    @Autowired
    Con_KkanbuEventService con_KkanbuEventService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 깐부이벤트 - 랭킹 목록
     *
     * @param p_kkanbuBetListInputVo
     * @return
     */
    @GetMapping("/rankList")
    public String getKkanbuRankList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        // return con_KkanbuEventService.callKkanbuRankList(p_kkanbuBetListInputVo);
        return "{}";
    }

    /**
     * 깐부이벤트 - 배팅 목록
     *
     * @param p_kkanbuBetListInputVo
     * @return
     */
    @GetMapping("/betList")
    public String getKkanbuBetList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        // return con_KkanbuEventService.callKkanbuBetList(p_kkanbuBetListInputVo);
        return "{}";
    }

    /**
     * 깐부이벤트 - 구슬 목록
     *
     * @param p_kkanbuBetListInputVo
     * @return
     */
    @GetMapping("/marbleList")
    public String getKkanbuMarbleList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        // return con_KkanbuEventService.callKkanbuMarbleList(p_kkanbuBetListInputVo);
        return "{}";
    }

    /**
     * 깐부이벤트 - 깐부신청 목록
     *
     * @param p_kkanbuBetListInputVo
     * @return
     */
    @GetMapping("/list")
    public String getKkanbuList(P_KkanbuBetListInputVo p_kkanbuBetListInputVo) {
        // return con_KkanbuEventService.callKkanbuList(p_kkanbuBetListInputVo);
        return "{}";
    }
}
