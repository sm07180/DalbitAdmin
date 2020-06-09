package com.dalbit.money.controller.rest;

import com.dalbit.exception.GlobalException;
import com.dalbit.money.service.Mon_ItemService;
import com.dalbit.money.vo.Mon_ItemInputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/money/item")
public class Mon_ItemRestController {

    @Autowired
    Mon_ItemService monItemService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(Mon_ItemInputVo monItemInputVo) throws GlobalException {
        String result = monItemService.selectChangeItemList(monItemInputVo);
        return result;
    }

}
