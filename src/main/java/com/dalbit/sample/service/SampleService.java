package com.dalbit.sample.service;

import com.dalbit.sample.dao.SampleDao;
import com.dalbit.sample.vo.ErrorVo;
import com.dalbit.sample.vo.SampleVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service
@Transactional
public class SampleService {

    @Autowired
    private SampleDao sampleDao;

    public int getCount(){
        int cnt = sampleDao.getCount();
        return cnt;
    }

    public List<SampleVo> getList(){
        List<SampleVo> list = sampleDao.getList();
        return list;
    }

    public void transactionTest(SampleVo sampleVo){

        sampleDao.insertSample(sampleVo);
        String[] arr = new String[1];
        log.error(arr[2]);

    }

    public List<ErrorVo> getLogErrorData(ErrorVo errorVo) {
        List<ErrorVo> errorList = sampleDao.getLogErrorData(errorVo);
        return errorList;
    }
}
