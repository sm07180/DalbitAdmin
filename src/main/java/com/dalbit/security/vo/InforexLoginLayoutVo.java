package com.dalbit.security.vo;

import com.dalbit.common.vo.CookieVo;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class InforexLoginLayoutVo {
    String success;
    InforexLoginUserInfoVo userInfo;
    List<CookieVo> loginCookieVo;
}
