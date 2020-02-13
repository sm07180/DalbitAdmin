package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_NoticeService;
import com.dalbit.member.vo.NoticeListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/member/notice")
public class M_NoticeRestController {

    @Autowired
    M_NoticeService mNoticeService;

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 회원리스트
     * @param model
     * @return
     */

    @PostMapping("mylist")
    public String mylist(Model model){

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

    @PostMapping("broadelist")
    public String list(HttpServletRequest request) {
        NoticeListVo apiData = new NoticeListVo();
        apiData.setMemNo((String) request.getParameter("mem_no"));
        List<NoticeListVo> list = mNoticeService.getBroadNoticeList(apiData);
        return gsonUtil.toJson(new JsonOutputVo(Status.MyStar목록보기성공, list));
    }




}
