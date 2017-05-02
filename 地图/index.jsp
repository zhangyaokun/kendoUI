<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        #china-map {
            height: 300px;
            width: 500px;
        }
    </style>
</head>
<body>
<a id="map-refresh">返回</a>
<div id="china-map"></div>
<script src="./utils/echarts-all-update.js"></script>
<script type="text/javascript">
    // --- 地图 ---


    function mapInit(value, name) {
        if (name == '中国') {
            var ajaxType = "china";
            $('#map-refresh').hide();
        }
        var ajaxData = [];
        var myChart = echarts.init(document.getElementById('china-map'));
        //map初始化赋值
        progress_get({url: ajaxSrvPath('map_init'), data: {regionId: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        ajaxData = result.data
                        for (var i = 0, l = result.data.length; i < l; i++) {
                            var a = {
                                "name": result.data[i].name,
                                "value": result.data[i].value,
                                "regionNo": result.data[i].regionNo,
                                "valueCode": result.data[i].value
                            };
                            ajaxData[i] = a;
                        }
                        console.log(ajaxData)
                        mapSelectInit(ajaxType, ajaxData);
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                });

        // 数据初始化以及单击后地图刷新新的数据
        function mapSelectInit(type, data) {
            var optionMap = {
                series: [
                    {
                        type: 'map',
                        mapType: type,
                        selectedMode: 'single',
                        itemStyle: {
                            normal: {label: {show: true}},
                            emphasis: {label: {show: true}}
                        },
                        data: data
                    }
                ]
            }
            myChart.clear();
            myChart.setOption(optionMap);
        };

        myChart.on(echarts.config.EVENT.CLICK, function (param) {
            clickMap(param)
        });

        //单击事件
        function clickMap(param) {
            var regionValue = param.data.valueCode;
            var regionNo = param.data.regionNo
            if (ajaxType == 'china') {
                $('#map-refresh').hide();
                progress_get({url: ajaxSrvPath('map_init'), data: {regionId: regionValue}})
                        .done(function (result) {
                            if ('ok' == result.status) {
                                ajaxData = [];
                                for (var i = 0, l = result.data.length; i < l; i++) {
                                    var a = {
                                        "name": result.data[i].name,
                                        "value": result.data[i].value,
                                        "regionNo": result.data[i].regionNo,
                                        "valueCode": result.data[i].value
                                    };
                                    ajaxData[i] = a;
                                }
                                ajaxType = param.name;
                                mapSelectInit(ajaxType, ajaxData);
                                mapUtils(regionNo);
                            } else {
                                new $.zui.Messager(result.message, {
                                    type: 'warning'
                                }).show();
                            }
                        })
            } else {
                if (regionNo == undefined || regionNo == 'undefined') {
                    new $.zui.Messager('此区域暂无数据', {
                        type: 'warning'
                    }).show();
                    return
                }
                mapUtils(regionNo);
            }

        };
    }
    ;


    //返回全国地图
    $('#map-refresh').click(function () {
        $('#export-site').unbind('click');
        $('#export-order').unbind('click');
        $('#export-project').unbind('click');
        $('#warn-modal').unbind('click');
        $('#export-errProDet').unbind('click');
        $('#export-resources').unbind('click');
        //轮播数据接口
        undelStaDet(regionNo);
        //地图初始化
        mapInit(regionId, regionName);
        //站址数量初始化
        staNum(regionNo);
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
        //站址预警数量接口
        errorStaNum(regionNo);
        //站址预警详情接口
        $('#warn-modal').click(function () {
            var prm = {
                regionNo: regionNo,
            };
            //项目施工进度延迟详情接口
            var project_logDs = readDataSource(
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
            var resources_logDs = readDataSource(
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
    });


    function mapUtils(value) {
        $('#export-site').unbind('click');
        $('#export-order').unbind('click');
        $('#export-project').unbind('click');
        $('#warn-modal').unbind('click');
        $('#export-errProDet').unbind('click');
        $('#export-resources').unbind('click');
        //轮播数据接口
        undelStaDet(value);
        //站址数量初始化
        staNum(value);
        //新增站址详情
        staDet(value);
        //订单数量初始化
        ordNum(value);
        //新增订单详情
        ordDet(value);
        //项目数量初始化
        proNum(value);
        //新增项目详情
        proDet(value);
        $('#map-refresh').show();
        //站址预警数量接口
        errorStaNum(value);
        //站址预警详情接口
        $('#warn-modal').click(function () {
            var prm = {
                regionNo: regionNo,
            };
            //项目施工进度延迟详情接口
            var project_logDs = readDataSource(
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
                autoBind: false,
                columns: [
                    {
                        'field': 'provinceNo',
                        title: '省份',
                        'template': hasTitleTemplate('provinceNo')
                    },
                    {
                        'field': 'countyNo',
                        title: '地市',
                        'template': hasTitleTemplate('countyNo')
                    },
                    {
                        'field': 'cityName',
                        title: '区域',
                        'template': hasTitleTemplate('cityName')
                    },
                    {'field': 'code', title: '站址编码', 'template': hasTitleTemplate('code')},
                    {
                        'field': 'chinaName',
                        title: '站址名称',
                        'template': hasTitleTemplate('chinaName')
                    },
                    {
                        'field': 'projectNo',
                        title: '项目编码',
                        'template': hasTitleTemplate('projectNo')
                    },
                    {
                        'field': 'projectName',
                        title: '项目名称',
                        'template': hasTitleTemplate('projectName')
                    },
                    {
                        'field': 'expectEndTime',
                        title: '预计完工时间',
                        'template': hasTitleTemplate('expectEndTime')
                    },
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
            var resources_logDs = readDataSource(
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
                autoBind: false,
                columns: [
                    {
                        'field': 'provinceNo',
                        title: '省份',
                        'template': hasTitleTemplate('provinceNo')
                    },
                    {
                        'field': 'countyNo',
                        title: '地市',
                        'template': hasTitleTemplate('countyNo')
                    },
                    {
                        'field': 'cityName',
                        title: '区域',
                        'template': hasTitleTemplate('cityName')
                    },
                    {'field': 'code', title: '站址编码', 'template': hasTitleTemplate('code')},
                    {
                        'field': 'chinaName',
                        title: '站址名称',
                        'template': hasTitleTemplate('chinaName')
                    },
                    {
                        'field': 'orderNo',
                        title: '订单编号',
                        'template': hasTitleTemplate('orderNo')
                    },
                    {
                        'field': 'deliveryTime',
                        title: '应交付时间',
                        'template': hasTitleTemplate('deliveryTime')
                    },
                    //{'field': 'orderState', title: '实际交付时间', 'template': hasTitleTemplate('propCharIdName')},
                    {
                        'field': 'orderStateName',
                        title: '订单状态',
                        'template': hasTitleTemplate('orderStateName')
                    },
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
    }

</script>
</body>
</html>
