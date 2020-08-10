<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="wrapper">
    <div id="page-wrapper">
        <div id="container-fluid">
            <div class="row col-lg-12 form-inline">
                <div class="widget widget-table"  style="overflow: auto">
                    <div class="widget-header">
                        <h3><i class="fa fa-desktop"></i> 검색결과</h3>
                    </div>
                    <div class="widget-content">
                        <input type="text" name="title" id="title" value="제목입니다12345" />
                        <input type="text" name="msgCont" id="msgCont" value="내용입니다.123123123" />
                        <input type="text" name="rcvMail" id="rcvMail" value="leejaeho114@gmail.com" />

                        <div class="pull-right">
                            <button type="button" class="btn btn-default mr-10" id="sendEmailBtn"><i class="fa fa-plus-square"></i>발송</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/code/sample/sampleCodeList.js?${dummyData}"></script>
<script type="text/javascript" src="/js/lib/unicode-csaiur.js?${dummyData}"></script>
<script type="text/javascript">
    $(document).on('click', '#sendEmailBtn', function(){
       console.log('발송');
       var data = {
           title : encodeURIComponent($("#title").val())
           , msgCont : encodeURIComponent($("#msgCont").val())
           , rcvMail : encodeURIComponent($("#rcvMail").val())
       }
       util.getAjaxData2("sendEmail", "/rest/sample/sendEmail", data, function(dst_id, response){
            console.log('성공');

       });
    });

</script>
