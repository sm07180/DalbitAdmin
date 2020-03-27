package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_LikeService;
import com.dalbit.broadcast.vo.procedure.P_LikeListInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/like")
public class Bro_LikeRestController {

    @Autowired
    Bro_LikeService bro_LikeService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 생방송 좋아요 목록
     * //@param model
     * @return
     */
    @PostMapping("list")
    public String list(P_LikeListInputVo pLikeListInputVo){
        return bro_LikeService.getLikeList(pLikeListInputVo);
    }

}
