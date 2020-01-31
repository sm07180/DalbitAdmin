<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1>회원관리>리스트</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>

            <!-- /.row well-->
            <div class="row well">
                <!-- /.1 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">기본정보</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_name">이름</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_nickNeme">닉네임</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_phon">휴대전화</label>
                        <label class="checkbox-inline"><input type="checkbox" id="check_mail">이메일</label>
                    </div>
                </div>
                <!-- /.1 row -->
                <!-- /.2 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">생년월일</label>
                        <div class="input-group date col-sm-2" id="date_birth">
                            <input type="text" class="form-control" id="txt_birth"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <label>* 달력에서 년/월/일을 선택</label>
                        <label>또는 직접 작성하여 입력할 수 있습니다.</label>
                    </div>
                </div>
                <!-- /.2 row -->
                <!-- /.3 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">가입일</label>
                        <div class="input-group date col-sm-2" id="date_stJoin">
                            <input type="text" class="form-control" id="txt_stJoin"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                        <label>~</label>
                        <div class="input-group date col-sm-2" id="date_edJoin">
                            <input type="text" class="form-control" id="txt_etJoin"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <!-- /.3 row -->
                <!-- /.4 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width: 10%">방송/청취정보</label>
                        <div class="input-group col-sm-2"><input type="text" class="form-control" id="txt_stTime"></div>
                        <label>시 ~</label>
                        <div class="input-group col-sm-2"><input type="text" class="form-control" id="txt_edTime"></div>
                        <label>시</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_all" value="option1" checked="true">전체</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_dj" value="option2">DJ</label>
                        <label class="radio-inline"><input type="radio" name="broad" id="radio_listener" value="option3">청취자</label>
                    </div>
                </div>
                <!-- /.4 row -->
                <!-- /.5 row -->
                <div class="row">
                    <div class="form-group form-inline">
                        <label style="width:10%">생방여부</label>
                        <label class="radio-inline"><input type="radio" name="live" id="radio_liveAll" value="option1" checked="true">전체</label>
                        <label class="radio-inline"><input type="radio" name="live" id="radio_liveOn" value="option2">생방송ON</label>
                        <label class="radio-inline"><input type="radio" name="live" id="radio_liveOff" value="option3">생방송OFF</label>
                    </div>
                </div>
                <!-- /.5 row -->
                <!-- /.6 row -->
                <div align="right">
                    <label><input type="text" class="form-control" id="txt_search"></label>
                    <button type="submit" class="btn btn-default">검색</button>
                </div>
                <!-- /.6 row -->
            </div>
            <!-- /.row well-->

            <div class="row" align="right">
                <input type="submit" class="btn btn-default" id="bt_list" value="리스트"></input>
                <input type="submit" class="btn btn-default" id="bt_edit" value="수정완료"></input>
            </div>
            <div class="row">
                <div class="col-md-3" align="right">
                    <div align="center">
                        <img src="../../../template2/assets/img/profile-avatar.png" alt="Profile Picture" />
                    </div>
                    <div align="center">
                        <button type="submit" class="btn btn-default" id="bt_imgChg">사진변경</button> <button type="submit" class="btn btn-default" id="br_imgDel">사진삭제</button>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="col-md-12">
                        <div class="basic-info col-md-4">
                            <p class="data-row">
                                <span class="data-name" style="width: 100px">이름</span>
                                <input type="text" class="bootstrap-slider" id="txt_name" value="양위디" style="width: 35%">
                                <button type="button" id="bt_nameEdit" class="btn btn-primary btn-xs"  style="border-radius:3px;width: 25%;">수정하기</button>
                            </p>
                        </div>
                        <div class="basic-info col-md-2">
                            <p class="data-row"><span class="data-name" style="width: 100px">나이</span><span class="data-value" >22세</span></p>
                        </div>
                        <div class="basic-info col-md-6">
                            <p class="data-row">
                                <span class="data-name" style="width: 100px">성별</span>
                                <%--<span class="data-value" style="width: 60%">남</span>--%>
                                <label class="control-inline fancy-radio">
                                    <input type="radio" name="inline-radio" checked>
                                    <span><i></i>남</span>
                                </label>
                                <label class="control-inline fancy-radio">
                                    <input type="radio" name="inline-radio">
                                    <span><i></i>여</span>
                                </label>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="basic-info col-md-4">
                            <p class="data-row">
                                <span class="data-name" style="width: 100px">닉네임</span>
                                <input type="text" class="bootstrap-slider" id="txt_nickName" value="위디위디" style="width: 35%">
                                <button type="button" id="bt_nickCheck" class="btn btn-primary btn-xs"  style="border-radius:3px;width: 25%;">중복체크</button>
                            </p>
                        </div>
                        <div class="basic-info col-md-2">
                            <p class="data-row"><span class="data-name" style="width: 100px">레벨</span><span class="data-value">52</span></p>
                        </div>
                        <div class="basic-info col-md-6">
                            <p class="data-row">
                                <span class="data-name" style="width: 100px">휴대폰번호</span>
                                <input type="text" class="bootstrap-slider" id="txt_phon" value="010-9999-0000" style="width: 25%">
                                <input type="text" class="bootstrap-slider" id="txt_authNumber" placeholder="인증번호" value="" style="width: 15%">
                                <label id="lb_authNumber"></label>
                                <button type="button" id="bt_authNumberSend" class="btn btn-primary btn-xs"  style="border-radius:3px;width: 20%">인증번호 발송</button>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="basic-info col-md-12">
                            <p class="data-row">
                                <span class="data-name" style="width: 100px">이메일</span>
                                <input type="text" class="bootstrap-slider" id="txt_mailID" value="Redio00" style="width: 13%">@
                                <input type="text" class="bootstrap-slider" id="txt_mailAdr" value="naver.com" style="width: 13%">
                                <select id="cob_mail" name="emailSelection" style="width: 13%">
                                    <option value="1" selected="selected">직접입력</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                </select>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="basic-info col-md-6">
                            <p class="data-row">
                                <span class="data-name" style="width: 100px">비밀번호</span>
                                <input type="password" class="bootstrap-slider" id="txt_pass" value="****" style="width: 25%">
                                <button type="button" id="bt_tempPassMail" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 27%;">임시 비밀번호 메일 발송</button>
                                <button type="button" id="bt_tempPassPhon" class="btn btn-primary btn-xs disabled"  style="border-radius:3px;width: 27%;">임시 비밀번호 문자 발송</button>
                            </p>
                        </div>
                        <div class="basic-info col-md-6">
                            <p class="data-row input-group date">
                                <span class="data-name" style="width: 100px">생년월일</span>
                                <%--<span class="data-value" style="width: 60%">1990.10.26</span>--%>
                                <input type="text" class="bootstrap-slider" id="txt_birthEdit" style="width: 25%">
                                <span class="input-group-addon" style="display: inline-block; width: 13%;"><i class="glyphicon glyphicon-calendar"  style="height: 17px"></i></span>
                                <%--<input type="text" class="bootstrap-slider" id="txt_birthEdit">--%>
                            </p>

                            <%--<div class="input-group date" id="date_birthEdit">--%>
                                <%--<input type="text" class="bootstrap-slider" id="txt_birthEdit"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"  style="height: 17px"></i></span>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="basic-info col-md-4">
                            <p class="data-row"><span class="data-name" style="width: 100px">생방송여부</span><span class="data-value" style="width: 60%">on air</span></p>
                        </div>
                        <div class="basic-info col-md-4">
                            <p class="data-row"><span class="data-name" style="width: 100px">회원가입경로</span><span class="data-value" style="width: 60%">Naver</span></p>
                        </div>
                        <div class="basic-info col-md-4">
                            <p class="data-row"><span class="data-name" style="width: 100px">최근정보 수정일</span><span class="data-value" style="width: 60%">2020.01.03 18:00:00</span></p>
                        </div>
                    </div>

                </div>
            </div>
            <%--<div class="row">--%>
                <%--<ul class="nav nav-tabs nav-tabs-custom-colored tabs-iconized">--%>
                    <%--<li class="active"><a href="#broad-history-tab" data-toggle="tab"> 방송기록</a></li>--%>
                    <%--<li><a href="#listening-history-tab" data-toggle="tab">청취기록</a></li>--%>
                    <%--<li><a href="#1-tab" data-toggle="tab">결제/환불</a></li>--%>
                    <%--<li><a href="#2-tab" data-toggle="tab">환전기록</a></li>--%>
                    <%--<li><a href="#3-tab" data-toggle="tab">아이템기록</a></li>--%>
                    <%--<li><a href="#4-tab" data-toggle="tab">퀘스트/업적기록</a></li>--%>
                    <%--<li><a href="#5-tab" data-toggle="tab">접속기록</a></li>--%>
                    <%--<li><a href="#6-tab" data-toggle="tab">신고기록</a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>















            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            DataTables Advanced Tables
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>Rendering engine</th>
                                        <th>Browser</th>
                                        <th>Platform(s)</th>
                                        <th>Engine version</th>
                                        <th>CSS grade</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tableBody"></tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="/template/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="/template/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/template/js/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/template/js/dataTables/jquery.dataTables.min.js"></script>
<script src="/template/js/dataTables/dataTables.bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/template/js/startmin.js"></script>
<script src="/js/lib/handlebars-v4.7.2.js"></script>
<script src="/js/common.js"></script>


<!-- Datepicker -->
<link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="/js/lib/bootstrap-datepicker.min.js"></script>
<script src="/js/lib/bootstrap-datepicker.kr.js" charset="UTF-8"></script>
<!-- Page-Level Demo Scripts - Tables - Use for reference -->

<script>
    $(document).ready(function() {
        getAjaxData("list", "/rest/sample/list", "", fn_success, fn_fail);
        $('.input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            todayHighlight: true,
            calendarWeeks: false,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: 'kr'
        }).datepicker("setDate", new Date());

    });

    var tmp_sw="true";

    $('#cob_mail').change(function () {
        var tmp = $('#cob_mail').val();
        if(tmp == "1"){
            $("#txt_mailAdr").val("");
        }else{
            $("#txt_mailAdr").val($('#cob_mail').val());
        }
    });
    $("#txt_authNumber").hide();
    $('#bt_authNumberSend').click( function() {
        if($(this).val() == '인증번호 발송'){
            $(this).val("재발송");
        }
        $("#txt_authNumber").show();
        if (tmp_sw == "true") {
            tmp_sw = "false";
            time();
        }
    });

    $('#bt_list').click( function() {       //리스트

    });

    $('#bt_edit').click( function() {       //수정완료

    });


    $('#bt_nameEdit').click( function() {       //이름 수정

    });

    $('#bt_nickCheck').click( function() {       //닉네임중복체크

    });

    $('#bt_tempPassMail').click( function() {       //임시비밀번호메일발송

    });

    $('#bt_tempPassPhon').click( function() {       //임시비밀번호문자발송

    });

    var num = 60 * 1; // 몇분을 설정할지의 대한 변수 선언
    var myVar;
    function time(){
        myVar = setInterval(alertFunc, 1000);
    }
    function alertFunc() {
        var min = num / 60;
        min = Math.floor(min);
        var sec = num - (60 * min);
        var input = min + '분' + sec + '초';
        console.log(input);
        $("#lb_authNumber").text(input);

        if(num == 0){
            num = 60 * 1;
            myVar;
            tmp_sw ="true";
            clearInterval(myVar); // num 이 0초가 되었을대 clearInterval로 타이머 종료
        }
        num--;
    }






    function fn_success(dst_id, response){
        dalbitLog(response);

        var template = $('#tmp_list').html();
        var templateScript = Handlebars.compile(template);
        var context = response;
        var html = templateScript(context);

        $("#tableBody").append(html);

        $('#dataTables-example').DataTable({
            responsive: true
        });
    }

    function fn_fail(data, textStatus, jqXHR){
        console.log(data, textStatus, jqXHR);
    }
</script>

<script id="tmp_list" type="text/x-handlebars-template">
    {{#data}}
    <tr>
        <td>{{renderingEngine}}</td>
        <td>{{browser}}</td>
        <td>{{platform}}</td>
        <td class="center">{{version}}</td>
        <td class="center">{{grade}}</td>
    </tr>
    {{/data}}
</script>