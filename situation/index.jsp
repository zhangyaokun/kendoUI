<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<div class="panel">
    <div class="panel-heading">
        <h6>
            舆情监控
            <a href="javascript:;" id="icon-situation" data-toggle="collapse" data-target="#collapseSituation">
                <i class="icon icon-chevron-up" style="float: right;"></i>
            </a>
        </h6>
    </div>
    <div class="panel-body in" id="collapseSituation">
        <div class="row">
            <%--地图--%>
            <div class="col-md-5">
                <%@include file="../map/index.jsp" %>
            </div>
            <%--右侧数据显示--%>
            <div class="col-md-7">
                <div class="dynamic-notice">
                    <div style="height: 36px;">
                        <i class="icon icon-tags iconTags"></i>
                        <span class="iconTags-span">今日动态</span>
                    </div>
                    <div class="dynamic-mes">
                        增加<a class="addStaCount"></a>座站址、删除<a class="delStaCount"></a>座站点；
                        增加<a class="addOrderNum"></a>个订单、取消<a class="delOrderNum"></a>个订单
                    </div>
                    <div class="dynamic-mes">
                        增加<a class="addProNum"></a>个项目、取消<a class="delProNum"></a>个项目；
                        增加<a class="addCountNum">0</a>份合同、终止<a class="delCountNum">0</a>份合同
                    </div>
                </div>
                <div style="margin: 20px 0;">
                    <ul class="nav nav-tabs">
                        <div class="col-xs-6">
                            <div class="row">
                                <li class="active">
                                    <div style="font-weight: 100;padding: 0 10px;">
                                        <a class="btn btn-primary btn-style" data-target="#site" data-toggle="tab">站</a>
                                        <label class="site-label">增加
                                            <a class="addStaCount-a"></a>座
                                        </label>
                                        <label style="font-weight: 100;">删除
                                            <a class="delStaCount-a"></a>座
                                        </label>
                                    </div>
                                </li>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">
                                <li>
                                    <div>
                                        <a class="btn btn-success btn-style" data-target="#order"
                                           data-toggle="tab">订</a>
                                        <label class="site-label">增加
                                            <a class="order-add"></a>个
                                        </label>
                                        <label style="font-weight: 100;">取消
                                            <a class="order-del"></a>个
                                        </label>
                                    </div>
                                </li>
                            </div>
                        </div>
                    </ul>
                </div>
                <div style="margin: 20px 0;">
                    <ul class="nav nav-tabs">
                        <div class="col-xs-6">
                            <div class="row">
                                <li>
                                    <div style="font-weight: 100;padding: 0 10px;">
                                        <a class="btn btn-warning btn-style" data-target="#project"
                                           data-toggle="tab">项</a>
                                        <label class="site-label">增加
                                            <a class="project-add"></a>个
                                        </label>
                                        <label style="font-weight: 100;">
                                            取消<a class="project-del"></a>个
                                        </label>
                                    </div>
                                </li>
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="row">
                                <li>
                                    <div>
                                        <a class="btn btn-danger btn-style" data-target=" #contract"
                                           data-toggle="tab">契</a>
                                        <label class="site-label">增加
                                            <a class="contract-add">0</a>份
                                        </label>
                                        <label style="font-weight: 100;">终止
                                            <a class="contract-del">0</a>份
                                        </label>
                                    </div>
                                </li>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </div>

        <div class="tab-content">
            <%--站址详情--%>
            <div class="tab-pane fade active in" id="site">
                <div class="panel-heading">
                    <h6>新增站址汇总表<i class="icon icon-download-alt" id="export-site" style="padding: 0 10px;"></i></h6>
                </div>
                <div class="panel-body" id="table-site"></div>
            </div>
            <%--订单详情--%>
            <div class="tab-pane fade" id="order">
                <div class="panel-heading">
                    <h6>新增订单汇总表<i class="icon icon-download-alt" id="export-order" style="padding: 0 10px;"></i></h6>
                </div>
                <div class="panel-body">
                    <div class="panel-body" id="table-order"></div>
                </div>
            </div>
            <%--项目详情--%>
            <div class="tab-pane fade" id="project">
                <div class="panel-heading">
                    <h6>新增项目汇总表<i class="icon icon-download-alt" id="export-project" style="padding: 0 10px;"></i></h6>
                </div>
                <div class="panel-body">
                    <div class="panel-body" id="table-project"></div>
                </div>
            </div>
            <%--合同详单--%>
            <div class="tab-pane fade" id="contract">
                <div class="panel-heading">
                    <h6>合同详单</h6>
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>合同编号</th>
                            <th>合同类型</th>
                            <th>合同状态</th>
                            <th>合同总金额</th>
                            <th>履行开始时间</th>
                            <th>履行结束时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>...</td>
                            <td>...</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //icon图标折叠
    $('#icon-situation').click(function () {
        if ($('#icon-situation i').attr('class').indexOf('icon-chevron-up') != -1) {
            $('#icon-situation i').removeClass('icon-chevron-up').addClass('icon-chevron-down')
        } else {
            $('#icon-situation i').removeClass('icon-chevron-down').addClass('icon-chevron-up')
        }
    });

    //站址详情
    function staDet(value) {
        var prm = {
            regionNo: value,
        };
        var site_logDs = front.data.pgSeqDataSource(
                {
                    url: ajaxSrvPath('sta_det'),
                    data: function () {
                        return prm;
                    },
                    dataType: "json",
                },
                {
                    serverPaging: true,
                    schema: {
                        data: "data.list",
                        total: "data.total"
                    }
                }, {
                    simple: true
                }
        );
        $('#table-site').kendoGrid({
            resizable: true ,
            autoBind: false,
            columns: [
                {'field': 'code', title: '站点编码', 'template': hasTitleTemplate('code')},
                {'field': 'typeIdName', title: '站点类型', 'template': hasTitleTemplate('typeIdName')},
                {'field': 'name', title: '所属组织', 'template': hasTitleTemplate('name')},
                {'field': 'regionName', title: '所属管理区域', 'template': hasTitleTemplate('regionName')},
                {'field': 'location', title: '所在地址', 'template': hasTitleTemplate('location')},
                {'field': 'longitude', title: '经度', 'template': hasTitleTemplate('longitude')},
                {'field': 'latitude', title: '纬度', 'template': hasTitleTemplate('latitude')},
                {'field': 'propCharIdName', title: '产权性质', 'template': hasTitleTemplate('propCharIdName')},
                {'field': 'propNameName', title: '原产权单位', 'template': hasTitleTemplate('propNameName')},
                {'field': 'createTime', title: '创建时间', 'template': hasTitleTemplate('createTime')},
            ],
            pageable: {
                pageSize: 10,
                refresh: true,
                pageSizes: [10, 20, 50],
                buttonCount: 5,
                input: true
            },
            dataSource: site_logDs
        })
        site_logDs.fetch();
        //下载数据
        $('#export-site').click(function () {
            exportStaDet(value)
        })
    }
    //站址详情下载
    function exportStaDet(value) {
        window.open(ajaxSrvPath('export_sta_det?regionNo=' + value))
    }

    //初始化订单数量接口
    function ordNum(value) {
        progress_get({url: ajaxSrvPath('ord_num'), data: {regionNo: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        if (result.data.addOrdNum == null) {
                            $('.order-add').html(0)
                            $('.addOrderNum').html(0)
                        } else {
                            $('.order-add').html(result.data.addOrdNum)
                            $('.addOrderNum').html(result.data.addOrdNum)
                        }
                        if (result.data.delOrdNum == null) {
                            $('.order-del').html(0)
                            $('.delOrderNum').html(0)
                        } else {
                            $('.order-del').html(result.data.delOrdNum)
                            $('.delOrderNum').html(result.data.delOrdNum)
                        }
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    //订单详情 ord_det
    function ordDet(value) {
        var prm = {
            regionNo: value,
        };
        var order_logDs = front.data.pgSeqDataSource(
                {
                    url: ajaxSrvPath('ord_det'),
                    data: function () {
                        return prm;
                    },
                    dataType: "json",
                },
                {
                    serverPaging: true,
                    schema: {
                        data: "data.list",
                        total: "data.total"
                    }
                }, {
                    simple: true
                }
        );
        $('#table-order').kendoGrid({
            resizable: true ,
            autoBind: false,
            columns: [
                {'field': 'orderId', title: '订单编号', 'template': hasTitleTemplate('orderId')},
                {'field': 'orderTypeName', title: '订单类型', 'template': hasTitleTemplate('orderTypeName')},
                {'field': 'buildWayName', title: '建设方式', 'template': hasTitleTemplate('buildWayName')},
                {'field': 'custCompanyTypeName', title: '运营商类型', 'template': hasTitleTemplate('custCompanyTypeName')},
                {'field': 'orderStateName', title: '订单状态', 'template': hasTitleTemplate('orderStateName')},
                {'field': 'hireTime', title: '起租时间', 'template': hasTitleTemplate('hireTime')},
                {'field': 'deliveryTime', title: '应交付时间', 'template': hasTitleTemplate('deliveryTime')},
                {'field': 'towerTypeName', title: '铁塔类型', 'template': hasTitleTemplate('towerTypeName')},
                {'field': 'roomTypeName', title: '机房类型', 'template': hasTitleTemplate('roomTypeName')},
                {'field': 'assortTypeName', title: '配套类型', 'template': hasTitleTemplate('assortTypeName')},
                {'field': 'createTime', title: '创建时间', 'template': hasTitleTemplate('createTime')},
            ],
            pageable: {
                pageSize: 10,
                refresh: true,
                pageSizes: [10, 20, 50],
                buttonCount: 5,
                input: true
            },
            dataSource: order_logDs
        })
        order_logDs.fetch();
        //下载数据
        $('#export-order').click(function () {
            exportOrdDet(value)
        })
    }
    //订单详情下载
    function exportOrdDet(value) {
        window.open(ajaxSrvPath('export_ord_det?regionNo=' + value))
    }

    //初始化项目数量接口
    function proNum(value) {
        progress_get({url: ajaxSrvPath('pro_num'), data: {regionNo: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        if (result.data.addProNum == null) {
                            $('.project-add').html(0)
                            $('.addProNum').html(0)
                        } else {
                            $('.project-add').html(result.data.addProNum)
                            $('.addProNum').html(result.data.addProNum)
                        }
                        if (result.data.delProNum == null) {
                            $('.project-del').html(0)
                            $('.delProNum').html(0)
                        } else {
                            $('.project-del').html(result.data.delProNum)
                            $('.delProNum').html(result.data.delProNum)
                        }
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    //项目详单
    function proDet(value) {
        var prm = {
            regionNo: value,
        };
        var pro_logDs = front.data.pgSeqDataSource(
                {
                    url: ajaxSrvPath('pro_det'),
                    data: function () {
                        return prm;
                    },
                    dataType: "json",
                },
                {
                    serverPaging: true,
                    schema: {
                        data: "data.list",
                        total: "data.total"
                    }
                }, {
                    simple: true
                }
        );
        $('#table-project').kendoGrid({
            resizable: true ,
            autoBind: false,
            columns: [
                {'field': 'projectNo', title: '项目编码', 'template': hasTitleTemplate('projectNo')},
                {'field': 'projectName', title: '项目名称', 'template': hasTitleTemplate('projectName')},
                {'field': 'projectType', title: '项目类别', 'template': hasTitleTemplate('projectType')},
                {'field': 'buildWay', title: '建设方式', 'template': hasTitleTemplate('buildWay')},
                {'field': 'projectStateName', title: '项目状态', 'template': hasTitleTemplate('projectStateName')},
                {'field': 'expectStartTime', title: '预计开工时间', 'template': hasTitleTemplate('expectStartTime')},
                {'field': 'expectEndTime', title: '预计完工时间', 'template': hasTitleTemplate('expectEndTime')},
                {'field': 'projectRealEndTime', title: '实际完工时间', 'template': hasTitleTemplate('projectRealEndTime')},
                {'field': 'createDate', title: '创建时间', 'template': hasTitleTemplate('createDate')},
            ],
            pageable: {
                pageSize: 10,
                refresh: true,
                pageSizes: [10, 20, 50],
                buttonCount: 5,
                input: true
            },
            dataSource: pro_logDs
        })
        pro_logDs.fetch();
        //下载数据
        $('#export-project').click(function () {
            exportProDet(value)
        })
    }
    //项目详情下载
    function exportProDet(value) {
        window.open(ajaxSrvPath('export_pro_det?regionNo=' + value))
    }

</script>

<style>
    .addStaCount {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .delOrderNum {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .addProNum {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .delProNum {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .addOrderNum {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .addStaCount-a {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
    }

    .delStaCount {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .delStaCount-a {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
    }

    .order-add {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
        color: #2e9134;
    }

    .order-del {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
        color: #2e9134;
    }

    .project-add {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
        color: #df8f0e;
    }

    .project-del {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
        color: #df8f0e;
    }

    .contract-add {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
        color: #e64525;
    }

    .contract-del {
        display: inline-block;
        width: 55px;
        text-align: center;
        font-size: x-large;
        color: #e64525;
    }

    .addCountNum {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .delCountNum {
        display: inline-block;
        width: 45px;
        text-align: center;
    }

    .iconTags {
        font-size: 25px;
        color: #565353;
    }

    .iconTags-span {
        font-size: 20px;
        font-weight: bold;
        color: #565353;
    }

    /*公告*/
    .dynamic-notice {
        height: 118px;
        background-color: #ffffbb;
        border: 1px solid #df8f0e;
        padding: 6px 21px 12px;
    }

    .dynamic-mes {
        line-height: 27px;
        letter-spacing: 5px;
    }

    .btn-style {
        min-width: 50px;
        height: 50px;
        line-height: 42px;
        font-size: 22px;
    }

    .site-label {
        font-weight: 100;
        padding: 0 20px;
    }
</style>
</body>
</html>
