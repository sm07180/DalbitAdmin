package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.PushService;
import com.dalbit.content.vo.PushVo;
import com.dalbit.content.vo.procedure.P_pushDeleteVo;
import com.dalbit.content.vo.procedure.P_pushDetailInputVo;
import com.dalbit.content.vo.procedure.P_pushInsertVo;
import com.dalbit.content.vo.procedure.P_pushUpdateVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;

@Slf4j
@RestController
@RequestMapping("rest/content/push")
public class PushRestController {

    @Autowired
    PushService pushService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 푸시 메시지
     */
    @PostMapping("list")
    public String list(HttpServletRequest request, PushVo pushVo) {
        int totalCnt = 0;
        int startIdx = pushVo.getPageStart();

        ArrayList<PushVo> list = new ArrayList<PushVo>();
        for(int i = 0; i < pushVo.getPageCnt(); i++){
            PushVo data = new PushVo();
            data.setRowNum((totalCnt - startIdx));
            data.setPush_col1(DalbitUtil.randomValue("number", 1));
            data.setPush_col2(DalbitUtil.randomValue("number", 1));
            data.setPush_col3("메시지 제목 이란다 ㅋㅋㅋㅋㅋ _" + data.getPush_col1());
            data.setPush_col4(new Date());
            data.setPush_col5(DalbitUtil.randomValue("number", 1));
            data.setPush_col6(new Date());
            data.setPush_col7("YOOSIN");

            list.add(data);
            startIdx++;
        }

        return gsonUtil.toJson(new JsonOutputVo(Status.조회, list, new PagingVo(totalCnt)));
    }


    /**
     * 푸시 메시지 상세 조회
     */
    @PostMapping("detail")
    public String detail(P_pushDetailInputVo p_pushDetailInputVo) {
        String result = pushService.callServiceCenterPushListDetail(p_pushDetailInputVo);
        return result;
    }

    /**
     * 푸시 메시지 등록
     */
    @PostMapping("insert")
    public String insert(P_pushInsertVo pPushInsertVo) {
        String result = pushService.callServiceStmpPushAdd(pPushInsertVo);
        return result;
    }

    /**
     * 푸시 메시지 수정
     */
    @PostMapping("update")
    public String update(P_pushUpdateVo pPushUpdateVo) {
        String result = pushService.callServiceCenterPushUpdate(pPushUpdateVo);
        return result;
    }

    /**
     * 푸시 메시지 삭제
     */
    @PostMapping("delete")
    public String delete(P_pushDeleteVo pPushDeleteVo) {
        String result = pushService.callServiceCenterPushDelete(pPushDeleteVo);
        return result;
    }
}
