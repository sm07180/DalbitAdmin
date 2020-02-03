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
@RequestMapping("rest/member/member")
public class MemberRestController {

    @Autowired
    SampleService sampleService;

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
            map.put("UserID", "DaldalE");
            map.put("NickName", "다달이");
            map.put("Name", "양달님");
            map.put("PhoneNum", "010-9941-0000");
            map.put("JoinPlatform", "달빛");
            map.put("Login_out", "Login");
            map.put("Live", "생방중♠");


            list.add(map);
        }


        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }


    /**
     * 회원프로필
     * @param model
     * @return
     */

    @PostMapping("profile")
    public String profile(Model model) {
        ArrayList<HashMap> profile = new ArrayList<HashMap>();
        HashMap map = new HashMap();


            map.put("ProfileImg", "ProfileImg");       // 프로필 이미지
            map.put("Name", "양위디");                 // 이름
            map.put("Age", "22세");                    // 나이
            map.put("Id", "Radio00");                  // 아이디
            map.put("Gender", "남");                   // 성별
            map.put("NickName", "위뒤위뒤");           // 닉네임
            map.put("Level", "52");                    //레벨
            map.put("DJGrade", "베스트DJ");            // DJ 등급
            map.put("ListenerGrade", "베스트청취자");  // 청취자 등급
            map.put("Email", "Radio00@gmail.com");     // 이메일
            map.put("PhoneNum", "010-9941-0000");      // 휴대폰번호
            map.put("Password", "*******");            // 비밀번호
            map.put("BirthDate", "2000.12.25");        // 생년월일
            map.put("OnAir", "On Air ♠");             // 생방송 여부
            map.put("JoinPath", "Naver 인증");         // 회원가입 경로
            map.put("ModifyDate", "20191225");         // 최근정보 수정일

            profile.add(map);


            return gsonUtil.toJson(new JsonOutputVo(Status.조회,profile));
    }


    /**
     * 회원프로필 > 방송기록
     * @param model
     * @return
     */

    @PostMapping("profile/broadList")
    public String broadList(Model model) {
        ArrayList<HashMap> broadList = new ArrayList<HashMap>();
        HashMap map = new HashMap();

        for(int i=0; i++<100;) {
            map.put("NO", "NO");
            map.put("RoomType", "노래/연주");
            map.put("RoomTitle", "다달이와 함께하는 라디오");
            map.put("StartTime", "20200501");
            map.put("EndTime", "20200501");
            map.put("OnAirTime", "xx");
            map.put("AvgListener", "50");
            map.put("Good", "XX");
            map.put("Gift", "1");

            broadList.add(map);
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, broadList));
    }

}
