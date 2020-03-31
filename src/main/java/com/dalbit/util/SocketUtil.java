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

    public Map<String, Object> setSocket(HashMap<String,String> param ,String command, Object message, String authToken){
        if(!"".equals(param) && !"".equals(authToken)) {
            SocketVo vo = getSocketVo(param, command, message);
            if(command == "chatEnd"){
                vo.setMessage("bjOut");
            }
            return socketService.sendSocketApi(authToken, param.get("roomNo"), vo.toQueryString());
        }
        return null;
    }


    public SocketVo getSocketVo(HashMap<String,String> param, String command, Object message){
        try{
            SocketVo socketVo = new SocketVo();

            String json = "";
            HashMap socketMap = new HashMap();

            if(message == ""){
                Gson gson = new Gson();
                HashMap<String,Object> tmp = new HashMap();
                tmp.put("revMemNo",param.get("memNo"));
                tmp.put("revMemNk",param.get("nickName"));
                tmp.put("sndAuth",3);
                tmp.put("sndMemNo",param.get("target_memNo"));
                tmp.put("sndMemNk",param.get("target_nickName"));
                json =  gson.toJson(tmp);
                socketVo.setMessage(json);
            }else{
                socketVo.setMessage(message);
            }

            socketVo.setMemNo(param.get("target_memNo"));
            socketVo.setCommand(command);
            socketVo.setMemNk(param.get("target_nickName"));
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
            socketVo.setRecvType("chat");
            socketVo.setRecvPosition("chat");
            socketVo.setRecvLevel(0);
            socketVo.setRecvTime(0);

            return socketVo;
        }catch(Exception e){e.getStackTrace();}
        return null;
    }
}
