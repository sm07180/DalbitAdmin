package com.dalbit.broadcast.service;


import com.dalbit.broadcast.dao.Bro_PlayMakerDao;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.content.vo.procedure.P_RebrandCommentListOutputVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Bro_PlayMakerService {

    @Autowired
    Bro_PlayMakerDao bro_playMakerDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 플레이메이커 목록 (활동중 / 미활동)
     *
     * @param pPlayMakerMemInputVo
     * @return
     */
    public String getList(P_PlayMakerMemInputVo pPlayMakerMemInputVo) {
        List<Object> getList = bro_playMakerDao.selectList(pPlayMakerMemInputVo);
        List<P_PlayMakerMemListOutputVo> list = DBUtil.getList(getList, P_PlayMakerMemListOutputVo.class);
        P_PlayMakerTotalCountOutputVo cnt = DBUtil.getData(getList, P_PlayMakerTotalCountOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", cnt.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 상세
     *
     * @return
     */
    public String getPlayer(P_PlayMakerMemSelInputVo pPlayMakerMemSelInputVo) {
        P_PlayMakerMemSelOutputVo player = bro_playMakerDao.selectPlayer(pPlayMakerMemSelInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("data", player);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 등록
     *
     * @return s_return	INT		-- -2: 신청자 탈퇴&정지회원, -1: 이미선정된 회원, 0: 에러, 1:정상
     */
    public String createPlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo) {
        int success = 0;
        int fail = 0;

        String chrgrName = MemberVo.getMyMemNo();
        pPlayMakerMemInsInputVo.setChrgrName(chrgrName);
        String[] memNos = pPlayMakerMemInsInputVo.getMemNos().split(",");
        for (String memNo : memNos) {
            pPlayMakerMemInsInputVo.setMemNo(memNo);
            int s_return = bro_playMakerDao.insertPlayer(pPlayMakerMemInsInputVo);
            if (s_return == 1) {
                success++;
            } else {
                fail++;
            }
        }

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("success", success);
        resHashMap.put("fail", fail);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 수정
     *
     * @return
     */
    public String modifyPlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPlayMakerMemInsInputVo.setChrgrName(chrgrName);
        int s_return = bro_playMakerDao.updatePlayer(pPlayMakerMemInsInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.수정));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 삭제
     *
     * @return
     */
    public String removePlayer(P_PlayMakerMemInsInputVo pPlayMakerMemInsInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPlayMakerMemInsInputVo.setChrgrName(chrgrName);
        Integer s_return = bro_playMakerDao.deletePlayer(pPlayMakerMemInsInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 상세조회 - 일간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    public String day(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo) {
        List<Object> getList = bro_playMakerDao.selectDay(pPlayMakerDetailInputVo);
        List<P_PlayMakerDetailListOutputVo> list = DBUtil.getList(getList, P_PlayMakerDetailListOutputVo.class);
        P_PlayMakerTotalCountOutputVo cnt = DBUtil.getData(getList, P_PlayMakerTotalCountOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", cnt.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 상세조회 - 주간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    public String week(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo) {
        List<Object> getList = bro_playMakerDao.selectWeek(pPlayMakerDetailInputVo);
        List<P_PlayMakerDetailListOutputVo> list = DBUtil.getList(getList, P_PlayMakerDetailListOutputVo.class);
        P_PlayMakerTotalCountOutputVo cnt = DBUtil.getData(getList, P_PlayMakerTotalCountOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", cnt.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 플레이메이커 상세조회 - 월간
     *
     * @param pPlayMakerDetailInputVo
     * @return
     */
    public String month(P_PlayMakerDetailInputVo pPlayMakerDetailInputVo) {
        List<Object> getList = bro_playMakerDao.selectMonth(pPlayMakerDetailInputVo);
        List<P_PlayMakerDetailListOutputVo> list = DBUtil.getList(getList, P_PlayMakerDetailListOutputVo.class);
        P_PlayMakerTotalCountOutputVo cnt = DBUtil.getData(getList, P_PlayMakerTotalCountOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", cnt.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 목록
     *
     * @param pPlayMakerTeamListInputVo
     * @return
     */
    @GetMapping("teams")
    public String teams(P_PlayMakerTeamListInputVo pPlayMakerTeamListInputVo) {
        List<Object> getList = bro_playMakerDao.selectTeams(pPlayMakerTeamListInputVo);
        List<P_PlayMakerTeamListOutputVo> list = DBUtil.getList(getList, P_PlayMakerTeamListOutputVo.class);
        P_PlayMakerTotalCountOutputVo cnt = DBUtil.getData(getList, P_PlayMakerTotalCountOutputVo.class);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("totalCnt", cnt.getCnt());
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 등록
     *
     * @param pPlayMakerTeamInputVo
     * @return
     */
    public String createTeams(P_PlayMakerTeamInputVo pPlayMakerTeamInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPlayMakerTeamInputVo.setChrgrName(chrgrName);
        int s_return = bro_playMakerDao.insertTeams(pPlayMakerTeamInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀원 등록
     *
     * @param pPlayMakerTeamMemInputVoList
     * @return
     */
    public String createTeamMembers(List<P_PlayMakerTeamMemInputVo> pPlayMakerTeamMemInputVoList) {
        String chrgrName = MemberVo.getMyMemNo();
        int s_return = 0;
        for (P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo : pPlayMakerTeamMemInputVoList) {
            pPlayMakerTeamMemInputVo.setChrgrName(chrgrName);
            s_return = bro_playMakerDao.insertTeamMembers(pPlayMakerTeamMemInputVo);
        }

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.생성));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀원 삭제
     *
     * @param pPlayMakerTeamMemInputVo
     * @return
     */
    public String removeTeamMembers(P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPlayMakerTeamMemInputVo.setChrgrName(chrgrName);
        int s_return = bro_playMakerDao.deleteTeamMembers(pPlayMakerTeamMemInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀 상세
     *
     * @param pPlayMakerTeamSelInputVo
     * @return
     */
    public String team(P_PlayMakerTeamSelInputVo pPlayMakerTeamSelInputVo) {
        List<P_PlayMakerTeamSelOutputVo> list = bro_playMakerDao.selectTeam(pPlayMakerTeamSelInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.조회));
        resHashMap.put("listData", list);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }

    /**
     * 팀삭제
     *
     * @param pPlayMakerTeamMemInputVo
     * @return
     */
    public String removeTeam(P_PlayMakerTeamMemInputVo pPlayMakerTeamMemInputVo) {
        String chrgrName = MemberVo.getMyMemNo();
        pPlayMakerTeamMemInputVo.setChrgrName(chrgrName);
        int s_return = bro_playMakerDao.deleteTeam(pPlayMakerTeamMemInputVo);

        HashMap resHashMap = new HashMap();
        resHashMap.put("result", new JsonOutputVo(Status.삭제));
        resHashMap.put("s_return", s_return);
        String result = gsonUtil.toJson(resHashMap);
        return result;
    }
}
