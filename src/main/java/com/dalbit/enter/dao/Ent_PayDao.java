package com.dalbit.enter.dao;

import com.dalbit.enter.vo.procedure.P_PayInfoOutVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public interface Ent_PayDao {

    @Transactional(readOnly = true)
    P_PayInfoOutVo callStatPayInfo();
}
