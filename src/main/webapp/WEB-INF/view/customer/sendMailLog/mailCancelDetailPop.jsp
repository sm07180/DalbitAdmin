<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="dummyData"><%= java.lang.Math.round(java.lang.Math.random() * 1000000) %></c:set>
<% String mailEtc = request.getParameter("mailEtc"); %>

<div class="pull-left pt10 pl10"><span id="selectYn"></span></div>
<div class="widget-content">
    <table id="tb_res_sendMailLogList" class="table table-sorting table-hover table-bordered" style="width: 710px; text-align: center; border-collapse: collapse">
        <tbody>
        <tr>
            <td>
                <img src="https://image.dalbitlive.com/emailForm/emailForm_top.png"
                     alt="달빛라이브"
                     loading="lazy"
                     style="vertical-align: bottom"
                />
            </td>
        </tr>
        <tr>
            <td style="padding: 25px; border: 1px solid #eee; border-top: none;">
                <table style="width: 100%">
                    <tr>
                        <td style="text-align: left; font-size: 34px; font-weight: 700; color: #333333; letter-spacing: -2px;">
                            달빛라이브<br/>
                            <strong id="cancelUserName" style="color: #632BEB"></strong>님의 결제 취소 안내입니다.
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; font-size: 22px; font-weight: 400; color: #333333; padding-top: 10px; letter-spacing: -1px;">
                            아래 결제된 내역에 대해 취소되었음을 안내 드립니다.
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 30px;">
                            <table style="border-top: 3px solid #333333; width: 100%; border-collapse: collapse;">
                                <tbody>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #EEEEEE; font-size: 20px; font-weight: 700; color: #333333;">거래일시</th>
                                    <td id="paymentDate" style="width: 75%; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #EEEEEE; font-size: 20px; font-weight: 700; color: #333333;">결제수단</th>
                                    <td id="paymentMethod" style="width: 75%; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #EEEEEE; font-size: 20px; font-weight: 700; color: #333333;">결제정보</th>
                                    <td id="paymentInfo" style="width: 75%; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #EEEEEE; font-size: 20px; font-weight: 700; color: #333333;">결제상품</th>
                                    <td id="paymentProduct" style="width: 75%; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #EEEEEE; font-size: 20px; font-weight: 700; color: #333333;">결제수량</th>
                                    <td id="paymentQuantity" style="width: 75%; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #EEEEEE; font-size: 20px; font-weight: 700; color: #333333;">결제금액</th>
                                    <td id="paymentPrice" style="width: 75%; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #757575; font-size: 20px; font-weight: 700; color: #ffffff;">취소일시</th>
                                    <td id="cancelDate" style="width: 75%; background-color: #EEEEEE; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                <tr style="height: 50px; border-bottom: 1px solid #BFBFBF;">
                                    <th style="width: 25%; background-color: #757575; font-size: 20px; font-weight: 700; color: #ffffff;">취소금액</th>
                                    <td id="cancelPrice" style="width: 75%; background-color: #EEEEEE; font-size: 22px; font-weight: 400; color: #333333; text-align: left; padding: 0 30px;"></td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; font-size: 18px; font-weight: 400; color: #757575; letter-spacing: -1px; padding-top: 18px;">
                            미성년자의 결제 내역은 본 이메일 주소로 고지되며, 만약 미성년자가 법정대리인의<br/> 동의 없이 결제한 경우 법정대리인은 결제를 취소 할 수 있습니다.
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
    <button onclick="closePop()" class="btn btn-default" style="display: flex; margin: 0 auto;">확인</button>
</div>

<script src="/js/dataTablesSource/customer/sendMailLogDataTableSource.js?${dummyData}"></script>
<script type="text/javascript" src="/js/code/customer/restrictionsCodeList.js?${dummyData}"></script>
<script>
  const jsonMailEtc = "<%=mailEtc%>";
  console.log(decodeURIComponent(jsonMailEtc));
  const mailEtc = JSON.parse(decodeURIComponent(jsonMailEtc));

  $(document).ready(function() {
    getRes_sendMailDetail()
  });

  function getRes_sendMailDetail(){
    console.log(mailEtc);
    $("#cancelUserName").html(mailEtc.cancelUserName);
    $("#paymentDate").html(mailEtc.paymentDate);
    $("#paymentMethod").html(mailEtc.paymentMethod);
    $("#paymentInfo").html(mailEtc.paymentAccount + ' ' + mailEtc.paymentBank);
    $("#paymentProduct").html(mailEtc.paymentProduct);
    $("#paymentQuantity").html(mailEtc.paymentQuantity);
    $("#paymentPrice").html(mailEtc.paymentPrice);
    $("#cancelDate").html(mailEtc.cancelDate);
    $("#cancelPrice").html(mailEtc.cancelPrice);
  }

  function closePop() {
    window.close();
  }

</script>