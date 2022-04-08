package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.dao.Con_TeamDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Con_TeamService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_TeamDao con_teamDao;

    /**
     * 팀 목록
     * @param pTeamSearchInputVo
     * @return
     */
    public String getTeams(P_TeamSearchInputVo pTeamSearchInputVo) {
        List<Object> getList = con_teamDao.selectTeams(pTeamSearchInputVo);
        P_TeamTotalCntVo totalCntVo = DBUtil.getData(getList, P_TeamTotalCntVo.class);
        List<P_TeamOutputVo> list = DBUtil.getList(getList, P_TeamOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 목록 (삭제)
     * @param pTeamSearchInputVo
     * @return
     */
    public String getTeamsDeleted(P_TeamSearchInputVo pTeamSearchInputVo) {
        List<Object> getList = con_teamDao.selectTeamsDeleted(pTeamSearchInputVo);
        P_TeamTotalCntVo totalCntVo = DBUtil.getData(getList, P_TeamTotalCntVo.class);
        List<P_TeamOutputVo> list = DBUtil.getList(getList, P_TeamOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 상세
     * @param pTeamSearchInputVo
     * @return
     */
    public String getTeam(P_TeamSearchInputVo pTeamSearchInputVo) {
        List<Object> getList = con_teamDao.selectTeam(pTeamSearchInputVo);
        P_TeamOutputVo team = DBUtil.getData(getList, P_TeamOutputVo.class);
        List<P_TeamMemberOutputVo> memberList = DBUtil.getList(getList, P_TeamMemberOutputVo.class);
        List<P_TeamBadgeOutputVo> badgeList = DBUtil.getList(getList, P_TeamBadgeOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("team", team);
        resHashMap.put("memberList", memberList);
        resHashMap.put("badgeList", badgeList);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 상세 (삭제)
     * @param pTeamSearchInputVo
     * @return
     */
    public String getTeamDeleted(P_TeamSearchInputVo pTeamSearchInputVo) {
        List<Object> getList = con_teamDao.selectTeamDeleted(pTeamSearchInputVo);
        P_TeamOutputVo team = DBUtil.getData(getList, P_TeamOutputVo.class);
        List<P_TeamMemberOutputVo> memberList = DBUtil.getList(getList, P_TeamMemberOutputVo.class);
        List<P_TeamBadgeOutputVo> badgeList = DBUtil.getList(getList, P_TeamBadgeOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("team", team);
        resHashMap.put("memberList", memberList);
        resHashMap.put("badgeList", badgeList);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 상세 - 팀원 (삭제)
     * @param pTeamSearchInputVo
     * @return
     */
    public String getTeamDeletedMember(P_TeamSearchInputVo pTeamSearchInputVo) {
        List<Object> getList = con_teamDao.selectTeamDeletedMember(pTeamSearchInputVo);
        P_TeamTotalCntVo totalCntVo = DBUtil.getData(getList, P_TeamTotalCntVo.class);
        List<P_TeamMemberOutputVo> list = DBUtil.getList(getList, P_TeamMemberOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 심볼 등록
     * @param pTeamSymbolInputVo
     * @return
     */
    public String createTeamSymbol(P_TeamSymbolInputVo pTeamSymbolInputVo) {
        int s_return = con_teamDao.insertTeamSymbol(pTeamSymbolInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 심볼 수정
     * @param pTeamSymbolInputVo
     * @return
     */
    public String modifyTeamSymbol(P_TeamSymbolInputVo pTeamSymbolInputVo) {
        int s_return = con_teamDao.updateTeamSymbol(pTeamSymbolInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.수정));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 활동배지 수정
     * @param pTeamBadgeInputVo
     * @return
     */
    public String modifyTeamBadge(P_TeamBadgeInputVo pTeamBadgeInputVo) {
        int s_return = con_teamDao.updateTeamBadge(pTeamBadgeInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.수정));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 심볼 리스트
     * @param pTeamSearchSymbolInputVo
     * @return
     */
    public String getTeamsSymbols(P_TeamSearchSymbolInputVo pTeamSearchSymbolInputVo) {
        List<Object> getList = con_teamDao.selectTeamsSymbols(pTeamSearchSymbolInputVo);
        P_TeamTotalCntVo totalCntVo = DBUtil.getData(getList, P_TeamTotalCntVo.class);
        List<P_TeamSymbolOutputVo> list = DBUtil.getList(getList, P_TeamSymbolOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 활동배지 리스트
     * @param pTeamSearchSymbolInputVo
     * @return
     */
    public String getTeamsBadges(P_TeamSearchSymbolInputVo pTeamSearchSymbolInputVo) {
        List<Object> getList = con_teamDao.selectTeamsBadges(pTeamSearchSymbolInputVo);
        P_TeamTotalCntVo totalCntVo = DBUtil.getData(getList, P_TeamTotalCntVo.class);
        List<P_TeamBadgeOutputVo> list = DBUtil.getList(getList, P_TeamBadgeOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", totalCntVo.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 집계
     * @param pTeamSearchInputVo
     * @return
     */
    public String getTeamsMonthStat(P_TeamSearchInputVo pTeamSearchInputVo) {
        List<P_TeamMonthStatOutputVo> list = con_teamDao.selectTeamsMonthStat(pTeamSearchInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("data", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
