package com.dalbit.enter.service;


import com.dalbit.enter.dao.Ent_PayV2Dao;
import com.dalbit.excel.service.ExcelService;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.MessageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class Ent_PayV2Service {

    @Autowired
    MessageUtil messageUtil;

    @Autowired
    GsonUtil gsonUtil;

    @Autowired
    Ent_PayV2Dao ent_payV2Dao;

    @Autowired
    ExcelService excelService;


}
