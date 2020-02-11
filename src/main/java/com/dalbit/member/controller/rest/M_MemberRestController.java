package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.M_MemberService;
import com.dalbit.member.vo.MemberBroadcastHistoryListVo;
import com.dalbit.member.vo.MemberInfoLevelListVo;
import com.dalbit.member.vo.MemberListVo;
import com.dalbit.member.vo.P_MemberInfoVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Slf4j
@RestController
@RequestMapping("rest/member/member")
public class M_MemberRestController {

    @Autowired
    M_MemberService mMemberService;
    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;



    @PostMapping("list")
    public String list(HttpServletRequest request){
        MemberListVo apiData = new MemberListVo();
        apiData.setSearch(request.getParameter("search"));
        apiData.setDate(request.getParameter("date"));
        apiData.setGubun(request.getParameter("gubun"));
        apiData.setStDate(request.getParameter("stDate"));
        apiData.setEdDate(request.getParameter("edDate"));
        List<MemberListVo> list = mMemberService.getMemberList(apiData);

        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list));
    }

    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model)throws GlobalException {

        String[] headers = {"회원정보", "userId", "닉네임", "Double", "Date", "Calendar", "Long", "ㅇㅇㅇㅇ"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        MemberListVo apiData = new MemberListVo();
        apiData.setSearch(request.getParameter("search"));
        apiData.setDate(request.getParameter("date"));
        apiData.setGubun(request.getParameter("gubun"));
        apiData.setStDate(request.getParameter("stDate"));
        apiData.setEdDate(request.getParameter("edDate"));
        List<MemberListVo> list = mMemberService.getMemberList(apiData);

        List<Object[]> bodies = new ArrayList<>();

        list.stream().forEach(memberListVo -> {
            HashMap hm = new LinkedHashMap();
            hm.put("memNo", DalbitUtil.isEmpty(memberListVo.getMemNo()) ? "" : memberListVo.getMemNo());
            hm.put("memId", DalbitUtil.isEmpty(memberListVo.getMemId()) ? "" : memberListVo.getMemId());
            hm.put("nickNm", DalbitUtil.isEmpty(memberListVo.getMemNick()) ? "" : memberListVo.getMemNick());
            hm.put("name", DalbitUtil.isEmpty(memberListVo.getMemName()) ? "" : memberListVo.getMemName());
            hm.put("phone", DalbitUtil.isEmpty(memberListVo.getMemPhone()) ? "" : memberListVo.getMemPhone());
            hm.put("gubun", DalbitUtil.isEmpty(memberListVo.getGubun()) ? "" : memberListVo.getGubun());
            hm.put("connect", false);
            hm.put("live", false);

            bodies.add(hm.values().toArray());
        });

        for(int i = 0; i < list.size(); i++){

        }



        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);

        SXSSFWorkbook workbook = excelService.excelDownload("회원정보",vo);

        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "회원목록");

        excelService.renderMergedOutputModel(model.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    @PostMapping("level")
    public String level(HttpServletRequest request){
        MemberInfoLevelListVo apiData = new MemberInfoLevelListVo();
        apiData.setLevel((String) request.getParameter("level"));
        String result = mMemberService.callMemberLevelList(apiData);
        return result;
    }

    @PostMapping("info")
    public String info(HttpServletRequest request){
        P_MemberInfoVo apiData = new P_MemberInfoVo();
        apiData.setMemLogin(DalbitUtil.isLogin() ? 1 : 0);
        apiData.setMemNo((String) request.getParameter("mem_no"));
        String result = mMemberService.callMemberInfo(apiData);
        return result;
    }
}
