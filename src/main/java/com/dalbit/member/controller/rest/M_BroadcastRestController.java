package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_BroadcastService;
import com.dalbit.member.vo.BroadListVo;
import com.dalbit.member.vo.MemberBroadcastHistoryListVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/member/broadcast")
public class M_BroadcastRestController {

    @Autowired
    M_BroadcastService mBroadcastService;

    @Autowired
    GsonUtil gsonUtil;


   @PostMapping("list")
    public String list() {
       List<BroadListVo> broadListVo = mBroadcastService.getBroadList();
       return gsonUtil.toJson(new JsonOutputVo(Status.조회, broadListVo));
   }

    @PostMapping("memberHistory_detail")
    public String memberHistory_detail(HttpServletRequest request){
        MemberBroadcastHistoryListVo apiData = new MemberBroadcastHistoryListVo();
        apiData.setMemNo((String) request.getParameter("mem_no"));
        apiData.setTmp((String) request.getParameter("tmp"));
        log.info("@@@ " + (String) request.getParameter("mem_no") + (String) request.getParameter("tmp"));

        List<MemberBroadcastHistoryListVo> list = mBroadcastService.getMemberHistory_detail(apiData);
        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }

}
