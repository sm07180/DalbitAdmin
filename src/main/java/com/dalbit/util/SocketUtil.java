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

    public Map<String, Object> setSocket(HashMap<String,Object> param ,String command, String message, String authToken){
        if(!"".equals(param) && !"".equals(authToken)) {
            SocketVo vo = getSocketVo(param, command, message);
            System.out.println(vo.toQueryString());
            return socketService.sendSocketApi(authToken, DalbitUtil.getStringMap(param, "roomNo"), vo.toQueryString());
        }
        return null;
    }


    public SocketVo getSocketVo(HashMap<String,Object> param, String command, String message){
        try {
            SocketVo socketVo = new SocketVo();

            socketVo.setRecvType(DalbitUtil.getStringMap(param, "recvType"));
            socketVo.setRecvPosition(DalbitUtil.getStringMap(param, "recvPosition"));
            socketVo.setRecvLevel(DalbitUtil.getIntMap(param, "recvLevel"));
            socketVo.setRecvTime(DalbitUtil.getIntMap(param, "recvTime"));
            socketVo.setMessage(message);
            socketVo.setCommand(command);
            socketVo.setMemImg("");
            if (command.equals("reqKickOut")){
                socketVo.setMemNo(DalbitUtil.getStringMap(param, "target_memNo"));
                socketVo.setMemNk(DalbitUtil.getStringMap(param, "target_nickName"));
            }else{
                socketVo.setMemNo(DalbitUtil.getStringMap(param, "memNo"));
                socketVo.setMemNk(DalbitUtil.getStringMap(param, "memNk"));
                if(command.equals("reqRoomChangeInfo")){
                    socketVo.setMemImg(DalbitUtil.getStringMap(param, "memImg"));
                }
            }
            socketVo.setFan(1);
            socketVo.setAuth(3);
            socketVo.setAuthName("달D");
            socketVo.setCtrlRole(DalbitUtil.getStringMap(param, "ctrlRole"));
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
