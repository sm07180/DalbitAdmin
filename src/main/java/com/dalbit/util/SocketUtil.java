package com.dalbit.util;

import com.dalbit.socket.service.SocketService;
import com.dalbit.socket.vo.SocketVo;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;


// reqMicOn             // 마이크 온
// reqCalling           // 통화중
// reqMicOff            // 마이크 오프
// reqEndCall           // ?
// reqGrant             // 권한 변경
// reqRoomChangeInfo    // 방정보 변경
// reqChangeCount       //
// reqGoodFirst         // 좋아요
// reqBooster           // 부스터
// reqNotice            // 알림
// reqStory             // 사연
// reqFan               // 팬
// reqGiftDal
// reqGiftImg           // 선물 이미지
// reqGuest             // 게스트
// reqKickOut           // 강퇴
// reqBanWord
// chatEnd              // 방폭
// reqMyInfo


@Component
public class SocketUtil {

    /**
     * socketUtil
     */
    @Autowired
    SocketService socketService;

    public Map<String, Object> setSocket(HashMap<String,Object> param ,String command, Object message, String authToken){
        if(!"".equals(param) && !"".equals(authToken)) {
            SocketVo vo = getSocketVo(param, command, message);
            if(command == "chatEnd"){
                vo.setMessage("bjOut");
            }
            return socketService.sendSocketApi(authToken, DalbitUtil.getStringMap(param, "roomNo"), vo.toQueryString());
        }
        return null;
    }


    public SocketVo getSocketVo(HashMap<String,Object> param, String command, Object message){
        try{
            SocketVo socketVo = new SocketVo();

            socketVo.setRecvType(DalbitUtil.getStringMap(param, "recvType"));
            socketVo.setRecvPosition(DalbitUtil.getStringMap(param, "recvPosition"));
            socketVo.setRecvLevel(DalbitUtil.getIntMap(param,"recvLevel"));
            socketVo.setRecvTime(DalbitUtil.getIntMap(param, "recvTime"));

            String json = "";
            HashMap socketMap = new HashMap();

            if(message == ""){
                Gson gson = new Gson();
                HashMap<String,Object> tmp = new HashMap();
                tmp.put("revMemNo",DalbitUtil.getStringMap(param, "target_memNo"));     // 받는 사람
                tmp.put("revMemNk",DalbitUtil.getStringMap(param, "target_nickName"));
                tmp.put("sndAuth",3);
                tmp.put("sndMemNo",DalbitUtil.getStringMap(param, "memNo"));            // 보낸 사람
                tmp.put("sndMemNk",DalbitUtil.getStringMap(param, "nickName"));
                json =  gson.toJson(tmp);
                socketVo.setMessage(json);
            }else{
                socketVo.setMessage(message);
            }

            socketVo.setMemNo(DalbitUtil.getStringMap(param, "target_memNo"));
            socketVo.setCommand(command);
            socketVo.setMemNk(DalbitUtil.getStringMap(param, "target_nickName"));
            socketVo.setMemImg("");
            socketVo.setFan(1);
            socketVo.setAuth(3);
            socketVo.setAuthName("달D");
            socketVo.setCtrlRole("1111111111");
            socketVo.setLogin(1);
            socketVo.setRecvMemNo("");
            socketVo.setRecvDj(1);
            socketVo.setRecvManager(1);
            socketVo.setRecvListener(1);




            return socketVo;
        }catch(Exception e){e.getStackTrace();}
        return null;
    }
}
