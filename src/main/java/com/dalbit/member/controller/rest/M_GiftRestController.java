package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_GiftService;
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
@RequestMapping("rest/member/gift")
public class M_GiftRestController {

    @Autowired
    M_GiftService mGiftService;

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

        for(int i=0; i++ <20;) {
            map.put("NO", "NO");
            map.put("Sort", "보낸선물");
            map.put("Item", "루비");
            map.put("Num", "OO건");
            map.put("Amount", "00,000원");
            map.put("Date", "20200325");
            map.put("UserID", "tt.mm.ss");
            map.put("Refund", "처리직원 ID");


            list.add(map);
        }


        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }




}
