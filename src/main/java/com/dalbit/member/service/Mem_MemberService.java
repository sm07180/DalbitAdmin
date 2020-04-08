package com.dalbit.member.service;


import com.dalbit.broadcast.dao.Bro_BroadcastDao;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListInputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastListOutputVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.SmsService;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.SmsVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.P_LoginVo;
import com.dalbit.member.vo.procedure.*;
import com.dalbit.util.*;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Slf4j
@Service
public class Mem_MemberService {

    @Autowired
    Mem_MemberDao mem_MemberDao;
    @Autowired
    Bro_BroadcastDao bro_BroadcastDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    ExcelService excelService;
    @Autowired
    SocketUtil socketUtil;
    @Autowired
    JwtUtil jwtUtil;
    @Autowired
    SmsService smsService;

    public ProcedureVo callMemberLogin(P_LoginVo pLoginVo) {
        ProcedureVo procedureVo = new ProcedureVo(pLoginVo);
        mem_MemberDao.callMemberLogin(procedureVo);
        return procedureVo;
    }

    /**
     * 회원 목록
     */
    public String getMemberList(P_MemberListInputVo pMemberListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberListInputVo);
        ArrayList<P_MemberListOutputVo> memberList = mem_MemberDao.callMemberList(procedureVo);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, memberList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_실패));
        }
        return result;
    }

    /**
     * 회원 엑셀
     */
    public Model getListExcel(P_MemberListInputVo pMemberListInputVo, Model model) {
        ProcedureVo procedureVo = new ProcedureVo(pMemberListInputVo);

        List<P_MemberListOutputVo> list = mem_MemberDao.callMemberList(procedureVo);

        String[] headers = {"회원번호", "UserID", "닉네임", "연락처", "가입플랫폼", "회원가입일시", "최근 접속 일시", "누적 접속 수", "결제 건 수/금액", "회원상태", "접속상태", "방송상태"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("mem1", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem2", DalbitUtil.isEmpty(list.get(i).getMem_userid()) ? "" : list.get(i).getMem_userid());
            hm.put("mem3", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("mem4", DalbitUtil.isEmpty(list.get(i).getMem_phone()) ? "" : list.get(i).getMem_phone());
            hm.put("mem5", DalbitUtil.isEmpty(list.get(i).getMem_slct()) ? "" : list.get(i).getMem_slct());
            hm.put("mem6", DalbitUtil.isEmpty(list.get(i).getJoinDate()) ? "" : list.get(i).getJoinDate());
            hm.put("mem7", DalbitUtil.isEmpty(list.get(i).getLast_connect_date()) ? "" : list.get(i).getLast_connect_date());
            hm.put("mem8", DalbitUtil.isEmpty(list.get(i).getConnectCnt()) ? "" : list.get(i).getConnectCnt());
            hm.put("mem9", DalbitUtil.isEmpty(list.get(i).getPayCntAmount()) ? "" : list.get(i).getPayCntAmount());
            hm.put("mem10", DalbitUtil.isEmpty(list.get(i).getMem_state()) ? "" : list.get(i).getMem_state());
            hm.put("mem11", DalbitUtil.isEmpty(list.get(i).getConnectState()) ? "" : list.get(i).getConnectState());
            hm.put("mem12", DalbitUtil.isEmpty(list.get(i).getLiveBroad()) ? "" : list.get(i).getLiveBroad());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "회원 목록");

        return model;
    }

    /**
     * 회원 정보
     */
    public String getMemberInfo(P_MemberInfoInputVo pMemberInfoInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pMemberInfoInputVo);
        mem_MemberDao.callMemberInfo(procedureVo);
        P_MemberInfoOutputVo memberInfo = new Gson().fromJson(procedureVo.getExt(), P_MemberInfoOutputVo.class);
        String result;
        if(Status.회원정보보기_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, memberInfo));
        } else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_실패));
        }
        return result;
    }

    /**
     * 닉네임 중복체크
     */
    public String callNickNameCheck(ProcedureVo procedureVo) {
        mem_MemberDao.callNickNameCheck(procedureVo);
        log.debug("닉네임중복체크 결과 : {}", procedureVo.toString());
        return procedureVo.getRet();
    }

    /**
     * 회원 정보수정 내역 보기
     */
    public String callMemberEditHistory(P_MemberEditHistInputVo pMemberEditHistInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberEditHistInputVo);
        ArrayList<P_MemberEditHistOutputVo> editList = mem_MemberDao.callMemberEditHistory(procedureVo);
        String result;
        if (Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정내역조회_성공, editList, new PagingVo(procedureVo.getRet())));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정내역조회_실패));
        }
        return result;

    }

    /**
     * 회원 정보 수정
     */
    public String getMemberEditor(P_MemberEditorVo pMemberEditorVo) throws GlobalException {
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pMemberEditorVo);
        mem_MemberDao.callMemberEditor(procedureVo);
        String result;
        if(Status.회원정보수정성공.getMessageCode().equals(procedureVo.getRet())){
//            if(pMemberEditorVo.getSendNoti().equals("1")) {
//                P_BroadcastListInputVo pBroadcastListInputVo = new P_BroadcastListInputVo();
//                pBroadcastListInputVo.setDj_searchText(pMemberEditorVo.getMem_no());
//                pBroadcastListInputVo.setSlctType(1);
//                pBroadcastListInputVo.setDj_slctType(0);
//                pBroadcastListInputVo.setRoom_slctType(-1);
//
//                ProcedureVo inner_procedureVo = new ProcedureVo(pBroadcastListInputVo);
//                ArrayList<P_BroadcastListOutputVo> broadList = bro_BroadcastDao.callBroadcastList(inner_procedureVo);
//
//                //프로필, 닉네임
//                HashMap<String, Object> param = new HashMap<>();
//                param.put("roomNo", broadList.get(0).getRoom_no());
//                param.put("memNo", pMemberEditorVo.getMem_no());
//                param.put("nickName", pMemberEditorVo.getNickName());
//                // option
//                param.put("ctrlRole", "ctrlRole");
//                param.put("recvType", "system");
//                param.put("recvPosition", "top1");
//                param.put("recvLevel", 1);
//                param.put("recvTime", 5);
//
//                socketUtil.setSocket(param, "reqAlert", pMemberEditorVo.getNotiMemo(), jwtUtil.generateToken(pMemberEditorVo.getMem_no(), true));
//            }

            // 비밀번호 변경
            if(pMemberEditorVo.getNotiSms().equals("1")){
                smsService.sendSms(new SmsVo(pMemberEditorVo.getNotiMemo() + "[" + pMemberEditorVo.getPasswdReset()+ "]",pMemberEditorVo.getPhoneNum()));
            }
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정실패));
        }
        return result;
    }

    /**
     * 회원 소셜아이디 변경
     */
    public String getMemberSocialIdEdit(P_MemberEditorVo pMemberEditorVo){
        int cnt = mem_MemberDao.callMemberSocialIdCheck(pMemberEditorVo);
        if(cnt > 0){

            return gsonUtil.toJson(new JsonOutputVo(Status.회원로그인ID변경_중복));
        }
        mem_MemberDao.callMemberSocialIdEditor(pMemberEditorVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.회원로그인ID변경_성공));
    }

    /**
     * 회원 상태 정상 변경
     */
    public String getMemberStateEdit(P_MemberEditorVo pMemberEditorVo){
        mem_MemberDao.callMemberStateEditor(pMemberEditorVo);
        return gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모등록성공));
    }

    //-------------------------------------------------------------------
    /*자세히보기*/

    /**
     * 회원 운영자 메모 등록
     */
    public String getMemberAdminMemoAdd(P_MemberAdminMemoAddVo pMemberAdminMemoAddVo){
        pMemberAdminMemoAddVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pMemberAdminMemoAddVo, true);
        mem_MemberDao.callMemAdminMemoAdd(procedureVo);
        String result;
        if(Status.회원운영자메모등록성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모등록성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모등록실패));
        }
        return result;
    }

    /**
     * 회원 운영자 메모 목록
     */
    public String getMemberAdminMemolist(P_MemberAdminMemoListInputVo pMemberAdminMemoListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberAdminMemoListInputVo);
        ArrayList<P_MemberAdminMemoListOutputVo> memberAdminMemoList = mem_MemberDao.callMemAdminMemoList(procedureVo);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, memberAdminMemoList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_실패));
        }
        return result;
    }

    /**
     * 회원 접속 정보
     */
    public String getMemberConnect(P_MemberConnectInputVo pMemberConnectInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberConnectInputVo);
        ArrayList<P_MemberConnectOutputVo> memberConnect = mem_MemberDao.callMemConnect(procedureVo);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_접속정보보기_성공, memberConnect, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_접속정보보기_실패));
        }
        return result;
    }
    /**
     * 회원 매니저 목록
     */
    public String getMemberManagerList(P_MemberManagerListInputVo pMemberManagerListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberManagerListInputVo);
        ArrayList<P_MemberManagerListOutputVo> memManagerList = mem_MemberDao.callMemManagerList(procedureVo);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_매니저정보보기_성공, memManagerList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_매니저정보보기_실패));
        }
        return result;
    }
    /**
     * 회원 블랙리스트 목록
     */
    public String getMemberBlackList(P_MemberBlackListInputVo pMemberBlackListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberBlackListInputVo);
        ArrayList<P_MemberBlackListOutputVo> memBlackList = mem_MemberDao.callMemBlackList(procedureVo);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_블랙리스트정보보기_성공, memBlackList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보_블랙리스트정보보기_실패));
        }
        return result;
    }

    //-------------------------------------------------------------------
}
