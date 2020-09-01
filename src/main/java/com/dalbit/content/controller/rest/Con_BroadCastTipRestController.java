package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_BroadCastTipService;
import com.dalbit.content.vo.procedure.P_BroadCastTipInputVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/rest/content/boardCastTip")
public class Con_BroadCastTipRestController {

    @Autowired
    Con_BroadCastTipService con_BroadCastTipService;

    /**
     * 방송팁 조회
     */
    @PostMapping("/list")
    public String selectBroadCastTipList(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        return con_BroadCastTipService.selectBroadCastTipList(pBroadCastTipInputVo);
    }

    /**
     * 방송팁 상세조회
     */
    @PostMapping("/detail")
    public String broadCastTipDetail(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        return con_BroadCastTipService.selectBroadCastTipDetail(pBroadCastTipInputVo);
    }

    /**
     * 방송팁 수정
     */
    @PostMapping("/edit")
    public String broadCastTipEdit(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        return con_BroadCastTipService.callbroadCastTipEdit(pBroadCastTipInputVo);
    }

    /**
     * 방송팁 등록
     */
    @PostMapping("/add")
    public String broadCastTipAdd(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        return con_BroadCastTipService.callbroadCastTipAdd(pBroadCastTipInputVo);
    }

    /**
     * 방송팁 삭제
     */
    @PostMapping("/del")
    public String broadCastTipDel(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        return con_BroadCastTipService.callbroadCastTipDel(pBroadCastTipInputVo);
    }

}
