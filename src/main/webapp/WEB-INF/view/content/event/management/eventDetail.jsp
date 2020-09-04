<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="eventInfoForm"></form>

<div id="eventDetail_fullSize"></div>

<script type="text/javascript">

    var dateTime = new Date();
    dateTime = moment(dateTime).format("YYYY.MM.DD");

    function initDetail_insert() {
        var template = $('#tmp_eventInfoForm').html();
        var templateScript = Handlebars.compile(template);
        $("#eventInfoForm").html(templateScript);

        setTimeDate(dateTime);

        $('._calendar').datepicker('._calendar', new Date()).on('changeDate', function(dateText, inst) {
            var selectDate = moment(dateText.date).format('YYYY.MM.DD');
            $(this).val(selectDate);
        });


    }

    function setTimeDate(dateTime) {
        $('#eventStartDate').val(dateTime);
        $('#eventEndDate').val(dateTime);
        $('#announcementDate').val(dateTime);
    }

    function initDetail(idx) {
        var data = {
            eventIdx : idx
        };
        util.getAjaxData("eventInfo", "/rest/content/event/management/info", data, function fn_eventInfo_success(dst_id, response) {
            var template = $('#tmp_eventInfoForm').html();
            var templateScript = Handlebars.compile(template);
            var context = response.data;
            var html = templateScript(context);

            $('#eventInfoForm').html(html);
            $('#eventInfoForm #datail_eventIdx').val(idx);
        });
    }

    $(document).on('click', '#alwaysYnCheck', function() {
        if($(this).prop('checked')) {
            $('#eventStartDate').val("");
            $('#eventStartDate').prop('disabled', true);
            $('#eventEndDate').val("");
            $('#eventEndDate').prop('disabled', true);
        } else {
            $('#eventStartDate').prop('disabled', false);
            $('#eventStartDate').val(dateTime);
            $('#eventEndDate').prop('disabled', false);
            $('#eventEndDate').val(dateTime);
        }
    });

    $(document).on('change', '#addInfoSlct', function() {
       if($(this).val() == 9) {
           $('#etcUrl').attr('readonly', false);
       } else {
           $('#etcUrl').attr('readonly', true);
           $('#etcUrl').val("");
       }
    });

    function inputValidation() {
        var title = $('#eventInfoForm #title');
        if(common.isEmpty(title.val())) {
            alert('이벤트 제목을 입력해주세요.');
            title.focus();
            return false;
        }

        var viewyn = $('input[name="viewYn"]:checked').val();
        if(common.isEmpty(viewyn)) {
            alert('노출/비노출을 선택해주세요.');
            viewyn.focus();
            return false;
        }
        return true;
    }

    function getAddParameter() {
        return data = {
            title : $('#title').val()
            , alwaysYn : $('#alwaysYnCheck').prop('checked') ? 1 : 0
            , startDate : $('#eventStartDate').val().replace(/\./g, '-')
            , endDate : $('#eventEndDate').val().replace(/\./g, '-')
            , viewYn : $('input[name="viewYn"]:checked').val()
            , prizeSlct : $('#prizeSlct').val()
            , addInfoSlct : $('#addInfoSlct').val()
            , etcUrl : $('#etcUrl').val()
            , pcLinkUrl : $('#pcLinkUrl').val()
            , mobileLinkUrl : $('#mobileLinkUrl').val()
            , listImgUrl : $('#listImgUrl').val()
            , announcementDate : $('#announcementDate').val().replace(/\./g, '-')
        };
    }

    $(document).on('click', '#bt_registerEvent', function() {
        if(inputValidation()) {
            if(confirm('등록하시겠습니까?')) {
                util.getAjaxData("eventAdd", "/rest/content/event/management/add", getAddParameter(), function fn_eventAdd_success(dst_id, response) {
                    alert(response.message);
                    getEventList();
                    hideTab();
                });
            }
        }
    });

    function getUpdateParameter() {
        return data = {
            eventIdx : $('#datail_eventIdx').val()
            , title : $('#title').val()
            , alwaysYn : $('#alwaysYnCheck').prop('checked') ? 1 : 0
            , startDate : $('#eventStartDate').val().replace(/\./g, '-')
            , endDate : $('#eventEndDate').val().replace(/\./g, '-')
            , viewYn : $('input[name="viewYn"]:checked').val()
            , prizeSlct : $('#prizeSlct').val()
            , addInfoSlct : $('#addInfoSlct').val()
            , etcUrl : $('#etcUrl').val()
            , pcLinkUrl : $('#pcLinkUrl').val()
            , mobileLinkUrl : $('#mobileLinkUrl').val()
            , listImgUrl : $('#listImgUrl').val()
            , announcementDate : $('#announcementDate').val().replace(/\./g, '-')
        };
    }

    $(document).on('click', '#bt_updateEvent', function() {
        if(inputValidation()) {
            if(confirm('수정하시겠습니까?')) {
                util.getAjaxData("eventUpdate", "/rest/content/event/management/edit", getUpdateParameter(), function fn_eventUpdate_success(dst_id, response) {
                    alert(response.message);
                    getEventList();
                    hideTab();
                });
            }
        }
    });

    function eventDetail_fullSize(url) {     // 이미지 full size
        $("#eventDetail_fullSize").html(util.imageFullSize("eventDetailFullSize",url));
        $('#eventDetailFullSize').modal('show');
    }

</script>

<script id="tmp_eventInfoForm" type="text/x-handlebars-template">
    <input type="hidden" name="datail_eventIdx" id="datail_eventIdx"/>
    <div class="row col-lg-12">
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
            </colgroup>
            <tbody>
            <tr class="align-middle">
                <th>이벤트 제목</th>
                <td colspan="7"><input type="text" class="form-control" style="width:100%;" id="title" name="title" placeholder="이벤트 제목을 입력하세요." value="{{replaceHtml title}}"></td>
            </tr>
            <tr>
                <th>이벤트 기간</th>
                <td colspan="3">
                    <div class="form-inline" id="eventPeriod">
                        <div class="input-group date" id="div-eventStartDate">
                            <label for="eventStartDate" class="input-group-addon">
                                <span><i class="fa fa-calendar" id="eventStartDateBtn"></i></span>
                            </label>
                            <input type="text" class="form-control _calendar" id="eventStartDate" name="eventStartDate" value="{{startDate}}">
                        </div>
                        <span> ~ </span>
                        <div class="input-group date" id="div-eventEndDate">
                            <label for="eventEndDate" class="input-group-addon">
                                <span><i class="fa fa-calendar" id="eventEndDateBtn"></i></span>
                            </label>
                            <input type="text" class="form-control _calendar" id="eventEndDate" name="eventEndDate" value="{{endDate}}">
                        </div>
                    </div>
                    <input type="checkbox" id="alwaysYnCheck" name="alwaysYnCheck"/> <label for="alwaysYnCheck">상시 이벤트</label>
                </td>
                <th>이벤트 상태</th>
                <td>{{{getCommonCodeLabel state 'event_stateSlct'}}}</td>
                <th>노출여부</th>
                <td>
                    {{{getCommonCodeRadio viewYn 'event_viewYn'}}}
                </td>
            </tr>
            <tr>
                <th>등록일</th>
                <td>{{regDate}}</td>
                <th>등록자</th>
                <td><input type="text" class="form-control" value="{{regOpName}}" readonly/></td>
                <th>최종수정일</th>
                <td>{{lastUpdDate}}</td>
                <th>최종수정자</th>
                <td><input type="text" class="form-control" value="{{lastOpName}}" readonly/></td>
            </tr>
            <tr>
                <th>추가 정보</th>
                <td colspan="3">
                    {{{getCommonCodeSelect addInfoSlct 'event_addInfoSlct'}}}
                    <input type="text" id="etcUrl" name="etcUrl" class="form-control" value="{{etcUrl}}" readonly/>
                </td>
                <th>당첨자 발표 날짜</th>
                <td>
                    <div class="form-inline">
                        <div class="input-group date" id="div-announcementDate">
                            <label for="announcementDate" class="input-group-addon">
                                <span><i class="fa fa-calendar" id="announcementDateBtn"></i></span>
                            </label>
                            <input type="text" class="form-control _calendar" id="announcementDate" name="announcementDate" value="{{announcementDate}}">
                        </div>
                    </div>
                </td>
                <th>경품 구분</th>
                <td>{{{getCommonCodeSelect prizeSlct 'event_prizeSlct'}}}</td>
            </tr>
            <tr>
                <th>이벤트 상세(PC)</th>
                <td colspan="7">
                    <input type="text" class="form-control _trim pull-left" id="pcLinkUrl"  name="pcLinkUrl" placeholder="배너 클릭 시 이동할 링크" style="width:70%" value="{{pcLinkUrl}}">
                    <input type="button" value="미리보기" class="pull-right" onclick="getImg('pcLinkUrl')">
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <!--미리보기-->
                    <img id="pc_img_urlViewer" class="thumbnail" style="max-width:360px; max-height:450px;" onclick="eventDetail_fullSize(this.src);"/>
                </td>
            </tr>
            <tr>
                <th>이벤트 상세(Mobile)</th>
                <td colspan="7">
                    <input type="text" class="form-control _trim pull-left" id="mobileLinkUrl" name="mobileLinkUrl" placeholder="배너 클릭 시 이동할 링크" style="width:70%" value="{{mobileLinkUrl}}">
                    <input type="button" value="미리보기" class="pull-right" onclick="getImg('mobileLinkUrl')">
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <!--미리보기-->
                    <img id="mobile_img_urlViewer" class="thumbnail" style="max-width:360px; max-height:450px;" onclick="eventDetail_fullSize(this.src);"/>
                </td>
            </tr>
            <tr>
                <th>리스트 이미지</th>
                <td colspan="7">
                    <input type="text" class="form-control _trim pull-left" id="listImgUrl" name="listImgUrl" placeholder="이벤트 목록에 보일 이미지" style="width:70%" value="{{listImgUrl}}">
                    <input type="button" value="미리보기" class="pull-right" onclick="getImg('listImgUrl')">
                </td>
            </tr>
            <tr>
                <td colspan="8">
                    <!--미리보기-->
                    <img id="thumb_img_urlViewer" class="thumbnail" style="max-width:360px; max-height:450px;" onclick="eventDetail_fullSize(this.src);"/>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="form-inline pull-right">
            {{^state}}<button class="btn btn-default btn-sm" type="button" id="bt_registerEvent">등록하기</button>{{/state}}
            {{#state}}<button class="btn btn-default btn-sm" type="button" id="bt_updateEvent">수정하기</button>{{/state}}
        </div>
    </div>
</script>