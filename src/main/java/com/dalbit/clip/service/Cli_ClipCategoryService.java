package com.dalbit.clip.service;

import com.dalbit.customer.dao.Cus_BlockAdmDao;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class Cli_ClipCategoryService {

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Cus_BlockAdmDao cusBlockAdmDao;


}
