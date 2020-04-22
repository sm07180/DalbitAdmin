<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>jsTree test</title>
    <!-- 2 load the theme CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<body>

<div class="col-md-4 col-sm-8 col-xs-8" style="margin-bottom: 20px;">
    <button type="button" class="btn btn-default btn-sm" onclick="root_add();"><i class="glyphicon glyphicon-asterisk"></i> 루트 추가</button>
    <button type="button" class="btn btn-success btn-sm" onclick="demo_create();"><i class="glyphicon glyphicon-asterisk"></i> 생성</button>
    <button type="button" class="btn btn-warning btn-sm" onclick="demo_rename();"><i class="glyphicon glyphicon-pencil"></i> 이름변경</button>
    <button type="button" class="btn btn-danger btn-sm" onclick="demo_delete();"><i class="glyphicon glyphicon-remove"></i> 삭제</button>
    <button type="button" class="btn btn-primary btn-sm" onclick="demo_refresh();"><i class="glyphicon glyphicon-remove"></i> 새로고침</button>
</div>

<!-- 3 setup a container element -->
<div id="jstree"></div>

<!-- 4 include the jQuery library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<!-- 5 include the minified jstree source -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
    $(function () {

        $('#jstree').jstree({
            "core" : {
                "animation" : 0,
                "check_callback" : true,
                'force_text' : true,
                "themes" : { "stripes" : true },
                'data' : [
                    { "id" : "ajson1", "parent" : "#", "text" : "1뎁스" },
                    { "id" : "ajson6", "parent" : "ajson1", "text" : "2뎁스" },
                    { "id" : "ajson2", "parent" : "#", "text" : "Root node 2" },
                    { "id" : "ajson3", "parent" : "ajson2", "text" : "Child 1" },
                    { "id" : "ajson4", "parent" : "ajson2", "text" : "Child 2" },
                    { "id" : "ajson5", "parent" : "ajson2", "text" : "Child 2" },
                ]
            },
            "types" : {
                "#" : { "max_children" : 1, "max_depth" : 2 },
                "root" : { "icon" : "/static/3.3.9/assets/images/tree_icon.png", "valid_children" : ["default"] },
                "default" : { "valid_children" : ["default","file"] },
                "file" : { "icon" : "glyphicon glyphicon-file", "valid_children" : [] }
            },
            "plugins" : [ "contextmenu", "dnd", "search", "state", "types", "wholerow" ]
        });
    });


    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
        console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
        $('#jstree').jstree(true).select_node('child_node_1');
        $('#jstree').jstree('select_node', 'child_node_1');
        $.jstree.reference('#jstree').select_node('child_node_1');
    });

    function root_add(){
        $("#jstree").jstree('create_node', '#', {'id' : 'myId', 'text' : 'My Text'}, 'last');
    }

    function demo_create() {
        var ref = $('#jstree').jstree(true),
            sel = ref.get_selected();
        if(!sel.length) { return false; }
        sel = sel[0];
        sel = ref.create_node(sel, {"type":"file"});
        if(sel) {
            ref.edit(sel);
        }
    };
    function demo_rename() {
        var ref = $('#jstree').jstree(true),
            sel = ref.get_selected();
        if(!sel.length) { return false; }
        sel = sel[0];
        ref.edit(sel);
    };
    function demo_delete() {
        var ref = $('#jstree').jstree(true),
            sel = ref.get_selected();
        if(!sel.length) { return false; }
        ref.delete_node(sel);
    };

    function demo_refresh(){
        $('#jstree').jstree(true).refresh();
    }

</script>
</body>
</html>
