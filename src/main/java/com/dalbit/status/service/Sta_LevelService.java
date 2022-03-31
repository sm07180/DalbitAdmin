package com.dalbit.status.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.status.dao.Sta_LevelDao;
import com.dalbit.status.proc.P_Level;
import com.dalbit.status.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Sta_LevelService {

    @Autowired
    Sta_LevelDao staLevelDao;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    ExcelService excelService;

    @Autowired
    P_Level pLevel;

    /**
     *  회원 레벨별 목록 조회
     */
    public String getMemberLevel(P_LevelInputVo pLevelInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pLevelInputVo);
        List<P_LevelOutputVo> list = staLevelDao.callMemberLevelList(procedureVo);
        P_LevelOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_LevelOutputVo.class);

       /* pLevelInputVo.setPageNo(pLevelInputVo.getPageNo() -1);
        pLevelInputVo.setPageNo(pLevelInputVo.getPageNo() * pLevelInputVo.getPageCnt());
        List<P_LevelOutputVo> list = staLevelDao.getMemberLevelList(pLevelInputVo);
        int getLevelListCnt = staLevelDao.getLevelListCnt(pLevelInputVo);

        for(int i=0;i<list.size();i++){
            P_LevelOutputVo outputVo = staLevelDao.getTopFanInfo(list.get(i).getMem_no());
            if(!DalbitUtil.isEmpty(outputVo)) {
                list.get(i).setTotRcvRubyCnt(outputVo.getTotRcvRubyCnt());
                list.get(i).setFanNickName(outputVo.getFanNickName());
            }
        }
        //summary
        P_LevelOutputVo summary = staLevelDao.getLevelSummary(pLevelInputVo);*/

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(procedureVo.getRet()) ,summary));

        return result;
    }

    public String getMemberLevelV2(P_LevelSearchInputVo pLevelSearchInputVo) {
        List<Object> getList = staLevelDao.callMemberLevelListV2(pLevelSearchInputVo);
        P_LevelSearchCount1OutputVo memLevel1 = DBUtil.getData(getList, P_LevelSearchCount1OutputVo.class);
        P_LevelSearchCount2OutputVo memLevel2 = DBUtil.getData(getList, P_LevelSearchCount2OutputVo.class);
        P_LevelSearchCount3OutputVo memLevel3 = DBUtil.getData(getList, P_LevelSearchCount3OutputVo.class);
        P_LevelSearchCount4OutputVo memLevel4 = DBUtil.getData(getList, P_LevelSearchCount4OutputVo.class);
        P_LevelSearchCount5OutputVo memLevel5 = DBUtil.getData(getList, P_LevelSearchCount5OutputVo.class);
        P_LevelSearchCount6OutputVo memLevel6 = DBUtil.getData(getList, P_LevelSearchCount6OutputVo.class);
        P_LevelSearchCount7OutputVo memLevel7 = DBUtil.getData(getList, P_LevelSearchCount7OutputVo.class);
        P_LevelSearchCount8OutputVo memLevel8 = DBUtil.getData(getList, P_LevelSearchCount8OutputVo.class);
        P_LevelSearchCount9OutputVo memLevel9 = DBUtil.getData(getList, P_LevelSearchCount9OutputVo.class);
        P_LevelSearchTotalOutputVo totalCount = DBUtil.getData(getList, P_LevelSearchTotalOutputVo.class);
        List<P_LevelSearchOutputVo> list = DBUtil.getList(getList, P_LevelSearchOutputVo.class);

        P_LevelSearchSummaryOutputVo summary = new P_LevelSearchSummaryOutputVo();
        if ("y".equals(pLevelSearchInputVo.getChrgrYn())) {
            summary.setLevel0(memLevel1.getMem_level_0() - memLevel1.getChrgr_level_0());
            summary.setLevel1_10(memLevel2.getMem_level_1_10() - memLevel2.getChrgr_level_1_10());
            summary.setLevel11_20(memLevel3.getMem_level_11_20() - memLevel3.getChrgr_level_11_20());
            summary.setLevel21_30(memLevel4.getMem_level_21_30() - memLevel4.getChrgr_level_21_30());
            summary.setLevel31_40(memLevel5.getMem_level_31_40() - memLevel5.getChrgr_level_31_40());
            summary.setLevel41_50(memLevel6.getMem_level_41_50() - memLevel6.getChrgr_level_41_50());
            summary.setLevel51_60(memLevel7.getMem_level_51_60() - memLevel7.getChrgr_level_51_60());
            summary.setLevel61_70(memLevel8.getMem_level_61_70() - memLevel8.getChrgr_level_61_70());
            summary.setLevel71_120(memLevel9.getMem_level_71_120() - memLevel9.getChrgr_level_71_120());
        } else {
            summary.setLevel0(memLevel1.getMem_level_0());
            summary.setLevel1_10(memLevel2.getMem_level_1_10());
            summary.setLevel11_20(memLevel3.getMem_level_11_20());
            summary.setLevel21_30(memLevel4.getMem_level_21_30());
            summary.setLevel31_40(memLevel5.getMem_level_31_40());
            summary.setLevel41_50(memLevel6.getMem_level_41_50());
            summary.setLevel51_60(memLevel7.getMem_level_51_60());
            summary.setLevel61_70(memLevel8.getMem_level_61_70());
            summary.setLevel71_120(memLevel9.getMem_level_71_120());
        }
        int totalLevelCnt = summary.getLevel0()
                + summary.getLevel1_10()
                + summary.getLevel11_20()
                + summary.getLevel21_30()
                + summary.getLevel31_40()
                + summary.getLevel41_50()
                + summary.getLevel51_60()
                + summary.getLevel61_70()
                + summary.getLevel71_120();
        summary.setTotalLevelCnt(totalLevelCnt);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCount.getCnt()), summary));
        return result;
    }

    /**
     *  레벨별 통계 조회
     */
    public String getLevelSummary(P_LevelInputVo pLevelInputVo) {

        //summary
        P_LevelSummaryOutputVo summary = null;
        if(pLevelInputVo.getLevel().equals("10")){    //0~10
            summary = staLevelDao.getLevelSummary10(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("20")){    //11~20
            summary = staLevelDao.getLevelSummary20(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("30")){    //21~30
            summary = staLevelDao.getLevelSummary30(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("40")){    //31~40
            summary = staLevelDao.getLevelSummary40(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("50")){    //41~50
            summary = staLevelDao.getLevelSummary50(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("60")){    //51~60
            summary = staLevelDao.getLevelSummary60(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("70")){    //61~70
            summary = staLevelDao.getLevelSummary70(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("80")){    //71~80
            summary = staLevelDao.getLevelSummary80(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("90")){    //81~90
            summary = staLevelDao.getLevelSummary90(pLevelInputVo);
        }else if(pLevelInputVo.getLevel().equals("100")){    //91~100
            summary = staLevelDao.getLevelSummary100(pLevelInputVo);
        }

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, null, new PagingVo(0),summary));

        return result;
    }

    /**
     *  회원 레벨별 목록 조회
     */
    public String getLevelList(P_LevelInputVo pLevelInputVo) {
        List<Object> getList  = pLevel.memLevelStatList(pLevelInputVo);

        List<P_LevelListOutputVo> list = DBUtil.getList(getList, P_LevelListOutputVo.class);
        int memAllCount = DBUtil.getData(getList, Integer.class);

        P_LevelListOutputVo summary = new P_LevelListOutputVo();
        summary.setMemAllCount(memAllCount);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(0), summary));
        return result;
    }

}
