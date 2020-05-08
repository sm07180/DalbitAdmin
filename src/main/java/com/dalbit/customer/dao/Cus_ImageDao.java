package com.dalbit.customer.dao;

import com.dalbit.customer.vo.procedure.P_ImageBroadcastListInputVo;
import com.dalbit.customer.vo.procedure.P_ImageBroadcastListOutputVo;
import com.dalbit.customer.vo.procedure.P_ImageProfileListInputVo;
import com.dalbit.customer.vo.procedure.P_ImageProfileListOutputVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Cus_ImageDao {

    @Transactional(readOnly = true)
    int callCustomerImageProfileListCnt(P_ImageProfileListInputVo pImageProfileListInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_ImageProfileListOutputVo> callCustomerImageProfileList(P_ImageProfileListInputVo pImageProfileListInputVo);

    @Transactional(readOnly = true)
    int callCustomerImageBroadcastListCnt(P_ImageBroadcastListInputVo pImageBroadcastListInputVo);

    @Transactional(readOnly = true)
    ArrayList<P_ImageBroadcastListOutputVo> callCustomerImageBroadcastList(P_ImageBroadcastListInputVo pImageBroadcastListInputVo);
}