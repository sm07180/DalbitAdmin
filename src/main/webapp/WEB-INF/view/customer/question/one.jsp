<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="principal" property="principal" />

<div class="col-md-12 no-padding">
    <label id="one_title"></label>
</div>
<div>
    <form id="question_detailFrm"></form>
</div>

<!-- 이미지 원본 보기 -->
<div id="fullSize_question"></div>

<script type="text/javascript" src="/js/code/customer/questionCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/handlebars/customerHelper.js?${dummyData}"></script>
<script type="text/javascript">
    $(document).ready(function() {

    });
    var memNo;
    var memId;
    var slct_type;
    function quest_detail_success(data, response, params){
        // dalbitLog(params);
        // dalbitLog(response);
        qnaIdx = params.qnaIdx;
        response.data["mem_userid"] = memInfo(response.data.mem_userid,response.data.mem_no);
        response.data["answer"] = params.answer;
        var add_file_cnt = response.data.add_file.split(",");
        response.data["add_file_cnt"] = common.isEmpty(response.data.add_file) ? 0 : add_file_cnt.length;

        var template = $('#tmp_question_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#question_detailFrm").html(html);

        memNo = response.data.mem_no;
        memId = response.data.mem_userid;

        util.editorInit("customer-question");
        util.getAjaxData("getGroup", "/rest/customer/question/getFaqGroupList", null, fn_getFaqGroup_success);

        $('#bt_operate').click(function() {                   // 방송제목 변경
            operate_click();
        });

        if(response.data.state == 2 && response.data.op_name != $(".name").text()){
            alert("다른 사람이 처리중인 1:1 문의 건 입니다.");
            $("#bt_operate").addClass("hide");
            $("#bt_chatchRelease").addClass("hide");
        }
    }

    function fn_getFaqGroup_success(data, response, params) {
        dalbitLog(response);
        var template = $("#tmp_question_faqGroup").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.faqGroupList;
        var html = templateScript(context);
        $("#_faqGroupArea").html(html);

        fn_sublist_success(data, response);
    }

    function memInfo(memId, memNo){
        return util.memNoLink(memId, memNo);
    }

    function operate_click(){
        var data = {};
        data["qnaIdx"] = qnaIdx;
        data["answer"] = $("#editor").summernote('code');
        // dalbitLog(data);
        if(confirm("등록하시겠습니까?")){
            util.getAjaxData("insert", "/rest/customer/question/operate", data, fn_insert_success);
        }
    }
    function fn_insert_success(data, response, params){
        dalbitLog(response);
        if(response.code == "-2"){
            alert("이미 등록되어있습니다.");
        }else{
            alert(response.message);
        }
        dtList_info.reload();

        $("#question_detailFrm").empty();
    }

    $(document).on('change', '#faqGroup', function() {
        var faqData = {
            slct_type : $('select[name="faqGroup"]').find('option:selected').val()
        }
        dalbitLog(faqData);
        util.getAjaxData("getSub", "/rest/customer/question/getFaqSubList", faqData, fn_sublist_success);
    });

    function fn_sublist_success(data, response, params) {
        var template = $("#tmp_question_faqSub").html();
        var templateScript = Handlebars.compile(template);
        var context = response.data.faqSubList;
        var html = templateScript(context);
        $("#_faqSubArea").html(html);
    }

    $(document).on('click', '#bt_faq', function() {
        $('button.btn-codeview').click();
        $('#editor').summernote('code', $('#editor').summernote('code') + '<p>' + $('select[name="faqSub"]').find('option:selected').data('answer')) + '</p>';
        $('button.btn-codeview').click();
    });

    $(document).on('click', '.bt_baro', function() {

        dalbitLog($(this).text() + ' 바로가기');
        $('button.btn-codeview').click();


        // 버튼 만드는 처리
        var button = '<p><button><a href=' + $(this).data('url') + '>' + $(this).text() + ' 바로가기' + '</a></button><p>';
        $('#editor').summernote('code', $('#editor').summernote('code') + button);
        $('button.btn-codeview').click();
    });

    $(document).on('click', '#bt_chatchRelease', function() {       // 처리중 해제
        var obj = {};
        obj.qnaIdx = qnaIdx;
        util.getAjaxData("qnaCatch", "/rest/customer/question/chatchRelease", obj, fn_chatchRelease_success);
    });
    function fn_chatchRelease_success(data, response, params) {
        dalbitLog(response);
        dtList_info.reload(question_summary_table);
        $('#tab_customerQuestion').removeClass("show");
    }

</script>

<script id="tmp_question_detailFrm" type="text/x-handlebars-template">
    <div id="wrapper">
        <div id="page-wrapper">
            <table class="table table-bordered table-dalbit" style="margin: auto">
                <colgroup>
                    <col width="5%"><col width="5%"><col width="5%"><col width="5%"><col width="5%"><col width="5%">
                    <col width="5%"><col width="5%"><col width="5%"><col width="5%"><col width="5%"><col width="5%">
                </colgroup>
                <tbody>
                    <tr>
                        <th rowspan="2">No</th>
                        <td rowspan="2">{{qnaIdx}}</td>

                        <th>문의유형</th>
                        <td>{{{getCommonCodeLabel slct_type 'question_type'}}}</td>

                        <th>Browser</th>
                        <td>{{browser}}</td>

                        <th>회원번호</th>
                        <td>{{mem_no}}</td>

                        <th>접수일시</th>
                        <td>{{write_date}}</td>

                        <th>처리상태</th>
                        <td>{{{getCommonCodeLabel state 'question_status'}}}
                            {{#equal state '2'}}
                                <button type="button" id="bt_chatchRelease" class="btn-sm btn btn-default">해제</button>
                            {{/equal}}
                        </td>
                    </tr>
                    <tr>
                        <th>플랫폼</th>
                        <td>{{platform}}</td>

                        <th>ip Address</th>
                        <td>{{ip}}</td>

                        <th>문의자<br /></th>
                        <td>
                            {{{mem_userid}}}
                            <br/>{{mem_level}}/{{mem_grade}}
                        </td>

                        <th>처리일시</th>
                        <td>{{op_date}}</td>

                        <th>처리자명</th>
                        <td>{{op_name}}</td>
                    </tr>
                    <tr>
                        <th colspan="2">문의제목</th>
                        <td colspan="4"><input type="text" class="form-control fit-table" value="{{question_title}}" /></td>

                        <th>문의자<br />닉네임</th>
                        <td>{{mem_nick}}</td>

                        <th>문의자 이메일</th>
                        <td colspan="3">{{email}}</td>

                    </tr>

                    <tr>
                        <th colspan="2">문의내용</th>
                        <td colspan="6">
                            <textarea class="form-control fit-table" rows="5">{{replaceHtml question_contents}}</textarea>
                        </td>

                        <th>첨부파일 <br /> {{add_file_cnt}} 건</th>
                        <td colspan="3">
                            <%--{{#equal add_file ''}}--%>
                            <%-- - --%>
                            <%--{{else}}--%>
                            <img src="{{renderImage add_file}}" width="auto" height="100px" class="_imageFullPop" />
                            <%--{{/equal}}--%>
                        </td>
                    </tr>

                    <tr>
                        <th colspan="2">매크로 답변하기</th>
                        <td colspan="2" id="_faqGroupArea"></td>
                        <td colspan="2" id="_faqSubArea"></td>

                        <td><button type="button" id="bt_faq" class="btn-sm btn btn-default">적용</button></td>

                        <th>바로가기버튼</th>
                        <td colspan="4">
                            <button type="button" id="bt_moon" class="btn-sm btn btn-default bt_baro" data-url=" https://www.dalbitlive.com/store">달결제</button>
                            <button type="button" id="bt_star" class="btn-sm btn btn-default bt_baro" data-url="https://www.dalbitlive.com/mypage/wallet">별환전</button>
                            <button type="button" id="bt_wallet" class="btn-sm btn btn-default bt_baro" data-url="https://www.dalbitlive.com/mypage/wallet">내지갑</button>
                            <button type="button" id="bt_profile" class="btn-sm btn btn-default bt_baro" data-url="https://www.dalbitlive.com/mypage/setting">사진등록</button>
                            <button type="button" id="bt_broadRoot" class="btn-sm btn btn-default bt_baro" data-url="https://www.dalbitlive.com/customer/faq">방송방법</button>
                        </td>
                            <%--<label class="control-inline fancy-radio custom-color-green">--%>
                                <%--<input type="radio" id="moon" name="inline-radio" value='1' checked="checked" data-url="https://www.dalibitlive.com/"/>--%>
                                <%--<span><i></i>달결제</span>--%>
                            <%--</label>--%>
                            <%--<label class="control-inline fancy-radio custom-color-green">--%>
                                <%--<input type="radio" id="star" name="inline-radio" value='2' data-url="https://www.dalibitlive.com/"/>--%>
                                <%--<span><i></i>별환전</span>--%>
                            <%--</label>--%>
                            <%--<label class="control-inline fancy-radio custom-color-green">--%>
                                <%--<input type="radio" id="wallet" name="inline-radio" value='3' data-url="https://www.dalibitlive.com/" />--%>
                                <%--<span><i></i>내지갑</span>--%>
                            <%--</label>--%>
                            <%--<label class="control-inline fancy-radio custom-color-green">--%>
                                <%--<input type="radio" id="profile" name="inline-radio" value='4' data-url="https://www.dalibitlive.com/"/>--%>
                                <%--<span><i></i>사진등록</span>--%>
                            <%--</label>--%>
                            <%--<label class="control-inline fancy-radio custom-color-green">--%>
                                <%--<input type="radio" id="broadRoot" name="inline-radio" value='5' data-url="https://www.dalibitlive.com/"/>--%>
                                <%--<span><i></i>방송방법</span>--%>
                            <%--</label>--%>
                        <%--</td>
                        <td>
                                <button type="button" id="bt_baro" class="btn-sm btn btn-default">적용</button>
                        </td>--%>
                    </tr>
                </tbody>
            </table>
            <div class="widget mt10">
                <div class="widget-header">
                    <h3><i class="fa fa-user"></i> 답변 </h3>
                </div>
                <div class="_editor" id="editor" name="editor">{{{replaceHtml answer}}}</div>
            </div>
            <div class="pull-right">
                {{#equal state '2'}}
                    <button type="button" id="bt_operate" class="btn-sm btn btn-default">완료</button>
                {{/equal}}
            </div>
        </div>
    </div>
</script>

<script id="tmp_question_faqGroup" type="text/x-handlebars-template">
    <select name="faqGroup" id="faqGroup" class="form-control">
        {{#each this as |faq|}}
            <option value="{{faq.slct_type}}">{{questionGroupName faq.slct_type}}</option>
        {{/each}}
    </select>
</script>

<script id="tmp_question_faqSub" type="text/x-handlebars-template">
    <select name="faqSub" id="faqSub" class="form-control">
        {{#each this as |sub|}}
            <option data-answer="{{replaceHtml sub.answer}}">{{sub.question}}</option>
        {{/each}}
    </select>
</script>