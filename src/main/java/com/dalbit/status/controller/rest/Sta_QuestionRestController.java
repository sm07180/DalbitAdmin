package com.dalbit.status.controller.rest;

import com.dalbit.status.service.Sta_QuestionService;
import com.dalbit.status.vo.procedure.P_StatVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/status/question")
public class Sta_QuestionRestController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    Sta_QuestionService sta_QuestionService;

    /**
     * 1:1문의 총계
     * @param pStatVo
     * @return
     */
    @PostMapping("total")
    public String total(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_QuestionService.callQuestionTotal(pStatVo);
        return result;
    }

    /**
     * 1:1문의 유형별
     * @param pStatVo
     * @return
     */
    @PostMapping("slct")
    public String slct(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_QuestionService.callQuestionSlct(pStatVo);
        return result;
    }

    /**
     * 1:1문의 플랫폼
     * @param pStatVo
     * @return
     */
    @PostMapping("platform")
    public String platform(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_QuestionService.callQuestionPlatform(pStatVo);
        return result;
    }
    /**
     * 1:1문의 미처리
     * @param pStatVo
     * @return
     */
    @PostMapping("untreated")
    public String untreated(P_StatVo pStatVo){
        if(DalbitUtil.isEmpty(pStatVo.getStartDate())){
            pStatVo.setStartDate(null);
        }
        if(DalbitUtil.isEmpty(pStatVo.getEndDate())){
            pStatVo.setEndDate(null);
        }
        String result = sta_QuestionService.callQuestionUntreated(pStatVo);
        return result;
    }

    /**
     * 1:1문의 고정
     */
    @PostMapping("info")
    public String info(){
        String result = sta_QuestionService.callQuestionInfo();
        return result;
    }
}
