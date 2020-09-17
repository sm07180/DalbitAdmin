<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>

<!-- DATA TABLE -->
<div class="row col-lg-12 form-inline" id="prize_table">
    <div class="widget widget-table">
        <div class="widget-content">
            <div class="row col-lg-12 mt15 mb15 form-inline">
                <input type="button" value="등록하기" class="btn btn-default btn-sm pull-right" id="bt_registerEventPrize"/>
            </div>
            <table id="list_eventPrize" class="table table-sorting table-hover table-bordered">
                <thead>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
        <div class="widget-footer">
            <span>
                <button type="button" class="btn btn-danger btn-sm" id="bt_deleteEventPrize">선택삭제</button>
            </span>
        </div>
    </div>
</div>
<!-- DATA TABLE END -->

<div class="modal fade" id="modal_select_eventPrize" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 100%; width: auto;  height: auto; display: table;">
        <div id="eventPrizeDetail"></div>
    </div>
</div>


<script type="text/javascript" src="/js/code/content/contentCodeList.js?${dummyData}"></script>

<script type="text/javascript">

    function initPrize() {
        // data table 셋팅
        var dtList_info_data = function(data) {
            data.eventIdx = $("#eventidx").val();
        };
        var dtList_info = new DalbitDataTable($('#list_eventPrize'), dtList_info_data, EventDataTableSource.eventPrize);
        dtList_info.useCheckBox(true);
        dtList_info.useIndex(true);
        dtList_info.createDataTable();
    }

    $('#bt_registerEventPrize').on('click', function() {
        var template = $('#tmp_eventPrizeDetail').html();
        var templateScript = Handlebars.compile(template);
        $('#eventPrizeDetail').html(templateScript);

        // modal창 셋팅
        modalSetting(1);
        $('#modal_select_eventPrize').modal('show');
    });

    $(document).on('click', '._getPrizeDetail', function() {
        var data = {
            eventIdx : $(this).data('eventidx')
            , prizeIdx : $(this).data('prizeidx')
        };
        var prizeIdx_ = data.prizeIdx;
        util.getAjaxData("eventPrizeDetail", "/rest/content/event/management/prize/detail", data, function fn_eventPrizeDetail_success(dst_id, response) {
            var template = $('#tmp_eventPrizeDetail').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html = templateScript(context);

            $('#eventPrizeDetail').html(html);

            $('#PopUpPrizeIdx').val(prizeIdx_);

            // modal창 셋팅
            modalSetting(2);

            $('#modal_select_eventPrize').modal('show');
        });
    });

    function modalSetting(tmpNo) {
        if(tmpNo == 1) {
            $('#htmlArea').html("<h3>경품 등록</h3>");
            disabledSetting(tmpNo);
        } else if(tmpNo == 2) {
            $('#htmlArea').html("<h3>경품 상세</h3> <br /><h5>진행 중인 이벤트의 경우 경품 정보 수정에 주의 부탁드립니다!</h5>");
            disabledSetting(tmpNo);
        }
        $("#prizeReceive").html(util.getCommonCodeSelect(0, event_prizeReceive, 'N', 'prize_receive'));
    }

    function val1() {
        $('input[name="dalByeol"]').prop('disabled', true);
        $('input[name="dalByeol"]').val("");
        $('input[name="prizeUrl"]').prop('disabled', false);
        $('input[name="giveCnt"]').prop('disabled', false);
        $('input[name="giveAmt"]').prop('disabled', false);
        $('input[name="taxAmt"]').prop('disabled', false);
        $('input[name="receiveDal"]').prop('disabled', false);
    }

    function val2_3() {
        $('input[name="dalByeol"]').prop('disabled', false);
        $('input[name="prizeUrl"]').prop('disabled', true);
        $('input[name="prizeUrl"]').val("");
        $('input[name="giveCnt"]').prop('disabled', true);
        $('input[name="giveCnt"]').val("");
        $('input[name="giveAmt"]').prop('disabled', true);
        $('input[name="giveAmt"]').val("");
        $('input[name="taxAmt"]').prop('disabled', true);
        $('input[name="taxAmt"]').val("");
        $('input[name="receiveDal"]').prop('disabled', true);
        $('input[name="receiveDal"]').val("");
    }

    function prize_select() {
        if($('#prizeSlct').val() == 1) {
            $('#prizeRank').removeAttr('readonly');
        } else if($('#prizeSlct').val() == 2) {
            $('#prizeRank').val('0');
            $('#prizeRank').attr('readonly', true);
        }
    }

    function disabledSetting(tmpNo) {
        if(tmpNo == 1) {
            val1();
            prize_select();
        } else if(tmpNo == 2) {
            if($('#prize_receive').val() == 1) {
                val1();
                prize_select();
            } else if($('#prize_receive').val() == 2 || $('#prize_receive').val() == 3) {
                val2_3();
                prize_select();
            }
        }

        $('#prize_receive').on('change', function() {
            if($('#prize_receive').val() == 1) {
                val1();
            } else if($('#prize_receive').val() == 2 || $('#prize_receive').val() == 3) {
                val2_3();
            }
        });
    }

    function getPrizeAddParam() {
        return data = {
            eventIdx : $("#eventidx").val()
            , prizeRank : $('#prizeRank').val()
            , prizeCnt : $('#prizeCnt').val()
            , prizeName : $('#prizeName').val()
            , prizeSlct : $('#prize_receive').val()
            , prizeUrl : $('#prizeUrl').val()
            , giveCnt : $('#giveCnt').val()
            , giveAmt : $('#giveAmt').val()
            , taxAmt : $('#taxAmt').val()
            , dalByeol : $('#dalByeol').val()
            , receiveDal : $('#receiveDal').val()
        };
    }

    function getPrizeEditParam() {
        return data = {
            eventIdx : $("#eventidx").val()
            , prizeIdx : $('#PopUpPrizeIdx').val()
            , prizeRank : $('#prizeRank').val()
            , prizeCnt : $('#prizeCnt').val()
            , prizeName : $('#prizeName').val()
            , prizeSlct : $('#prize_receive').val()
            , prizeUrl : $('#prizeUrl').val()
            , giveCnt : $('#giveCnt').val()
            , giveAmt : $('#giveAmt').val()
            , taxAmt : $('#taxAmt').val()
            , dalByeol : $('#dalByeol').val()
            , receiveDal : $('#receiveDal').val()
        };
    }

    function prizeFormValidation() {
        if($('#prizeSlct').val() == 1) {
            if (common.isEmpty($('#prizeRank').val())) {
                alert('등수를 입력해주세요.');
                return false;
            }
        }

        if(common.isEmpty($('#prizeCnt').val())) {
            alert('당첨 인원을 입력해주세요.');
            return false;
        }

        if(common.isEmpty($('#prizeName').val())) {
            alert('경품명을 입력해주세요.');
            return false;
        }

        if($('#eventPrizeForm #prize_receive').val() == 1) {

            if(common.isEmpty($('input[name="giveCnt"]').val())) {
                alert('지급 수량을 입력해주세요.');
                return false;
            }

            if(common.isEmpty($('input[name="giveAmt"]').val())) {
                alert('금액을 입력해주세요.');
                return false;
            }

            if(common.isEmpty($('input[name="taxAmt"]').val())) {
                alert('제세 공과금을 입력해주세요.');
                return false;
            }

            if(common.isEmpty($('input[name="receiveDal"]').val())) {
                alert('달로 받기 개수를 입력해주세요.');
                return false;
            }
        } else if($('#eventPrizeForm #prize_receive').val() == 2 || $('#eventPrizeForm #prize_receive').val() == 3) {
            // 달/ 별일 시
            if (common.isEmpty($('input[name="dalByeol"]').val())) {
                alert('달/별 수를 입력해주세요.');
                return false;
            }
        }
        return true;
    }

    $(document).on('click', '._eventPrizeButton', function() {
       var id = $(this).prop("id").split("_")[1];
       if(id == "eventPrizeRegister") {
           console.log($('#eventPrizeForm').serialize());
           if(prizeFormValidation()) {
               if(confirm('경품을 등록하시겠습니까?')) {
                   util.getAjaxData("eventPrizeAdd", "/rest/content/event/management/prize/add", getPrizeAddParam(), function fn_eventPrizeAdd_success(dst_id, response) {
                       alert(response.message);
                       $('#tab_eventPrize').click();
                       initPrize();
                   });
               }
           }
       } else if(id == "eventPrizeUpdate") {
           console.log($('#eventPrizeForm').serialize());
           if(prizeFormValidation()) {
               if(confirm('경품을 수정하시겠습니까?')) {
                   util.getAjaxData("eventPrizeEdit", "/rest/content/event/management/prize/edit", getPrizeEditParam(), function fn_eventPrizeEdit_success(dst_id, response) {
                       alert(response.message);
                       $('#tab_eventPrize').click();
                       initPrize();
                   });
               }
           }
       }
    });

    $('#bt_deleteEventPrize').on('click', function() {
        var checked = $('#list_eventPrize > tbody > tr > td > input[type=checkbox]:checked');
        var eventIdx = checked.parent().parent().find('._getPrizeDetail').data('eventidx');
        if(checked.length == 0) {
            alert('삭제할 이벤트 경품을 선택해주세요.');
            return false;
        }

        if(confirm(checked.length + '건의 이벤트 경품을 삭제하시겠습니까?')){
            var prizeIdxs = '';
            checked.each(function() {
               prizeIdxs += $(this).parent().parent().find('._getPrizeDetail').data('prizeidx') + ",";
            });
            var data = {
                prizeIdxs : prizeIdxs
                , eventIdx : eventIdx
            };
            util.getAjaxData("eventPrizeDelete", "/rest/content/event/management/prize/delete", data, function fn_eventPrizeDelete_success(dst_id, response) {
                alert(response.message);
                $('#tab_eventPrize').click();
                initPrize();
            });
        }
    });

    // 제세공과금, 달로 받기 자동 계산
    $(document).on('focusout', '#giveAmt', function() {
       var giveAmt = $('#giveAmt').val();
       if(giveAmt >= 50000) {
           $('#taxAmt').val(giveAmt * 0.22);
       } else if(giveAmt < 50000) {
           $('#taxAmt').val('0');
       }
       $('#receiveDal').val(giveAmt * 0.01);
    });

    function bt_x(){
    };
</script>

<script id="tmp_eventPrizeDetail" type="text/x-handlebars-template">
    <div class="modal-content" style="width:450px;">
        <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="bt_x();">&times;</button>
             <div id="htmlArea"/>
         </div>
         <div class="modal-body" style="height: 400px;">
             <form id="eventPrizeForm">
                 <div class="row col-lg-12 form-inline">
                     <div class="widget-content">
                         <input type="hidden" id="PopUpPrizeIdx" name="PopUpPrizeIdx"/>
                         <table class="table table-sorting table-hover table-bordered no-padding">
                             <tbody id="tableBody">
                             <tr>
                                 <th>등수</th>
                                 <td><input type="number" id="prizeRank" name="prizeRank" class="form-control" style="width: 100%;" value="{{prizeRank}}"/></td>
                             </tr>
                             <tr>
                                 <th>당첨 인원</th>
                                 <td><input type="number" id="prizeCnt" name="prizeCnt" class="form-control" style="width: 100%;" value="{{prizeCnt}}"/></td>
                             </tr>
                             <tr>
                                 <th>경품명</th>
                                 <td><input type="text" id="prizeName" name="prizeName" class="form-control" style="width: 100%;" value="{{prizeName}}"/></td>
                             </tr>
                             <tr>
                                 <th>경품 구분</th>
                                 <td>
                                     {{#equal prizeSlct ''}}
                                     <span id="prizeReceive"></span>
                                     {{else}}
                                     {{{getCommonCodeSelect ../prizeSlct 'event_prizeReceive' 'N' 'prize_receive'}}}
                                     {{/equal}}
                                 </td>
                             </tr>

                              <tr>
                                  <th>경품 URL</th>
                                  <td><input type="text" id="prizeUrl" name="prizeUrl" class="form-control" style="width: 100%;" value="{{prizeUrl}}"/></td>
                              </tr>
                              <tr>
                                  <th>지급 수량</th>
                                  <td><input type="number" id="giveCnt" name="giveCnt" class="form-control" style="width: 100%;" value="{{giveCnt}}"/></td>
                              </tr>
                              <tr>
                                  <th>금액</th>
                                  <td><input type="number" id="giveAmt" name="giveAmt" class="form-control" style="width: 100%;" value="{{giveAmt}}"/></td>
                              </tr>
                              <tr>
                                  <th>제세 공과금</th>
                                  <td><input type="number" id="taxAmt" name="taxAmt" class="form-control" style="width: 100%;" value="{{taxAmt}}"/></td>
                              </tr>
                              <tr>
                                  <th>달/별 수</th>
                                  <td><input type="number" id="dalByeol" name="dalByeol" class="form-control" style="width: 100%;" value="{{dalByeol}}"/></td>
                              </tr>
                              <tr>
                                  <th>달로 받기</th>
                                  <td><input type="number" id="receiveDal" name="receiveDal" class="form-control" style="width: 100%;" value="{{receiveDal}}"/></td>
                              </tr>

                             </tbody>
                         </table>
                     </div>
                 </div>
             </form>
         </div>
         <div class="modal-footer">
             {{^prizeRank}}<button type="button" id="bt_eventPrizeRegister" class="btn btn-success _eventPrizeButton" data-dismiss="modal">등록</button>{{/prizeRank}}
             {{#prizeRank}}<button type="button" id="bt_eventPrizeUpdate" class="btn btn-success _eventPrizeButton" data-dismiss="modal">수정</button>{{/prizeRank}}
         </div>
    </div>
</script>