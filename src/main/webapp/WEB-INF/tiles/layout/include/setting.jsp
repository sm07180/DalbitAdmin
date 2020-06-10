<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- STYLE SWITCHER -->
<%--<div class="del-style-switcher" style="right: -250px;">
    <div class="del-switcher-toggle toggle-hide"></div>
    <form>
        <section class="del-section del-section-skin">
            <h5 class="del-switcher-header">Choose Skins:</h5>
            <ul>
                <li><a href="#" title="Slate Gray" class="switch-skin slategray" data-skin="/template/css/skins/dalbitRadio.css">Slate Gray</a></li>
                <li><a href="#" title="Dark Blue" class="switch-skin darkblue" data-skin="/template/css/skins/darkblue.css">Dark Blue</a></li>
                <li><a href="#" title="Dark Brown" class="switch-skin darkbrown" data-skin="/template/css/skins/darkbrown.css">Dark Brown</a></li>
                <li><a href="#" title="Light Green" class="switch-skin lightgreen" data-skin="/template/css/skins/lightgreen.css">Light Green</a></li>
                <li><a href="#" title="Orange" class="switch-skin orange" data-skin="/template/css/skins/orange.css">Orange</a></li>
                <li><a href="#" title="Red" class="switch-skin red" data-skin="/template/css/skins/red.css">Red</a></li>
                <li><a href="#" title="Teal" class="switch-skin teal" data-skin="/template/css/skins/teal.css">Teal</a></li>
                <li><a href="#" title="Yellow" class="switch-skin yellow" data-skin="/template/css/skins/yellow.css">Yellow</a></li>
            </ul>
            <button type="button" class="switch-skin-full fulldark" data-skin="/template/css/skins/fulldark.css">Full Dark</button>
            <button type="button" class="switch-skin-full fullbright" data-skin="/template/css/skins/fullbright.css">Full Bright</button>
        </section>
        <label class="fancy-checkbox">
            <input type="checkbox" id="fixed-top-nav"><span>Fixed Top Navigation</span>
        </label>
        <p><a href="#" title="Reset Style" class="del-reset-style">Reset Style</a></p>
    </form>
</div>--%>
<!-- END STYLE SWITCHER -->

<!-- 이미지 원본 보기 -->
<div id="_imgFullLayer"></div>

<!-- 엑셀 다운로드 용 iframe -->
<iframe id="iframe_excel_download" name="iframe_excel_download" style="display:none;"></iframe>

<script type="text/javascript">
    $(function(){
        ui.paintColor();
    });
</script>