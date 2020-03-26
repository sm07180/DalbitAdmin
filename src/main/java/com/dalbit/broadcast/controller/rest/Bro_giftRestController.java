package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_GiftService;
import com.dalbit.broadcast.vo.procedure.P_GiftListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/gift")
public class Bro_giftRestController {

    @Autowired
    Bro_GiftService bro_GiftService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 선물 목록
     * //@param model
     * @return
     */
    @PostMapping("list")
    public String getBroadcastList(P_GiftListInputVo pGiftListInputVo){
        return bro_GiftService.getGiftList(pGiftListInputVo);
    }

}
