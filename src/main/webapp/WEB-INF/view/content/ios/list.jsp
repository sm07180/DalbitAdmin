
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="main-header">
    <div id="page-wrapper">
        <div class="row col-lg-12 form-inline">
            <div class="widget widget-table searchBoxArea">
                <div class="widget-header searchBoxRow">
                    <div class="row col-md-3">
                        <h3 class="title"><i class="fa fa-search"></i>IOS Test App</h3>
                    </div>
                    <div class="row col-md-8 last" style="margin-top: 8px;font-weight: 600;">
                        최신버전 :
                        <span>-</span>
                    </div>
                    <div class="row col-md-1 pull-right" style="text-align: right;">
                        <button type="button" class="btn btn-success" onclick="$('.app').hide();$('.register').show();">등록</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="main-content" style="margin-top: 3px;">
    <div class="row col-lg-3 version mr10">
        <div class="widget widget-table">
            <div class="widget-header">
                <h3 class="title" style="font-size: 14px;">Version</h3>
            </div>
            <div class="widget-content mt10">
                <table class="table table-hover table-bordered">
                    <thead>
                    <tr>
                        <th class="dt-body-center">Version</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row col-lg-9 app" style="display: none;">
        <div class="widget widget-table">
            <div class="widget-header">
                <h3 class="title" style="font-size: 14px;">App <span>(1.1.2)</span></h3>
            </div>
            <div class="widget-content mt10">
                <table class="table table-hover table-bordered">
                    <colgroup>
                        <col width="100px" />
                        <col width="*" />
                        <col width="30px" />
                    </colgroup>
                    <thead>
                    <tr>
                        <th class="dt-body-center">App Build</th>
                        <th class="dt-body-center" colspan="2">Description</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row col-lg-9 register" style="display: none;">
        <div class="widget widget-table">
            <div class="widget-header">
                <h3 class="title" style="font-size: 14px;">등록</h3>
            </div>
            <div class="widget-content mt10">
                <form name="frmRegister" id="frmRegister" onsubmit="fnInsertApp();return false;">
                    <table class="table table-dalbit table-bordered">
                        <colgroup>
                            <col width="100px" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>Version</th>
                            <td style="text-align: left;"><input type="text" name="verName" id="verName" class="form-control" value="" maxlength="100"></td>
                        </tr>
                        <tr>
                            <th>App Build</th>
                            <td style="text-align: left;"><input type="number" name="appBuild" id="appBuild" class="form-control" value=""></td>
                        </tr>
                        <tr>
                            <th>디렉토리</th>
                            <td style="text-align: left;"><input type="text" name="dirName" id="dirName" class="form-control" value="" maxlength="100"></td>
                        </tr>
                        <tr>
                            <th>Descripttion</th>
                            <td style="text-align: left;"><textarea name="description" id="description" class="form-control"></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="pb10" style="text-align: center;">
                        <button class="btn btn-default" type="submit" id="insertBtn">등록하기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    let selVersion = "";
    $(document).ready(function() {
        fnLoadVersion();
    });

    function fnLoadVersion(){
        $.ajax({
            type: "GET"
            , url: "/content/ios/version"
            , dataType: "json"
            , success: function(response){
                if(response.result == 'success'){
                    const last = response.data.last;
                    if(last != undefined && last.verName != undefined && last.appBuild != undefined && last.dirName != undefined){
                        $(".last > span").html("<a href=\"itms-services://?action=download-manifest&url=https://devimage2.dalbitlive.com/ios/" + last.dirName + "/manifest.plist\">" + last.verName + " (" + last.appBuild + ")</a>");
                    }else{
                        $(".last > span").html("-");
                    }

                    const list = response.data.list;
                    $(".version table > tbody").empty();
                    if(list != undefined && list.length > 0){
                        if(selVersion == ""){
                            selVersion = list[0].verName;
                        }
                        $(list).each(function(i, data){
                            let html = "";
                            html += "<tr>";
                            html += "<td><a href=\"#\" onclick=\"selVersion = '" + data.verName + "';fnLoadApp();return false;\">" + data.verName + " (" + data.cnt + ")</a></td>";
                            html += "</tr>";
                            $(".version table > tbody").append(html);
                        })
                        fnLoadApp();
                    }else{
                        $(".version table > tbody").append("<tr><td>등록된 버전이 없습니다.</td></tr>");
                        $('.app').hide();
                    }
                }else{
                    alert(response.message);
                }
            }
            , erroe: function(xhr, textStatus){
                alert(xhr.status + "버전 로딩중 오류가 발생하였습니다.");
            }
        });
    }

    function fnLoadApp(){
        $.ajax({
            type: "GET"
            , url: "/content/ios/app"
            , dataType: "json"
            , data: {
                ver: selVersion
            }
            , success: function(response){
                if(response.result == 'success'){
                    const list = response.data.list;
                    $(".app table > tbody").empty();
                    if(list != undefined && list.length > 0){
                        if(selVersion == ""){
                            selVersion = list[0].verName;
                        }
                        $(list).each(function(i, data){
                            let html = "";
                            html += "<tr>";
                            html += "<td><a href=\"itms-services://?action=download-manifest&url=https://devimage2.dalbitlive.com/ios/" + data.dirName + "/manifest.plist\">" + data.appBuild + "</a></td>";
                            html += "<td style=\"text-align: left;\">" + data.description.split("\n").join("<br />") + "</td>";
                            html += "<td><a href=\"#\" onclick=\"fnDeleteApp(" + data.idx + ");return false;\">X</a></td>";
                            html += "</tr>";
                            $(".app table > tbody").append(html);
                        })
                    }else{
                        $(".app table > tbody").append("<tr><td colspan=\"3\">등록된 앱 빌드가 없습니다.</td></tr>");
                    }
                }else{
                    alert(response.message);
                }
            }
            , erroe: function(xhr, textStatus){
                alert(xhr.status + "앱빌드 로딩중 오류가 발생하였습니다.");
            }
        });

        $(".app .widget-header .title > span").html("(" + selVersion + ")");
        $('.register').hide();
        $('.app').show();
    }

    function fnInsertApp(){
        const verName = $("#verName").val().trim();
        const appBuild = $("#appBuild").val().trim();
        const dirName = $("#dirName").val().trim();
        const description = $("#description").val().trim();

        if(verName == ""){
            alert("Version을 입력하세요.");
            $("#verName").get(0).focus();
        }else if(appBuild == ""){
            alert("App Build 입력하세요.");
            $("#appBuild").get(0).focus();
        }else if(dirName == ""){
            alert("디렉토리를 입력하세요.");
            $("#dirName").get(0).focus();
        }else if(description == ""){
            alert("Description을 입력하세요.");
            $("#description").get(0).focus();
        }else if(description.length > 1000) {
            alert("Description을 1,000자 이내로 입력하세요.");
            $("#description").get(0).focus();
        }else{
            $.ajax({
                type: "POST"
                , url: "/content/ios"
                , dataType: "json"
                , data: {
                    verName : verName
                    , appBuild : appBuild
                    , dirName : dirName
                    , description : description
                }
                , success: function (response) {
                    if(response.result == 'success'){    //로그인성공
                        selVersion = verName;
                        fnLoadVersion();
                    }else{
                        alert(response.message);
                    }
                }
                , error: function (xhr, textStatus) {
                    alert(xhr.status + "등록 중 오류가 발생했습니다.");
                }
            });
        }
    }

    function fnDeleteApp(_idx){
        if(confirm("정말로 삭제하시겠습니까?")){
            $.ajax({
                type: "DELETE"
                , url: "/content/ios"
                , dataType: "json"
                , data: {
                    idx : _idx
                }
                , success: function (response) {
                    if(response.result == 'success'){    //로그인성공
                        fnLoadVersion();
                    }else{
                        alert(response.message);
                    }
                }
                , error: function (xhr, textStatus) {
                    alert(xhr.status + "삭제 중 오류가 발생했습니다.");
                }
            });
        }
    }
</script>