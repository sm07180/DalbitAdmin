package com.dalbit.customer.dao;

import com.dalbit.customer.vo.QuestionVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionDao {
    List<QuestionVo> questionList(QuestionVo questionVo);
    int questionList_cnt(QuestionVo questionVo);
}
