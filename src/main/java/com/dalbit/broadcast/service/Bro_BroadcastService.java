package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.Bro_BroadcastDao;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.common.code.Code;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.ImageVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.dao.Mem_MemberDao;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.member.vo.procedure.P_MemberInfoInputVo;
import com.dalbit.member.vo.procedure.P_MemberInfoOutputVo;
import com.dalbit.member.vo.procedure.P_MemberListInputVo;
import com.dalbit.util.*;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Bro_BroadcastService {

    @Autowired
    Bro_BroadcastDao bro_BroadcastDao;
    @Autowired
    Mem_MemberDao mem_MemberDao;
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

    /**
     * 생방송 list 목록
     */
    public String callBroadcastList(P_BroadcastListInputVo pBroadcastListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastListInputVo);
        ArrayList<P_BroadcastListOutputVo> broadList = bro_BroadcastDao.callBroadcastList(procedureVo);
        P_BroadcastListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_BroadcastListOutputVo.class);
        String result;
        if(Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송기록보기성공, broadList, new PagingVo(procedureVo.getRet()),summary));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송기록보기실패));
        }
        return result;
    }

    /**
     * 실시간 최신 생방송 엑셀
     */
    public Model callLiveListExcel(P_BroadcastListInputVo pBroadcastListInputVo, Model model) {
        pBroadcastListInputVo.setPageCnt(100000);
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastListInputVo);

        List<P_BroadcastListOutputVo> list = bro_BroadcastDao.callBroadcastList(procedureVo);

        String[] headers = {"No","방송주제", "방송제목", "프로필이미지", "테그부분", "DJID", "User 닉네임", "방송시작일시", "진행시간", "누적청취자", "청취자", "좋아요", "부스터", "선물", "팬수", "강제퇴장"};
        int[] headerWidths = {3000, 3000, 6000, 6000, 6000, 6000, 6000, 6000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem2",  DalbitUtil.isEmpty(list.get(i).getSubjectType())     ? "" : list.get(i).getSubjectType());
            hm.put("mem3",  DalbitUtil.isEmpty(list.get(i).getTitle())           ? "" : list.get(i).getTitle());
            hm.put("mem4",  DalbitUtil.isEmpty(list.get(i).getDj_profileImage()) ? "" : list.get(i).getDj_profileImage());
            String tmp = "";
            if(list.get(i).getRecommBadge() == 1)tmp = "추천 ";
            if(list.get(i).getPopularBadge() == 1)tmp = tmp + "인기 ";
            if(list.get(i).getNewjdBadge() == 1)tmp = tmp + "신입";
            hm.put("mem5", tmp);
            hm.put("mem7",  DalbitUtil.isEmpty(list.get(i).getDj_userid()) ? "" : list.get(i).getDj_userid());
            hm.put("mem8",  DalbitUtil.isEmpty(list.get(i).getDj_nickname()) ? "" : list.get(i).getDj_nickname());
            hm.put("mem11", DalbitUtil.isEmpty(list.get(i).getStartDateFormat()) ? "" : list.get(i).getStartDateFormat());
            hm.put("mem12", DalbitUtil.isEmpty(list.get(i).getAirTime()) ? "" : list.get(i).getAirTime());
            hm.put("mem13", DalbitUtil.isEmpty(list.get(i).getLiveListener()) ? "" : list.get(i).getLiveListener());
            hm.put("mem14", DalbitUtil.isEmpty(list.get(i).getGoodCnt()) ? "" : list.get(i).getGoodCnt());
            hm.put("mem15", DalbitUtil.isEmpty(list.get(i).getBoosterCnt()) ? "" : list.get(i).getBoosterCnt());
            hm.put("mem16", DalbitUtil.isEmpty(list.get(i).getGiftCnt()) ? "" : list.get(i).getGiftCnt());
            hm.put("mem17", DalbitUtil.isEmpty(list.get(i).getFanCnt()) ? "" : list.get(i).getFanCnt());
            hm.put("mem18", DalbitUtil.isEmpty(list.get(i).getForcedCnt()) ? "" : list.get(i).getForcedCnt());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "실시간 최신 생방송 목록");

        return model;
    }

    /**
     * 생방송 검색 엑셀
     */
    public Model callBroadcastListExcel(P_BroadcastListInputVo pBroadcastListInputVo, Model model) {
        pBroadcastListInputVo.setPageCnt(100000);
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastListInputVo);

        List<P_BroadcastListOutputVo> list = bro_BroadcastDao.callBroadcastList(procedureVo);

        String[] headers = {"No", "방송주제", "방송제목", "방송시작일시", "방송진행시간", "DJ ID", "DJ 닉네임", "누적청취자", "청취자", "좋아요", "선물", "사연수", "방송상태"};
        int[] headerWidths = {3000, 3000, 6000, 6000, 6000, 6000, 6000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("no", list.size()-i);
            hm.put("mem1",  DalbitUtil.isEmpty(list.get(i).getSubjectType()) ? "" : list.get(i).getSubjectType());
            hm.put("mem2",  DalbitUtil.isEmpty(list.get(i).getTitle()) ? "" : list.get(i).getTitle());
            hm.put("mem3", DalbitUtil.isEmpty(list.get(i).getStartDateFormat()) ? "" : list.get(i).getStartDateFormat());
            hm.put("mem4", DalbitUtil.isEmpty(list.get(i).getAirTime()) ? "" : list.get(i).getAirTime());
            hm.put("mem5",  DalbitUtil.isEmpty(list.get(i).getDj_userid()) ? "" : list.get(i).getDj_userid());
            hm.put("mem6",  DalbitUtil.isEmpty(list.get(i).getDj_nickname()) ? "" : list.get(i).getDj_nickname());
            hm.put("mem7", DalbitUtil.isEmpty(list.get(i).getTotalListener()) ? "" : list.get(i).getTotalListener());
            hm.put("mem8", DalbitUtil.isEmpty(list.get(i).getLiveListener()) ? "" : list.get(i).getLiveListener());
            hm.put("mem9", DalbitUtil.isEmpty(list.get(i).getGoodCnt()) ? "" : list.get(i).getGoodCnt());
            hm.put("mem10", DalbitUtil.isEmpty(list.get(i).getGiftCnt()) ? "" : list.get(i).getGiftCnt());
            hm.put("mem11", DalbitUtil.isEmpty(list.get(i).getStoryCnt()) ? "" : list.get(i).getStoryCnt());
            hm.put("mem12", DalbitUtil.isEmpty(list.get(i).getState()) ? "" : list.get(i).getState());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "생방송 검색 엑셀 목록");

        return model;
    }


    /**
     * 선택한 방 정보
     */
    public String callBroadcastInfo(P_BroadcastDetailInputVo pBroadcastDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastDetailInputVo);

        bro_BroadcastDao.callBroadcastInfo(procedureVo);

        P_BroadcastDetailOutputVo broadcastDetail = new Gson().fromJson(procedureVo.getExt(), P_BroadcastDetailOutputVo.class);

        if(DalbitUtil.isEmpty(broadcastDetail.getDj_userId())){
            HashMap<P_BroadcastDetailOutputVo,String> withdrawal= bro_BroadcastDao.callBroadcastInfo_withdrawal(broadcastDetail.getDj_mem_no());
            if(!DalbitUtil.isEmpty(withdrawal)) {
                broadcastDetail.setDj_userId(withdrawal.get("dj_userId"));
                broadcastDetail.setDj_nickName(withdrawal.get("dj_nickName"));
                broadcastDetail.setDj_memSex(withdrawal.get("dj_memSex"));
            }
        }

        String result;
        if(Status.방송방상세조회_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방상세조회_성공, broadcastDetail));
        } else if(Status.방송방상세조회_공지번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방상세조회_공지번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방상세조회_에러));
        }

        return result;
    }

    /**
     * 방송방 정보수정 내역 보기
     */
    public String callBroadcastEditHistory(P_BroadcastEditHistInputVo pBroadcastEditHistInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastEditHistInputVo);

        ArrayList<P_BroadcastEditHistOutputVo> editList = bro_BroadcastDao.callBroadcastEditHistory(procedureVo);

        String result;

        if (Integer.parseInt(procedureVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_성공, editList, new PagingVo(procedureVo.getRet())));
        } else if(Status.방송방수정내역조회_데이터없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_데이터없음));
        } else if(Status.방송방수정내역조회_방번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_방번호없음));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방수정내역조회_에러));
        }
        return result;

    }

    /**
     * 방송방 정보수정
     */
    public String callBroadcastEdit(P_BroadcastEditInputVo pBroadcastEditInputVo) {
        pBroadcastEditInputVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastEditInputVo);
        bro_BroadcastDao.callBroadcastEdit(procedureVo);
        String result;

        if(Status.방송방정보수정_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_성공));
            // 방송방 강제 종료 ------------------------------------
            if(pBroadcastEditInputVo.getForceExit().equals("1")){
//            if(pBroadcastEditInputVo.getForceExit().equals("1") && pBroadcastEditInputVo.getSendNoti().equals("1")){
                // 방송 시작시간
                bro_BroadcastDao.callBroadcastInfo(procedureVo);
                P_BroadcastDetailOutputVo broadcastDetail = new Gson().fromJson(procedureVo.getExt(), P_BroadcastDetailOutputVo.class);
                pBroadcastEditInputVo.setStart_date(broadcastDetail.getStartDate());

                // 회원 방 나가기 상태
                bro_BroadcastDao.callBroadcastMemberExit(pBroadcastEditInputVo);
                // 방 종료 상태
                bro_BroadcastDao.callBroadcastExit(pBroadcastEditInputVo);

                HashMap<String,Object> param = new HashMap<>();
                param.put("roomNo",pBroadcastEditInputVo.getRoom_no());
                param.put("memNo",pBroadcastEditInputVo.getMem_no());

                //option
                param.put("ctrlRole","");
                param.put("recvType","chat");
                param.put("recvPosition","chat");
                param.put("recvLevel",0);
                param.put("recvTime",0);

                socketUtil.setSocket(param,"chatEnd","roomOut",jwtUtil.generateToken(pBroadcastEditInputVo.getMem_no(), true));
            }

//              else if(pBroadcastEditInputVo.getForceExit().equals("0") && pBroadcastEditInputVo.getSendNoti().equals("1")){
//                P_MemberInfoInputVo pMemberInfoInputVo = new P_MemberInfoInputVo();
//                pMemberInfoInputVo.setMem_no(pBroadcastEditInputVo.getMem_no());
//                ProcedureVo inner_procedureVo = new ProcedureVo(pMemberInfoInputVo);
//                mem_MemberDao.callMemberInfo(inner_procedureVo);
//                P_MemberInfoOutputVo memberInfo = new Gson().fromJson(inner_procedureVo.getExt(), P_MemberInfoOutputVo.class);
//
//                if(DalbitUtil.isEmpty(memberInfo.getProfileImage())){
//                    memberInfo.setProfileImage_reset(new ImageVo(null, memberInfo.getMemSex(), DalbitUtil.getProperty("server.photo.url")));
//                }else{
//                    memberInfo.setProfileImage_reset(new ImageVo(memberInfo.getProfileImage(), DalbitUtil.getProperty("server.photo.url")));
//                }
//
//                pBroadcastEditInputVo.setBackgroundImage_reset(new ImageVo(pBroadcastEditInputVo.getBackgroundImage(),DalbitUtil.getProperty("server.photo.url")));
//
//                //배경화면, 방송제목, 환영메시지
//                HashMap<String, Object> param = new HashMap<>();
//                param.put("roomNo", pBroadcastEditInputVo.getRoom_no());
//                param.put("memNo", pBroadcastEditInputVo.getMem_no());
//                param.put("memNk", memberInfo.getNickName());
//                param.put("memImg", memberInfo.getProfileImage_reset().getThumb120x120());
//                param.put("ctrlRole", "1111111111");
//                param.put("recvType","chat");
//                param.put("recvPosition","chat");
//                param.put("recvLevel", 0);
//                param.put("recvTime", 0);
//
//                // message set
//                Gson gson = new Gson();
//                HashMap<String,Object> tmp = new HashMap();
//                tmp.put("bgImgRacy",5);
//                tmp.put("bgImg",pBroadcastEditInputVo.getBackgroundImage_reset());
//                tmp.put("welcomMsg",pBroadcastEditInputVo.getNotiMeno());
//                tmp.put("title",pBroadcastEditInputVo.getNotiContents());
//                tmp.put("roomType","01");
//                String message =  gson.toJson(tmp);
//
//
//                socketUtil.setSocket(param, "reqRoomChangeInfo", message, jwtUtil.generateToken(pBroadcastEditInputVo.getMem_no(), true));
//            }
        } else if(Status.방송방정보수정_방번호없음.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_방번호없음));
        } else if(Status.방송방정보수정_종료된방.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_종료된방));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_에러));
        }

        return result;

    }
}
