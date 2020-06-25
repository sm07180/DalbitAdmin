package com.dalbit.member.controller.rest;

import com.dalbit.excel.service.ExcelService;
import com.dalbit.member.service.Mem_WalletService;
import com.dalbit.member.vo.procedure.P_WalletByeolVo;
import com.dalbit.member.vo.procedure.P_WalletDalVo;
import com.dalbit.util.GsonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("rest/member/wallet")
public class Mem_WalletRestController {

    @Autowired
    Mem_WalletService mem_walletService;

    @Autowired
    ExcelService excelService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * 내지갑 달 사용 목록
     */
    @PostMapping("dal/list")
    public String dalList(P_WalletDalVo dalVo){
        String result = mem_walletService.callMemberWalletDal(dalVo);
        return result;

    }

    /**
     * 내지갑 별 사용 목록
     */
    @PostMapping("byeol/list")
    public String byeolList(P_WalletByeolVo byeolVo){
        String result = mem_walletService.callMemberWalletByeol(byeolVo);
        return result;

    }

}
