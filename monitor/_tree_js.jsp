<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    var zTree;
    var typeTree;
    var valueSetId;
    var selectNode;
    var selectTypeTreeNode
    //站址详情显示数据
    var templateCityInfo = $("#city-info-data").html();
    var templateCityOrder = $("#city-order-data").html();
    var templateCityPro = $("#city-pro-data").html();
    var templateCityAss = $("#city-assets-data").html();
    var templateCityConst = $("#city-const-data").html();
    var templateCityTra = $("#city-contract-data").html();
    var cityInfo = kendo.template(templateCityInfo);
    var cityOrder = kendo.template(templateCityOrder);
    var cityPro = kendo.template(templateCityPro);
    var cityAss = kendo.template(templateCityAss);
    var cityConst = kendo.template(templateCityConst);
    var cityTra = kendo.template(templateCityTra);
    //地市详情显示数据
    var templateProvinceInfo = $("#province-info-data").html();
    var templateProvinceOrder = $("#province-order-data").html();
    var templateProvincePro = $("#province-pro-data").html();
    var templateProvinceAss = $("#province-assets-data").html();
    var templateProvinceConst = $("#province-const-data").html();
    var templateProvinceTra = $("#province-contract-data").html();
    var provinceInfo = kendo.template(templateProvinceInfo);
    var provinceOrder = kendo.template(templateProvinceOrder);
    var provincePro = kendo.template(templateProvincePro);
    var provinceAss = kendo.template(templateProvinceAss);
    var provinceConst = kendo.template(templateProvinceConst);
    var provinceTra = kendo.template(templateProvinceTra);
    var setting = {
        data: {
            key: {
                name: "regionName"
            },
            simpleData: {
                enable: true,
                idKey: "regionId",
                pIdKey: "superRegionId",
                rootPId: null
            },
        },
        callback: {
            onClick: function (event, treeId, treeNode) {
                selectNode = treeNode;
                var code = treeNode.code
                var regionNo = treeNode.regionNo
                var stationId = treeNode.stationId
                var gradeId = treeNode.gradeId
                if(!selectNode.children){
                    orgTreeQ(code);
                }
                if (regionNo == null) {
                    orgDetPro(stationId, regionNo, gradeId);
                } else {
                    orgDetCity(stationId, regionNo, gradeId);
                }
            },
        }
    };

    var nodeList = [], allNode = [];
    function updateNodes(highlight, treeObj) {
        allNode = treeObj.transformToArray(treeObj.getNodes());
        treeObj.hideNodes(allNode);
        for (var n in nodeList) {
            findParent(treeObj, nodeList[n]);
        }
        treeObj.showNodes(nodeList);
        treeObj.updateNode(nodeList);
    }
    function findParent(treeObj, node) {
        treeObj.expandNode(node, true, false, false);
        if (node.level >= 0) {
            var pNode = node.getParentNode();
            if (pNode != null && pNode.toString() != "undefined" && pNode.toString() != "size" && pNode.toString() != "null") {
                nodeList.push(pNode);
                findParent(zTree, pNode);
            }
        }
    }
    //绑定指标树搜索事件
    function addBind() {
        $("#monitor-tree-search").bind("input", function () {
            nodeList = [], allNode = [];
            var treeObj = $.fn.zTree.getZTreeObj("ztree");
            var value = $("#monitor-tree-search").val();
            var keyType = "regionName";
            if (value == "") {
                allNode = treeObj.transformToArray(treeObj.getNodes());
                treeObj.showNodes(allNode);
                treeObj.expandAll(false);
                return;
            }
            nodeList = treeObj.getNodesByParamFuzzy(keyType, value);
            nodeList = treeObj.transformToArray(nodeList);
            updateNodes(true, treeObj);
        });
    }
    //子节点点击树获取新的子目录
    function orgTreeQ(code) {
        progress_get({url: ajaxSrvPath('org_treeQ'), data: {code: code}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        var treeObj = $.fn.zTree.getZTreeObj("ztree");
                        var newNode = result.data;
                        if (result.data.length != 0) {
                            newNode = treeObj.addNodes(selectNode, newNode);
                        }
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    //站址详情
    function orgDetPro(stationId, regionNo, gradeId) {
        progress_post({
            url: ajaxSrvPath('query_org_det'),
            data: kendo.stringify({stationId: stationId, regionNo: regionNo, gradeId: gradeId})
        })
                .done(function (result) {
                    if ('ok' == result.status) {
                        $('.province-info-are').hide()
                        var basicInfoList = result.data.basicInfoList
                        var costInfoList = result.data.costInfoList
                        var orderInfoList = result.data.orderInfoList
                        var projectInfoList = result.data.projectInfoList
                        var assetInfoList = result.data.assetInfoList
                        var bargainInfoList = result.data.bargainInfoList
                        $("#city-info").html(kendo.render(cityInfo, basicInfoList));
                        $("#city-const").html(kendo.render(cityConst, costInfoList));
                        $("#city-order").html(kendo.render(cityOrder, orderInfoList));
                        $("#city-pro").html(kendo.render(cityPro, projectInfoList));
                        $("#city-assets").html(kendo.render(cityAss, assetInfoList));
                        $("#city-contract").html(kendo.render(cityTra, bargainInfoList));
                        $('.city-info-are').show()
                        $('.query-title').html(result.data.title)
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    }
    //地市详情
    function orgDetCity(stationId, regionNo, gradeId) {
        progress_post({
            url: ajaxSrvPath('query_org_det'),
            data: kendo.stringify({stationId: null, regionNo: regionNo, gradeId: gradeId})
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

</script>