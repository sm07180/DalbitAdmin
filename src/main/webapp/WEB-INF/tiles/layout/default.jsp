<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<!--[if IE 9 ]><html class="ie ie9" lang="en" class="no-js"> <![endif]-->
<!--[if !(IE)]><!-->
<html lang="ko" class="no-js">
<!--<![endif]-->

<head>
    <tiles:insertAttribute name="header"/>
</head>

<%--<body class="dashboard">--%>
<body>

        <tiles:insertAttribute name="script"/>

<!-- WRAPPER -->
<div class="wrapper">
    <tiles:insertAttribute name="top"/>
<!-- BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
<div class="bottom">
<div class="container">
<div class="row">
    <tiles:insertAttribute name="left"/>
<!-- top general alert -->
<div class="alert alert-danger top-general-alert" style="display: none;">
<span>If you <strong>can't see the logo</strong> on the top left, please reset the style on right style switcher (for upgraded theme only).</span>
<button type="button" class="close">×</button>
</div>
<!-- end top general alert -->
<!-- content-wrapper -->
<div id="main-content-wrapper" class="content-wrapper ">
<!-- top general alert -->
<div class="alert alert-danger top-general-alert">
<span>If you <strong>can't see the logo</strong> on the top left, please reset the style on right style switcher (for upgraded theme only).</span>
<button type="button" class="close">&times;</button>
</div>
<!-- end top general alert -->
<div class="row">
<div class="col-md-4 ">
<ul class="breadcrumb">
<li><i class="fa fa-home"></i><a href="#">Home</a></li>
<li class="active">Dashboard</li>
</ul>
</div>
<div class="col-md-8 ">
<div class="top-content">
<ul class="list-inline mini-stat">
<li>
<h5>LIKES <span class="stat-value stat-color-orange"><i class="fa fa-plus-circle"></i> 81,450</span></h5>
<span id="mini-bar-chart1" class="mini-bar-chart"></span>
</li>
<li>
<h5>SUBSCRIBERS <span class="stat-value stat-color-blue"><i class="fa fa-plus-circle"></i> 150,743</span></h5>
<span id="mini-bar-chart2" class="mini-bar-chart"></span>
</li>
<li>
<h5>CUSTOMERS <span class="stat-value stat-color-seagreen"><i class="fa fa-plus-circle"></i> 43,748</span></h5>
<span id="mini-bar-chart3" class="mini-bar-chart"></span>
</li>
</ul>
</div>
</div>
</div>

        <tiles:insertAttribute name="body"/>
</div>
<!-- /row -->
</div>
<!-- /container -->
</div>
<!-- END BOTTOM: LEFT NAV AND RIGHT MAIN CONTENT -->
</div>
<!-- /wrapper -->

<!-- STYLE SWITCHER -->
<div class="del-style-switcher" style="right: -250px;">
<div class="del-switcher-toggle toggle-hide"></div>
<form>
<section class="del-section del-section-skin">
<h5 class="del-switcher-header">Choose Skins:</h5>
<ul>
<li><a href="#" title="Slate Gray" class="switch-skin slategray" data-skin="/template2/assets/css/skins/slategray.css">Slate Gray</a></li>
<li><a href="#" title="Dark Blue" class="switch-skin darkblue" data-skin="/template2/assets/css/skins/darkblue.css">Dark Blue</a></li>
<li><a href="#" title="Dark Brown" class="switch-skin darkbrown" data-skin="/template2/assets/css/skins/darkbrown.css">Dark Brown</a></li>
<li><a href="#" title="Light Green" class="switch-skin lightgreen" data-skin="/template2/assets/css/skins/lightgreen.css">Light Green</a></li>
<li><a href="#" title="Orange" class="switch-skin orange" data-skin="/template2/assets/css/skins/orange.css">Orange</a></li>
<li><a href="#" title="Red" class="switch-skin red" data-skin="/template2/assets/css/skins/red.css">Red</a></li>
<li><a href="#" title="Teal" class="switch-skin teal" data-skin="/template2/assets/css/skins/teal.css">Teal</a></li>
<li><a href="#" title="Yellow" class="switch-skin yellow" data-skin="/template2/assets/css/skins/yellow.css">Yellow</a></li>
</ul>
<button type="button" class="switch-skin-full fulldark" data-skin="/template2/assets/css/skins/fulldark.css">Full Dark</button>
<button type="button" class="switch-skin-full fullbright" data-skin="/template2/assets/css/skins/fullbright.css">Full Bright</button>
</section>
<label class="fancy-checkbox">
<input type="checkbox" id="fixed-top-nav"><span>Fixed Top Navigation</span>
</label>
<p><a href="#" title="Reset Style" class="del-reset-style">Reset Style</a></p>
</form>
</div>
<!-- END STYLE SWITCHER -->

<!-- Javascript -->



