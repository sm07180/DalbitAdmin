package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.B_BroadcastService;
import com.dalbit.broadcast.service.B_MemberService;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
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
@RequestMapping("rest/broadcast/member")
public class B_MemberRestController {

    @Autowired
    B_MemberService bMemberService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 회원리스트
     * @param model
     * @return
     */

    @PostMapping("list")
    public String list(Model model){
        ArrayList<HashMap> list = new ArrayList<HashMap>();
        HashMap map = new HashMap();
        for(int i=0; i++ < 20;) {

            map.put("NO", i);
            map.put("MemNo", "11577950603958");
            map.put("UserID", "3333");
            map.put("NickName", "cccc");
            map.put("Name", "양달님");
            map.put("PhoneNum", "010-9941-0000");
            map.put("JoinPlatform", "달빛");
            map.put("Login_out", "Login");
            map.put("Live", "생방중♠");
            list.add(map);
        }


        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }

}
