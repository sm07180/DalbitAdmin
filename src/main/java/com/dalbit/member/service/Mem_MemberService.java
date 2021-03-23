package com.dalbit.member.service;


import com.dalbit.broadcast.dao.Bro_BroadcastDao;
import com.dalbit.broadcast.service.Bro_BroadcastService;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditHistOutputVo;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditInputVo;
import com.dalbit.common.code.Code;
import com.dalbit.common.code.ErrorStatus;
import com.dalbit.common.code.Status;
import com.dalbit.common.dao.CommonDao;
import com.dalbit.common.service.CommonMemberService;
import com.dalbit.common.service.SmsService;
import com.dalbit.common.vo.*;
import com.dalbit.content.service.PushService;
import com.dalbit.content.vo.procedure.P_pushInsertVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.*;
import com.dalbit.member.vo.procedure.*;
import com.dalbit.security.vo.InforexLoginUserInfoVo;
import com.dalbit.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import lombok.extern.slf4j.Slf4j;
import lombok.var;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

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

    @Value("${admin.memNo}")
    String ADMIN_MEM_NO;

    @Autowired
    PushService pushService;
    @Autowired
    Mem_ListenService mem_ListenService;
    @Autowired
    Mem_BroadcastService mem_BroadcastService;

    @Autowired
    Bro_BroadcastService bro_broadcastService;
    @Autowired
    CommonDao commonDao;

    @Autowired
    CommonMemberService commonMemberService;

    @Autowired
    SocketRestUtil socketRestUtil;

    public ProcedureVo callMemberLogin(P_LoginVo pLoginVo) {
        ProcedureVo procedureVo = new ProcedureVo(pLoginVo);
        mem_MemberDao.callMemberLogin(procedureVo);
        return procedureVo;
    }

    /**
     * 회원 목록
     */
    public String getMemberList(P_MemberListInputVo pMemberListInputVo){

        if(DalbitUtil.isEmpty(pMemberListInputVo.getSearchText())){
            return gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_데이터없음));
        }

        if(DalbitUtil.isEmpty(pMemberListInputVo.getMemWithdrawal())){
            pMemberListInputVo.setMemWithdrawal("0");
        }

        ProcedureVo procedureVo = new ProcedureVo(pMemberListInputVo);
        ArrayList<P_MemberListOutputVo> memberList = mem_MemberDao.callMemberList(procedureVo);

        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공, memberList, new PagingVo(procedureVo.getRet())));
        }else if(Integer.parseInt(procedureVo.getRet()) == 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_데이터없음));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_실패));
        }
        return result;
    }

    /**
     * 회원 엑셀
     */
    public Model getListExcel(P_MemberListInputVo pMemberListInputVo, Model model) {
        pMemberListInputVo.setPageCnt(60000);
        ProcedureVo procedureVo = new ProcedureVo(pMemberListInputVo);

        List<P_MemberListOutputVo> list = mem_MemberDao.callMemberList(procedureVo);

        String[] headers = {"No", "회원번호", "UserID", "닉네임", "연락처", "가입플랫폼", "회원가입일시", "최근 접속 일시", "누적 접속 수", "결제 건 수/금액", "회원상태", "접속상태", "방송상태"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size() - i);
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

        // 회원 뱃지
        HashMap<P_MemberInfoOutputVo,String> djBadge = mem_MemberDao.callMemberInfo_badge(pMemberInfoInputVo.getMem_no());
        if(!DalbitUtil.isEmpty(djBadge)) {
            memberInfo.setRecomm_badge(String.valueOf(djBadge.get("recomm_badge")) );
            memberInfo.setNewdj_badge(String.valueOf(djBadge.get("newdj_badge")));
            memberInfo.setSpecialdj_badge(String.valueOf(djBadge.get("specialdj_badge")));
        }

        List badgeList = commonMemberService.selectMemberBadgeList(pMemberInfoInputVo.getMem_no());
        if(!DalbitUtil.isEmpty(badgeList)){
            memberInfo.setLiveBadgeList(badgeList);
        }


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
     * 회원 정보수정 내역 보기
     */
    public String callMemberRoomEditHistory(P_MemberEditHistInputVo pMemberEditHistInputVo){
        int totalCnt = mem_MemberDao.callMemberRoomEditHistoryCnt(pMemberEditHistInputVo);
        pMemberEditHistInputVo.setTotalCnt(totalCnt);
        ArrayList<P_BroadcastEditHistOutputVo> editList = mem_MemberDao.callMemberRoomEditHistory(pMemberEditHistInputVo);
        String result;
        if (editList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정내역조회_성공, editList, new PagingVo(pMemberEditHistInputVo.getTotalCnt())));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정내역조회_실패));
        }
        return result;

    }

    /**
     * 회원 클립수정 내역 보기
     */
    public String callMemberClipEditHistory(P_MemberEditHistInputVo pMemberEditHistInputVo){
        int totalCnt = mem_MemberDao.callMemberClipEditHistoryCnt(pMemberEditHistInputVo);
        pMemberEditHistInputVo.setTotalCnt(totalCnt);
        ArrayList<P_BroadcastEditHistOutputVo> editList = mem_MemberDao.callMemberClipEditHistory(pMemberEditHistInputVo);
        String result;
        if (editList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정내역조회_성공, editList, new PagingVo(pMemberEditHistInputVo.getTotalCnt())));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정내역조회_실패));
        }
        return result;

    }


    /**
     * 회원 달/별 내역 보기
     */
    public String callMemberPointHistory(P_MemberEditHistInputVo pMemberEditHistInputVo){
        pMemberEditHistInputVo.setPageNo(pMemberEditHistInputVo.getPageNo() -1);
        pMemberEditHistInputVo.setPageNo(pMemberEditHistInputVo.getPageNo() * pMemberEditHistInputVo.getPageCnt());
        ArrayList<P_MemberEditHistOutputVo> editList = mem_MemberDao.callMemberPointHistory(pMemberEditHistInputVo);
        int totalCnt = mem_MemberDao.callMemberPointHistory_totalCnt(pMemberEditHistInputVo);
        String result;
        if (editList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원달별수정내역조회_성공, editList, new PagingVo(totalCnt)));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원달별수정내역조회_실패));
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
            if(pMemberEditorVo.getSendNoti().equals("1") || pMemberEditorVo.getSendNoti().equals("2")) {        // 1: noti + push + socket, 2: socket

                // option
                HashMap<String, Object> param = new HashMap<>();
                param.put("memNo", pMemberEditorVo.getMem_no());
                param.put("memNk", "");
                param.put("ctrlRole", "ctrlRole");
                param.put("recvType", "chat");
                param.put("recvPosition", "chat");
                param.put("recvLevel", 0);
                param.put("recvTime", 0);

                // message set
                Gson gson = new Gson();
                HashMap<String,Object> tmp = new HashMap();
                if("".equals(pMemberEditorVo.getProfileImage())){
                    // 프로필 이미지 제거
                    P_MemberInfoInputVo pMemberInfoInputVo = new P_MemberInfoInputVo();
                    pMemberInfoInputVo.setMem_no(pMemberEditorVo.getMem_no());
                    mem_MemberDao.callMemberLeaderAlbumDelete(pMemberInfoInputVo);

                    tmp.put("image", new ImageVo("",pMemberEditorVo.getMemSex(), DalbitUtil.getProperty("server.photo.url")).getUrl().replace(DalbitUtil.getProperty("server.photo.url"),""));
                }else{
                    tmp.put("image", pMemberEditorVo.getBeforProfileImage());
                }
                tmp.put("sex", pMemberEditorVo.getMemSex());
                tmp.put("nk", pMemberEditorVo.getBeforNickName());
                String message =  gson.toJson(tmp);

                socketUtil.setSocket(param, "reqMyInfo", message, jwtUtil.generateToken(pMemberEditorVo.getMem_no(), true));

                 if(pMemberEditorVo.getSendNoti().equals("1")){
                    try{    // PUSH 발송
                        P_pushInsertVo pPushInsertVo = new P_pushInsertVo();
                        pPushInsertVo.setMem_nos(pMemberEditorVo.getMem_no());
                        pPushInsertVo.setSlct_push("35");
                        pPushInsertVo.setPush_slct("57");       //운영자 메시지(프로필 이미지 초기화, 닉네임 초기화)
                        pPushInsertVo.setSend_title("달빛 라이브 운영자 메시지");
                        pPushInsertVo.setSend_cont(pMemberEditorVo.getNotiMemo());
                        pPushInsertVo.setImage_type("101");
                        pushService.sendPushReqOK(pPushInsertVo);
                    }catch (Exception e){
                        log.error("[PUSH 발송 실패 - 회원 정보 수정]");
                    }
                }
            }

            // 비밀번호 변경
            if(pMemberEditorVo.getNotiSms().equals("1")){
                smsService.sendSms(new SmsVo(pMemberEditorVo.getNotiMemo() + " " + pMemberEditorVo.getPasswdReset()+ " 입니다.",pMemberEditorVo.getPhoneNum(),"1"));
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
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        int cnt = mem_MemberDao.callMemberSocialIdCheck(pMemberEditorVo);
        if(cnt > 0){
            return gsonUtil.toJson(new JsonOutputVo(Status.회원로그인ID변경_중복));
        }
        mem_MemberDao.callMemberSocialIdEditor(pMemberEditorVo);

        pMemberEditorVo.setEditContents("로그인ID 변경 : " + pMemberEditorVo.getBefore_socialId() + " >> " + pMemberEditorVo.getSocialId());
        pMemberEditorVo.setType(0);
        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);


        return gsonUtil.toJson(new JsonOutputVo(Status.회원로그인ID변경_성공));
    }

    /**
     * 회원 상태 정상 변경
     */
    public String getMemberStateEdit(P_MemberEditorVo pMemberEditorVo){
        mem_MemberDao.callMemberWithdrawal_del(pMemberEditorVo);
        mem_MemberDao.callMemberBasicAdd(pMemberEditorVo);
        mem_MemberDao.callMemberWithdrawal_bak_del(pMemberEditorVo);
        mem_MemberDao.callMemberStateEditor(pMemberEditorVo);

        String cont = "이용정지가 해제되었습니다.";
        String etcCont = "이용정지가 해제되었습니다. 서비스 이용에 주의 부탁드립니다.";
        P_pushInsertVo pPushInsertVo = new P_pushInsertVo();
        pPushInsertVo.setPush_slct("56");   //운영자 메시지(이용정지 해제)

        if(pMemberEditorVo.getMemState().equals("2")){ //경고
            cont = "경고 조치가 해제되었습니다.";
            etcCont = "경고 조치가 해제되었습니다.";
            pPushInsertVo.setPush_slct("55");       //운영자 메시지(경고 해제)
        }

        try{    // PUSH 발송
            pPushInsertVo.setMem_nos(pMemberEditorVo.getMem_no());
            pPushInsertVo.setSlct_push("34");
            pPushInsertVo.setSend_title("달빛 라이브 운영자 메시지");
            pPushInsertVo.setSend_cont(cont);
            pPushInsertVo.setEtc_contents(etcCont);
            pPushInsertVo.setImage_type("101");
            pushService.sendPushReqOK(pPushInsertVo);
        }catch (Exception e){
            log.error("[PUSH 발송 실패 - 회원 경고/정지 해지]");
        }

        try{
            P_MemberReportVo pMemberReportVo = new P_MemberReportVo();

            pMemberReportVo.setReported_mem_no(pMemberEditorVo.getMem_no());
            pMemberReportVo.setType_noti(70);
            pMemberReportVo.setTargetMemNo(ADMIN_MEM_NO);
            pMemberReportVo.setNotiContents(etcCont);
            pMemberReportVo.setNotimemo(etcCont);
            mem_MemberDao.callMemberNotification_Add(pMemberReportVo);
        }catch (Exception e){
            log.error("[NOTI 발송 실패 - 회원 경고/정지 해지]");
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모등록성공));
    }

    /**
     * 회원 경고/정지
     */
    public String getMemberReport(P_MemberReportVo pMemberReportVo) throws GlobalException{
        pMemberReportVo.setOpName(MemberVo.getMyMemNo());

        // 신고 대상자가 방송 중인지
        int broadCastingCheck = mem_MemberDao.callMemberBroadCasting_check(pMemberReportVo);
        // 신고 대상자가 청취 중인지
        int listeningCheck = mem_MemberDao.callMemberListening_check(pMemberReportVo);

//        if(check > 0){
//            return gsonUtil.toJson(new JsonOutputVo(Status.방송중));
//        }

        // 경고를 제외한 정지, 탈퇴 시 방송강제종료, 청취강제종료 후 처리 되도록
        if(pMemberReportVo.getSlctType() > 2) {

            if(broadCastingCheck > 0) {
                //방송 강제 종료 처리
                MemberVo MemVo = new MemberVo();
                MemVo.setMem_no(pMemberReportVo.getMem_no());
                mem_BroadcastService.forcedEnd(MemVo);
            }
            if(listeningCheck > 0){
                // 청취 종료 처리
                P_MemberListenInputVo pMemberListenInputVo = new P_MemberListenInputVo();
                pMemberListenInputVo.setMem_no(pMemberReportVo.getMem_no());
                mem_ListenService.forcedExit(pMemberListenInputVo);
            }

            //2021.02.03
            socketRestUtil.memberForceLogout(pMemberReportVo);

         }

        // 신고 대상자 정보
        ProcedureVo procedureVo = new ProcedureVo(pMemberReportVo);
        mem_MemberDao.callMemberInfo(procedureVo);
        P_MemberInfoOutputVo memberInfo = new Gson().fromJson(procedureVo.getExt(), P_MemberInfoOutputVo.class);

        // 신고 -----
        InforexLoginUserInfoVo inforexLoginUserInfoVo = MemberVo.getUserInfo();
        log.info(inforexLoginUserInfoVo.getEmp_no());
        pMemberReportVo.setMem_no(inforexLoginUserInfoVo.getEmp_no());        // 신고자
        pMemberReportVo.setMem_userid(inforexLoginUserInfoVo.getEmp_no());
        pMemberReportVo.setMem_nick(MemberVo.getMyMemNo());
        pMemberReportVo.setReported_mem_no(memberInfo.getMem_no());
        pMemberReportVo.setReported_userid(memberInfo.getUserId());
        pMemberReportVo.setReported_nick(memberInfo.getNickName());
        pMemberReportVo.setReported_phone(memberInfo.getPhoneNum());
        pMemberReportVo.setReported_level(memberInfo.getLevel());
        pMemberReportVo.setReported_grade(memberInfo.getGrade());
        mem_MemberDao.callMemberReport(pMemberReportVo);

        //회원정보 변경 3-1  4-3    5-7
        if(pMemberReportVo.getSlctType() == 3){
            pMemberReportVo.setBlockDay(1);
        }else if(pMemberReportVo.getSlctType() == 4){
            pMemberReportVo.setBlockDay(3);
        }else if(pMemberReportVo.getSlctType() == 5){
            pMemberReportVo.setBlockDay(7);
        }
        mem_MemberDao.callMemberBasicReport_Edit(pMemberReportVo);
        //notice
        pMemberReportVo.setType_noti(70);
        pMemberReportVo.setTargetMemNo(ADMIN_MEM_NO);
        mem_MemberDao.callMemberNotification_Add(pMemberReportVo);
        // 어드민 메모
        if(!DalbitUtil.isEmpty(pMemberReportVo.getMemo())){
            P_MemberReportVo memo = new P_MemberReportVo();
            memo.setMemo(pMemberReportVo.getMemo());
            memo.setOpName(pMemberReportVo.getOpName());
            memo.setMem_no(pMemberReportVo.getMem_no());
            mem_MemberDao.callMemAdminMemoAdd(procedureVo);
        }

        if(pMemberReportVo.getSlctType() == 7) {
            // callMemberWithdrawal_bak_Add
            mem_MemberDao.callMemberWithdrawal_bak_Add(pMemberReportVo);
            // tb_member_basic del
            mem_MemberDao.callMemberBasic_del(pMemberReportVo);
            // tb_member_withdrawal insert
            mem_MemberDao.callMemberWithdrawal_Add(pMemberReportVo);
            // 해당 회원번호로 등록된 팬목록 삭제
            mem_MemberDao.callMemberWithdrawal_fanDel(pMemberReportVo);
            // 해당 회원번호로 등록된 스타목록 삭제
            mem_MemberDao.callMemberWithdrawal_starDel(pMemberReportVo);
        }

        //디바이스 UUID or IP block 테이블 등록
        if((3 <= pMemberReportVo.getSlctType() && pMemberReportVo.getSlctType() <= 6) || pMemberReportVo.getSlctType() == 8){
            var blockScopes = pMemberReportVo.getBlockScope().split(",");
            var blockScopeTexts = pMemberReportVo.getBlockScopeText().split(",");

            var blockDay = pMemberReportVo.getSlctType() == 6 ? 99 : pMemberReportVo.getSlctType() == 8 ? 98 : pMemberReportVo.getBlockDay();

            for(int i = 0; i < blockScopes.length; i++){
                if(blockScopes[i].equals("true") && !DalbitUtil.isEmpty(blockScopeTexts[i])){

                    int block_type = i+1;

                    mem_MemberDao.insertLoginBlock(new LoginBlockVo(block_type, blockScopeTexts[i], blockDay, pMemberReportVo.getOpName(), pMemberReportVo.getIdx()));

                    String edit_contents = "";
                    if(block_type == 1){
                        edit_contents = "deviceUuid 차단 등록 : " +  blockScopeTexts[i];
                    }else if(block_type == 2){
                        edit_contents = "ip 차단 등록 : " +  blockScopeTexts[i];
                    }else if(block_type == 3){
                        edit_contents = "회원번호 차단 등록 : " +  blockScopeTexts[i];
                    }else if(block_type == 4){
                        edit_contents = "휴대폰번호 차단 등록 : " +  blockScopeTexts[i];
                    }

                    mem_MemberDao.insertLoginBlockHistory(new LoginBlockHistVo(edit_contents, 0, pMemberReportVo.getOpName(), pMemberReportVo.getIdx()));
                }
            }
        }


        if(pMemberReportVo.getSlctType() == 2){    // 경고 푸시 발송
            try{    // PUSH 발송
                P_pushInsertVo pPushInsertVo = new P_pushInsertVo();
                pPushInsertVo.setMem_nos(pMemberReportVo.getReported_mem_no());
                pPushInsertVo.setSlct_push("34");
                pPushInsertVo.setPush_slct("54");   //운영자 메시지(사용자 경고)
                pPushInsertVo.setSend_title("달빛 라이브 운영자 메시지");
                pPushInsertVo.setSend_cont("운영정책 위반에 의한 경고 안내입니다.");
                pPushInsertVo.setEtc_contents(pMemberReportVo.getNotiContents().replaceAll("\n", "<br>"));
                pPushInsertVo.setImage_type("101");

                pushService.sendPushReqOK(pPushInsertVo);
            }catch (Exception e){
                log.error("[PUSH 발송 실패 - 회원 경고/정지]");
            }
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.회원제재처리성공));
    }



    /**
     * 회원 방송방 이미지 초기화
     */
    @Transactional
    public String setInitBackgroundImage(P_MemberEditorVo pMemberEditorVo) throws GlobalException {

        try {
            //배경 초기화
            P_BroadcastEditInputVo pBroadcastEditInputVo = new P_BroadcastEditInputVo();
            pBroadcastEditInputVo.setRoom_no(pMemberEditorVo.getRoom_no());
            pBroadcastEditInputVo.setMem_no(pMemberEditorVo.getMem_no());
            pBroadcastEditInputVo.setForceExit("0");
            int random = Integer.parseInt(DalbitUtil.randomBgValue());
            pBroadcastEditInputVo.setBackgroundImage(Code.포토_배경_디폴트_PREFIX.getCode() + "/" + Code.배경이미지_파일명_PREFIX.getCode() + "200708_" + random + ".jpg");

            String result = bro_broadcastService.callBroadcastEdit(pBroadcastEditInputVo);
            log.debug(result);

            // 방송방 수정 성공여부 확인
            JsonParser parser = new JsonParser();
            JsonElement element;
            element = parser.parse(result);
            String codeResult = element.getAsJsonObject().get("code").getAsString();

            if(Status.방송방정보수정_성공.getMessageCode().equals(codeResult)) {

                pBroadcastEditInputVo.setOpName(MemberVo.getMyMemNo());
                pBroadcastEditInputVo.setEditContents("배경이미지초기화: " + pMemberEditorVo.getBeforeMemberData().getRoomBgImage() + " >> " + pBroadcastEditInputVo.getBackgroundImage());
                bro_BroadcastDao.callBroadCastEditHistoryAdd(pBroadcastEditInputVo);

                result = gsonUtil.toJson(new JsonOutputVo(Status.이미지초기화성공));
                return result;
            } else if(Status.방송방정보수정_방번호없음.getMessageCode().equals(codeResult)) {
                return gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_방번호없음));
            } else if(Status.방송방정보수정_종료된방.getMessageCode().equals(codeResult)) {
                return gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_종료된방));
            } else {
                return gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_에러));
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new GlobalException(ErrorStatus.서버처리중오류);
        }
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
     * 회원 운영자 메모 등록
     */
    public String getMemberAdminMemoDel(P_MemberAdminMemoDelVo pMemberAdminMemoDelVo){
        int cnt = mem_MemberDao.callMemAdminMemoDel(pMemberAdminMemoDelVo);
        String result;
        if(cnt > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모삭제성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모삭제실패));
        }
        return result;
    }

    /**
     * 회원 접속 정보
     */
    public String getMemberConnect(P_MemberConnectInputVo pMemberConnectInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pMemberConnectInputVo);
        ArrayList<P_MemberConnectOutputVo> memberConnectList = mem_MemberDao.callMemConnect(procedureVo);

        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.회원정보_접속정보보기_성공, memberConnectList, new PagingVo(procedureVo.getRet())));
        }else{
            return gsonUtil.toJson(new JsonOutputVo(Status.회원정보_접속정보보기_실패));
        }
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



    /**
     * 달 추가
     */
    public String getMemberDalAdd(P_MemberEditorVo pMemberEditorVo){
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());


//        // 가지고 있는 dal
//        // 달 set
//        pMemberEditorVo.setBeforDalCnt(beforDalCnt);
//        pMemberEditorVo.setAfterDalCnt(afterDalCnt);
//        // 달 추가
//        mem_MemberDao.callMemberAddDal(pMemberEditorVo);
//        // 달 추가 로그
//        mem_MemberDao.callMemberAddDal_history(pMemberEditorVo);
//        // 최근정보 수정일 변경
//        mem_MemberDao.callMemberEdit_date(pMemberEditorVo);
//        // 최근 정보 수정 자 입력

        // addDalCnt 추가달
        // dalSlct  0:dal, 1:money
        // dalType  type
        // useContents wellet 문구
        // addContents profile_history 문구
        pMemberEditorVo.setUseContents(pMemberEditorVo.getAddDalCnt() + " - " +  pMemberEditorVo.getPointEditStroy());
        int beforDalCnt = mem_MemberDao.callMemberBeforDelCnt(pMemberEditorVo);
        int afterDalCnt = beforDalCnt + pMemberEditorVo.getAddDalCnt();
        pMemberEditorVo.setAddContents("달수 변경 : " + DalbitUtil.comma(beforDalCnt) + " >> " + DalbitUtil.comma(pMemberEditorVo.getAddDalCnt())
                                         + " 변경 >> " + DalbitUtil.comma(afterDalCnt) + " | " + pMemberEditorVo.getPointEditStroy());

        // 소실금액 복구, 운영자 지급이 같은 코드를 사용. 소실 금액 복구시에만 money ( 차감시에는 dalSlct 사용 X )
        if (pMemberEditorVo.getPointEditStroy().equals("소실금액 복구")) {
            pMemberEditorVo.setDalSlct(1);
        } else {
            pMemberEditorVo.setDalSlct(0);
        }

        ProcedureVo procedureVo = new ProcedureVo(pMemberEditorVo);
        mem_MemberDao.callMemberEditor(procedureVo);


//        //notice
        P_MemberReportVo pMemberReportVo = new P_MemberReportVo();
        pMemberReportVo.setReported_mem_no(pMemberEditorVo.getMem_no());
        pMemberReportVo.setType_noti(32);
        pMemberReportVo.setNotiContents("운영자가 선물을 보냈습니다.");
        pMemberReportVo.setNotimemo("운영자가 선물을 보냈습니다.");
        pMemberReportVo.setTargetMemNo(DalbitUtil.getProperty("admin.memNo"));
        mem_MemberDao.callMemberNotification_Add(pMemberReportVo);

        if(pMemberEditorVo.getAddDalCnt() > 0){
            try{    // PUSH 발송
                P_pushInsertVo pPushInsertVo = new P_pushInsertVo();
                pPushInsertVo.setMem_nos(pMemberReportVo.getReported_mem_no());
                pPushInsertVo.setSlct_push("32");
                pPushInsertVo.setPush_slct("61");   //운영자 선물 알림
                pPushInsertVo.setSend_title("운영자의 선물 도착!!");
                pPushInsertVo.setSend_cont("운영자가 선물을 보냈습니다.");
                pPushInsertVo.setImage_type("102");

                pushService.sendPushReqOK(pPushInsertVo);
            }catch (Exception e){
                log.error("[PUSH 발송 실패 - 달 추가]");
            }
        }


        return gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모등록성공));
    }

    /**
     * 별 추가
     */
    public String getMemberByeolAdd(P_MemberEditorVo pMemberEditorVo){
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        // 가지고 있는 Byeol
        int beforByeolCnt = mem_MemberDao.callMemberBeforByeolCnt(pMemberEditorVo);
        int afterByeolCnt = beforByeolCnt + pMemberEditorVo.getAddByeolCnt();
        // 달 set
        pMemberEditorVo.setBeforByeolCnt(beforByeolCnt);
        pMemberEditorVo.setAfterByeolCnt(afterByeolCnt);
        pMemberEditorVo.setUse_contents(pMemberEditorVo.getAddByeolCnt() + " - " + pMemberEditorVo.getPointEditStroy());
        // 달 추가
        mem_MemberDao.callMemberAddByeol(pMemberEditorVo);
        // 달 추가 로그
        mem_MemberDao.callMemberAddByeol_history(pMemberEditorVo);
        // 최근정보 수정일 변경
        mem_MemberDao.callMemberEdit_date(pMemberEditorVo);
        // 최근 정보 수정 자 입력
        pMemberEditorVo.setEditContents("별수 변경 : " + DalbitUtil.comma(beforByeolCnt) + " >> " + DalbitUtil.comma(pMemberEditorVo.getAddByeolCnt())
                                        + " 변경 >> " + DalbitUtil.comma(afterByeolCnt) + " | " + pMemberEditorVo.getPointEditStroy());
        pMemberEditorVo.setType(1);

        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);
        //notice
        P_MemberReportVo pMemberReportVo = new P_MemberReportVo();
        pMemberReportVo.setReported_mem_no(pMemberEditorVo.getMem_no());
//        pMemberReportVo.setNotiContents(pMemberEditorVo.getAddByeolCnt() + " - " + pMemberEditorVo.getPointEditStroy());
//        pMemberReportVo.setNotimemo(pMemberEditorVo.getAddByeolCnt() + " - " + pMemberEditorVo.getPointEditStroy());
        pMemberReportVo.setType_noti(32);
        pMemberReportVo.setNotiContents("운영자가 선물을 보냈습니다.");
        pMemberReportVo.setNotimemo("운영자가 선물을 보냈습니다.");
        pMemberReportVo.setTargetMemNo(DalbitUtil.getProperty("admin.memNo"));
        mem_MemberDao.callMemberNotification_Add(pMemberReportVo);

        if(pMemberEditorVo.getAddByeolCnt() > 0){
            try{    // PUSH 발송
                P_pushInsertVo pPushInsertVo = new P_pushInsertVo();
                pPushInsertVo.setMem_nos(pMemberReportVo.getReported_mem_no());
                pPushInsertVo.setSlct_push("32");
                pPushInsertVo.setPush_slct("61");       //운영자 선물 알림
                pPushInsertVo.setSend_title("운영자의 선물 도착!!");
                pPushInsertVo.setSend_cont("운영자가 선물을 보냈습니다.");
                pPushInsertVo.setImage_type("102");

                pushService.sendPushReqOK(pPushInsertVo);
            }catch (Exception e){
                log.error("[PUSH 발송 실패 - 별 추가]");
            }
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.회원운영자메모등록성공));
    }
    public String callMemberBroadCastHide(P_MemberEditorVo pMemberEditorVo){
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        int hide = mem_MemberDao.callMemberBroadCastHide(pMemberEditorVo);
        String ediContents = "";
        if (pMemberEditorVo.getHide() == 1) {
            ediContents = "방송방 제목 : " + pMemberEditorVo.getTitle() + " > [방송방 숨김]";
        }else {
            ediContents = "방송방 제목 : " + pMemberEditorVo.getTitle() + " > [방송방 숨김 해제]";
        }

        pMemberEditorVo.setEditContents(ediContents);
        pMemberEditorVo.setType(0);
        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);

        P_BroadcastEditInputVo pBroadcastEditInputVo = new P_BroadcastEditInputVo();
        pBroadcastEditInputVo.setRoom_no(pMemberEditorVo.getRoom_no());
        pBroadcastEditInputVo.setEditContents(ediContents);
        pBroadcastEditInputVo.setOpName(MemberVo.getMyMemNo());

        bro_BroadcastDao.callBroadCastEditHistoryAdd(pBroadcastEditInputVo);

        String result;
        if(hide > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원방송방_숨김처리_성공));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원방송방_숨김처리_실패));
        }

        return result;
    }

    public String selectLoginHistory(LoginHistoryVo loginHistoryVo){

        loginHistoryVo.setPageStart(loginHistoryVo.getPageStart() -1);
        loginHistoryVo.setPageStart(loginHistoryVo.getPageStart() * loginHistoryVo.getPageCnt());

        int loginHistCnt = mem_MemberDao.selectLoginHistoryCnt(loginHistoryVo);
        loginHistoryVo.setTotalCnt(loginHistCnt);
        ArrayList<LoginHistoryVo> loginHistList = mem_MemberDao.selectLoginHistory(loginHistoryVo);

        var returnMap = new HashMap();
        returnMap.put("loginHistCnt", loginHistCnt);
        returnMap.put("loginHistList", loginHistList);

        return new Gson().toJson(new JsonOutputVo(Status.조회, returnMap));
    }

    /**
     * 법정대리인 동의정보
     */
    public String getParentsAgreeInfo(P_MemberParentsAgreeInputVo pMemberParentsAgreeInputVo) {
        P_MemberParentsAgreeOutputVo memberParentsAgreeOutputVo = mem_MemberDao.getParentsAgreeInfo(pMemberParentsAgreeInputVo);

        var resultMap = new HashMap<>();
        resultMap.put("detail", memberParentsAgreeOutputVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, resultMap));
    }

    /**
     * 법정대리인 동의 철회
     */
    public int updateRecant(P_MemberParentsAgreeInputVo pMemberParentsAgreeInputVo) {
        P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
        pMemberEditorVo.setMem_no(pMemberParentsAgreeInputVo.getMemNo());
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        pMemberEditorVo.setEditContents("법정대리인 동의정보 철회");
        pMemberEditorVo.setType(0);

        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);
        return mem_MemberDao.updateRecant(pMemberParentsAgreeInputVo);
    }

    /**
     * 법정대리인 동의 복귀
     */
    public int updateBackRecant(P_MemberParentsAgreeInputVo pMemberParentsAgreeInputVo) {
        P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
        pMemberEditorVo.setMem_no(pMemberParentsAgreeInputVo.getMemNo());
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        pMemberEditorVo.setEditContents("법정대리인 동의정보 복귀");
        pMemberEditorVo.setType(0);

        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);
        return mem_MemberDao.updateBackRecant(pMemberParentsAgreeInputVo);
    }

    /**
     * 본인인증 철회
     */
    public String cancelCert(P_MemberParentsAgreeInputVo pMemberParentsAgreeInputVo) {
        mem_MemberDao.deleteCert_back(pMemberParentsAgreeInputVo);
        mem_MemberDao.moveCertInfo(pMemberParentsAgreeInputVo);
        mem_MemberDao.deleteCert(pMemberParentsAgreeInputVo);

        P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
        pMemberEditorVo.setMem_no(pMemberParentsAgreeInputVo.getMemNo());
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        pMemberEditorVo.setEditContents("본인인증정보 철회");
        pMemberEditorVo.setType(0);

        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

    /**
     * 본인인증 복구
     */
    public String rollbackCert(P_MemberParentsAgreeInputVo pMemberParentsAgreeInputVo) {
        //mem_MemberDao.deleteCert(pMemberParentsAgreeInputVo);
        mem_MemberDao.moveRollbackCertInfo(pMemberParentsAgreeInputVo);
        mem_MemberDao.deleteCert_back(pMemberParentsAgreeInputVo);

        P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
        pMemberEditorVo.setMem_no(pMemberParentsAgreeInputVo.getMemNo());
        pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
        pMemberEditorVo.setEditContents("본인인증정보 복구");
        pMemberEditorVo.setType(0);

        mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.수정));
    }

    /**
     * 수동 본인인증 추가
     */
    public String insertAuth(P_AuthVo pAuthVo) {
        pAuthVo.setUserName(DalbitUtil.isEmpty(pAuthVo.getUserName()) ? pAuthVo.getUserId() : pAuthVo.getUserName());
        pAuthVo.setPhoneNo(DalbitUtil.isEmpty(pAuthVo.getPhoneNo()) ? "01000000000" : pAuthVo.getPhoneNo());
        pAuthVo.setGender(DalbitUtil.isEmpty(pAuthVo.getMemSex()) ? 0 : "m".equals(pAuthVo.getMemSex()) ? 0 : 1);
        pAuthVo.setBirthYear(pAuthVo.getBirth().split("-")[0]);
        pAuthVo.setBirthMonth(pAuthVo.getBirth().split("-")[1]);
        pAuthVo.setBirthDay(pAuthVo.getBirth().split("-")[2]);


        int success = mem_MemberDao.insertAuth(pAuthVo);
        String result;
        if(success > 0){
            result = gsonUtil.toJson(new JsonOutputVo(Status.생성));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }
        return result;

    }

    /**
     * 아이템 수정하기
     */
    public String boostItemChange(P_MemberItemVo pMemberItemVo){
        pMemberItemVo.setOpName(MemberVo.getMyMemNo());

        ProcedureVo procedureVo = new ProcedureVo(pMemberItemVo);
        mem_MemberDao.boostItemChange(procedureVo);

        String result = "";
        if(Status.회원아이템수정_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보보기_성공));

            P_MemberItemVo changeItemVo = new Gson().fromJson(procedureVo.getExt(), P_MemberItemVo.class);

            String ediContents = "";
            if (pMemberItemVo.getSlctType() == 1) {
                int prevItemCnt = changeItemVo.getItemCnt() - pMemberItemVo.getItemCnt();
                ediContents = "부스터 아이템 지급 : " + pMemberItemVo.getItemCnt() + "개 | " + prevItemCnt + "개 > " + changeItemVo.getItemCnt() + "개";
            }else {
                int prevItemCnt = changeItemVo.getItemCnt() + pMemberItemVo.getItemCnt();
                ediContents = "부스터 아이템 차감 : " + pMemberItemVo.getItemCnt() + "개 | " + prevItemCnt + "개 > " + changeItemVo.getItemCnt() + "개";
            }

            P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
            pMemberEditorVo.setMem_no(pMemberItemVo.getMem_no());
            pMemberEditorVo.setEditContents(ediContents);
            pMemberEditorVo.setType(0);
            pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
            mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);

        } else if(Status.회원아이템수정_실패_회원없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원아이템수정_실패_회원없음));

        } else if(Status.회원아이템수정_실패_회수시보유개수부족.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원아이템수정_실패_회수시보유개수부족));

        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

    /**
     * 갈 자동교환 설정상태 변경
     */
    public String setChangeAutoSetting(P_MemberInfoInputVo pMemberInfoInputVo){
        pMemberInfoInputVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pMemberInfoInputVo);
        mem_MemberDao.setChangeAutoSetting(procedureVo);

        if(Integer.parseInt(procedureVo.getRet()) == 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.달자동교환설정상태변경_성공));
        }else{
            return gsonUtil.toJson(new JsonOutputVo(Status.달자동교환설정상태변경_실패));
        }
    }

    public String boostItemHist(P_MemberItemVo pMemberItemVo){

        int totalCnt = mem_MemberDao.boostItemHistCnt(pMemberItemVo);

        pMemberItemVo.setTotalCnt(totalCnt);
        List<P_MemberItemVo> itemHistoryList = mem_MemberDao.boostItemHist(pMemberItemVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, itemHistoryList, new PagingVo(totalCnt)));
    }

    public String memberBoostList(P_MemberListInputVo pMemberListInputVo){

        int totalCnt = mem_MemberDao.selectMemberBoostListCnt(pMemberListInputVo);
        pMemberListInputVo.setTotalCnt(totalCnt);
        ArrayList<P_MemberListOutputVo> memberList = mem_MemberDao.selectMemberBoostList(pMemberListInputVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, memberList, new PagingVo(totalCnt)));
    }

    public String memberCouponHistory(P_MemberCouponVo pMemberCouponVo){

        ProcedureVo procedureVo = new ProcedureVo(pMemberCouponVo);
        ArrayList<P_MemberCouponVo> couponHistoryList = mem_MemberDao.callMemberCouponHistory(procedureVo);

        P_MemberCouponVo summary = new Gson().fromJson(procedureVo.getExt(), P_MemberCouponVo.class);

        HashMap map = new HashMap();
        map.put("list", couponHistoryList);
        map.put("summary", summary);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, couponHistoryList, new PagingVo(summary.getTotalCnt())));
    }


    public String albumList(P_MemberInfoInputVo pMemberInfoInputVo){

        ProcedureVo procedureVo = new ProcedureVo(pMemberInfoInputVo);
        ArrayList<P_MemberInfoOutputVo> list = mem_MemberDao.callAlbumList(procedureVo);

        P_MemberInfoOutputVo outVo = new Gson().fromJson(procedureVo.getExt(), P_MemberInfoOutputVo.class);

        HashMap map = new HashMap();
        map.put("list", list);
        map.put("outVo", outVo);

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, map));
    }

    /**
     * 회원 정보 수정
     */
    public String getAlbumDelete(P_MemberInfoInputVo pMemberInfoInputVo) throws GlobalException {
        String result = "";
        int deleteResult = 0;

        String[] LeaderList = pMemberInfoInputVo.getLeaderList().split("@@");
        String[] profileList = pMemberInfoInputVo.getProfileList().split("@@");
        String[] idxList = pMemberInfoInputVo.getIdxList().split("@@");

        boolean profileSw = true;
        for(int i=0 ; i<idxList.length; i++){
            pMemberInfoInputVo.setLeader(Integer.parseInt(LeaderList[i]));
            pMemberInfoInputVo.setProfile(DalbitUtil.isEmpty(profileList[i]) ? "" : profileList[i]);
            pMemberInfoInputVo.setIdx(Integer.parseInt(idxList[i]));

            // 수정이력
            if(!DalbitUtil.isEmpty(pMemberInfoInputVo.getProfile() )){
                P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();

                pMemberEditorVo.setEditContents("관리자 프로필이미지 초기화 : " + pMemberInfoInputVo.getProfile() + " >> " + "");
                pMemberEditorVo.setType(0);
                pMemberEditorVo.setMem_no(pMemberInfoInputVo.getMem_no());
                pMemberEditorVo.setOpName(MemberVo.getMyMemNo());
                mem_MemberDao.callMemberEditHistoryAdd(pMemberEditorVo);
            }

            // 프로필 이미지 제거
            deleteResult = mem_MemberDao.callMemberAlbumDelete(pMemberInfoInputVo);

            // 리더 프로필 이미지 일 경우
            if(pMemberInfoInputVo.getLeader() == 1){
                deleteResult = mem_MemberDao.callMemberProfileDelete(pMemberInfoInputVo);
            }
            if(deleteResult > 0){
                // 리더 프로필 이미지일 경우 socket 송신
                if(pMemberInfoInputVo.getLeader() == 1){
                    // option
                    HashMap<String, Object> param = new HashMap<>();
                    param.put("memNo", pMemberInfoInputVo.getMem_no());
                    param.put("memNk", "");
                    param.put("ctrlRole", "ctrlRole");
                    param.put("recvType", "chat");
                    param.put("recvPosition", "chat");
                    param.put("recvLevel", 0);
                    param.put("recvTime", 0);

                    // message set
                    Gson gson = new Gson();
                    HashMap<String,Object> tmp = new HashMap();
                    tmp.put("image", new ImageVo("",pMemberInfoInputVo.getMemSex(), DalbitUtil.getProperty("server.photo.url")).getUrl().replace(DalbitUtil.getProperty("server.photo.url"),""));
                    tmp.put("sex", pMemberInfoInputVo.getMemSex());
                    tmp.put("nk", pMemberInfoInputVo.getMemNick());
                    String message =  gson.toJson(tmp);

                    socketUtil.setSocket(param, "reqMyInfo", message, jwtUtil.generateToken(pMemberInfoInputVo.getMem_no(), true));
                }
            }
        }

        if(deleteResult > 0){
            //이미지 초기화시 무조건 push 발송
            try{    // PUSH 발송
                P_pushInsertVo pPushInsertVo = new P_pushInsertVo();
                pPushInsertVo.setMem_nos(pMemberInfoInputVo.getMem_no());
                pPushInsertVo.setSlct_push("35");
                pPushInsertVo.setPush_slct("57");       //운영자 메시지(프로필 이미지 초기화, 닉네임 초기화)
                pPushInsertVo.setSend_title("달빛 라이브 운영자 메시지");
                pPushInsertVo.setSend_cont("운영정책 위반으로 프로필 이미지가 초기화 되었습니다.");
                pPushInsertVo.setImage_type("101");
                pushService.sendPushReqOK(pPushInsertVo);
            }catch (Exception e){
                log.error("[PUSH 발송 실패 - 회원 정보 수정]");
            }
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정실패));
        }

        return result;
    }
}
