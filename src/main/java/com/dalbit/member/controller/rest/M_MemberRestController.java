package com.dalbit.member.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.M_MemberService;
import com.dalbit.member.vo.MemberInfoLevelListVo;
import com.dalbit.member.vo.MemberInfoVo;
import com.dalbit.member.vo.MemberListVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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
    public String list(MemberListVo memberListVo){

        log.info("MemberListVo.search : " + memberListVo.getSearch());
        List<MemberListVo> list = mMemberService.getMemberList(memberListVo);
        var pagingVo = new PagingVo(mMemberService.getMemberList_cnt(memberListVo));
        return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, list, pagingVo));
    }

    @PostMapping("level")
    public String level(MemberInfoLevelListVo memberInfoLevelListVo){
        String result = mMemberService.callMemberLevelList(memberInfoLevelListVo);
        return result;
    }

    @PostMapping("info")
    public String info(MemberInfoVo memberInfoVo){
        log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@ 1");
        String result = mMemberService.callMemberInfo(memberInfoVo);
        return result;
    }

    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model) throws GlobalException {

        String[] headers = {"회원번호", "UserID", "닉네임", "이름", "연락처", "가입플랫폼", "접속상태", "생방상태"};
        int[] headerWidths = {5000, 5000, 4000, 3000, 5000, 1000, 3000, 3000};

        MemberListVo apiData = new MemberListVo();
        apiData.setSearch(request.getParameter("search"));
        apiData.setDate(request.getParameter("date"));
        apiData.setGubun(request.getParameter("gubun"));
        apiData.setCheckDate(request.getParameter("checkDate"));
        apiData.setStDate(request.getParameter("stDate").replace("-",""));
        apiData.setEdDate(request.getParameter("edDate").replace("-",""));
        List<MemberListVo> list = mMemberService.getMemberList(apiData);
        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("memNo", DalbitUtil.isEmpty(list.get(i).getMemNo()) ? "" : list.get(i).getMemNo());
            hm.put("memId", DalbitUtil.isEmpty(list.get(i).getMemId()) ? "" : list.get(i).getMemId());
            hm.put("nickNm", DalbitUtil.isEmpty(list.get(i).getMemNick()) ? "" : list.get(i).getMemNick());
            hm.put("name", DalbitUtil.isEmpty(list.get(i).getMemName()) ? "" : list.get(i).getMemName());
            hm.put("phone", DalbitUtil.isEmpty(list.get(i).getMemPhone()) ? "" : list.get(i).getMemPhone());
            hm.put("memSlct", DalbitUtil.isEmpty(list.get(i).getMemSlct()) ? "" : list.get(i).getMemSlct());
            hm.put("connect", false);
            hm.put("live", false);

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("회원정보",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "회원목록");
        excelService.renderMergedOutputModel(model.asMap(), request, response);
        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    @PostMapping("edit")
    public int edit(HttpServletRequest request){
        MemberInfoVo apiData = new MemberInfoVo();
        apiData.setMemLogin(DalbitUtil.isLogin() ? 1 : 0);
        apiData.setMemNo((String) request.getParameter("memNo"));
        apiData.setProfileImage((String) request.getParameter("profileImage"));
        apiData.setProfileImageGrade(Integer.parseInt(request.getParameter("profileImageGrade")));
        apiData.setProfImgDel((String) (request.getParameter("profImgDel")));
        int result = mMemberService.callMemberEdit(apiData);
        return result;
    }
}
