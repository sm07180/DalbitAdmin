package com.dalbit.customer.service;

import com.dalbit.broadcast.service.Bro_BroadcastService;
import com.dalbit.broadcast.vo.procedure.P_BroadcastEditInputVo;
import com.dalbit.common.code.Code;
import com.dalbit.common.code.ErrorStatus;
import com.dalbit.common.code.Status;
import com.dalbit.common.vo.JsonOutputVo;
import com.dalbit.common.vo.PagingVo;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.customer.dao.Cus_ImageDao;
import com.dalbit.customer.vo.procedure.P_ImageBroadcastListInputVo;
import com.dalbit.customer.vo.procedure.P_ImageBroadcastListOutputVo;
import com.dalbit.customer.vo.procedure.P_ImageProfileListInputVo;
import com.dalbit.customer.vo.procedure.P_ImageProfileListOutputVo;
import com.dalbit.exception.GlobalException;
import com.dalbit.member.service.Mem_MemberService;
import com.dalbit.member.vo.procedure.P_MemberEditorVo;
import com.dalbit.member.vo.procedure.P_MemberReportVo;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Slf4j
@Service
public class Cus_ImageService {

    @Autowired
    Cus_ImageDao cusImageDao;

    @Autowired
    Mem_MemberService memMemberService;

    @Autowired
    Bro_BroadcastService broBroadcastService;

    @Autowired
    GsonUtil gsonUtil;

    /**
     * profile 리스트 조회
     */
    public String getMemberList(P_ImageProfileListInputVo pImageProfileListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pImageProfileListInputVo);
        String result;
        try {
            int totalCnt = cusImageDao.callCustomerImageProfileListCnt(pImageProfileListInputVo);
            pImageProfileListInputVo.setTotalCnt(totalCnt);
            ArrayList<P_ImageProfileListOutputVo> memberList = cusImageDao.callCustomerImageProfileList(pImageProfileListInputVo);

            if(memberList != null && memberList.size() > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, memberList, new PagingVo(pImageProfileListInputVo.getTotalCnt(), pImageProfileListInputVo.getPageStart(), pImageProfileListInputVo.getPageCnt())));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, null, new PagingVo(pImageProfileListInputVo.getTotalCnt(), pImageProfileListInputVo.getPageStart(), pImageProfileListInputVo.getPageCnt())));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

    /**
     * profile 이미지 초기화 조회
     */
    @Transactional(readOnly = true)
    public String getMemberReset(P_MemberReportVo pMemberReportVo) throws GlobalException {
        try {
            //이미지 초기화
            P_MemberEditorVo pMemberEditorVo = new P_MemberEditorVo();
            pMemberEditorVo.setMem_no(pMemberReportVo.getMem_no());
            pMemberEditorVo.setProfileImage("");
            pMemberEditorVo.setNotiSms("0");

            String result = memMemberService.getMemberEditor(pMemberEditorVo);
            log.debug(result);

            // 방송방 수정 성공여부 확인
            JsonParser parser = new JsonParser();
            JsonElement element;
            element = parser.parse(result);
            String codeResult = element.getAsJsonObject().get("code").getAsString();

            if(Status.회원정보수정성공.getMessageCode().equals(codeResult)){
                //정지/경고 조치
                result = memMemberService.getMemberReport(pMemberReportVo);
                log.debug(result);

                result = gsonUtil.toJson(new JsonOutputVo(Status.이미지초기화성공));
                return result;
            } else {
                return gsonUtil.toJson(new JsonOutputVo(Status.회원정보수정실패));
            }

        }catch (Exception e){
            e.printStackTrace();
            throw new GlobalException(ErrorStatus.서버처리중오류);
        }
    }




    /**
     * broadcast 리스트 조회
     */
    public String getBroadcastList(P_ImageBroadcastListInputVo pImageBroadcastListInputVo){
        ProcedureVo procedureVo = new ProcedureVo(pImageBroadcastListInputVo);
        String result;
        try {
            int totalCnt = cusImageDao.callCustomerImageBroadcastListCnt(pImageBroadcastListInputVo);
            pImageBroadcastListInputVo.setTotalCnt(totalCnt);
            ArrayList<P_ImageBroadcastListOutputVo> memberList = cusImageDao.callCustomerImageBroadcastList(pImageBroadcastListInputVo);

            if(memberList != null && memberList.size() > 0) {
                result = gsonUtil.toJson(new JsonOutputVo(Status.조회, memberList, new PagingVo(pImageBroadcastListInputVo.getTotalCnt(), pImageBroadcastListInputVo.getPageStart(), pImageBroadcastListInputVo.getPageCnt())));
            }else {
                result = gsonUtil.toJson(new JsonOutputVo(Status.데이터없음, null, new PagingVo(pImageBroadcastListInputVo.getTotalCnt(), pImageBroadcastListInputVo.getPageStart(), pImageBroadcastListInputVo.getPageCnt())));
            }

        }catch (Exception e){
            e.printStackTrace();
            result = gsonUtil.toJson(new JsonOutputVo(Status.비즈니스로직오류));
        }

        return result;
    }

    /**
     * broadcast 이미지 초기화 조회
     */
    @Transactional(readOnly = true)
    public String getBroadcastReset(P_MemberReportVo pMemberReportVo, String room_no) throws GlobalException {

        try {
            //배경 초기화
            P_BroadcastEditInputVo pBroadcastEditInputVo = new P_BroadcastEditInputVo();
            pBroadcastEditInputVo.setRoom_no(room_no);
            pBroadcastEditInputVo.setMem_no(pMemberReportVo.getMem_no());
            pBroadcastEditInputVo.setForceExit("0");
            int random = Integer.parseInt(DalbitUtil.randomBgValue());
            pBroadcastEditInputVo.setBackgroundImage(Code.포토_배경_디폴트_PREFIX.getCode() + "/" + Code.배경이미지_파일명_PREFIX.getCode() + "200310_" + random + ".jpg");

            String result = broBroadcastService.callBroadcastEdit(pBroadcastEditInputVo);
            log.debug(result);

            // 방송방 수정 성공여부 확인
            JsonParser parser = new JsonParser();
            JsonElement element;
            element = parser.parse(result);
            String codeResult = element.getAsJsonObject().get("code").getAsString();

            if(Status.방송방정보수정_성공.getMessageCode().equals(codeResult)) {
                //정지/경고 조치
                result = memMemberService.getMemberReport(pMemberReportVo);
                log.debug(result);

                result = gsonUtil.toJson(new JsonOutputVo(Status.이미지초기화성공));
                return result;
            } else if(Status.방송방정보수정_방번호없음.getMessageCode().equals(codeResult)) {
                return gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_방번호없음));
            } else if(Status.방송방정보수정_종료된방.getMessageCode().equals(codeResult)) {
                return gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_종료된방));
            } else {
                return gsonUtil.toJson(new JsonOutputVo(Status.방송방정보수정_에러));
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new GlobalException(ErrorStatus.서버처리중오류);
        }
    }
}
