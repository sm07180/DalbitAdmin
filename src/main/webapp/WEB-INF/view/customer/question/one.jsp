<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-md-12 no-padding">
    <label id="one_title"></label>
</div>
<div>
    <form id="detailFrm"></form>
</div>

<!-- 이미지 원본 보기 -->
<div class="modal fade" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <img id="image_full_size" src="#" alt="your image" style="max-width: 1000px;max-height: 1000px;">
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="/js/code/administrate/adminCodeList.js"></script>

<script>
    $(document).ready(function() {

    });
    var memNo;
    var memId;
    var qnaIdx;
    function quest_detail_success(data, response, params){
        dalbitLog(params);
        dalbitLog(response);
        qnaIdx = params.qnaIdx;
        response.data["mem_userid"] = memInfo(response.data.mem_userid,response.data.mem_no);
        response.data["answer"] = params.answer;

        var template = $('#tmp_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = response.data;
        var html=templateScript(context);
        $("#detailFrm").html(html);

        memNo = response.data.mem_no;
        memId = response.data.mem_userid;

        util.editorInit("customer-question");

        $('#bt_operate').click(function() {                   // 방송제목 변경
            operate_click();
        });
    }

    function fullSize(url) {     // 이미지 full size
        $("#image_full_size").prop("src", url);
    }

    function memInfo(memId, memNo){
        return util.memNoLink(memId, memNo);
    }

    function operate_click(){
        console.log("@@@@@@@");

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
        alert(response.message);
        dtList_info.reload();

        $("#detailFrm").empty();
    }
</script>

<script id="tmp_detailFrm" type="text/x-handlebars-template">
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
                        <td>{{slct_type}}</td>

                        <th>Browser</th>
                        <td>{{browser}}</td>

                        <th>회원번호</th>
                        <td>{{mem_no}}</td>

                        <th rowspan="2">접수일시</th>
                        <td rowspan="2">{{write_date}}</td>

                        <th>첨부파일</th>
                        <td>{{add_file}}</td>
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

                        <th>처리상태</th>
                        <td>{{{getCommonCodeLabel state 'state'}}}</td>
                    </tr>
                    <tr>
                        <th colspan="2">문의제목</th>
                        <td colspan="4"><input type="text" class="form-control fit-table" value="{{question_title}}" /></td>

                        <th>문의자<br />닉네임</th>
                        <td>{{mem_nick}}</td>

                        <th>처리일시</th>
                        <td>{{op_date}}</td>

                        <th>처리자명</th>
                        <td>{{op_name}}</td>
                    </tr>

                    <tr>
                        <th colspan="2">문의내용</th>
                        <td colspan="6">
                            <textarea class="form-control fit-table" rows="5">{{question_contents}}</textarea>
                        </td>

                        <th>첨부파일</th>
                        <td colspan="3">
                            <img src="{{renderImage add_file}}" width="auto" height="100px" data-toggle="modal" data-target="#imgModal" onclick="fullSize(this.src)"/>
                        </td>
                    </tr>

                    <tr>
                        <th colspan="2">매크로 답변하기</th>
                        <td colspan="2">{{{getCommonCodeSelect question_type 'question_type'}}}</td>
                        <td colspan="2">{{{getCommonCodeSelect slctType 'faq_slctType' 'Y'}}}</td>

                        <th colspan="2">바로가기버튼</th>
                        <td colspan="4">
                            <button type="button" id="bt_moon" class="btn-sm btn btn-default">달결제</button>
                            <button type="button" id="bt_star" class="btn-sm btn btn-default">별환전</button>
                            <button type="button" id="bt_wallet" class="btn-sm btn btn-default">내지갑</button>
                            <button type="button" id="bt_profile" class="btn-sm btn btn-default">사진등록</button>
                            <button type="button" id="bt_broadRoot" class="btn-sm btn btn-default">방송방법</button>
                        </td>
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
                <button type="button" id="bt_operate" class="btn-sm btn btn-default">완료</button>
            </div>
        </div>
    </div>
</script>
