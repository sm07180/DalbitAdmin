package com.dalbit.content.dao;

import com.dalbit.content.vo.procedure.P_LuckyChatInputVo;
import com.dalbit.content.vo.procedure.P_LuckyChatMemListOuputVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface Con_LuckyChatEventDao {
    /**
     * 번호중복
     *
     * @param pLuckyChatInputVo
     * @return
     */
    List<P_LuckyChatMemListOuputVo> selectLuckyChatDuplicatMemList(P_LuckyChatInputVo pLuckyChatInputVo);

    /**
     * 당첨자 목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    List<Object> selectLuckyChatMemList(P_LuckyChatInputVo pLuckyChatInputVo);

    /**
     * 보너스 목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    List<Object> selectLuckyChatBounsMemList(P_LuckyChatInputVo pLuckyChatInputVo);

    /**
     * 채팅목록
     *
     * @param pLuckyChatInputVo
     * @return
     */
    List<Object> selectLuckyChatList(P_LuckyChatInputVo pLuckyChatInputVo);
}
