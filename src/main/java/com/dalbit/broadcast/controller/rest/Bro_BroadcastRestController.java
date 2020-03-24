package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_BroadcastService;
import com.dalbit.broadcast.vo.procedure.P_BroadcastDetailInputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditHistInputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/broadcast")
public class Bro_BroadcastRestController {

    @Autowired
    Bro_BroadcastService bro_BroadcastService;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 목록
     * //@param model
     * @return
     */

    @PostMapping("list")
    public String getBroadcastList(P_BroadcastListInputVo pBroadcastListInputVo){
        return bro_BroadcastService.callBroadcastList(pBroadcastListInputVo);
    }

    /**
     * 방송방 상세보기
     */
    @PostMapping("info")
    public String info(P_BroadcastDetailInputVo pBroadcastDetailInputVo){
        return bro_BroadcastService.callBroadcastInfo(pBroadcastDetailInputVo);
    }

    /**
     * 방송방 정보수정 내역 보기
     */
    @PostMapping("editHist")
    public String editHist(P_BroadcastEditHistInputVo pBroadcastEditHistInputVo) {
        return bro_BroadcastService.callBroadcastEditHistory(pBroadcastEditHistInputVo);
    }
}
