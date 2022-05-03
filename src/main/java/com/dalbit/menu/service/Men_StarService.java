package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.excel.vo.ExcelVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.dao.Men_StarDao;
import com.dalbit.menu.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Slf4j
@Service
public class Men_StarService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_StarDao menStarDao;

    @Autowired
    ExcelService excelService;

    /**
     * 스타 dj 등록 후 달/부스터/아이템 지급
     *
     * @param pStarInputVo
     * @return
     */
    public String createStarDJ(P_StarInputVo pStarInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pStarInputVo.setChrgrName(chrgrName);
        int resultCnt = menStarDao.insertStarDJ(pStarInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타 dj 삭제
     *
     * @param pStarInputVo
     * @return
     */
    public String removeStarDJ(P_StarInputVo pStarInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pStarInputVo.setChrgrName(chrgrName);
        int resultCnt = menStarDao.deleteStarDJ(pStarInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타DJ 가산점 점수 수정
     *
     * @param pStarScoreInputVo
     * @return
     */
    public String modifyPointStarDJ(P_StarScoreInputVo pStarScoreInputVo) {
        int resultCnt = menStarDao.updatePointStarDJ(pStarScoreInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.수정));
        resHashMap.put("data", resultCnt);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타 DJ 신청 리스트
     *
     * @param pStarSearchInputVo
     * @return
     */
    public String findReqStarDJ(P_StarSearchInputVo pStarSearchInputVo) {
        List<Object> getList = menStarDao.selectReqStarDJ(pStarSearchInputVo);
        P_StarTotalCntVo total = DBUtil.getData(getList, P_StarTotalCntVo.class);
        List<P_StarReqListOutputVo> list = DBUtil.getList(getList, P_StarReqListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", total.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 스타 DJ 신청 리스트 - 엑셀다운로드
     *
     * @param pStarSearchInputVo
     * @return
     */
    public Model findReqStarDJExcel(P_StarSearchInputVo pStarSearchInputVo, Model model) {
        List<Object> getList = menStarDao.selectReqStarDJ(pStarSearchInputVo);
        List<P_StarReqListOutputVo> list = DBUtil.getList(getList, P_StarReqListOutputVo.class);

        String[] headers = {"No", "스타DJ횟수", "회원번호", "닉네임" , "성별", "집계(팬방제외)방송시간"
                , "집계 받은 별", "집계 좋아요 합계", "순수 좋아요 수", "부스터 수", "집계 평균 청취자 수", "경고", "정지"
                , "타임랭킹 가산점", "총 점수"};
        int[] headerWidths = {3000, 3000, 5000, 5000, 3000, 3000
                , 3000, 3000, 3000, 3000, 3000, 3000, 3000
                , 3000, 4000};

        List<Object[]> bodies = new ArrayList<>();
        for(int i=0; i<list.size(); i++) {
            HashMap hm = new LinkedHashMap();
            int like = DalbitUtil.isEmpty(list.get(i).getLike_cnt()) ? 0 : list.get(i).getLike_cnt();
            int boost_good_cnt = DalbitUtil.isEmpty(list.get(i).getBoost_good_cnt()) ? 0 : (list.get(i).getBoost_good_cnt()/10);
            int good_cnt = like - boost_good_cnt;

            hm.put("no", list.size()-i);
            hm.put("specialdj_cnt", DalbitUtil.isEmpty(list.get(i).getSpecialdj_cnt()) ? "" : list.get(i).getSpecialdj_cnt());
            hm.put("mem_no", DalbitUtil.isEmpty(list.get(i).getMem_no()) ? "" : list.get(i).getMem_no());
            hm.put("mem_nick", DalbitUtil.isEmpty(list.get(i).getMem_nick()) ? "" : list.get(i).getMem_nick());
            hm.put("mem_sex", DalbitUtil.isEmpty(list.get(i).getMem_sex()) ? "" : list.get(i).getMem_sex());
            hm.put("playtime", DalbitUtil.isEmpty(list.get(i).getPlay_cnt()) ? "" : list.get(i).getPlay_cnt());
            hm.put("byeol", DalbitUtil.isEmpty(list.get(i).getByeol_cnt()) ? "" : list.get(i).getByeol_cnt());
            hm.put("like", like == 0 ? "" : like);
            hm.put("good_cnt", good_cnt == 0 ? "" : good_cnt);
            hm.put("boost_good_cnt", boost_good_cnt == 0 ? "" : boost_good_cnt);
            hm.put("listen", DalbitUtil.isEmpty(list.get(i).getView_cnt()) ? "" : list.get(i).getView_cnt());
            hm.put("warm_cnt", DalbitUtil.isEmpty(list.get(i).getWarm_cnt()) ? "" : list.get(i).getWarm_cnt());
            hm.put("block_cnt", DalbitUtil.isEmpty(list.get(i).getBlock_cnt()) ? "" : list.get(i).getBlock_cnt());
            hm.put("time_rank_score_cnt", DalbitUtil.isEmpty(list.get(i).getTime_rank_score_cnt()) ? "" : list.get(i).getTime_rank_score_cnt().floatValue());
            hm.put("tot_score_cnt", DalbitUtil.isEmpty(list.get(i).getTot_score_cnt()) ? "" : list.get(i).getTot_score_cnt().floatValue());

            bodies.add(hm.values().toArray());
        }
        ExcelVo vo = new ExcelVo(headers, headerWidths, bodies);
        SXSSFWorkbook workbook = excelService.excelDownload("스타DJ 신청 목록",vo);
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "스타DJ 신청 목록");

        return model;
    }

    /**
     * 스타 DJ 리스트
     *
     * @param pStarSearchInputVo
     * @return
     */
    public String findStarDJ(P_StarSearchInputVo pStarSearchInputVo) {
        List<Object> getList = menStarDao.selectStarDJ(pStarSearchInputVo);
        P_StarTotalCntVo total = DBUtil.getData(getList, P_StarTotalCntVo.class);
        List<P_StarListOutputVo> list = DBUtil.getList(getList, P_StarListOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", total.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
