<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="col-md-12 no-padding">
    <label>
        ㆍ새로운 약관을 추가할 수 있습니다.<br/>
        ㆍ선택한 약관의 상세 정보를 확인하고 수정할 수 있습니다.<br/>
        ㆍ단, 버전 업데이트 시 직접 버전을 작성하고, 버전 업데이트에 대한 정보를 운영자 메모정보에 입력하여 등록 및 수정합니다.
    </label>
</div>
<div>
    <form id="terms_detailFrm"></form>
</div>

<script type="text/javascript" src="/js/handlebars/customerHelper.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

    });
    var idx;
    function terms_detail(data){
        $("#tab_termsTab").removeClass('hide');
        dalbitLog(data);

        idx = data.idx;

        var template = $('#tmp_terms_detailFrm').html();
        var templateScript = Handlebars.compile(template);
        var context = data;
        var html=templateScript(context);
        $("#terms_detailFrm").html(html);

        util.editorInit("content-notice");

        $('#bt_termsUpdate').click(function() {                   // 수정
            termsGenerate("update");
        });

    }

    function termsGenerate(sw){
        var data = {};
        data.idx = idx;
        data.platform =$('input[name="platform"]:checked').val();
        data.view_on =$("#detail_viewOn").prop('checked') ? 1 : 0;
        data.terms_type =$("select[name='terms_type']").val();
        data.terms_title = $("#terms_title").val();
        data.terms_content = $("#editor").summernote('code');
        data.version = $("#version").val();
        data.meno = $("#meno").val();

        if(sw == "update"){
            termsUpdate_click(data);
        }else{
            termsInsert_click(data);
        }
    }

    function termsUpdate_click(data){
        if(isValid(data)){
            if(confirm("수정하시겠습니까?")){
                util.getAjaxData("insert", "/rest/administrate/terms/update", data, fn_update_success);
            }
        }
    }
    function termsInsert_click(data){
        if(isValid(data)) {
            if (confirm("등록하시겠습니까?")) {
                util.getAjaxData("insert", "/rest/administrate/terms/insert", data, fn_update_success);
            }
        }
    }

    function isValid(data){
        if(common.isEmpty(data.platform)){
            alert("플랫폼을 선택해주세요.");
            return false;
        }
        if (common.isEmpty(data.version)) {
            alert("버전을 입력해 주시기 바랍니다.");
            return false;
        }
        if (common.isEmpty(data.terms_title)) {
            alert("약관명을 입력해 주세요.");
            return false;
        }
        var editor = $("#editor");
        if(editor.summernote('isEmpty')){
            alert("약관 상세정보를 입력해 주세요.");
            return false;
        }
        return true;
    }

    function fn_update_success(data, response, params){
        dalbitLog(response);
        alert(response.message);
        dtList_info.reload();

        $("#tab_termsTab").addClass('hide');
    }

</script>

<script id="tmp_terms_detailFrm" type="text/x-handlebars-template">
    <div id="wrapper">
        <div id="page-wrapper">
            <table class="table table-bordered table-dalbit" style="margin: auto">
                <colgroup>
                    <col width="3%"><col width="5%"><col width="3%"><col width="9%"><col width="3%"><col width="5%">
                    <col width="5%"><col width="7%"><col width="5%"><col width="5%"><col width="5%"><col width="5%">
                </colgroup>
                <tbody>
                    <tr>
                        <th>No</th>
                        <td>{{idx}}</td>

                        <th>플랫폼</th>
                        <td>{{{getCommonCodeRadio platform 'terms_platform'}}}</td>

                        <th>구분</th>
                        <td colspan="2">{{{getCommonCodeSelect terms_type 'terms_type'}}}</td>

                        <th>약관명</th>
                        <td colspan="4"><input type="text" class="form-control" id="terms_title" value="{{terms_title}}"></td>
                    </tr>
                    <tr>
                        <th>Version</th>
                        <td>
                            <input type="text" class="form-control" id="version" value="{{version}}">
                        </td>
                        <%--{{#version}}<td>{{version}}</td>{{/version}}--%>


                        <th>등록일시</th>
                        <td>{{regDateFormat}}</td>

                        <th>등록자</th>
                        <td>{{{op_name}}}</td>

                        <th>수정일시</th>
                        <td>{{lastUpdDateFormat}}</td>

                        <th>수정자</th>
                        <td>{{last_op_name}}</td>

                        <th>게시상태</th>
                        <td>{{{getOnOffSwitch view_on}}}</td>
                    </tr>
                </tbody>
            </table>
            <div class="widget mt10" style="margin-bottom: 0px">
                <div class="widget-header">
                    <h3> 약관 상세정보 </h3>
                </div>
                <div class="_editor" id="editor" name="editor">{{{replaceHtml terms_content}}}</div>
                <div class="widget-header">
                    <h3> 변경 요약정보 </h3>
                </div>
                <div>
                    <textarea type="textarea" class="form-control" id="meno" style="height: 100px;">{{meno}}</textarea>
                </div>
            </div>
            <div class="pull-right">
                {{^idx}}<button type="button" id="bt_termsInsert" class="btn-sm btn btn-default">약관 등록</button>{{/idx}}
                {{#idx}}<button type="button" id="bt_termsUpdate" class="btn-sm btn btn-default">약관 수정</button>{{/idx}}
                <button type="button" id="bt_world" class="btn-sm btn btn-default">World 출력</button>
            </div>
        </div>
    </div>
</script>