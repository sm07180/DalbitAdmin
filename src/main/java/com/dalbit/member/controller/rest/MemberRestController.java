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
            map.put("Name", "양위디");             // 이름
            map.put("NickName", "내이름은난난");   // 닉네임
            map.put("PhoneNum", "01099410000");    // 휴대전화번호
            map.put("Email", "Radio00@gmail.com"); // 이메일
            map.put("JoinDate", "20191231");       // 가입일
            map.put("BirthDate", "20000418");      // 생년월일
            map.put("Live", "♠");                 // 생방여부
            map.put("Status", "");                 // 상태 정렬


            list.add(map);
        }


        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }

    @PostMapping("profile/broadList")
    public String broadList(Model model) {
        ArrayList<HashMap> broadList = new ArrayList<>();
        HashMap map = new HashMap();

        for(int i=0; i++<100;) {
            map.put("NO", "NO");
            map.put("RoomTitle", "신나는 주말");  // 방제목
            map.put("StartTime", "20191225");     // 방송 시작 시간
            map.put("EndTime", "현재 진행 중");      // 방송 종료 시간
            map.put("OnAirTime", "01:05:01");      // 방송 진행 시간
            map.put("MaxListener", "xx");     // 최대 청취자 수
            map.put("AvgListener", "50");     // 평균 청취자 수
            map.put("Good", "XX");     // 받은 좋아요 수
            map.put("Gift", "1");     // 받은 선물 아이템 수

            broadList.add(map);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, broadList));
    }

}
