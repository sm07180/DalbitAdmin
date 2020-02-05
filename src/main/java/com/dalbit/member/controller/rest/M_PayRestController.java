package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_PayService;
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
@RequestMapping("rest/member/pay")
public class M_PayRestController {

    @Autowired
    M_PayService mPayService;

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
            map.put("Sort", "결제");
            map.put("Item", "루비");
            map.put("PayRefundNum", "OO건");
            map.put("PayRefundAmt", "00,000원");
            map.put("PayRefundDate", "20200305");
            map.put("PayBy", "신용카드");
            map.put("PayBy", "휴대폰결제");
            map.put("Status", "11:00:01");
            map.put("Refund", "처리직원명");

            list.add(map);
        }


        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }



}
