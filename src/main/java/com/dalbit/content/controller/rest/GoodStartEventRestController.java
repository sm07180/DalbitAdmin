package com.dalbit.content.controller.rest;

import com.dalbit.content.service.GoodStartEventService;
import com.dalbit.content.vo.GoodStartDataInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("rest/content/event/goodstart")
public class GoodStartEventRestController {
    @Autowired GoodStartEventService goodStartEventService;
    @Autowired GsonUtil gsonUtil;

    /**
     * 굿스타트 이벤트 bj 데이터
     */
    @GetMapping("/event/dj/page")
    public String getGoodStartBjData(GoodStartDataInputVo goodStartDataInputVo) {
        return gsonUtil.toJson(goodStartEventService.getGoodStartDjData(goodStartDataInputVo));
    }

    /**
     * 굿스타트 이벤트 fan 데이터
     */
    @GetMapping("/event/fan/page")
    public String getGoodStartFanData(GoodStartDataInputVo goodStartDataInputVo) {
        return gsonUtil.toJson(goodStartEventService.getGoodStartFanData(goodStartDataInputVo));
    }

    /**
     * 굿스타트 이벤트 회차 정보
     */
    @GetMapping("/event/no")
    public String goodStartNoSel(@RequestParam(value = "noSlct", defaultValue = "1") String noSlct) {
        return gsonUtil.toJson(goodStartEventService.goodStartNoSel(noSlct));
    }

    /**
     * 굿스타트 이벤트 특별점수 상세내역
     */
    @GetMapping("/event/special/detail/list")
    public String goodStartFanSpecialSel(GoodStartDataInputVo goodStartDataInputVo) {
        return gsonUtil.toJson(goodStartEventService.goodStartFanSpecialSel(goodStartDataInputVo));
    }
}
