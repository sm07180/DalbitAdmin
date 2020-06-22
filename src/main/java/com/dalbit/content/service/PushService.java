package com.dalbit.content.service;

import com.dalbit.administrate.dao.Adm_TestIdDao;
import com.dalbit.administrate.vo.TestIdListVo;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.content.dao.PushDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.procedure.P_MemberListOutputVo;
import com.dalbit.member.vo.procedure.P_MemberReportVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class PushService {

    @Autowired
    PushDao pushDao;

    @Autowired
    Mem_MemberDao memMemberDao;

    @Autowired
    Adm_TestIdDao admTestIdDao;

    @Autowired
    GsonUtil gsonUtil;

    @Value("${server.photo.url}")
    String SERVER_PHOTO_URL;

    @Value("${push.logo.img.101}")
    String PUSH_LOGO_IMG_101;
    @Value("${push.logo.img.102}")
    String PUSH_LOGO_IMG_102;
    @Value("${push.logo.img.103}")
    String PUSH_LOGO_IMG_103;


    /** 푸시  리스트 */
    public String callContentsPushList(P_pushListInputVo pPushListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushListInputVo);
        String result;

        try {
            int totalCnt = pushDao.callContentsPushListCnt(pPushListInputVo);
            ArrayList<P_pushListOutputVo> pushList = pushDao.callContentsPushList(pPushListInputVo);
            P_pushListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_pushListOutputVo.class);

            if(pushList != null && pushList.size() > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시조회_성공, pushList, new PagingVo(totalCnt), summary));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시조회_데이터없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시조회_에러));
        }

        return result;
    }

    /** 푸시  상세 */
    public String callContentsPushDetail(P_pushDetailInputVo pPushDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushDetailInputVo);
        String result;

        try {
            P_pushDetailOutputVo pushDetail = pushDao.callContentsPushDetail(pPushDetailInputVo);

            // 수신대상이 지정회원일 경우 대상 정보 조회
            if(pushDetail.getIs_all() != null && pushDetail.getIs_all().equals("7")){
                List arrayList = Arrays.asList(pushDetail.getMem_nos().split("\\|"));
                List<P_MemberListOutputVo> memInfo = pushDao.selectMemInfo(arrayList);
                pushDetail.setMem_info(memInfo);
            }


            if (pushDetail != null) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시상세조회_성공, pushDetail));
            } else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시상세조회_상품코드없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시상세조회_에러));
        }

        return result;
    }

    /**
     * 푸시  등록
     */
    public String callContentsPushAdd(P_pushInsertVo pPushInsertVo){
        pPushInsertVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pPushInsertVo, true);
        String result = null;

        try{
            if(DalbitUtil.isEmpty(pPushInsertVo.getSend_url())){
                if(!DalbitUtil.isEmpty(pPushInsertVo.getImage_type())){
                    if(pPushInsertVo.getImage_type().equals("102")){
                        pPushInsertVo.setSend_url(SERVER_PHOTO_URL + PUSH_LOGO_IMG_102);
                    }else if(pPushInsertVo.getImage_type().equals("103")){
                        pPushInsertVo.setSend_url(SERVER_PHOTO_URL + PUSH_LOGO_IMG_103);
                    }else{
                        pPushInsertVo.setSend_url(SERVER_PHOTO_URL + PUSH_LOGO_IMG_101);
                    }
                }
            }

            int insertResult = pushDao.callContentsPushAdd(pPushInsertVo);

            if(insertResult > 0){
                HashMap resultHash = null;
                // 지정 일 경우 푸시 발송
                 resultHash = callSendPush(pPushInsertVo);

                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_성공, resultHash));

            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_에러));
            }
        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시등록_에러));
        }

        return result;
    }

    /**
     * 푸시  수정
     */
    public String callContentsPushEdit(P_pushUpdateVo pPushUpdateVo) {
        pPushUpdateVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pPushUpdateVo, true);
        String result;

        try{
            int updateResult = pushDao.callContentsPushEdit(pPushUpdateVo);

            if(updateResult > 0){
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시수정_성공));
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.푸시수정_실패));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시수정_에러));
        }

        return result;
    }

    /**
     * 푸시  삭제
     */
    public String callContentsPushDelete(P_pushDeleteVo pPushDeleteVo) {
        pPushDeleteVo.setOpName(MemberVo.getMyMemNo());

        int sucCnt=0;
        int failCnt=0;

        String result="";

        String[] idxs = pPushDeleteVo.getPush_idx().split(",");
        for(int i=0; i < idxs.length; i++) {
            ProcedureVo procedureVo = new ProcedureVo(new P_pushDeleteVo(idxs[i]));

            int deleteResult = pushDao.callContentsPushDelete(new P_pushDeleteVo(idxs[i]));

            if (deleteResult > 0) {
                sucCnt++;
            } else {
                failCnt++;
            }
        }

        HashMap resultMap = new HashMap();
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("failCnt", failCnt);

        if(0 < sucCnt){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시삭제_성공, resultMap));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시삭제_실패, resultMap));
        }

        return result;
    }



    /**
     * 푸시 발송 모듈 적재
     */
    public HashMap callSendPush(P_pushInsertVo pPushInsertVo){
        String mem_nos = pPushInsertVo.getMem_nos();
        HashMap resultMap = new HashMap();
        int sucCnt=0;
        int notTokenCnt=0;
        int notMemNoCnt=0;
        int failCnt=0;
        int sucNotiCnt=0;
        int failNotiCnt=0;

        pPushInsertVo.setSend_url(pPushInsertVo.getSend_url().replace(SERVER_PHOTO_URL, ""));

        if(pPushInsertVo.getIs_all().equals("7")){        // 지정 일 경우 푸시 발송
            if(mem_nos != null && mem_nos.length() > 0){
                String[] arryMem_no = mem_nos.split("\\|");

                for(String target : arryMem_no){
                    P_pushStmpInsertVo pPushStmpInsertVo = new P_pushStmpInsertVo(target, pPushInsertVo);
                    ProcedureVo procedureVo = new ProcedureVo(pPushStmpInsertVo);

                    // PUSH 발송
                    if(pPushInsertVo.getSend_type().equals("0") || pPushInsertVo.getSend_type().equals("1")){
                        pushDao.callStmpPushAdd(procedureVo);

                        if(Status.푸시발송_성공.getMessageCode().equals(procedureVo.getRet())){
                            log.debug("[PUSH_SEND] 푸시 발송 성공 (" + target + ")");
                            sucCnt++;
                        }else if(Status.푸시발송_디바이스토큰미존재.getMessageCode().equals(procedureVo.getRet())){
                            log.error("[PUSH_SEND] ERROR 디바이스토큰 미존재 (" + target + ")");
                            notTokenCnt++;
                        }else if(Status.푸시발송_요청회원번호미존재.getMessageCode().equals(procedureVo.getRet())){
                            log.error("[PUSH_SEND] ERROR mem_no 미존재 (" + target + ")");
                            notMemNoCnt++;
                        } else {
                            log.error("[PUSH_SEND] ERROR [ targetMemNo:{} | 실패코드:{} | 실패내용:{} ]", target, procedureVo.getRet(), procedureVo.getExt());
                            failCnt++;
                        }
                    }

                    // 알림 발송
                    if(pPushInsertVo.getSend_type().equals("0") || pPushInsertVo.getSend_type().equals("2")){
                        try{
                            P_MemberReportVo pMemberReportVo = new P_MemberReportVo();

                            pMemberReportVo.setSlctOs(pPushStmpInsertVo.getSlctOs());
                            pMemberReportVo.setReported_mem_no(target);
                            pMemberReportVo.setSlctType(7);
                            pMemberReportVo.setNotiContents(pPushInsertVo.getSend_cont().replaceAll("\n", "<br>"));
                            pMemberReportVo.setNotimemo(pPushInsertVo.getSend_cont().replaceAll("\n", "<br>"));
                            int notiResult = memMemberDao.callMemberNotification_Add(pMemberReportVo);

                            if(notiResult > 0){
                                sucNotiCnt++;
                            }else{
                                failNotiCnt++;
                            }
                        }catch (Exception e){
                            log.error("[NOTI 발송 실패 - PUSH 발송]");
                        }
                    }
                }
            }
        }else if(pPushInsertVo.getIs_all().equals("99")){        // 테스트계정 발송
            SearchVo searchVo = new SearchVo();
             List<TestIdListVo> testIdList = admTestIdDao.getTestIdList(searchVo);

            for(TestIdListVo target : testIdList){
                P_pushStmpInsertVo pPushStmpInsertVo = new P_pushStmpInsertVo(target.getMem_no(), pPushInsertVo);
                ProcedureVo procedureVo = new ProcedureVo(pPushStmpInsertVo);

                // PUSH 발송
                if(pPushInsertVo.getSend_type().equals("0") || pPushInsertVo.getSend_type().equals("1")) {
                    pushDao.callStmpPushAdd(procedureVo);

                    if (Status.푸시발송_성공.getMessageCode().equals(procedureVo.getRet())) {
                        log.debug("[PUSH_SEND] 푸시 발송 성공  (" + target + ")");
                        sucCnt++;
                    } else if (Status.푸시발송_디바이스토큰미존재.getMessageCode().equals(procedureVo.getRet())) {
                        log.error("[PUSH_SEND] ERROR 디바이스토큰 미존재 (" + target + ") ");
                        notTokenCnt++;
                    } else if (Status.푸시발송_요청회원번호미존재.getMessageCode().equals(procedureVo.getRet())) {
                        log.error("[PUSH_SEND] ERROR mem_no 미존재 (" + target + ") ");
                        notMemNoCnt++;
                    } else {
                        log.error("[PUSH_SEND] ERROR [ targetMemNo:{} | 실패코드:{} | 실패내용:{} ]", target, procedureVo.getRet(), procedureVo.getExt());
                        failCnt++;
                    }
                }

                // 알림 발송
                if(pPushInsertVo.getSend_type().equals("0") || pPushInsertVo.getSend_type().equals("2")) {
                    try{
                        P_MemberReportVo pMemberReportVo = new P_MemberReportVo();

                        pMemberReportVo.setSlctOs(pPushStmpInsertVo.getSlctOs());
                        pMemberReportVo.setReported_mem_no(target.getMem_no());
                        pMemberReportVo.setSlctType(7);
                        pMemberReportVo.setNotiContents(pPushInsertVo.getSend_cont().replaceAll("\n", "<br>"));
                        pMemberReportVo.setNotimemo(pPushInsertVo.getSend_cont().replaceAll("\n", "<br>"));
                        int notiResult = memMemberDao.callMemberNotification_Add(pMemberReportVo);

                        if(notiResult > 0){
                            sucNotiCnt++;
                        }else{
                            failNotiCnt++;
                        }
                    }catch (Exception e){
                        log.error("[NOTI 발송 실패 - PUSH 발송]");
                    }
                }
            }

        }else if(pPushInsertVo.getIs_all().equals("11")){  // 전체 발송
            P_pushStmpInsertVo pPushStmpInsertVo = new P_pushStmpInsertVo("0", pPushInsertVo);
            ProcedureVo procedureVo = new ProcedureVo(pPushStmpInsertVo);

            // PUSH 발송
            if(pPushInsertVo.getSend_type().equals("0") || pPushInsertVo.getSend_type().equals("1")) {
                pushDao.callStmpPushAdd(procedureVo);

                if (Status.푸시발송_성공.getMessageCode().equals(procedureVo.getRet())) {
                    log.debug("[PUSH_SEND] 푸시 발송 성공 (" + MemberVo.getUserInfo().getEmp_no() + ")");
                    sucCnt++;
                } else {
                    log.error("[PUSH_SEND] ERROR [ 실패코드:{} | 실패내용:{} ]", procedureVo.getRet(), procedureVo.getExt());
                    failCnt++;
                }
            }

            // 알림 발송
            if(pPushInsertVo.getSend_type().equals("0") || pPushInsertVo.getSend_type().equals("2")) {
                try{
                    P_MemberReportVo pMemberReportVo = new P_MemberReportVo();

                    pMemberReportVo.setSlctOs(pPushStmpInsertVo.getSlctOs());
                    pMemberReportVo.setSlctType(7);
                    pMemberReportVo.setNotiContents(pPushInsertVo.getSend_cont().replaceAll("\n", "<br>"));
                    pMemberReportVo.setNotimemo(pPushInsertVo.getSend_cont().replaceAll("\n", "<br>"));
                    int notiResult = pushDao.callContentsNotiAddALL(pMemberReportVo);

                    if(notiResult > 0){
                        sucNotiCnt++;
                    }else{
                        failNotiCnt++;
                    }

                }catch (Exception e){
                    log.error("[NOTI 발송 실패 - PUSH 발송]");
                }
            }

        }else{
            log.error("[PUSH_SEND] ERROR 발송 타입이 존재하지 않습니다. [ is_all:{}]", pPushInsertVo.getIs_all());
        }

        if(pPushInsertVo.getSend_type().equals("2")){
            sucCnt = sucNotiCnt;
            failCnt = failNotiCnt;
        }

        log.error("[PUSH_SEND] Result [ 성공:{} | 디바이스토큰 미존재:{} | mem_no 미존재:{} | 실패:{} ]", sucCnt, notTokenCnt, notMemNoCnt, failCnt);

        resultMap.put("is_all", pPushInsertVo.getIs_all());
        resultMap.put("sucCnt", sucCnt);
        resultMap.put("notTokenCnt", notTokenCnt);
        resultMap.put("notMemNoCnt", notMemNoCnt);
        resultMap.put("failCnt", failCnt);

        return resultMap;
    }

    public HashMap callSendAllPush(P_pushStmpInsertVo pPushStmpInsertVo){
        HashMap resultMap = new HashMap();

        ProcedureVo procedureVo = new ProcedureVo(pPushStmpInsertVo);

        pushDao.callStmpPushAdd(procedureVo);

        if(Status.푸시발송_성공.getMessageCode().equals(procedureVo.getRet())){
            log.debug("[ALL_PUSH_SEND] 전체 푸시 발송 성공");
        } else {
            log.debug("[ERROR] 전체 푸시 발송 실패 / 실패코드 : " + procedureVo.getRet() + " : "+ procedureVo.getExt());
        }
        return resultMap;
    }


    public String callStmpPushAdd(P_pushInsertVo pPushInsertVo) {
        ProcedureVo procedureVo = new ProcedureVo(pPushInsertVo);

        pushDao.callStmpPushAdd(procedureVo);

        String result;
        if(Status.푸시발송_성공.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시발송_성공));
        } else if(Status.푸시발송_요청회원번호미존재.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시발송_요청회원번호미존재));
        } else if(Status.푸시발송_디바이스토큰미존재.getMessageCode().equals(procedureVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시발송_디바이스토큰미존재));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.푸시발송_에러));
        }

        return result;
    }





    public String sendPushReqOK(P_pushInsertVo pPushInsertVo){
//        pPushInsertVo.setMem_nos(mem_no);
//        pPushInsertVo.setSend_title("스페셜 DJ로 선정되었어요.");
//        pPushInsertVo.setSend_cont("축하해요~ 스페셜DJ로 선정되셨어요. DJ님의 FLEX한 방송을 보여주세요♥");
//        pPushInsertVo.setBoard_idx("22");
//        pPushInsertVo.setImage_type("101");
//        pPushInsertVo.setSlct_push("7");

        pPushInsertVo.setSend_cnt("1");
        pPushInsertVo.setIs_all("7");
        pPushInsertVo.setPlatform("111");
        pPushInsertVo.setStatus("0");
        pPushInsertVo.setMsg_type("0");
        pPushInsertVo.setIs_direct("0");
        if(DalbitUtil.isEmpty(pPushInsertVo.getSend_type())){       // default 1
            pPushInsertVo.setSend_type("1");
        }

        String pushResult = callContentsPushAdd(pPushInsertVo);
        log.info("[PUSH SEND RESULT] : {}" , pushResult);

        return pushResult;
    }

}
