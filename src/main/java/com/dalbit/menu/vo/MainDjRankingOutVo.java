package com.dalbit.menu.vo;

import com.dalbit.common.vo.ImageVo;
import com.dalbit.menu.vo.procedure.P_MainDjRankingVo;
import com.dalbit.util.DalbitUtil;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class MainDjRankingOutVo {

    private int rank;
    private String upDown;
    private String memNo;
    private String nickNm;
    private String memId;
    private String gender;
    private ImageVo profImg;
    private int level;
    private String grade;
    private int likes;
    private int listeners;

    public MainDjRankingOutVo(){}
    public MainDjRankingOutVo(P_MainDjRankingVo target) {
        setRank(target.getRank());
        setUpDown(target.getUp_down());
        setMemNo(target.getMem_no());
        setNickNm(target.getNickName());
        setMemId(target.getMemId());
        setGender(target.getMemSex());
        setProfImg(new ImageVo(target.getProfileImage(), target.getMemSex(), DalbitUtil.getProperty("server.photo.url")));
        setLevel(target.getLevel());
        setGrade(target.getGrade());
        setLikes(target.getGoodCount());
        setListeners(target.getListenerCount());
    }
}
