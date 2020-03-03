package com.dalbit.customer.service;

import com.dalbit.customer.dao.QuestionDao;
import com.dalbit.customer.vo.QuestionVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class QuestionService {

    @Autowired
    QuestionDao questionDao;

    public List<QuestionVo> getQuestionList(QuestionVo questionVo) {
        List<QuestionVo> list = questionDao.questionList(questionVo);
        int questionList_cnt = questionDao.questionList_cnt(questionVo);
        list.get(0).setTotalCnt(questionList_cnt);
        return list;
    }

}
