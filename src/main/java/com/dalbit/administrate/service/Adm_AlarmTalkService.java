package com.dalbit.administrate.service;

import com.dalbit.administrate.dao.AlarmTalkDao;
import com.dalbit.administrate.vo.AlarmTalkValVo;
import com.dalbit.administrate.vo.procedure.*;
import com.dalbit.common.code.AlarmTalkTemplate;
import com.dalbit.common.code.Code;
import com.dalbit.common.vo.ProcedureVo;
import com.dalbit.common.vo.SearchVo;
import com.dalbit.inforex.vo.InforexMember;
import com.dalbit.util.DalbitUtil;
import com.dalbit.util.GsonUtil;
import com.dalbit.util.RestApiUtil;
import com.google.common.collect.Lists;
import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Slf4j
@Service
public class AlarmTalkService {

    @Autowired
    AlarmTalkDao alarmTalkDao;

    @Autowired
    Adm_AuthorityService admAuthorityService;

    @Autowired
    GsonUtil gsonUtil;

    @Value("${alarmtalk.profile}")
    String ALARMTALK_PROFILE;
    @Value("${alarmtalk.userid}")
    String ALARMTALK_USER_ID;
    @Value("${alarmtalk.url}")
    String ALARMTALK_URL;

    private static int restApiTimeout;

    @Value("${rest.api.timeout}")
    public void setRestApiTimeout(int timeoutSecond){
        restApiTimeout = timeoutSecond;
    }


    /** 알림톡 발송 대상 리스트 */
    public List<P_AlarmTalkListOutputVo> callAlarmTalkTargetList(SearchVo searchVo) {

        List<P_AlarmTalkListOutputVo> resultMemberList = new ArrayList<>();
        // 검색조건 대상자 조회
        List<InforexMember> memberList = admAuthorityService.getInforexMemberList(searchVo);
        // 알림톡 발송 대상 리스트 조회
        List<P_AlarmTalkTargetListOutputVo> targetList =  alarmTalkDao.callAlarmTalkTarget();

        // 검색 조건에 알림톡 발송 대상 여부 체크
        for (InforexMember member : memberList) {
            P_AlarmTalkListOutputVo target = (P_AlarmTalkListOutputVo) member;
            target.setAlarmTalkTarget(targetList.stream().filter(inforexMember -> inforexMember.getEmp_no().equals(target.getEmp_no())).collect(Collectors.toList()).size());
            resultMemberList.add(target);
        }

        return resultMemberList;
    }


    /** 통계 알림톡 발송 */
    public void callSpStatGetData() {
        ProcedureVo procedureVo = new ProcedureVo();
        List<P_AlarmTalkInsertVo> sendList = new ArrayList<>();

        try {
            // 변수 데이터 조회
            alarmTalkDao.callSpStatGetData(procedureVo);

            if(!DalbitUtil.isEmpty(procedureVo.getRet())){// 성공
                log.info("[AlarmTalk] 통계 조회 성공 : {}", procedureVo.getRet());
                String tmpId = AlarmTalkTemplate.알림톡_달빛라이브_직원관리용_CONT1.getId();
                String msg = AlarmTalkTemplate.알림톡_달빛라이브_직원관리용_CONT1.getMsg();

                AlarmTalkValVo alarmTalkValVo = new Gson().fromJson(procedureVo.getRet(), AlarmTalkValVo.class);
                msg = msg.replace("#{1}", alarmTalkValVo.getWeb_male_cnt());
                msg = msg.replace("#{2}", alarmTalkValVo.getWeb_female_cnt());
                msg = msg.replace("#{3}", alarmTalkValVo.getMobile_male_cnt());
                msg = msg.replace("#{4}", alarmTalkValVo.getMobile_female_cnt());
                msg = msg.replace("#{5}", alarmTalkValVo.getConnect_member_cnt());
                msg = msg.replace("#{6}", alarmTalkValVo.getConnect_nonmem_cnt());
                msg = msg.replace("#{7}", alarmTalkValVo.getConnect_30_cnt());
                msg = msg.replace("#{8}", alarmTalkValVo.getConnect_10_cnt());
                msg = msg.replace("#{9}", alarmTalkValVo.getBroadcast_create_cnt());
                msg = msg.replace("#{10}", alarmTalkValVo.getBroadcast_listener_cnt());
                msg = msg.replace("#{11}", alarmTalkValVo.getPayment_cnt());
                msg = msg.replace("#{12}", alarmTalkValVo.getPayment_cnt());
                msg = msg.replace("#{13}", alarmTalkValVo.getDal_pay_amt());
                msg = msg.replace("#{14}", alarmTalkValVo.getDal_use_amt());


                //발송 대상 조회
                List<P_AlarmTalkTargetListOutputVo> targetList =  alarmTalkDao.callAlarmTalkTarget();

                if(targetList.size() <= 0){
                    log.debug("[AlarmTalk] 발송 대상 미존재");
                    return;
                }

                String result = RestApiUtil.sendGet(DalbitUtil.getProperty(Code.인포렉스_임직원목록.getDesc()));
                InforexMember[] inforexMembers = new Gson().fromJson(result, InforexMember[].class);
                List<InforexMember> memberList = Arrays.asList(inforexMembers);

                for(int idx=0; idx < targetList.size(); idx++){
                    P_AlarmTalkTargetListOutputVo target = targetList.get(idx);
                    List<InforexMember> inforexMemberList = memberList.stream()
                                .filter(inforexMember -> inforexMember.getEmp_no().equals(target.getEmp_no()))
                                .collect(Collectors.toList());

                    // 어드민 계정 검증
                    if(inforexMemberList.size() <= 0){
                        log.error("[AlarmTalk] 어드민 계정 미존재 [emp_no : {}]", target.getEmp_no());
                        continue;
                    }

                    InforexMember member = inforexMemberList.get(0);

                    String targetPhone = DalbitUtil.convertInternationalPhone(member.getStaff_hphone(), "82");
                    if(targetPhone == null){
                        log.error("[AlarmTalk] 핸드폰번호 비정상 [phone : {} / {}]", member.getStaff_hphone(), targetPhone);
                        continue;
                    }

                    P_AlarmTalkInsertVo pAlarmTalkInsertVo = new P_AlarmTalkInsertVo();
                    pAlarmTalkInsertVo.setEmp_no(member.getEmp_no());
                    pAlarmTalkInsertVo.setUserid(ALARMTALK_USER_ID);
                    pAlarmTalkInsertVo.setMessage_type("at");
                    pAlarmTalkInsertVo.setPhn(targetPhone);
                    pAlarmTalkInsertVo.setProfile(ALARMTALK_PROFILE);
                    pAlarmTalkInsertVo.setTmplId(tmpId);
                    pAlarmTalkInsertVo.setMsg(msg);
                    pAlarmTalkInsertVo.setReserveDt("00000000000000");   // 즉시발송

                    sendList.add(pAlarmTalkInsertVo);
                }

                if(sendList.size() > 0){
                    // 알림톡 발송 요청
                    sendAlarmTalk(sendList, null);
                }else{
                    log.debug("[AlarmTalk] 정상 발송 대상 미존재");
                }

                /* TEST
                P_AlarmTalkInsertVo a = new P_AlarmTalkInsertVo();
                a.setEmp_no("1111");
                a.setUserid(ALARMTALK_USER_ID);
                a.setMessage_type("at");
                a.setPhn("821045990513");
                a.setProfile(ALARMTALK_PROFILE);
                a.setTmplId(tmpId);
                a.setMsg(msg);
                a.setReserveDt("00000000000000");

                sendList.add(a);

                a = new P_AlarmTalkInsertVo();
                a.setEmp_no("2222");
                a.setUserid(ALARMTALK_USER_ID);
                a.setMessage_type("at");
                a.setPhn("01045990513");
                a.setProfile(ALARMTALK_PROFILE);
                a.setTmplId(tmpId);
                a.setMsg(msg);
                a.setReserveDt("00000000000000");

                sendList.add(a);

                a = new P_AlarmTalkInsertVo();
                a.setEmp_no("3333");
                a.setUserid(ALARMTALK_USER_ID);
                a.setMessage_type("at");
                a.setPhn("444");
                a.setProfile(ALARMTALK_PROFILE);
                a.setTmplId(tmpId);
                a.setMsg(msg);
                a.setReserveDt("00000000000000");

                sendList.add(a);

                //알림톡 발송 요청 시작  //100건씩 끊어서 발송 필요
                sendAlarmTalk(sendList, null);
                */
            }else{
                log.error("[AlarmTalk] 통계 조회 실패 : {}", procedureVo.getRet());
            }

        }catch (Exception e){
            e.printStackTrace();
            log.error("[AlarmTalk] 발송 에러 : {}", e.getMessage());
        }
    }


    public void sendAlarmTalk(List<P_AlarmTalkInsertVo> sendList, String opName){
        // 발송 그룹 키
        String group_idx = DalbitUtil.randomValueDatetime(3);

        /** 최대 알림 톡 발송 건수가 100건이므로 나눠서 발송 요청 */
        List<List<P_AlarmTalkInsertVo>> partSendList = Lists.partition(sendList, 100);
        for(List<P_AlarmTalkInsertVo> part :partSendList){
            StringBuilder result = new StringBuilder();
            String jsonMessage = new Gson().toJson(part);
            P_AlarmTalkLogInsertVo pAlarmTalkLogInsertVo = new P_AlarmTalkLogInsertVo();
            pAlarmTalkLogInsertVo.setGroup_idx(group_idx);
            pAlarmTalkLogInsertVo.setSendList(part);
            pAlarmTalkLogInsertVo.setOp_name(DalbitUtil.isEmpty(opName) ? "관리자" : opName);

            // 발송로그 적재
            alarmTalkDao.callAlarmTalkLogAdd(pAlarmTalkLogInsertVo);

            // 발송요청
            try {
                String sendURL = ALARMTALK_URL + "/v2/sender/send";

                URL url = new URL(sendURL);
                HttpURLConnection con = (HttpURLConnection) url.openConnection();
                con.setRequestMethod("POST");
                con.setRequestProperty("Content-Type", "application/json");
                con.setRequestProperty("userid", ALARMTALK_USER_ID);
                con.setDoInput(true);
                con.setDoOutput(true);
                con.setUseCaches(false);
                con.setDefaultUseCaches(false);

                con.setConnectTimeout(restApiTimeout); //서버에 연결되는 Timeout 시간 설정
                con.setReadTimeout(restApiTimeout); // InputStream 읽어 오는 Timeout 시간 설정

                OutputStream outputStream = con.getOutputStream();
                outputStream.write(jsonMessage.getBytes("UTF-8"));
                outputStream.flush();

                if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
                    BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream(), "utf-8"));
                    String line;
                    while ((line = br.readLine()) != null) {
                        result.append(line);
                    }
                    br.close();

                    log.debug(result.toString());

                    JSONArray jsonArr = new JSONArray(result.toString());

                    for (int i = 0; i < jsonArr.length(); i++) {
                        JSONObject jsonObj = jsonArr.getJSONObject(i);
                        JSONObject  data = jsonObj.getJSONObject("data");

                        if(data.get("phn") != null && !data.get("phn").equals("")){
                            P_AlarmTalkLogUpdateVo resultLog = new P_AlarmTalkLogUpdateVo();
                            resultLog.setGroup_idx(group_idx);
                            resultLog.setPhn(data.get("phn").toString());
                            resultLog.setResult_code(jsonObj.get("code").toString());
                            resultLog.setResult_cont(jsonObj.toString());

                            alarmTalkDao.callAlarmTalkLogUpdate(resultLog);
                        }

                        if(jsonObj.get("code").equals("fail")){
                            //실패 로그
                            log.error(jsonObj.toString());
                        }else{
                            log.info(jsonObj.toString());
                        }
                    }
                } else {
                    result.append(con.getResponseMessage());

                    P_AlarmTalkLogUpdateVo resultLog = new P_AlarmTalkLogUpdateVo();
                    resultLog.setGroup_idx(group_idx);
                    resultLog.setResult_code("-9");
                    resultLog.setResult_cont(result.toString());

                    alarmTalkDao.callAlarmTalkLogUpdate(resultLog);
                }

                log.debug("[AlarmTalk] 발송 요청 결과 : {}", result.toString());

            } catch (Exception e){
                e.printStackTrace();
                result.append(e.getMessage());

                log.error("[AlarmTalk] 발송 요청 에러 : {}", result.toString());
            }
        }
    }


}
