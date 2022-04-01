
package com.dalbit.common.proc;

import com.dalbit.payment.vo.ParentsAuthSelVo;
import com.dalbit.payment.vo.ParentsEmailLogInsVo;
import com.dalbit.payment.vo.ParentsEmailLogSelVo;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.List;

@Component
@Repository
public interface Common {
    /**********************************************************************************************
     * @Method 설명 : 법정대리인 인증 정보
     * @작성일   : 2022-01-03
     * @작성자   : 박성민
     * @param  : memNo: 회원번호(신청자)
     * @return :
     *   mem_no                  bigint(20)          -- 회원번호
     *   parents_mem_name        varchar(20)         -- 회원대리인 이름
     *   parents_mem_sex         char(1)             -- 회원대리인 성별
     *   parents_mem_birth_year  smallint(6)         -- 회원대리인 생년
     *   parents_mem_birth_day   smallint(6)         -- 회원대리인 월일
     *   parents_mem_email       varchar(50)         -- 회원대리인 이메일
     *   parents_mem_hphone      varchar(15)         -- 회원대리인 휴대전
     *   agreement_date          smallint(6)         -- 동의기간
     *   expire_date             datetime(6)         -- 만료일자
     *   auth_yn                 char(1)             -- 동의완료여부
     *   ins_date                datetime(6)         -- 인증일자
     *   upd_date                datetime(6)         -- 수정일자
     **********************************************************************************************/
    @Select("CALL rd_data.p_adm_mem_parents_auth_sel(#{memNo})")
    ParentsAuthSelVo parentsAuthSel(String memNo);

    /**********************************************************************************************
     * @Method 설명 : 법정대리인 이메일 발송로그 등록 (api 서버랑 같음)
     * @작성일   : 2022-01-04
     * @작성자   : 박성민
     * @param  :
     *   memNo  회원번호(신청자)
     *   pMemEmail  대리인 이메일주소
     *   mailSlct  메일발송구분[a:동의, p:결제, c:결제취소]
     *   mailEtc  메일발송정보
     * @return : s_return - 0:에러, 1:정상
     **********************************************************************************************/
    @Select("CALL rd_data.p_mem_parents_auth_email_log_ins(#{memNo}, #{pMemEmail}, #{mailSlct}, #{mailEtc})")
    Integer parentsAuthEmailLogIns(ParentsEmailLogInsVo param);

    /**********************************************************************************************
     * @Method 설명 : 법정대리인 이메일 발송로그
     * @작성일   : 2022-01-05
     * @작성자   : 박성민
     * @param  :
     *   memNo  회원번호(신청자)
     *   tDate  검색일자
     *   mailSlct  메일발송구분[a:동의, p:결제, c:결제취소]
     *   pageNo, pagePerCnt
     * @return :
     *   #1 : cnt
     *   #2 :
     *     auto_no  고유번호
     *     mem_no  회원번호
     *     parents_mem_email  발송메일주소
     *     mail_slct  메일발송 구분 [a:동의, p:결제, c:결제취소]
     *     mail_etc  메일 발송정보
     *     ins_date  메일 발송일자
     **********************************************************************************************/
    @ResultMap({"ResultMap.integer", "ResultMap.ParentsEmailLogSelOutputVo"})
    @Select("CALL rd_data.p_mem_parents_auth_email_log_list(#{memNo}, #{tDate}, #{mailSlct}, #{pageNo}, #{pagePerCnt})")
    List<Object> parentsAuthEmailLogSel(ParentsEmailLogSelVo param);

    /* 법정대리인 동의 체크(결제) */
    // return s_authYn	CHAR(1)		-- 인증여부
    @Select("CALL rd_data.p_adm_mem_parents_auth_chk(#{memNo})")
    String parentsAuthChk(String memNo);
}
