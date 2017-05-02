<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="row">
    <div class="col-md-4">
        <div class="alert alert-info">
            <span>实时舆情</span>
            <span><i class="icon icon-flag"></i>新增站址<a class="init-addStaCount"></a>座</span>
            <a id="sentiment" data-target="#site" data-toggle="tab">详情<i class="icon icon-double-angle-right"></i></a>
        </div>
    </div>
    <div class="col-md-4">
        <div class="alert alert-danger">
            <span>站址预警</span>
            <span><i class="icon icon-flag-checkered"></i>异常站址<a class="errorCount"></a>座</span>
            <a data-toggle="modal" data-target="#warnModal" id="warn-modal">详情<i
                    class="icon icon-double-angle-right"></i></a>
        </div>
    </div>
    <div class="col-md-4">
        <div class="alert alert-success">
            <span><i class="icon icon-group"></i>联系支撑团队</span>
            <a data-toggle="modal" data-target="#contactModal">详情<i class="icon icon-double-angle-right"></i></a>
        </div>
    </div>
    <%--联系支撑团队详情--%>
    <%@include file="_dialog_contact_js.jsp" %>
    <%--异常站址详情--%>
    <%@include file="_dialog_warn_js.jsp" %>
</div>
<script>
    $('#sentiment').click(function () {
        $(document).scrollTop(800);
    });
    //实时舆情数量接口
    function staNum(value) {
        progress_get({url: ajaxSrvPath('sta_num'), data: {regionNo: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        if (result.data.addStaCount == null) {
                            $('.addStaCount').html(0)
                            $('.addStaCount-a').html(0)
                            $('.init-addStaCount').html(0)
                        } else {
                            $('.addStaCount').html(result.data.addStaCount)
                            $('.addStaCount-a').html(result.data.addStaCount)
                            $('.init-addStaCount').html(result.data.addStaCount)
                        }
                        if (result.data.delStaCount == null) {
                            $('.delStaCount').html(0)
                            $('.delStaCount-a').html(0)
                        } else {
                            $('.delStaCount').html(result.data.delStaCount)
                            $('.delStaCount-a').html(result.data.delStaCount)
                        }
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    //站址预警数量接口
    function errorStaNum(value) {
        progress_get({url: ajaxSrvPath('error_sta_num'), data: {regionNo: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        if (result.data.allNum == null) {
                            $('.errorCount').html(0)
                        } else {
                            $('.errorCount').html(result.data.allNum)
                        }
                        if (result.data.proNum == null) {
                            $('#proDetNum').html(0)
                        } else {
                            $('#proDetNum').html(result.data.proNum)
                        }
                        if (result.data.ordNum == null) {
                            $('#resourcesNum').html(0)
                        } else {
                            $('#resourcesNum').html(result.data.ordNum)
                        }
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    //站址预警详情接口
    $('#warn-modal').click(function () {
        var prm = {
            regionNo: regionNo,
        };
        //项目施工进度延迟详情接口
        var project_logDs = front.data.pgSeqDataSource(
                {
                    url: ajaxSrvPath('error_pro_det'),
                    data: function () {
                        return prm;
                    },
                    dataType: "json",
                },
                {
                    serverPaging: true,
                    schema: {
                        data: "data.list",
                        total: "data.total",
                    }
                }, {
                    simple: true
                }
        );
        $('#delay-project').kendoGrid({
            resizable: true ,
            autoBind: false,
            columns: [
                {'field': 'provinceNo', title: '省份', 'template': hasTitleTemplate('provinceNo')},
                {'field': 'countyNo', title: '地市', 'template': hasTitleTemplate('countyNo')},
                {'field': 'cityName', title: '区域', 'template': hasTitleTemplate('cityName')},
                {'field': 'code', title: '站址编码', 'template': hasTitleTemplate('code')},
                {'field': 'chinaName', title: '站址名称', 'template': hasTitleTemplate('chinaName')},
                {'field': 'projectNo', title: '项目编码', 'template': hasTitleTemplate('projectNo')},
                {'field': 'projectName', title: '项目名称', 'template': hasTitleTemplate('projectName')},
                {'field': 'expectEndTime', title: '预计完工时间', 'template': hasTitleTemplate('expectEndTime')},
                {
                    'field': 'projectRealEndTime',
                    title: '实际完工时间',
                    'template': hasTitleTemplate('projectRealEndTime')
                },
            ],
            pageable: {
                pageSize: 10,
                refresh: true,
                pageSizes: [10, 20, 50],
                buttonCount: 5,
                input: true
            },
            dataSource: project_logDs
        })
        project_logDs.fetch();

        //资源交付延迟详情接口
        var resources_logDs = front.data.pgSeqDataSource(
                {
                    url: ajaxSrvPath('error_ord_det'),
                    data: function () {
                        return prm;
                    },
                    dataType: "json",
                },
                {
                    serverPaging: true,
                    schema: {
                        data: "data.list",
                        total: "data.total",
                    }
                }, {
                    simple: true
                }
        );
        $('#delay-resources').kendoGrid({
            resizable: true ,
            autoBind: false,
            columns: [
                {'field': 'provinceNo', title: '省份', 'template': hasTitleTemplate('provinceNo')},
                {'field': 'countyNo', title: '地市', 'template': hasTitleTemplate('countyNo')},
                {'field': 'cityName', title: '区域', 'template': hasTitleTemplate('cityName')},
                {'field': 'code', title: '站址编码', 'template': hasTitleTemplate('code')},
                {'field': 'chinaName', title: '站址名称', 'template': hasTitleTemplate('chinaName')},
                {'field': 'orderNo', title: '订单编号', 'template': hasTitleTemplate('orderNo')},
                {'field': 'deliveryTime', title: '应交付时间', 'template': hasTitleTemplate('deliveryTime')},
                //{'field': 'orderState', title: '实际交付时间', 'template': hasTitleTemplate('propCharIdName')},
                {'field': 'orderStateName', title: '订单状态', 'template': hasTitleTemplate('orderStateName')},
            ],
            pageable: {
                pageSize: 10,
                refresh: true,
                pageSizes: [10, 20, 50],
                buttonCount: 5,
                input: true
            },
            dataSource: resources_logDs
        })
        resources_logDs.fetch();

        //下载
        //项目施工进度延迟下载接口 export_error_pro_det
        $('#export-errProDet').click(function () {
            window.open(ajaxSrvPath('export_error_pro_det?regionNo=' + regionNo))
        })
        //资源交付延迟下载接口 export_error_pro_det
        $('#export-resources').click(function () {
            window.open(ajaxSrvPath('export_error_ord_det?regionNo=' + regionNo))
        })
    })

</script>
</body>
</html>
