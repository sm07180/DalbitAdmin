package com.dalbit.content.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.content.dao.Con_MessageDao;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.OkHttpClientUtil;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import okhttp3.FormBody;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;

@Slf4j
@Service
public class Con_MessageService {

    @Autowired
    Con_MessageDao messageDao;

    @Autowired
    GsonUtil gsonUtil;

    @Value("${server.api.url}")
    private String SERVER_API_URL;


    /** 방송방메시지 리스트 */
    public String callContentsMessageList(P_MessageListInputVo pMessageListInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pMessageListInputVo);
        String result;

        try {
            int totalCnt = messageDao.callContentsMessageListCnt(pMessageListInputVo);
            ArrayList<P_MessageListOutputVo> messageList = messageDao.callContentsMessageList(pMessageListInputVo);
            P_MessageListOutputVo summary = new Gson().fromJson(procedureVo.getExt(), P_MessageListOutputVo.class);

            if(messageList != null && messageList.size() > 0) {
                    result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지조회_성공, messageList, new PagingVo(totalCnt), summary));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지조회_데이터없음));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지조회_에러));
        }

        return result;
    }

    /** 방송방메시지 상세 */
    public String callContentsMessageDetail(P_MessageDetailInputVo pMessageDetailInputVo) {
        ProcedureVo procedureVo = new ProcedureVo(pMessageDetailInputVo);
        String result;

        try {
            P_MessageDetailOutputVo messageDetail = messageDao.callContentsMessageDetail(pMessageDetailInputVo);

            if (messageDetail != null) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지상세조회_성공, messageDetail));
            } else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지상세조회_에러));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지상세조회_에러));
        }

        return result;
    }

    /**
     * 방송방메시지 등록
     */
    @Transactional(readOnly = false)
    public String callContentsMessageAdd(P_MessageInsertVo pMessageInsertVo) throws GlobalException{
        pMessageInsertVo.setOpName(MemberVo.getMyMemNo());
        ProcedureVo procedureVo = new ProcedureVo(pMessageInsertVo, true);
        String result;

        try{
            int insertResult = messageDao.callContentsMessageAdd(pMessageInsertVo);

            if(insertResult > 0){
                result = sendSplashApi(pMessageInsertVo);
            }else{
                result = gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지발송_에러));
            }

        }catch (Exception e){
            e.printStackTrace();
            throw new GlobalException(Status.방송방메시지발송_에러);
        }

        return result;
    }




    public String sendSplashApi(P_MessageInsertVo pMessageInsertVo) throws GlobalException {
        RequestBody formBody;
        String uri = "";

        if(DalbitUtil.isEmpty(pMessageInsertVo.getTarget_rooms())){
            formBody = new FormBody.Builder()
                    .add("message", pMessageInsertVo.getSend_cont())
                    .build();
            uri = "/socket/sendSystemMessage";
        }else {
            formBody = new FormBody.Builder()
                    .add("message", pMessageInsertVo.getSend_cont())
                    .add("targetRooms", pMessageInsertVo.getTarget_rooms())
                    .build();
            uri = "/socket/sendTargetSystemMessage";
        }

        OkHttpClientUtil okHttpClientUtil = new OkHttpClientUtil();

        try{
            String url = SERVER_API_URL + uri;
            Response response = okHttpClientUtil.sendPost(url, formBody);
            String inforexLoginResult = response.body().string();
            log.debug(inforexLoginResult);

            return gsonUtil.toJson(new JsonOutputVo(Status.방송방메시지발송_성공));
        }catch (IOException | GlobalException e){
            throw new GlobalException(Status.방송방메시지발송_에러);
        }
    }
}
