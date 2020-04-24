package com.dalbit.customer.dao;

import com.dalbit.customer.vo.procedure.P_ImageBroadcastListInputVo;
import com.dalbit.customer.vo.procedure.P_ImageBroadcastListOutputVo;
import com.dalbit.customer.vo.procedure.P_ImageProfileListInputVo;
import com.dalbit.customer.vo.procedure.P_ImageProfileListOutputVo;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface Cus_ImageDao {
    int callCustomerImageProfileListCnt(P_ImageProfileListInputVo pImageProfileListInputVo);
    ArrayList<P_ImageProfileListOutputVo> callCustomerImageProfileList(P_ImageProfileListInputVo pImageProfileListInputVo);

    int callCustomerImageBroadcastListCnt(P_ImageBroadcastListInputVo pImageBroadcastListInputVo);
    ArrayList<P_ImageBroadcastListOutputVo> callCustomerImageBroadcastList(P_ImageBroadcastListInputVo pImageBroadcastListInputVo);
}