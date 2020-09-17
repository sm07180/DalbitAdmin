package com.dalbit.clip.dao;

import com.dalbit.clip.vo.procedure.P_ClipStatusGiftOutputVo;
import com.dalbit.common.vo.ProcedureVo;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface Cli_ClipStatusDao {

    @Transactional(readOnly = true)
    ArrayList<P_ClipStatusGiftOutputVo> callClipStatusGift(ProcedureVo procedureVo);

}
