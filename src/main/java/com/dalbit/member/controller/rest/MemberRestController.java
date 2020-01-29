package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.sample.service.SampleService;
import com.dalbit.util.DalbitUtil;
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
@RequestMapping("rest/member")
public class MemberRestController {

    @Autowired
    SampleService sampleService;

    @Autowired
    GsonUtil gsonUtil;

    @PostMapping("list")
    public String list(Model model){

        ArrayList<HashMap> list = new ArrayList<HashMap>();
        HashMap map = new HashMap();

        for(int i=0; i++ <20;) {
            map.put("NO", "NO");
            map.put("Name", "양위디");
            map.put("NickName", "내이름은난난");
            map.put("PhoneNum", "01099410000");
            map.put("Email", "Radio00@gmail.com");
            map.put("JoinDate", "20191231");
            map.put("BirthDate", "2000.04.18");
            map.put("Live", "♠");
            map.put("Status", "");


            list.add(map);
        }
//        for(int i = 0; i++ < 20;){
//            map = new HashMap();
//            map.put("NO", DalbitUtil.randomValue("string", 1));
//            map.put("Name", "테스트인포렉스");
//            map.put("NickName", DalbitUtil.randomValue("string", 6));
//            map.put("PhoneNum", DalbitUtil.randomValue("string", 9));
//            map.put("Email", DalbitUtil.randomValue("String", 20));
//            map.put("JoinDate", DalbitUtil.randomValue("Date", 6));
//            map.put("BirthDate", DalbitUtil.randomValue("getTime()", 6));
//            map.put("Live", DalbitUtil.randomValue("string", 1));
//            map.put("Status", DalbitUtil.randomValue("string", 1));
//            list.add(map);
//        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }

}
