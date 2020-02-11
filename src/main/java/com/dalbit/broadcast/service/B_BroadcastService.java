package com.dalbit.broadcast.service;

import com.dalbit.broadcast.vo.BroadcastInfoOutVo;
import com.dalbit.broadcast.vo.BroadcastInfoVo;
import com.dalbit.broadcast.vo.BroadcastListVo;
import com.dalbit.common.code.Status;
import com.dalbit.util.GsonUtil;
import com.dalbit.broadcast.dao.B_BroadcastDao;
import com.dalbit.broadcast.vo.BroadcastTypeListVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class B_BroadcastService {

    @Autowired
    B_BroadcastDao bBroadcastDao;
    @Autowired
    MessageUtil messageUtil;
    @Autowired
    GsonUtil gsonUtil;


    /**
     * 방송관리 Type 목록
     */
    public String callBroadcastTypeList(BroadcastTypeListVo broadcastTypeListVo) {
        List<BroadcastTypeListVo> codeList = new ArrayList<>();
        if(broadcastTypeListVo.getType().equals("subject_type")){
            codeList = bBroadcastDao.callBroadcastTypeList(broadcastTypeListVo);
        }
        ProcedureVo procedureVo = new ProcedureVo();
        procedureVo.setData(codeList);
        String result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }

    /**
     * 방송 list 목록
     */
    public String callBroadcastList(BroadcastListVo broadcastListVo){
        List<BroadcastListVo> list = bBroadcastDao.callBroadcastList(broadcastListVo);
        ProcedureVo procedureVo = new ProcedureVo();
        procedureVo.setData(list);
        String result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }

    /**
     * 선택한 방 정보
     */
    public String callBroadcastInfo(BroadcastInfoVo broadcastInfoVo) {

//        platform;                    //플랫폼
//        freezing;                    //얼리기여부
//        forceExit;                   //방송강제종료
//        infoEditNm;                  //최근정보수정처리자
//        menagerCnt;                     // 메니저 수
//        guestCnt;                       // 게스트/게스트ID 수
//        banCnt;                         // 등록 금지어 수

        log.info("@@@@@@@@@@@@ " + broadcastInfoVo.getRoomNo());
        ProcedureVo procedureVo = new ProcedureVo();
        List<BroadcastInfoVo> list = bBroadcastDao.callBroadcastInfo(broadcastInfoVo);

        List<BroadcastInfoOutVo> outVoList = new ArrayList<>();
        for (int i = 0; i< list.size(); i++){
            outVoList.add(new BroadcastInfoOutVo(list.get(i)));
        }
        procedureVo.setData(outVoList.get(0));

        String result;
        result = gsonUtil.toJson(messageUtil.setJsonOutputVo(new JsonOutputVo(Status.회원정보보기_성공, procedureVo.getData())));
        log.info(" ### 호출결과 ###" + result);
        return result;
    }
}
