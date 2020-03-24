package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum Status {

    //공통
    조회("C001", "select.success", "조회"),
    수정("C002", "update.success", "수정"),
    생성("C003", "create.success", "생성"),
    삭제("C004", "delete.success", "삭제"),
    파라미터오류("C005", "param.error", "파라미터 오류 시"),
    비즈니스로직오류("C006", "business.error", "비즈니스로직 오류 시"),
    로그인필요("C007", "login.need", "로그인 세션이 없어 로그인 해야 할 때"),
    데이터없음("C008", "no.data", "데이터가 없을 시"),

    //로그인
    로그인성공("0", "login.success", "로그인 성공 시"),
    로그인실패_회원가입필요("1", "login.join.need", "회원가입 필요 시"),
    로그인실패_패스워드틀림("-1", "login.fail", "로그인 실패 시 - 아이디/비밀번호가 틀릴 시"),
    로그인실패_파라메터이상("-2", "param.error", "로그인 실패 시 - 파라메터이상"),
    로그인실패_API통신이상("-3", "login.api.error", "API 통신 오류"),

    //엑셀 다운로드
    엑셀다운로드성공("1", "excel.download.success", "엑셀 다운로드 성공 시"),
    엑셀다운로드실패("0", "excel.download.fail", "엑셀 다운로드 실패 시"),

    //회원정보보기 (프로필, 마이페이지 통합)
    회원정보보기_성공("0", "member.info.view.success", "회원정보보기 성공 시"),
    회원정보보기_회원아님("-1", "member.no", "회원이 아닐 시"),
    회원정보보기_대상아님("-2", "member.this.no", "대상 회원이 아닐 시 "),
    회원정보보기_실패("C006", "member.info.view.fail", "회원정보보기 실패 시"),

    //회원운영자 메모 등록
    회원운영자메모등록성공("0", "member.admin.memo.add.success", "회원 운영자 메모 등록 성공"),
    회원운영자메모등록실패("-1", "member.admin.memo.add.fail", "회원 운영자 메모 등록 실패"),

    //회원정보 메모 보기
    회원정보_메모정보보기_성공("0", "member.admin.memo.view.success", "회원 운영자 메모정보 보기 성공"),
    회원정보_메모정보보기_실패("-1", "member.admin.memo.view.fail", "회원 운영자 메모정보 정보 보기 실패"),
    //회원정보 접속정보 보기
    회원정보_접속정보보기_성공("0", "member.admin.connect.view.success", "회원 운영자 접속정보 보기 성공"),
    회원정보_접속정보보기_실패("-1", "member.admin.connect.view.fail", "회원 운영자 접속 정보 보기 실패"),
    //회원정보 매니저 보기
    회원정보_매니저정보보기_성공("0", "member.admin.manager.view.success", "회원 운영자 매니저 정보 보기 성공"),
    회원정보_매니저정보보기_실패("-1", "member.admin.manager.view.fail", "회원 운영자 매니저 정보 보기 실패"),
    //회원정보 블랙리스트 보기
    회원정보_블랙리스트정보보기_성공("0", "member.admin.blacklist.view.success", "회원 운영자 블랙리스트 정보 보기 성공"),
    회원정보_블랙리스트정보보기_실패("-1", "member.admin.blacklist.view.fail", "회원 운영자 블랙리스트 정보 보기 실패"),

    //회원정보 방송이력 보기
    회원정보_방송내역보기_성공("0", "member.admin.broadcast.view.success", "회원 운영자 방송내역 보기 성공"),
    회원정보_방송내역보기_실패("-1", "member.admin.broadcast.view.fail", "회원 운영자 방송내역 보기 실패"),
    //회원정보 청취이력 보기
    회원정보_청취내역보기_성공("0", "member.admin.listen.view.success", "회원 운영자 청취내역 보기 성공"),
    회원정보_청취내역보기_실패("-1", "member.admin.listen.view.fail", "회원 운영자 청취내역 보기 실패"),

    //회원정보수정
    회원정보수정성공("0", "member.editor.success", "회원 정보 수정 성공"),
    회원정보수정실패("-1", "member.editor.fail", "회원 정소 수정 실패"),

    //방송기록보기
    방송기록보기성공("0", "broadcast.list.view.success", "방송기록 보기 성공 시"),
    방송기록보기실패("C006", "broadcast.list.view.fail", "방송기록 보기 실패 시"),

    //청취기록보기
    청취기록보기성공("0", "listen.list.view.success", "청취기록 보기 성공 시"),
    청취기록보기실패("C006", "listen.list.view.fail", "청취기록 보기 실패 시"),

    //결제/환불내역 보기
    결제환불내역보기성공("0", "pay.list.view.success", "결제환불내역 보기 성공 시"),
    결제환불내역보기실패("C006", "pay.list.view.fail", "결제환불내역 보기 실패 시"),

    //선물내역보기
    선물내역보기성공("0", "gift.list.view.success", "선물내역 보기 성공 시"),
    선물내역보기실패("C006", "gift.list.view.fail", "선물내역 보기 실패 시"),

    //환전내역보기
    환전내역보기성공("0", "exchange.list.view.success", "환전내역 보기 성공 시"),
    환전내역보기실패("C006", "exchange.list.view.fail", "환전내역 보기 실패 시"),

    //MyStar 목록 보기
    MyStar목록보기성공("0", "myStar.list.view.success", "MyStar 목록보기 성공 시"),
    MyStar목록보기실패("C006", "myStar.list.view.fail", "MyStar 목록보기 실패 시"),

    //Fan 목록 보기
    Fan목록보기성공("0", "fan.list.view.success", "Fan 목록보기 성공 시"),
    Fan목록보기실패("C006", "fan.list.view.fail", "Fan 목록보기 실패 시"),

    //개별/방송 중 공지
    공지보기성공("0", "notice.list.view.success", "공지보기 성공 시"),
    공지보기실패("C006", "notice.list.view.fail", "공지보기 실패 시"),

    //신고/1:1문의
    신고문의보기성공("0", "report.list.view.success", "신고문의보기 성공 시"),
    신고문의보기실패("C006", "report.list.view.fail", "신고문의보기 실패 시"),

    //회원접속기록
    회원접속기록보기성공("0", "connect.list.view.success", "회원접속기록보기 성공 시"),
    회원접속기록보기실패("C006", "connect.list.view.fail", "회원접속기록보기 실패 시"),

    //프로시저 연동 부분
    공지사항조회_데이터없음("0", "no.data", "공지사항 조회 데이터가 없을 시"),
    공지사항조회_성공("C001", "select.success", "공지사항 조회 성공 시"),
    공지사항조회_에러("C006", "server.error", "공지사항 조회에서 에러 발생 시"),

    공지상세조회_성공("0", "select.success", "공지사항 상세조회 성공 시"),
    공지상세조회_공지번호없음("-1", "no.data", "공지사항 상세조회에서 공지번호가 없을 시"),
    공지상세조회_에러("C006", "server.error", "공지사항 상세조회에서 에러 발생 시"),

    공지등록_성공("0","insert.success", "공지등록 성공 시"),
    공지등록_실패("C006", "server.error", "공지등록 실패 시"),

    공지수정_성공("0", "update.success", "공지수정 성공 시"),
    공지수정_실패("-1", "no.data", "공지수정에서 공지번호가 없을 시"),
    공지수정_에러("C006", "server.error", "공지수정에서 에러 발생 시"),

    공지삭제_성공("0", "delete.success", "공지삭제 성공 시"),
    공지삭제_실패("-1", "no.data", "공지삭제에서 공지번호가 없을 시"),

    //FAQ
    FAQ조회_데이터없음("0", "no.data", "FAQ 조회 데이터가 없을 시"),
    FAQ조회_성공("C001", "select.success", "FAQ 조회 시"),
    FAQ조회_에러("C006", "server.error", "FAQ 조회에서 에러 발생 시"),

    FAQ상세조회_성공("0", "select.success", "FAQ 상세조회 시"),
    FAQ상세조회_FAQ번호없음("-1", "no.data", "FAQ 조회 데이터가 없을 시"),

    FAQ등록성공("0","insert.success", "FAQ등록 성공 시"),
    FAQ등록실패("C006", "server.error", "FAQ등록 실패 시"),

    FAQ수정성공("0", "update.success", "FAQ수정 성공 시"),
    FAQ수정실패("C006", "server.error", "FAQ수정 실패 시"),

    FAQ삭제성공("0", "delete.success", "FAQ삭제 성공 시"),
    FAQ삭제실패("C006", "server.error", "FAQ삭제 실패 시"),

    //신고목록
    신고목록조회_데이터없음("0", "no.data", "신고목록 조회 데이터가 없을 시"),
    신고목록조회_성공("C001", "select.success", "신고목록 조회 시"),
    신고목록조회_에러("C006", "server.error", "신고목록 조회에서 에러 발생 시"),

    신고상세조회_성공("0", "select.success", "신고목록 상세조회 시"),
    신고상세조회_공지번호없음("-1", "no.data", "신고목록 조회 데이터가 없을 시"),
    신고상세조회_에러("C006", "server.error", "신고상세 조회에서 에러 발생 시"),

    신고처리_성공("0", "update.success", "신고처리 성공 시"),
    신고처리_신고번호없음("-1", "no.data", "신고번호가 없을 시"),
    신고처리_이미처리되었음("-2", "server.error", "신고처리가 이미 되었을 시"),
    신고처리_에러("C006", "server.error", "신고처리에서 에러 발생 시"),

    신고처리내역수조회_성공("0", "select.success", "신고처리 내역 건수 조회에서 성공 시"),
    신고처리내역수조회_에러("C006", "server.error", "신고처리 내역 건수 조회에서 에러 발생 시"),

    //방송방 상세 정보
    방송방상세조회_성공("0", "select.success", "방송방 상세 조회 성공 시"),
    방송방상세조회_공지번호없음("-1", "no.data", "방번호가 없을 시"),
    방송방상세조회_에러("C006", "server.error", "방송방 상세 조회에서 에러 발생 시"),

    //방송방 정보수정 내역 조회
    방송방수정내역조회_성공("C001", "select.success", "방송방 수정내역 조회 성공 시"),
    방송방수정내역조회_데이터없음("0", "no.data", "방송방 수정내역 조회 데이터 없을 시"),
    방송방수정내역조회_방번호없음("-1", "server.error", "방번호가 없을 시"),
    방송방수정내역조회_에러("C006", "server.error", "방송방 수정내역 조회에서 에러 발생 시"),

    //생방송 목록 보기
    생방송목록조회_성공("0", "broadcast.list.view.success", "생방송 목록 조회 성공 시"),
    생방송목록조회_에러("-1", "broadcast.list.view.fail", "생방송 목록 조회 데이터 없을 시"),

    //생방송 목록 보기
    생방송_청취자목록조회_성공("0", "broadcast.listen.list.view.success", "생방송 청취자 목록 조회 성공 시"),
    생방송_청취자목록조회_실패("-1", "broadcast.listen.list.view.fail", "생방송 청취자 목록 조회 데이터 없을 시"),

    ;

    final private String RESULT_SUCCESS = "success";
    final private String RESULT_FAIL = "fail";

    final private String result;
    final private String messageCode;
    final private String messageKey;
    final private String desc;

    Status(String messageCode, String messageKey, String desc){
        this.result = messageKey.contains("success") ? RESULT_SUCCESS : RESULT_FAIL;;
        this.messageCode = messageCode;
        this.messageKey = messageKey;
        this.desc = desc;
    }
}
