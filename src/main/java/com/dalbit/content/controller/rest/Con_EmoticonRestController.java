package com.dalbit.content.controller.rest;

import com.dalbit.content.service.Con_EmoticonService;
import com.dalbit.content.vo.procedure.*;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/content/emoticon")
public class Con_EmoticonRestController {

    @Autowired
    Con_EmoticonService conEmoticonService;

    @Autowired
    GsonUtil gsonUtil;


    /**
     * 인싸티콘 카테고리 리스트
     */
    @PostMapping("inssaticon/category/list")
    public String inssaticonCategoryList(P_EmoticonCategoryListInputVo pEmoticonCategoryListInputVo) {
        String result = conEmoticonService.callAdminEmoticonCategorySelect(pEmoticonCategoryListInputVo);
        return result;
    }

    /**
     * 인싸티콘 카테고리 수정
     */
    @PostMapping("inssaticon/category/update")
    public String inssaticonCategoryUpdate(P_EmoticonCategoryUpdateVo pEmoticonCategoryUpdateVo) {
        String result = conEmoticonService.callAdminEmoticonCategoryEdit(pEmoticonCategoryUpdateVo);
        return result;
    }

    /**
     * 인싸티콘 리스트
     */
    @PostMapping("inssaticon/list")
    public String inssaticonList(P_EmoticonListInputVo pEmoticonListInputVo) {
        String result = conEmoticonService.callAdminEmoticonSelect(pEmoticonListInputVo);
        return result;
    }

    /**
     * 인싸티콘 등록
     */
    @PostMapping("inssaticon/insert")
    public String bannerInsert(P_EmoticonInsertVo pEmoticonInsertVo) {
        String result = conEmoticonService.callAdminEmoticonAdd(pEmoticonInsertVo);
        return result;
    }

    /**
     * 인싸티콘 수정
     */
    @PostMapping("inssaticon/update")
    public String bannerUpdate(P_EmoticonUpdateVo pEmoticonUpdateVo) {
        String result = conEmoticonService.callAdminEmoticonEdit(pEmoticonUpdateVo);
        return result;
    }

}
