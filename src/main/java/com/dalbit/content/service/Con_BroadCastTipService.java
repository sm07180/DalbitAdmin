package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_BroadCastTipDao;
import com.dalbit.content.vo.procedure.P_BroadCastTipDetailOutputVo;
import com.dalbit.content.vo.procedure.P_BroadCastTipInputVo;
import com.dalbit.content.vo.procedure.P_BroadCastTipOutputVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Slf4j
@Service
public class Con_BroadCastTipService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Con_BroadCastTipDao con_BroadCastTipDao;

    /**
     * 방송팁 목록 조회
     */
    public String selectBroadCastTipList(P_BroadCastTipInputVo pBroadCastTipInputVo) {

        ProcedureVo procedureVo = new ProcedureVo(pBroadCastTipInputVo);
        ArrayList<P_BroadCastTipOutputVo> broadCastTipList = con_BroadCastTipDao.callBroadcastTipList(procedureVo);

        String result;
        if(broadCastTipList.size() > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁목록보기_성공, broadCastTipList, new PagingVo(procedureVo.getRet())));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁목록보기_실패));
        }
        return result;
    }

    /**
     * 방송팁 상세 조회
     */
    public String selectBroadCastTipDetail(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pBroadCastTipInputVo);
        con_BroadCastTipDao.callBroadcastTipDetail(procedureVo);
        P_BroadCastTipDetailOutputVo broadCastTipDetail = new Gson().fromJson(procedureVo.getExt(), P_BroadCastTipDetailOutputVo.class);

        String result;
        if(broadCastTipDetail != null) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁목록보기_성공, broadCastTipDetail));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁목록보기_실패));
        }
        return result;
    }

    /**
     * 방송팁 수정
     */
    public String callbroadCastTipEdit(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        pBroadCastTipInputVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBroadCastTipInputVo);
        con_BroadCastTipDao.callbroadCastTipEdit(procedureVo);
        String result;

        if(Status.방송팁수정_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁수정_성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁수정_실패));
        }

        return result;

    }

    /**
     * 방송팁 등록
     */
    public String callbroadCastTipAdd(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        pBroadCastTipInputVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBroadCastTipInputVo);
        con_BroadCastTipDao.callbroadCastTipAdd(procedureVo);
        String result;

        if(Status.방송팁등록_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁등록_성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁등록_실패));
        }

        return result;

    }

    /**
     * 방송팁 삭제
     */
    public String callbroadCastTipDel(P_BroadCastTipInputVo pBroadCastTipInputVo) {
        pBroadCastTipInputVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pBroadCastTipInputVo);
        con_BroadCastTipDao.callbroadCastTipDel(procedureVo);
        String result;

        if(Status.방송팁삭제_성공.getMessageCode().equals(procedureVo.getRet())) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁삭제_성공));
        } else {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송팁삭제_실패));
        }
        return result;
    }

}