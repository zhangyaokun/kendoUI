<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN" class="no-js">
<%

    String staffId = "";
    if(request.getQueryString()==null){
        staffId = "21200089";
    }else{
        staffId = request.getParameter("staffId");
    }
%>
<head>
    <title>一线看全</title>
    <%@ include file="/_include/header_lib.jsp" %>
    <%@ include file="/_include/kendo_base_lib.jsp" %>
    <%@ include file="/_include/kendo_grid_lib.jsp" %>

    <!-- ZUI Javascript组件 -->
    <link href="${ctxStatic}/zui/dist/css/zui.min.css" rel="stylesheet">
    <script src="${ctxStatic}/zui/dist/js/zui.min.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/asset/zui-dialog.css" rel="stylesheet">
    <script src="${ctxStatic}/asset/zui-dialog.js"></script>
    <link href="core-single.css" rel="stylesheet">
    <script src="${ctxStatic}/jquery/jquery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="${ctxStatic}/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script src="${ctxStatic}/zTree/js/jquery.ztree.core.min.js"></script>
    <script src="${ctxStatic}/zTree/js/jquery.ztree.exedit.min.js"></script>
    <script src="${ctxStatic}/zTree/js/jquery.ztree.exhide.min.js"></script>
    <script src="${ctxStatic}/kendo/js/kendo.all.min.js"></script>
    <script src="./utils/echarts-all.js"></script>
    <script>
        var ajaxSrvPath = function (path) {
            return window.contentPath + "/pdss/birdview/" + path;
        };
    </script>
    <%@ include file="/_include/application.jsp" %>
</head>
<body>
<div class="panel">
    <div class="panel-heading">
        <h6>一线看全</h6>
    </div>
    <div class="panel-body" id="top">
        <%--消息提示--%>
        <%@ include file="message/index.jsp" %>
        <%--实时动态--%>
        <%@ include file="dynamic/index.jsp" %>
        <%--舆情监控--%>
        <%@include file="situation/index.jsp" %>
        <%--实时监控--%>
        <%@include file="monitor/index.jsp" %>
    </div>
    <a href="javascript:;" class="logoTop">返回顶部<i class="icon icon-rocket"></i></a>
</div>

<script>
    $('.logoTop').click(function () {
        $(document).scrollTop(0, 0);
    })

    var staffId = <%=staffId %>;
    var regionNo;
    var regionId;
    var regionName;

    progress_get({url: ajaxSrvPath('init_staff'), data: {staffId: staffId}})
            .done(function (result) {
                if (result.status == 'ok') {
                    regionNo = result.data.regionNo;
                    regionId = result.data.regionId;
                    regionName = result.data.regionName;
                    //初始化kendo分页组件
                    initKendo();
                    //站址预警数量接口
                    errorStaNum(regionNo);
                    //新增站址数量接口
                    staNum(regionNo);
                    //轮播数据接口
                    undelStaDet(regionNo);
                    //树初始化接口
                    orgTreeInit(regionNo);
                    //树右侧数据 初始化
                    queryOrgDet(regionNo);
                    //新增站址详情
                    staDet(regionNo);
                    //订单数量初始化
                    ordNum(regionNo);
                    //新增订单详情
                    ordDet(regionNo);
                    //项目数量初始化
                    proNum(regionNo);
                    //新增项目详情
                    proDet(regionNo);
                    //地图初始化
                    mapInit(regionId,regionName);
                }else{
                    alert("该用户信息不存在,非铁塔用户!");
                }
            })

    function initKendo() {
        kendo.ui.Pager.prototype.options.messages =
                $.extend(true, kendo.ui.Pager.prototype.options.messages, {
                    "display": "当前 {0} - {1} 条， 共 {2} 条记录。",
                    "empty": "没有可显示的记录。",
                    "page": "页",
                    "of": "共 {0} 页",
                    "itemsPerPage": "每页",
                    "first": "首页",
                    "last": "末页",
                    "next": "下一页",
                    "previous": "上一页",
                    "refresh": "刷新",
                    "morePages": "更多..."
                });
    }
</script>
<style>
    .logoTop {
        width: 17px;
        height: 100px;
        position: fixed;
        right: 14px;
        bottom: 20px;
        z-index:999;
    }
</style>
</body>
</html>
