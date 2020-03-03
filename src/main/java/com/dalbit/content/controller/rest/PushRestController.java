package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.service.PushService;
import com.dalbit.content.vo.PushVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/content/push")
public class PushRestController {

    @Autowired
    PushService pushService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * Push Rest List
     */
    @PostMapping("list")
    public String list(HttpServletRequest request, PushVo pushVo) {
        int totalCnt = 100;
        int startIdx = pushVo.getPageStart();

        ArrayList<PushVo> list = new ArrayList<PushVo>();
        for(int i = 0; i < pushVo.getPageCnt(); i++){
            PushVo data = new PushVo();
            data.setRowNum((totalCnt - startIdx));
            data.setPush_col1(DalbitUtil.randomValue("number", 1));
            data.setPush_col2(DalbitUtil.randomValue("number", 1));
            data.setPush_col3("메시지 제목 이란다 ㅋㅋㅋㅋㅋ _" + data.getPush_col1());
            data.setPush_col4((new Date()).toString());
            data.setPush_col5(DalbitUtil.randomValue("number", 1));
            data.setPush_col6((new Date()).toString());
            data.setPush_col7("YOOSIN");

            list.add(data);
            startIdx++;
        }

        list.get(0).setTotalCnt(totalCnt);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));

    }

}