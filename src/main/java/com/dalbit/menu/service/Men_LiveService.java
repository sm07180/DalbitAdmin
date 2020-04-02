package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.menu.dao.Men_LiveDao;
import com.dalbit.menu.vo.RoomOutVo;
import com.dalbit.menu.vo.procedure.P_RoomListVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Men_LiveService {

    @Autowired
    Men_LiveDao menLiveDao;
    @Autowired
    GsonUtil gsonUtil;

    /**
     * 방송방 리스트
     */
    @Transactional(readOnly = true)
    public String callBroadCastRoomList(P_RoomListVo pRoomListVo){
        ProcedureVo procedureVo = new ProcedureVo(pRoomListVo);
        List<P_RoomListVo> roomVoList = menLiveDao.callBroadCastRoomList(procedureVo);

        HashMap roomList = new HashMap();
        if(DalbitUtil.isEmpty(roomVoList)){
            roomList.put("list", new ArrayList<>());
            return gsonUtil.toJson(new JsonOutputVo(Status.방송리스트없음, roomList));
        }

        List<RoomOutVo> outVoList = new ArrayList<>();
        for (int i=0; i<roomVoList.size(); i++){
            outVoList.add(new RoomOutVo(roomVoList.get(i)));
        }
        ProcedureOutputVo procedureOutputVo = new ProcedureOutputVo(procedureVo, outVoList);
        roomList.put("list", procedureOutputVo.getOutputBox());
        //roomList.put("paging", new PagingVo(Integer.valueOf(procedureOutputVo.getRet()), pRoomListVo.getPageNo(), pRoomListVo.getPageCnt()));

        log.info("프로시저 응답 코드: {}", procedureOutputVo.getRet());
        log.info("프로시저 응답 데이타: {}", procedureOutputVo.getExt());
        log.info(" ### 프로시저 호출결과 ###");

        String result;
        if(Integer.parseInt(procedureOutputVo.getRet()) > 0) {
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송리스트조회, roomList));
        }else if(Status.방송리스트_회원아님.getMessageCode().equals(procedureOutputVo.getRet())){
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송리스트_회원아님));
        }else{
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송리스트조회_실패));
        }
        return result;
    }
}
