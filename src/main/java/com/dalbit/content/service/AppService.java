package com.dalbit.content.service;

import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.code.*;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.content.dao.AppDao;
import com.dalbit.content.vo.AppVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class AppService {

    @Autowired
    AppDao appDao;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 앱버전 리스트 조회
     */
    public String getAppVersionList(AppVo appVo) {
        int getAppVersionListCnt = appDao.getAppVersionListCnt(appVo);
        appVo.setTotalCnt(getAppVersionListCnt);
        List<AppVo> appList = appDao.getAppVersionList(appVo);

        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, appList, new PagingVo(appVo.getTotalCnt(), appVo.getPageStart(), appVo.getPageCnt())));

        return result;
    }

    /**
     * 앱버전 리스트 상세 조회
     */
    public String getListDetail(AppVo appVo) {
        AppVo detail = appDao.getListDetail(appVo);
        String result = gsonUtil.toJson(new JsonOutputVo(Status.조회, detail));

        return result;
    }

    /**
     * 앱버전 리스트 등록
     */
    public String addAppVersion(AppVo appVo) {
        appVo.setOp_name(MemberVo.getMyMemNo());
        int result = appDao.addAppVersion(appVo);

        if(appVo.getIs_use() == 1) {
            appDao.updateOs(appVo);
        }

        if(result > 0) {
            return gsonUtil.toJson(new JsonOutputVo(Status.생성));
        } else {
            return gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
        }
    }

//    /**
//     * 앱버전 리스트 수정
//     */
//    public String updateAppVersion(AppVo appVo) {
//        int result = appDao.updateAppVersion(appVo);
//
//        if(result > 0) {
//            return gsonUtil.toJson(new JsonOutputVo(Status.수정));
//        } else {
//            return gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
//        }
//    }
//
//    /**
//     * 앱버전 리스트 삭제
//     */
//    public String deleteAppVersion(AppVo appVo) {
//        int result = appDao.deleteAppVersion(appVo);
//
//        if(result > 0) {
//            return gsonUtil.toJson(new JsonOutputVo(Status.삭제));
//        } else {
//            return gsonUtil.toJson(new JsonOutputVo(Status.파라미터오류));
//        }
//    }
}
