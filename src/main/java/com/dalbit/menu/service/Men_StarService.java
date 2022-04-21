package com.dalbit.menu.service;

import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.member.vo.MemberVo;
import com.dalbit.menu.dao.Men_PartnerDao;
import com.dalbit.menu.dao.Men_StarDao;
import com.dalbit.menu.vo.procedure.*;
import com.dalbit.util.DBUtil;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Slf4j
@Service
public class Men_StarService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Men_StarDao menStarDao;
}
