package com.dalbit.broadcast.service;

import com.dalbit.broadcast.dao.Bro_BroadcastDao;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
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
     * 회원 엑셀
     */
    public Model callBroadcastListExcel(P_BroadcastListInputVo pBroadcastListInputVo, Model model) {
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastListInputVo);

        List<P_BroadcastListOutputVo> list = bro_BroadcastDao.callBroadcastList(procedureVo);

        String[] headers = {"방번호","방송주제", "방송제목", "프로필이미지", "테그부분","회원번호", "DJID", "닉네임", "DJ레벨", "DJ등급", "방송시작일시", "진행시간", "청취자", "좋아요", "부스터", "선물", "팬수", "강제퇴장","사연수"};
        int[] headerWidths = {3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000, 3000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            HashMap hm = new LinkedHashMap();

            hm.put("mem1",  DalbitUtil.isEmpty(list.get(i).getRoom_no())         ? "" : list.get(i).getRoom_no());
            hm.put("mem2",  DalbitUtil.isEmpty(list.get(i).getSubjectType())     ? "" : list.get(i).getSubjectType());
            hm.put("mem3",  DalbitUtil.isEmpty(list.get(i).getTitle())           ? "" : list.get(i).getTitle());
            hm.put("mem4",  DalbitUtil.isEmpty(list.get(i).getDj_profileImage()) ? "" : list.get(i).getDj_profileImage());
            String tmp = "";
            if(list.get(i).getRecommBadge() == 1)tmp = "추천 ";
            if(list.get(i).getPopularBadge() == 1)tmp = tmp + "인기 ";
            if(list.get(i).getNewjdBadge() == 1)tmp = tmp + "신입";
            hm.put("mem5", tmp);
            hm.put("mem6",  DalbitUtil.isEmpty(list.get(i).getDj_mem_no()) ? "" : list.get(i).getDj_mem_no());
            hm.put("mem7",  DalbitUtil.isEmpty(list.get(i).getDj_userid()) ? "" : list.get(i).getDj_userid());
            hm.put("mem8",  DalbitUtil.isEmpty(list.get(i).getDj_nickname()) ? "" : list.get(i).getDj_nickname());
            hm.put("mem9",  DalbitUtil.isEmpty(list.get(i).getDj_level()) ? "" : list.get(i).getDj_level());
            hm.put("mem10",  DalbitUtil.isEmpty(list.get(i).getDj_grade()) ? "" : list.get(i).getDj_grade());
            hm.put("mem11", DalbitUtil.isEmpty(list.get(i).getStartDateFormat()) ? "" : list.get(i).getStartDateFormat());
            hm.put("mem12", DalbitUtil.isEmpty(list.get(i).getAirTime()) ? "" : list.get(i).getAirTime());
            hm.put("mem13", DalbitUtil.isEmpty(list.get(i).getLiveListener()) ? "" : list.get(i).getLiveListener());
            hm.put("mem14", DalbitUtil.isEmpty(list.get(i).getGoodCnt()) ? "" : list.get(i).getGoodCnt());
            hm.put("mem15", DalbitUtil.isEmpty(list.get(i).getBoosterCnt()) ? "" : list.get(i).getBoosterCnt());
            hm.put("mem16", DalbitUtil.isEmpty(list.get(i).getGiftCnt()) ? "" : list.get(i).getGiftCnt());
            hm.put("mem17", DalbitUtil.isEmpty(list.get(i).getFanCnt()) ? "" : list.get(i).getFanCnt());
            hm.put("mem18", DalbitUtil.isEmpty(list.get(i).getForcedCnt()) ? "" : list.get(i).getForcedCnt());
            hm.put("mem19", DalbitUtil.isEmpty(list.get(i).getStoryCnt()) ? "" : list.get(i).getStoryCnt());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "생방송 목록");

        return model;
    }

    /**
     * 선택한 방 정보
     */
    public String callBroadcastInfo(P_BroadcastDetailInputVo pBroadcastDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastDetailInputVo);

        bro_BroadcastDao.callBroadcastInfo(procedureVo);

        P_BroadcastDetailOutputVo broadcastDetail = new Gson().fromJson(procedureVo.getExt(), P_BroadcastDetailOutputVo.class);

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
        ProcedureVo procedureVo = new ProcedureVo(pBroadcastEditInputVo);
        bro_BroadcastDao.callBroadcastEdit(procedureVo);
        String result;

        if(Status.방송방정보수정_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_성공));

            // 방송방 강제 종료 ------------------------------------
            if(pBroadcastEditInputVo.getForceExit().equals("1")){
                HashMap<String,Object> param = new HashMap<>();
                param.put("roomNo",pBroadcastEditInputVo.getRoom_no());
                param.put("memNo",pBroadcastEditInputVo.getMem_no());

                //option
                param.put("ctrlRole","ctrlRole");
                param.put("recvType","system");
                param.put("recvPosition","top1");
                param.put("recvLevel",2);
                param.put("recvTime",5);

                socketUtil.setSocket(param,"chatEnd","",jwtUtil.generateToken(pBroadcastEditInputVo.getMem_no(), true));
            }

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
