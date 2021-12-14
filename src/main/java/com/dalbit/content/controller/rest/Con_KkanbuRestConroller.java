package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_KkanbuEventService;
import com.dalbit.content.vo.procedure.P_KkanbuListInputVo;
import com.dalbit.content.vo.procedure.P_KkanbuMemSelInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
     * 깐부이벤트 - 배팅 목록
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @GetMapping("/betList")
    public String getKkanbuBetList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        return con_KkanbuEventService.callKkanbuBetList(p_kkanbuListInputVo);
    }

    /**
     * 깐부이벤트 - 구슬 목록
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @GetMapping("/marbleList")
    public String getKkanbuMarbleList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        return con_KkanbuEventService.callKkanbuMarbleList(p_kkanbuListInputVo);
    }

    /**
     * 깐부이벤트 - 점수 목록
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @GetMapping("/marblePointList")
    public String getKkanbuMarblePointList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        return con_KkanbuEventService.callKkanbuMarblePointList(p_kkanbuListInputVo);
    }

    /**
     * 깐부이벤트 - 랭킹 목록
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @GetMapping("/rankList")
    public String getKkanbuRankList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        return con_KkanbuEventService.callKkanbuRankList(p_kkanbuListInputVo);
    }

    /**
     * 깐부이벤트 - 깐부신청 목록
     *
     * @param p_kkanbuListInputVo
     * @return
     */
    @GetMapping("/list")
    public String getKkanbuList(P_KkanbuListInputVo p_kkanbuListInputVo) {
        return con_KkanbuEventService.callKkanbuList(p_kkanbuListInputVo);
    }

    /**
     * 깐부이벤트 - 회원상세 정보
     *
     * @param p_kkanbuMemSelInputVo
     * @return
     */
    @GetMapping("/memSel")
    public String getKkanbuMemSelList(P_KkanbuMemSelInputVo p_kkanbuMemSelInputVo) {
        if ("m".equals(p_kkanbuMemSelInputVo.getTabSlct())) {
            return con_KkanbuEventService.callKkanbuMemSelMarbleList(p_kkanbuMemSelInputVo);
        } else {
            return con_KkanbuEventService.callKkanbuMemSelMarblePointList(p_kkanbuMemSelInputVo);
        }
    }
}
