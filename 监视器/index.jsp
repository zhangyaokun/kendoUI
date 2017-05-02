<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<div class="panel">
    <div class="panel-heading">
        <h6>
            实时监控
            <a href="javascript:;" id="icon-monitor" data-toggle="collapse" data-target="#collapseMonitor">
                <i class="icon icon-chevron-up" style="float: right;"></i>
            </a>
        </h6>
    </div>
    <div class="panel-body in" id="collapseMonitor" style="position:relative;padding-bottom:0;">
        <div class="tree-panel-wrap" id="tree-panel"
             style="width: 250px;position: absolute;top: 0;left: 10px;"> <%--  指标树 --%>
            <div class="search-box-sm" style="margin-top:15px;">
                <input type="text" class="form-control" id="monitor-tree-search" placeholder="请搜索">
                <a href="javascript:;" id="tree-search"><i class="icon-search"></i></a>
            </div>
            <div id="search-org">
                <ul id="ztree" class="ztree" style="overflow:auto;height:600px;width:239px;"></ul>
            </div>
        </div>
        <div class="panel-pa row" style="margin-left: 230px;">
            <h6 class="query-title"></h6>
            <div class="panel-row col-md-6">
                <div>
                    <div class="province-info-are">
                        <div id="province-info" class="panel-content"></div>
                        <div id="province-order" class="panel-content"></div>
                        <div id="province-pro" class="panel-content"></div>
                    </div>
                    <div class="city-info-are">
                        <div id="city-info" class="panel-content"></div>
                        <div id="city-order" class="panel-content"></div>
                        <div id="city-pro" class="panel-content"></div>
                    </div>
                </div>
            </div>
            <div class="panel-row col-md-6">
                <div>
                    <div class="province-info-are">
                        <div id="province-const" class="panel-content"></div>
                        <div id="province-assets" class="panel-content"></div>
                        <div id="province-contract" class="panel-content"></div>
                    </div>
                    <div class="city-info-are">
                        <div id="city-const" class="panel-content"></div>
                        <div id="city-assets" class="panel-content"></div>
                        <div id="city-contract" class="panel-content"></div>
                    </div>
                </div>
            </div>
        </div>
        <%--内容展示区--%>
    </div>
    <%--地市详情--%>
    <%@include file="_monitor_province.jsp" %>
    <%@include file="_monitor_city.jsp" %>
    <%@include file="_tree_js.jsp" %>
</div>

<script>
    //icon图标折叠
    $('#icon-monitor').click(function () {
        if ($('#icon-monitor i').attr('class').indexOf('icon-chevron-up') != -1) {
            $('#icon-monitor i').removeClass('icon-chevron-up').addClass('icon-chevron-down')
        } else {
            $('#icon-monitor i').removeClass('icon-chevron-down').addClass('icon-chevron-up')
        }
    });
    //树初始化接口
    function orgTreeInit(value) {
        progress_get({url: ajaxSrvPath('org_tree'), data: {regionNo: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        //默认展开第一节点
                        var data = result.data.find(function (e) {
                            return e.regionNo == value
                        });
                        data.open = true
                        zTree = $.fn.zTree.init($("#ztree"), setting, result.data);
                        var node = zTree.getNodeByParam("regionNo",data.regionNo);
                        zTree.selectNode(node);
                        addBind()
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    ;
    //树右侧数据 初始化
    function queryOrgDet(value) {
        progress_post({
            url: ajaxSrvPath('query_org_det'),
            data: kendo.stringify({stationId: null, regionNo: regionNo, gradeId: null})
        })
                .done(function (result) {
                    if ('ok' == result.status) {
                        var basicInfoList = result.data.basicInfoList
                        var costInfoList = result.data.costInfoList
                        var orderInfoList = result.data.orderInfoList
                        var projectInfoList = result.data.projectInfoList
                        var assetInfoList = result.data.assetInfoList
                        var bargainInfoList = result.data.bargainInfoList
                        $("#province-info").html(kendo.render(provinceInfo, basicInfoList));
                        $("#province-const").html(kendo.render(provinceConst, costInfoList));
                        $("#province-order").html(kendo.render(provinceOrder, orderInfoList));
                        $("#province-pro").html(kendo.render(provincePro, projectInfoList));
                        $("#province-assets").html(kendo.render(provinceAss, assetInfoList));
                        $("#province-contract").html(kendo.render(provinceTra, bargainInfoList));
                        $('.city-info-are').hide()
                        $('.province-info-are').show()
                        $('.query-title').html(result.data.title)
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    ;

</script>

<style>
    .panel-pa {
        overflow: hidden;
        padding: 0 0 0 10px;
    }

    .panel-row {
        float: left;
    }

    .panel-content {
        overflow: hidden;
        clear: both;
        border: 1px solid #0babfd;
        height: 200px;
        /*width: 300px;*/
        margin: 20px 0;
    }

    .monitor-title {
        position: relative;
        float: left;
        width: 36px;
        height: 200px;
        border-right: 1px solid #0babfd;
        padding: 24px 5px;
        background-color: #0babfd;
        text-align: center;
    }

    .monitor-title .numb-icon {
        margin-left: 0;
        color: #fff;
    }

    .monitor-title .numb-icon > i {
        color: #fff;
    }

    .monitor-title h3 {
        font-size: 15px;
        color: #fff;
    }

    .query-title {
        background-color: #f5f5f5;
        font-size: 15px;
        margin-left: 9px;
        margin-right: 9px;
        line-height: 34px;
        padding: 0 10px;
        margin-top: 0;
        margin-bottom: -5px;
        border-top: solid 2px #0babfd;
        box-shadow: 0 1px 2px #bbb;
    }

    .province-info label,
    .monitor-const label,
    .pan-content label {
        /*width: 130px;*/
    }

    .pan-content {
        /*float: left;*/
        /*width: 255px;*/
        height: 200px;
        padding: 15px 22px 15px 18px;
        line-height: 26px;
        margin-left: 40px;
    }

    .pan-content-thoe {
        /*float: left;*/
        /*width: 255px;*/
        height: 200px;
        padding: 15px 22px 15px 18px;
        line-height: 26px;
        margin-left: 40px;
    }

    .pan-content-oth {
        height: 200px;
        padding: 22px 22px 22px 18px;
        line-height: 26px;
        margin-left: 40px;
    }

    .pan-content-oth span {
        float: right;
    }

    .pan-content span {
        float: right;
    }

    /*资产信息*/
    .monitor-assets {
        /*float: left;*/
        padding: 12px 22px 12px 20px;
        line-height: 18px;
        margin-left: 40px;
    }

    .monitor-assets a {
        line-height: 22px;
    }

    .monitor-assets-div {
        /*display: inline-block;*/
        padding: 4px 3px;
        overflow: hidden;
    }

    .monitor-assets-div > label,
    .monitor-assets-div > span {
        display: inline-block;
    }

    .monitor-assets-div > label {
        min-width: 40px;
    }

    .monitor-assets > div > label {
        float: left;
        width: 40px;
        margin-bottom: 0;
        margin-top: 3px;
    }

    .assets-span {
        /*margin-right: 53px;*/
        /*padding-left: 16px;*/
    }

    /*站址详情 基础信息*/
    .city-info {
        /*float: left;*/
        /*width: 255px;*/
        height: 200px;
        padding: 6px 0 9px;
        line-height: 26px;
        margin-left: 40px;
    }

    .city-info-span {
        white-space: nowrap;
        text-overflow: ellipsis;
        width: 200px;
        overflow: hidden;
        display: inline-block;
        height: 22px;
        line-height: 22px;
        margin-bottom: -6px;
    }

    .city-info > div > label {
        margin-bottom: 0;
        vertical-align: middle;
    }

    /*城市详情 基础信息*/
    .province-info {
        /*float: left;*/
        /*width: 255px;*/
        height: 200px;
        padding: 15px 22px 15px 18px;
        line-height: 29px;
        margin-left: 40px;
    }

    .province-info span {
        float: right;
    }

    /*成本信息*/
    .monitor-const {
        /*float: left;*/
        /*width: 255px;*/
        height: 200px;
        padding: 45px 22px 45px 18px;
        line-height: 29px;
        margin-left: 40px;
    }

    .monitor-const label {
        width: 100px;
    }

    .monitor-const span {
        float: right;
    }

    .pan-content-const {
        float: left;
        width: 255px;
        height: 200px;
        padding: 45px;
        line-height: 29px;
        margin-left: 40px;
    }

    /**/
    .pan-content-contract {
        float: left;
        width: 255px;
        height: 200px;
        padding: 15px 22px 15px 18px;
        line-height: 31px;
    }

    .pan-content-contract label {
        width: 140px;
    }

    #city-contract .panel-content,
    #city-pro .panel-content,
    #city-pro .pan-content,
    #city-contract .pan-content {
        line-height: 24px;
    }

    #city-order .panel-content, #city-order .pan-content,
    #province-order .panel-content,
    #city-pro .pan-content {
        padding-left: 0;
        padding-right: 0;
    }

    #province-order .pan-content span,
    #province-pro .pan-content span,
    #province-contract .pan-content span {
        float: right;
    }

    #province-info .province-info span {
        color: #0babfd;
        font-weight: bold
    }

    #city-info .city-info span {
        color: #0babfd;
        font-weight: bold
    }

    #province-const .monitor-const span {
        color: #009688;
        font-weight: bold
    }

    #province-const.panel-content {
        border-color: #009688;
    }

    #province-const .monitor-title {
        background-color: #009688;
        border-right-color: #009688;
    }

    #city-const .monitor-const span {
        color: #009688;
        font-weight: bold
    }

    #city-const.panel-content {
        border-color: #009688;
    }

    #city-const .monitor-title {
        background-color: #009688;
        border-right-color: #009688;
    }

    #province-order .pan-content-oth span {
        color: #38b03f;
        font-weight: bold
    }

    #province-order.panel-content {
        border-color: #38b03f;
    }

    #province-order .monitor-title {
        background-color: #38b03f;
        border-right-color: #38b03f;
    }

    #city-order.panel-content {
        border-color: #38b03f;
    }

    #city-order .monitor-title {
        background-color: #38b03f;
        border-right-color: #38b03f;
    }

    #province-assets .monitor-assets-div span {
        color: #ca1b6c;
        font-weight: bold
    }

    #province-assets.panel-content {
        border-color: #ca1b6c;
    }

    #province-assets .monitor-title {
        background-color: #ca1b6c;
        border-right-color: #ca1b6c;
    }

    #city-assets .monitor-assets-div span {
        color: #ca1b6c;
        font-weight: bold
    }

    #city-assets.panel-content {
        border-color: #ca1b6c;
    }

    #city-assets .monitor-title {
        background-color: #ca1b6c;
        border-right-color: #ca1b6c;
    }

    #province-pro .pan-content-oth span {
        color: #df8f0e;
        font-weight: bold
    }

    #province-pro.panel-content {
        border-color: #df8f0e;
    }

    #province-pro .monitor-title {
        background-color: #df8f0e;
        border-right-color: #df8f0e;
    }

    #city-pro.panel-content {
        border-color: #df8f0e;
    }

    #city-pro .monitor-title {
        background-color: #df8f0e;
        border-right-color: #df8f0e;
    }

    #province-contract .pan-content span {
        color: #ea644a;
        font-weight: bold
    }

    #province-contract.panel-content {
        border-color: #ea644a;
    }

    #province-contract .monitor-title {
        background-color: #ea644a;
        border-right-color: #ea644a;
    }

    #city-contract .pan-content span {
        color: #ea644a;
        font-weight: bold
    }

    #city-contract.panel-content {
        border-color: #ea644a;
    }

    #city-contract .monitor-title {
        background-color: #ea644a;
        border-right-color: #ea644a;
    }

</style>
</body>
</html>