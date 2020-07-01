package com.dalbit.common.controller;

import com.dalbit.common.annotation.NoLogging;
import com.dalbit.common.code.Status;
import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.CodeListVo;
import com.dalbit.common.vo.CodeVo;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RestController
@RequestMapping("common")
public class CommonController {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    CommonService commonService;

    @NoLogging
    @GetMapping("/ctrl/check/service")
    public String checkService(HttpServletRequest request){
        return commonService.checkHealthy(request);
    }

    /**
     * 코드목록
     */
    @PostMapping("codeList")
    public String codeList(CodeListVo codeListVo){
        String codeList = commonService.getCodeList(codeListVo);
        return codeList;
    }

}
