package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.sample.service.SampleService;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/member/listen")
public class ListenRestController {

    @Autowired
    SampleService sampleService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원프로필 > 방송기록
     * @param model
     * @return
     */

    @PostMapping("list")
    public String list(Model model) {
        ArrayList<HashMap> list = new ArrayList<HashMap>();
        HashMap map = new HashMap();

        for(int i=0; i++<100;) {
            map.put("NO", "NO");
            map.put("RoomType", "노래/연주");
            map.put("RoomTitle", "다달이와 함께하는 라디오");
            map.put("StartTime", "20200501");
            map.put("EndTime", "20200501");
            map.put("OnAirTime", "xx");
            map.put("DJNickName", "50");
            map.put("Good", "XX");
            map.put("Gift", "1");

            list.add(map);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }
}
