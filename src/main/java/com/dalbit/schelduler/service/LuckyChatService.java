package com.dalbit.schelduler.service;

import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.menu.dao.Men_LiveDao;
import com.dalbit.menu.vo.procedure.P_RoomListVo;
import com.dalbit.schelduler.proc.LuckChat;
import com.dalbit.schelduler.vo.DallaEventMessage;
import com.dalbit.schelduler.vo.LuckChatVO;
import com.dalbit.socket.service.SocketService;
import com.dalbit.socket.vo.SocketVo;
import com.dalbit.util.DBUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Service
public class LuckyChatService {

    @Autowired
    LuckChat luckChat;

    @Autowired
    Men_LiveDao menLiveDao;

    @Autowired
    SocketService socketService;

    private void sendNoticeResult(DallaEventMessage message) {
        try {
            P_RoomListVo pRoomListVo = new P_RoomListVo();
            pRoomListVo.setMem_no("10000000000000");
            pRoomListVo.setPageNo(1);
            pRoomListVo.setPageCnt(100);
            ProcedureVo procedureVo = new ProcedureVo(pRoomListVo);
            List<P_RoomListVo> roomVoList = menLiveDao.callBroadCastRoomList(procedureVo);

            SocketVo vo = new SocketVo();
            vo.setLogin(1);
            vo.setCommand("reqEventMsg");
            vo.setCtrlRole("0");
            vo.setRecvType("system");
            vo.setAuth(3);
            vo.setAuthName("운영자");
            vo.setMessage(message);

            roomVoList.forEach(value -> {
                vo.setMemNo(value.getBj_mem_no());
                socketService.sendSocketApi(value.getBj_mem_no(), value.getRoomNo(), vo.toQueryString());
            });
        } catch (Exception e) {
            log.error("LuckyChatService Error => sendNoticeResult {}", e);
        }
    }

    // 시간대별에 해당하는 seqNum 가져오기
    private static Integer calTheSeq() {
        LocalTime currentTime = LocalTime.now();
        Integer result = 0;

        try {
            for (int i = 0; i < 24; i++) {
                if (currentTime.compareTo(LocalTime.of(i * 1, 0, 0)) >= 0) {
                    result = i + 1;
                }
            }
        } catch (Exception e) {
            log.error("LuckyChatService => calTheSeq error: {}", e);
        }

        return result;
    }


    // 랜덤 구하는 함수
    private static Integer getRandomNumber(Integer maxNum) {
        Integer result = null;

        if (maxNum < 1) {
            return null;
        }

        try {
            double randNum = Math.random();
            result = (int)(randNum * maxNum + 1);
        } catch (Exception e) {
            result = null;
            log.error("LuckyChatService => getRandomNumber error: {}", e);
        }

        return result;
    }

    public String luckyChatRewardChoice() {
        Integer theSeq = calTheSeq();
        String theDate = LocalDate.now().toString();

        try {

            List<Object> info = luckChat.getLuckyChatInfo(theDate, theSeq);
            List<LuckChatVO.RewardItemInfo> itemInfo = DBUtil.getList(info, LuckChatVO.RewardItemInfo.class);
            List<LuckChatVO.RewardUserInfo> userInfo = DBUtil.getList(info, LuckChatVO.RewardUserInfo.class);

            List<String> rewardList = new ArrayList<>();

            Integer totalPreMemCnt = 0;

            Integer success = 1;// DB insert 값 success 처리용 값

            DallaEventMessage message = new DallaEventMessage();

            message.setTitle("키보드 히어로31 당첨자 발표");
            message.setLinkTitle("확인하기");
            message.setLinkUrl("/event/keyboardhero");

            for (int i = 0; i < itemInfo.size(); i++) {

                Integer remainRewardCnt = itemInfo.get(i).getPre_mem_cnt() - itemInfo.get(i).getRcv_mem_cnt();
                totalPreMemCnt += remainRewardCnt;
                for (int j = 0; j < remainRewardCnt; j++) {
                    rewardList.add(itemInfo.get(i).getPre_code());
                }
            }

            for (LuckChatVO.RewardUserInfo target : userInfo) {
                Integer choiceNum = getRandomNumber(totalPreMemCnt) - 1;

                if (rewardList.size() > 0) {
                    log.warn("내가 뽑은 숫자는 : " + choiceNum + " 선물 리스트 : " + rewardList.toString());
                    log.warn("theSeq : " + theSeq + ", 총 남은 선물 개수 : " + totalPreMemCnt + ", 선툭 받은 선물 : " + rewardList.get(choiceNum));
                    Integer insResult = luckChat.putLuckyChatIns(theDate, theSeq, target.getMem_no(), rewardList.get(choiceNum), rewardList.get(choiceNum).substring(0, 1));

                    if (success.equals(insResult)) {
                        rewardList.remove(rewardList.get(choiceNum));
                        totalPreMemCnt = totalPreMemCnt - 1;

                        message.setContent("{nickName}님 축하드립니다~ 지금 바로 이벤트 페이지에서 선물 받기를 완료해주세요!");
                        message.setNickName(target.getMem_nick());
                        log.warn("sendNoticeResult call prev : " + message.getContent());
                        //sendNoticeResult(message); 테스트를 위해 소켓 호출부분 제거
                    } else {
                        log.error("LuckyChatService => putLuckyChatIns result: {}", insResult);
                    }
                } else {
                    log.error("LuckyChatService => No rewardList's size is zero {}", rewardList.size());
                }
            }

        } catch (Exception e) {
            log.error("LuckyChatService => luckyChatRewardChoice error: {}", e);
        }

        return "";
    }
}
