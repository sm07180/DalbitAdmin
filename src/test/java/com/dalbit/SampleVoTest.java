package com.dalbit;

import com.dalbit.common.service.CommonService;
import com.dalbit.common.vo.CodeVo;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;

import java.util.List;

@Slf4j
@SpringBootTest
@ActiveProfiles({"local"})
public class SampleVoTest {

    @Autowired
    CommonService commonService;

    @Test
    public void 공통코드조회(){
        List<CodeVo> codeVoList = commonService.getCodeList("subject_type");
        log.info("공통코드 : {}", codeVoList);

        //commonService.getCodeList("subject_type");
    }
}
