package com.dalbit.common.code;

import lombok.Getter;

@Getter
public enum Status {

    //공통
    조회("C001", "select.success", "조회"),
    수정("C002", "update.success", "수정"),
    생성("C003", "insert.success", "생성"),
    삭제("C004", "delete.success", "삭제"),
    파라미터오류("C005", "param.error", "파라미터 오류 시"),
    비즈니스로직오류("C006", "business.error", "비즈니스로직 오류 시"),
    로그인필요("C007", "login.need", "로그인 세션이 없어 로그인 해야 할 때"),
    데이터없음("C008", "no.data", "데이터가 없을 시"),
    처리완료("C008", "operate.success", "처리완료 시"),
    권한없음("C009", "no.auth", "접근 권한이 없을 시"),

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

    //회원정보수정 내역 조회
    회원정보수정내역조회_성공("0", "member.editor.list.success", "회원정보 수정내역 조회 성공 시"),
    회원정보수정내역조회_실패("-1", "member.editor.list.fail", "회원정보 수정내역 조회 실패 시"),

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

    //Fanboard 보기
    Fanboard목록보기성공("0", "fanboard.list.view.success", "Fanboard 목록보기 성공 시"),
    Fanboard목록보기실패("C006", "fanboard.list.view.fail", "Fanboard 목록보기 실패 시"),

    //Fanboard 보기
    Fanboard삭제성공("0", "fanboard.list.del.success", "Fanboard 삭제 성공 시"),
    Fanboard삭제실패("C006", "fanboard.list.del.fail", "Fanboard 삭제 실패 시"),

    //Fanboard reply 보기
    FanboardReply목록보기성공("0", "fanboard.reply.list.view.success", "Fanboard Reply 보기 성공 시"),
    FanboardReply목록보기실패("C006", "fanboard.reply.list.view.fail", "Fanboard Reply 보기 실패 시"),

    //개별/방송 중 공지
    공지보기성공("0", "notice.list.view.success", "공지보기 성공 시"),
    공지보기실패("C006", "notice.list.view.fail", "공지보기 실패 시"),

    //금지어
    금지어목록보기성공("0", "banword.list.view.success", "금지어목록보기 성공 시"),
    금지어목록보기실패("C006", "banword.list.view.fail", "금지어목록보기 실패 시"),

    //신고/1:1문의
    신고문의보기성공("0", "report.list.view.success", "신고문의보기 성공 시"),
    신고문의보기실패("C006", "report.list.view.fail", "신고문의보기 실패 시"),

    //1:1문의
    문의목록조회_성공("0", "question.list.view.success", "1:1문의보기 성공 시"),
    문의목록조회_실패("C006", "question.list.view.fail", "1:1문의보기 실패 시"),

    //회원접속기록
    회원접속기록보기성공("0", "connect.list.view.success", "회원접속기록보기 성공 시"),
    회원접속기록보기실패("C006", "connect.list.view.fail", "회원접속기록보기 실패 시"),

    //회원로그인ID변경
    회원로그인ID변경_성공("0", "member.edit.socialId.success", "회원로그인ID변경 성공 시"),
    회원로그인ID변경_중복("1", "member.edit.socialId.duplicate", "회원로그인ID변경 중복 시"),
    회원로그인ID변경_실패("-1", "member.edit.socialId.fail", "회원로그인ID변경 실패 시"),

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

    //회원탈퇴
    회원탈퇴_성공("0", "member.withdrawal.success", "회원탈퇴 성공 시"),
    회원탈퇴_회원아님("-1", "member.withdrawal.member.number.error", "요청회원번호 회원 아닐 시"),
    회원탈퇴_이미탈퇴("-2", "member.withdrawal.already", "이미 탈퇴한 회원일 시"),
    회원탈퇴_방접속중("-3", "member.withdrawal.playing", "방송방 접속중일 시"),
    회원탈퇴_실패("C006", "member.withdrawal.fail", "회원탈퇴 실패 시"),

    //신고센터
    신고목록조회_데이터없음("0", "no.data", "신고목록 조회 데이터가 없을 시"),
    신고목록조회_성공("C001", "select.success", "신고목록 조회 시"),
    신고목록조회_에러("C006", "server.error", "신고목록 조회에서 에러 발생 시"),

    신고상세조회_성공("0", "select.success", "신고목록 상세조회 시"),
    신고상세조회_공지번호없음("-1", "no.data", "신고목록 조회 데이터가 없을 시"),
    신고상세조회_에러("C006", "server.error", "신고상세 조회에서 에러 발생 시"),

    신고처리_성공("0", "operate.success", "신고처리 성공 시"),
    신고처리_신고번호없음("-1", "no.data", "신고번호가 없을 시"),
    신고처리_이미처리되었음("-2", "server.error", "신고처리가 이미 되었을 시"),
    신고처리_에러("C006", "server.error", "신고처리에서 에러 발생 시"),

    신고처리내역수조회_성공("0", "select.success", "신고처리 내역 건수 조회에서 성공 시"),
    신고처리내역수조회_에러("C006", "server.error", "신고처리 내역 건수 조회에서 에러 발생 시"),


    //1:1 문의 상세 조회
    일대일문의상세조회_성공("0", "select.success", "1:1문의 상세조회 성공 시"),
    일대일문의상세조회_문의번호없음("-1", "no.data", "1:1문의 상세조회에서 문의 번호가 없을 시"),
    일대일문의상세조회_에러("C006", "server.error", "1:1문의 상세조회에서 에러 발생 시"),

    //1:1문의 처리하기
    일대일문의처리_성공("0", "operate.success", "1:1문의 처리 성공 시"),
    일대일문의처리_문의번호없음("-1", "no.data", "1:1문의 처리에서 문의 번호가 없을 시"),
    일대일문의처리_이미처리됐음("-2", "server.error", "1:1문의 처리에서 이미 처리된 문의일 시"),
    일대일문의처리_에러("C006", "server.error", "1:1문의 처리에서 에러 발생 시"),

    //방송방 상세 정보
    방송방상세조회_성공("0", "select.success", "방송방 상세 조회 성공 시"),
    방송방상세조회_공지번호없음("-1", "no.data", "방번호가 없을 시"),
    방송방상세조회_에러("C006", "server.error", "방송방 상세 조회에서 에러 발생 시"),

    //방송방 정보 수정
    방송방정보수정_성공("0", "update.success", "방송방 정보 수정 성공 시"),
    방송방정보수정_방번호없음("-1", "no.data", "방송방 정보 수정에서 방번호가 없을 시"),
    방송방정보수정_종료된방("-2", "no.data", "방송방 정보 수정에서 방송방이 종료되었을 시"),
    방송방정보수정_에러("C006", "server.error", "방송방 정보 수정에서 에러 발생 시"),

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

    //생방송 청취자 강제퇴장
    생방청취자강제퇴장_성공("0", "broadcast.listen.forced.success", "생방송 청취자 강제퇴장 성공 시"),
    생방청취자강제퇴장_회원아님("-1", "broadcast.listen.forced.no.member", "생방송 청취자 강제퇴장 회원 아닐 시"),
    생방청취자강제퇴장_방없음("-2", "broadcast.listen.forced.no.room", "생방송 청취자 강제퇴장 방 없을 시"),
    생방청취자강제퇴장_종료된방("-3", "broadcast.listen.forced.end.room", "생방송 청취자 강제퇴장 종료된 방일 시"),
    생방청취자강제퇴장_청취자아님("-4", "broadcast.listen.forced.no.listener", "생방송 청취자 강제퇴장 청취자 아닐 시"),
    생방청취자강제퇴장_퇴장한회원("-5", "broadcast.listen.forced.no.forced", "생방송 청취자 강제퇴장 이미 퇴장한 회원 일 시"),

    //생방송 좋아요 목록 보기
    생방송_좋아요목록조회_성공("0", "broadcast.like.list.view.success", "생방송 좋아요 목록 조회 성공 시"),
    생방송_좋아요목록조회_실패("-1", "broadcast.like.list.view.fail", "생방송 좋아요 목록 조회 데이터 없을 시"),

    //생방송 선물 목록 보기
    생방송_선물목록조회_성공("0", "broadcast.gift.list.view.success", "생방송 선물 목록 조회 성공 시"),
    생방송_선물목록조회_실패("-1", "broadcast.gift.list.view.fail", "생방송 선물 목록 조회 데이터 없을 시"),

    //생방송 사연 목록 보기
    생방송_사연목록조회_성공("0", "broadcast.story.list.view.success", "생방송 사연 목록 조회 성공 시"),
    생방송_사연목록조회_실패("-1", "broadcast.story.list.view.fail", "생방송 사연 목록 조회 데이터 없을 시"),

    //생방송 사연 삭제
    생방송_사연삭제_성공("0", "broadcast.story.del.success", "생방송 사연 삭제 성공 시"),
    생방송_사연삭제_번호없음("-1", "broadcast.story.del.no.index", "생방송 사연 삭제 방반호 없을 시"),
    생방송_사연삭제_방번호틀림("-2", "broadcast.story.del.fail", "생방송 사연 삭제 방번호 틀릴 시"),

    //생방송 채팅 목록 보기
    생방송_채팅목록조회_성공("0", "broadcast.chat.list.view.success", "생방송 채팅 목록 조회 성공 시"),
    생방송_채팅목록조회_실패("-1", "broadcast.chat.list.view.fail", "생방송 채팅 목록 조회 방번호 없을 시"),


    //푸시 조회
    푸시조회_데이터없음("0", "no.data", "푸시 조회 데이터가 없을 시"),
    푸시조회_성공("C001", "select.success", "푸시 조회 성공 시"),
    푸시조회_에러("C006", "server.error", "푸시 조회에서 에러 발생 시"),
    //푸시 상세조회
    푸시상세조회_성공("0", "select.success", "푸시 상세조회 성공 시"),
    푸시상세조회_상품코드없음("-1", "no.data", "푸시 상세조회에서 상품코드가 없을 시"),
    푸시상세조회_에러("C006", "server.error", "푸시 상세조회에서 에러 발생 시"),
    //푸시 등록
    푸시등록_성공("0","insert.push.success", "푸시등록 성공 시"),
    푸시등록_에러("C006", "server.error", "푸시등록 실패 시"),
    //푸시 발송
    푸시발송_성공("0","insert.success", "푸시발송 성공 시"),
    푸시발송_요청회원번호미존재("-1","insert.push.not.member", "요청회원번호 미존재 시"),
    푸시발송_디바이스토큰미존재("-2","insert.push.not.token", "디바이스토큰 미존재 시"),
    푸시발송_에러("C006", "server.error", "푸시발송 실패 시"),
    //푸시 수정
    푸시수정_성공("0", "update.success", "푸시수정 성공 시"),
    푸시수정_실패("-1", "no.data", "푸시수정에서 푸시번호가 없을 시"),
    푸시수정_에러("C006", "server.error", "푸시수정에서 에러 발생 시"),
    //푸시 삭제
    푸시삭제_성공("0", "delete.success", "푸시삭제 성공 시"),
    푸시삭제_실패("-1", "no.data", "푸시삭제에서 푸시번호가 없을 시"),


    //충전아이템 조회
    충전아이템조회_데이터없음("0", "no.data", "충전아이템 조회 데이터가 없을 시"),
    충전아이템조회_성공("C001", "select.success", "충전아이템 조회 성공 시"),
    충전아이템조회_에러("C006", "server.error", "충전아이템 조회에서 에러 발생 시"),
    //충전아이템 상세조회
    충전아이템상세조회_성공("0", "select.success", "충전아이템 상세조회 성공 시"),
    충전아이템상세조회_상품코드없음("-1", "no.data", "충전아이템 상세조회에서 상품코드가 없을 시"),
    충전아이템상세조회_에러("C006", "server.error", "충전아이템 상세조회에서 에러 발생 시"),
    //충전아이템 등록
    충전아이템등록_성공("0","insert.success", "충전아이템등록 성공 시"),
    충전아이템등록_실패("C006", "server.error", "충전아이템등록 실패 시"),
    //충전아이템 수정
    충전아이템수정_성공("0", "update.success", "충전아이템수정 성공 시"),
    충전아이템수정_실패("-1", "no.data", "충전아이템수정에서 충전아이템번호가 없을 시"),
    충전아이템수정_에러("C006", "server.error", "충전아이템수정에서 에러 발생 시"),
    //충전아이템 삭제
    충전아이템삭제_성공("0", "delete.success", "충전아이템삭제 성공 시"),
    충전아이템삭제_실패("-1", "no.data", "충전아이템삭제에서 충전아이템번호가 없을 시"),

    //교환아이템 조회
    교환아이템조회_데이터없음("0", "no.data", "교환아이템 조회 데이터가 없을 시"),
    교환아이템조회_성공("C001", "select.success", "교환아이템 조회 성공 시"),
    교환아이템조회_에러("C006", "server.error", "교환아이템 조회에서 에러 발생 시"),
    //교환아이템 상세조회
    교환아이템상세조회_성공("0", "select.success", "교환아이템 상세조회 성공 시"),
    교환아이템상세조회_상품코드없음("-1", "no.data", "교환아이템 상세조회에서 상품코드가 없을 시"),
    교환아이템상세조회_에러("C006", "server.error", "교환아이템 상세조회에서 에러 발생 시"),
    //교환아이템 등록
    교환아이템등록_성공("0","insert.success", "교환아이템등록 성공 시"),
    교환아이템등록_플랫폼미선택("-1", "item.input.no.platform", "교환아이템등록에서 선택된 플랫폼이 없을 시"),
    교환아이템등록_IOS미지원("-2", "item.ios.not.supported", "교환아이템등록에서 IOS는 미지원."),
    교환아이템등록_실패("C006", "server.error", "교환아이템등록 실패 시"),
    //교환아이템 수정
    교환아이템수정_성공("0", "update.success", "교환아이템수정 성공 시"),
    교환아이템수정_아이템코드없음("-1", "no.data", "교환아이템수정에서 교환아이템번호가 없을 시"),
    교환아이템수정_플랫폼미선택("-2", "item.input.no.platform", "교환아이템수정에서 선택된 플랫폼이 없을 시"),
    교환아이템수정_IOS미지원("-3", "item.ios.not.supported", "교환아이템수정에서 IOS는 미지원."),
    교환아이템수정_에러("C006", "server.error", "교환아이템수정에서 에러 발생 시"),
    //교환아이템 삭제
    교환아이템삭제_성공("0", "delete.success", "교환아이템삭제 성공 시"),
    교환아이템삭제_실패("-1", "no.data", "교환아이템삭제에서 교환아이템번호가 없을 시"),

    선물아이템조회_데이터없음("0", "no.data", "선물아이템 조회 데이터가 없을 시"),
    선물아이템조회_성공("C001", "select.success", "선물아이템 조회 성공 시"),
    선물아이템조회_에러("C006", "server.error", "선물아이템 조회에서 에러 발생 시"),

    //선물아이템 상세조회
    선물아이템상세조회_성공("0", "select.success", "선물아이템 상세조회 성공 시"),
    선물아이템상세조회_상품코드없음("-1", "no.data", "선물아이템 상세조회에서 상품코드가 없을 시"),
    선물아이템상세조회_에러("C006", "server.error", "선물아이템 상세조회에서 에러 발생 시"),

    //선물아이템 등록
    선물아이템등록_성공("0","insert.success", "선물아이템등록 성공 시"),
    선물아이템등록_플랫폼미선택("-1", "item.input.no.platform", "선물아이템등록에서 플랫폼 선택 안됨"),
    선물아이템등록_아이템구분미선택("-2", "item.input.no.itemslct", "선물아이템등록에서 아이템구분 선택 안됨"),
    선물아이템등록_아이템가격미입력("-3", "item.input.no.itemprice", "선물아이템등록에서 가격 미입력"),
    선물아이템등록_지급별수량미입력("-4","item.input.no.byeol", "선물아이템등록에서 지급 별 미입력"),
    선물아이템등록_실패("C006", "server.error", "선물아이템등록 실패 시"),


    //선물아이템 수정
    선물아이템수정_성공("0", "update.success", "선물아이템수정 성공 시"),
    선물아이템수정_아이템코드미입력("-1", "item.input.no.itemcode", "선물아이템수정에서 선물아이템번호가 없을 시"),
    선물아이템수정_플랫폼미선택("-2", "item.input.no.platform", "선물아이템등록에서 플랫폼 선택 안됨"),
    선물아이템수정_아이템구분미선택("-3", "item.input.no.itemslct", "선물아이템등록에서 아이템구분 선택 안됨"),
    선물아이템수정_아이템가격미입력("-4", "item.input.no.itemprice", "선물아이템등록에서 가격 미입력"),
    선물아이템수정_지급별수량미입력("-5","item.input.no.byeol", "선물아이템등록에서 지급 별 미입력"),
    선물아이템수정_에러("C006", "server.error", "선물아이템수정에서 에러 발생 시"),

    //선물아이템 삭제
    선물아이템삭제_성공("0", "delete.success", "선물아이템삭제 성공 시"),
    선물아이템삭제_실패("-1", "no.data", "선물아이템삭제에서 선물아이템번호가 없을 시"),

    관리자권한부여_성공("A001", "auth.set.success", "어드민관리 관리자 권한 부여 성공 시"),
    관리자권한부여_임직원번호업음("A001", "auth.set.success", "권한 부여 시 임직원번호가 안넘어 왔을 시"),
    관리자권한부여_메뉴없음("A001", "auth.set.success", "권한 부여 시 메뉴번호가 안넘어 왔을 시"),
    관리자권한부여_실패("C006", "server.error", "어드민관리 > 권한 부여 성공 시"),

    테스트아이디_회원검색_결과없음("C008", "testid.member.notFound", "회원검색이 안되었을 때"),
    테스트아이디_이미등록된테스트아이디("C008", "testid.already.regist", "테스트아이디가 이미 등록이 되었을 때"),


    //배너 조회
    배너조회_데이터없음("0", "no.data", "배너 조회 데이터가 없을 시"),
    배너조회_성공("C001", "select.success", "배너 조회 성공 시"),
    배너조회_에러("C006", "server.error", "배너 조회에서 에러 발생 시"),
    //배너 상세조회
    배너상세조회_성공("0", "select.success", "배너 상세조회 성공 시"),
    배너상세조회_상품코드없음("-1", "no.data", "배너 상세조회에서 상품코드가 없을 시"),
    배너상세조회_에러("C006", "server.error", "배너 상세조회에서 에러 발생 시"),
    //배너 등록
    배너등록_성공("0","insert.success", "배너등록 성공 시"),
    배너등록_실패("C006", "server.error", "배너등록 실패 시"),
    //배너 수정
    배너수정_성공("0", "update.success", "배너수정 성공 시"),
    배너수정_실패("-1", "no.data", "배너수정에서 배너번호가 없을 시"),
    배너수정_에러("C006", "server.error", "배너수정에서 에러 발생 시"),
    //배너 삭제
    배너삭제_성공("0", "delete.success", "배너삭제 성공 시"),
    배너삭제_실패("-1", "no.data", "배너삭제에서 배너번호가 없을 시"),





    //---- 여기 밑으로는 API STATUS 복사 --------------
    //방송리스트
    방송리스트조회("C001", "broadcast.room.list.select.success", "방송리스트 정보 조회 성공 시"),
    방송리스트없음("0", "broadcast.room.list.no.success", "방송리스트가 없을 시"),
    방송리스트_회원아님("-1", "broadcast.room.list.member.number.no", "회원번호가 아닐 시"),
    방송리스트조회_실패("C006", "broadcast.room.list.select.fail", "방송리스트 정보 조회 실패 시"),

    //메인 DJ 랭킹
    메인_DJ랭킹조회_성공("C001", "main.dj.ranking.select.success", "DJ 랭킹 조회 성공 시"),
    메인_DJ랭킹조회_내역없음("0", "main.dj.ranking.no.ranking.success", "랭킹 내역 없을 시"),
    메인_DJ랭킹조회_요청회원_회원아님("-1", "main.dj.ranking.member.number.error", "요청회원번호가 회원 아닐 시"),
    메인_DJ랭킹조회_실패("C006", "main.dj.ranking.select.fail", "DJ 랭킹 조회 실패 시"),

    //메인 팬 랭킹
    메인_팬랭킹조회_성공("C001", "main.fan.ranking.select.success", "팬 랭킹 조회 성공 시"),
    메인_팬랭킹조회_내역없음("0", "main.fan.ranking.no.ranking.success", "랭킹 내역 없을 시"),
    메인_팬랭킹조회_요청회원_회원아님("-1", "main.fan.ranking.member.number.error", "요청회원번호가 회원 아닐 시"),
    메인_팬랭킹조회_실패("C006", "main.fan.ranking.select.fail", "팬 랭킹 조회 실패 시"),

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
