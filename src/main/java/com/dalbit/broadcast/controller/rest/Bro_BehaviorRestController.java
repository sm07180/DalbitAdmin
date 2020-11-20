package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_BehaviorService;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/behavior")
public class Bro_BehaviorRestController {

    @Autowired
    Bro_BehaviorService bro_behaviorService;
    @Autowired
    GsonUtil gsonUtil;


    /**
     * 청취자 행위 유도 메시지 리스트 조회
     */
    @PostMapping("/list")
    public String behaviorList(P_BehaviorListInputVo pBehaviorListInputVo) {
        return bro_behaviorService.callBroadcastBehaviorList(pBehaviorListInputVo);
    }

    /**
     * 청취자 행위 유도 메시지 상세 조회
     */
    @PostMapping("/detail")
    public String behaviorDetail(P_BehaviorDetailInputVo pBehaviorDetailInputVo) {
        return bro_behaviorService.callBroadcastBehaviorDetail(pBehaviorDetailInputVo);
    }

    /**
     * 청취자 행위 유도 메시지 추가 / 수정
     */
    @PostMapping("/apply")
    public String behaviorApply(P_BehaviorListAddUpdateVo pBehaviorListAddUpdateVo) {
        return bro_behaviorService.broadcastBehaviorApply(pBehaviorListAddUpdateVo);
    }

    /**
     * 청취자 행위 유도 메시지 삭제
     */
    @PostMapping("/delete")
    public String behaviorDelete(P_BehaviorListDeleteVo pBehaviorListDeleteVo) {
        return bro_behaviorService.callBroadcastBehaviorDelete(pBehaviorListDeleteVo);
    }
}
