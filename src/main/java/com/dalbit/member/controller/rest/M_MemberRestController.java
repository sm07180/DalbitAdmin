package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.service.M_MemberService;
import com.dalbit.member.vo.MemberListVo;
import com.dalbit.member.vo.P_MemberInfoVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("rest/member/member")
public class M_MemberRestController {

    @Autowired
    M_MemberService mMemberService;

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 회원리스트
     * //@param model
     * @return
     */

    /*@PostMapping("list")
    public String list(Model model){
        ArrayList<HashMap> list = new ArrayList<HashMap>();
//        HashMap map = new HashMap();
        for(int i=0; i<3;i++) {
            HashMap map = new HashMap();
            map.put("NO", i);
            if(i == 0) {
                map.put("MemNo", "11577690655946");
                map.put("UserID", "1111");
                map.put("NickName", "aaaa");
            }else if(i == 1) {
                map.put("MemNo", "11577931027280");
                map.put("UserID", "2222");
                map.put("NickName", "bbbb");
            }else {
                map.put("MemNo", "11577950603958");
                map.put("UserID", "3333");
                map.put("NickName", "cccc");
            }
            map.put("Name", "양달님");
            map.put("PhoneNum", "010-9941-0000");
            map.put("JoinPlatform", "달빛");
            map.put("Login_out", "Login");
            map.put("Live", "생방중♠");
            list.add(map);
        }



        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list));
    }*/

    @PostMapping("list")
    public String getMemberList(){
        List<MemberListVo> memberListVo = mMemberService.getMemberList();
        return gsonUtil.toJson(new JsonOutputVo(Status.조회, memberListVo));
    }


    @PostMapping("info")
    public String info(HttpServletRequest request){
        String memNo = (String) request.getParameter("mem_no");

        P_MemberInfoVo apiData = new P_MemberInfoVo();
        apiData.setMemLogin(DalbitUtil.isLogin() ? 1 : 0);
        apiData.setMem_no(memNo);
        apiData.setTarget_mem_no(memNo);
        String result = mMemberService.callMemberInfo(apiData);
        return result;
    }


}
