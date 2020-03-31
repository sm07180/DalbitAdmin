package com.dalbit.broadcast.controller.rest;


import com.dalbit.broadcast.service.Bro_BroadcastService;
import com.dalbit.broadcast.vo.procedure.*;
import com.dalbit.common.code.Code;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.exception.GlobalException;
import com.dalbit.socket.service.SocketService;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.JwtUtil;
import com.dalbit.util.SocketUtil;
import org.springframework.ui.Model;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping("rest/broadcast/broadcast")
public class Bro_BroadcastRestController {

    @Autowired
    Bro_BroadcastService bro_BroadcastService;
    @Autowired
    GsonUtil gsonUtil;
    @Autowired
    ExcelService excelService;
    @Autowired
    SocketUtil socketUtil;
    @Autowired
    SocketService socketService;
    @Autowired
    JwtUtil jwtUtil;

    /**
     * 생방송 목록
     * //@param model
     * @return
     */
    @PostMapping("list")
    public String list(P_BroadcastListInputVo pBroadcastListInputVo){
        return bro_BroadcastService.callBroadcastList(pBroadcastListInputVo);
    }

    /**
     * 실시간 최신 생방송 엑셀
     */
    @PostMapping("listExcel")
    public String listExcel(HttpServletRequest request, HttpServletResponse response, Model model, P_BroadcastListInputVo pBroadcastListInputVo) throws GlobalException {
        Model resultModel = bro_BroadcastService.callBroadcastListExcel(pBroadcastListInputVo, model);
        excelService.renderMergedOutputModel(resultModel.asMap(), request, response);

        return gsonUtil.toJson(new JsonOutputVo(Status.엑셀다운로드성공));
    }

    /**
     * 방송방 상세보기
     */
    @PostMapping("info")
    public String info(P_BroadcastDetailInputVo pBroadcastDetailInputVo){
        return bro_BroadcastService.callBroadcastInfo(pBroadcastDetailInputVo);
    }

    /**
     * 방송방 정보수정 내역 보기
     */
    @PostMapping("editHist")
    public String editHist(P_BroadcastEditHistInputVo pBroadcastEditHistInputVo) {
        return bro_BroadcastService.callBroadcastEditHistory(pBroadcastEditHistInputVo);
    }

    /**
     * 방송방 정보수정
     */
    @PostMapping("edit")
    public String edit(P_BroadcastEditInputVo pBroadcastEditInputVo) {

        if(pBroadcastEditInputVo.getBackgroundImage().equals("backImageDel")) {
             int random = Integer.parseInt(DalbitUtil.randomBgValue());
             pBroadcastEditInputVo.setBackgroundImage(Code.포토_배경_디폴트_PREFIX.getCode() + "/" + Code.배경이미지_파일명_PREFIX.getCode() + "200310_" + random + ".jpg");
        }
        if(pBroadcastEditInputVo.getForceExit().equals("1")){
            HashMap<String,String> param = new HashMap<>();
            param.put("roomNo",pBroadcastEditInputVo.getRoom_no());
            param.put("memNo",pBroadcastEditInputVo.getMem_no());

            socketUtil.setSocket(param,"chatEnd","",jwtUtil.generateToken(pBroadcastEditInputVo.getMem_no(), true));
        }

        return bro_BroadcastService.callBroadcastEdit(pBroadcastEditInputVo);
    }
}
