package com.dalbit.content.controller.rest;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.service.PushService;
import com.dalbit.content.vo.PushVo;
import com.dalbit.content.vo.procedure.*;
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
    public String list(P_pushListInputVo pPushListInputVo) {
        String result = pushService.callContentsPushList(pPushListInputVo);
        return result;
    }


    /**
     * 푸시 메시지 상세 조회
     */
    @PostMapping("detail")
    public String detail(P_pushDetailInputVo p_pushDetailInputVo) {
        String result = pushService.callContentsPushDetail(p_pushDetailInputVo);
        return result;
    }

    /**
     * 푸시 메시지 등록
     */
    @PostMapping("insert")
    public String insert(P_pushInsertVo pPushInsertVo) {
        String result = pushService.callContentsPushAdd(pPushInsertVo);
        return result;
    }

    /**
     * 푸시 메시지 수정
     */
    @PostMapping("update")
    public String update(P_pushUpdateVo pPushUpdateVo) {
        String result = pushService.callContentsPushEdit(pPushUpdateVo);
        return result;
    }

    /**
     * 푸시 메시지 삭제
     */
    @PostMapping("delete")
    public String delete(P_pushDeleteVo pPushDeleteVo) {
        String result = pushService.callContentsPushDelete(pPushDeleteVo);
        return result;
    }
}
