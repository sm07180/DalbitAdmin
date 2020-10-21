<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content">
    <div class="main-header">
        <h2>푸시 샘플</h2>
    </div>

    <div class="row">
        <div class="widget">
            <div class="widget-header">
                <h3>푸시</h3>
            </div>
            <div class="widget-content">
                <div class="row col-md-12">
                    <div class="row col-md-12" style="padding-bottom: 15px">
                        <div class="pull-right">
                            <button class="btn btn-default" type="button" id="insertBtn" style="margin-left: 10px;">발송</button>
                        </div>
                    </div>
                    <table class="table table-bordered table-dalbit">
                        <colgroup>
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                            <col width="8%" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>수신대상</th>
                            <td colspan="5" style="width:50%;">
                                <div>
                                    <input type="text" id="mem_nos" placeholder="mem_no 입력해주세요.">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>메시지 제목</th>
                            <td colspan="5" style="width:50%;"><input type="text" class="form-control" name="send_title" id="push-send_title" placeholder="제목을 입력해주세요." value=""></td>
                        </tr>
                        <tr>
                            <th>메시지 내용</th>
                            <td colspan="5">
                                <div>
                                    <textarea class="form-control" name="send_cont" id="push-send_cont" rows="5" cols="30" placeholder="방송 시스템에 적용되는 내용을 작성해주세요." style="resize: none" maxlength="150"></textarea>
                                    <p style="color: red">* 메시지 내용은 10자~150자(한글) 입력 가능합니다.</p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>푸시 타입<br>(이동경로)</th>
                            <td><input type="text" id="slct_push" placeholder="pushType 입력해주세요."></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).on("click", "#insertBtn", function(){

            var sendURL = '/rest/content/push/insert';
            console.log("SEND URL :", sendURL);

            var sendData = {
                server_slct : $("input:radio[name=server_slct]:checked").val()
                ,platform : "111"
                , status : "0"
                , send_title : $("#push-send_title").val()
                , send_cont : $("#push-send_cont").val()
                , is_all : "7"
                , mem_nos : $("#mem_nos").val()
                , msg_type : "0"
                , slct_push : $("#slct_push").val()
                , is_direct : "0"
                , send_cnt : "1"
                // , send_datetime : "202010211053"
                , send_type : "11"
                , image_type : "101"
            }

            util.getAjaxData("push", sendURL, sendData,
                function (data) {
                    console.log("[ajax 통신 결과]url : " + '/push/send');
                    console.log(data);
                    alert("PUSH 발송을 성공하였습니다.");
                },function (data, textStatus, jqXHR) {
                    alert(data);
                }
            );

        })

    </script>
