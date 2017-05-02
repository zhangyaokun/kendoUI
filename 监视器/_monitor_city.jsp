<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--基本信息--%>
<script id="city-info-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>1</span><i class="icon icon-sun"></i></span>
            <h3>基本信息</h3>
        </div>
        <div class="city-info">
            <div>
                <div class="col-md-12">
                    <label>站点编码 : </label>
                    <span title="#= code #" class="city-info-span">#= code #</span>
                </div>
            </div>
            <div>
                <div class="col-md-12">
                    <label>站点名称 : </label>
                    <span title="#= chinaName #" class="city-info-span">#= chinaName #</span>
                </div>
            </div>
            <div>
                <div class="col-md-12">
                    <label>站点地址 : </label>
                    <span title="#= location #" class="city-info-span">#= location #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>站点类型 : </label>
                    <span title="#= typeIdName #">#= typeIdName #</span>
                </div>
                <div class="col-md-6">
                    <label>塔类型 : </label>
                    <span title="#= typeIdName #">#= typeIdName #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>经度 : </label>
                    <span title="#= longitude #" style="padding-right: 7px;">#= longitude #</span>
                </div>
                <div class="col-md-6">
                    <label>纬度 : </label>
                    <span title="#= latitude #">#= latitude #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>产权性质 : </label>
                    <span title="#= propCharIdName #"  style="padding-right: 10px;">#= propCharIdName #</span>
                </div>
                <div class="col-md-6">
                    <label>原产权单位 : </label>
                    <span title="#= propNameName #">#= propNameName #</span>
                </div>
            </div>
        </div>
    </div>
</script>
<%--订单信息--%>
<script id="city-order-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>3</span><i class="icon icon-sun"></i></span>
            <h3>订单信息</h3>
        </div>
        <div class="pan-content-thoe">
            <div>
                <div class="col-md-6">
                    <label>订单编号 : </label>
                    <span>#= orderId #</span>
                </div>
                <div class="col-md-6">
                    <label>运营商类型 : </label>
                    <span>#= custCompanyType #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>建设方式 : </label>
                    <span>#= buildWay #</span>
                </div>
                <div class="col-md-6">
                    <label>订单类型 : </label>
                    <span>#= orderType #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>订单状态 : </label>
                    <span>#= orderState #</span>
                </div>
                <div class="col-md-6">
                    <label>起租时间 : </label>
                    <span>#= hireTime #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>应交付时间 : </label>
                    <span>#= deliveryTime #</span>
                </div>
                <div class="col-md-6">
                    <label>机房类型 : </label>
                    <span>#= roomType #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>铁塔类型 : </label>
                    <span>#= towerType #</span>
                </div>
                <div class="col-md-6">
                    <label>配套类型 : </label>
                    <span>#= assortType #</span>
                </div>
            </div>
        </div>
    </div>
</script>
<%--项目信息--%>
<script id="city-pro-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>5</span><i class="icon icon-sun"></i></span>
            <h3>项目信息</h3>
        </div>
        <div class="pan-content-thoe">
            <div>
                <div class="col-md-12">
                    <label>项目编码 : </label>
                    <span>#= projectNo #</span>
                </div>
            </div>
            <div>
                <div class="col-md-12">
                    <label>项目名称 : </label>
                    <span>#= projectName #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>项目类别 :</label>
                    <span>#= projectType #</span>
                </div>
                <div class="col-md-6">
                    <label>项目状态 :</label>
                    <span>#= projectStateName #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>预计开工时间 :</label>
                    <span>#= expectStartTime #</span>
                </div>
                <div class="col-md-6">
                    <label>建设方式 :</label>
                    <span>#= buildWay #</span>
                </div>
            </div>
            <div>
                <div class="col-md-6">
                    <label>预计完工时间 :</label>
                    <span>#= expectEndTime #</span>
                </div>
                <div class="col-md-6">
                    <label>实际完工时间 :</label>
                    <span>#= projectRealEndTime #</span>
                </div>
            </div>
        </div>
    </div>
</script>
<%--成本情况--%>
<script id="city-const-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>2</span><i class="icon icon-sun"></i></span>
            <h3>成本信息</h3>
        </div>
        <div class="monitor-const">
            <div>
                <label style="width: 130px;">当月电费成本(元) :</label>
                <span>#= elecCharge #</span>
            </div>
            <div>
                <label style="width: 130px;">维护费成本(元) :</label>
                <span>#= maintenanceFee #</span>
            </div>
            <div>
                <label style="width: 130px;">场租成本(元) :</label>
                <span>#= siteFee #</span>
            </div>
        </div>
    </div>
</script>
<%--资产信息--%>
<script id="city-assets-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>4</span><i class="icon icon-sun"></i></span>
            <h3>资产信息</h3>
        </div>
        <div class="monitor-assets">
            <div>
                <label><a href="javascript:;">机房:</a></label>
                <div class="monitor-assets-div">
                    <div class="col-md-6">
                        <label>数量:</label>
                        <span class="assets-span">0</span>
                    </div>
                    <div class="col-md-6">
                        <label>原值:</label>
                        <span>0</span>
                    </div>
                </div>
            </div>
            <div>
                <label><a href="javascript:;">铁塔:</a></label>
                <div class="monitor-assets-div">
                    <div class="col-md-6">
                        <label>数量:</label>
                        <span class="assets-span">0</span>
                    </div>
                    <div class="col-md-6">
                        <label>原值:</label>
                        <span>0</span>
                    </div>
                </div>
            </div>
            <div>
                <label><a href="javascript:;">配套:</a></label>
                <div class="monitor-assets-div">
                    <div class="col-md-6">
                        <label>数量:</label>
                        <span class="assets-span">0</span>
                    </div>
                    <div class="col-md-6">
                        <label>原值:</label>
                        <span>0</span>
                    </div>
                </div>
            </div>
            <div>
                <label><a href="javascript:;">电源:</a></label>
                <div class="monitor-assets-div">
                    <div class="col-md-6">
                        <label>数量:</label>
                        <span class="assets-span">0</span>
                    </div>
                    <div class="col-md-6">
                        <label>原值:</label>
                        <span>0</span>
                    </div>
                </div>
            </div>
            <div>
                <label><a href="javascript:;">其他:</a></label>
                <div class="monitor-assets-div">
                    <div class="col-md-6">
                        <label>数量:</label>
                        <span class="assets-span">0</span>
                    </div>
                    <div class="col-md-6">
                        <label>原值:</label>
                        <span>0</span>
                    </div>
                </div>
            </div>
            <div>
                <div class="col-md-6" style="margin-left:-12px;">
                    <label>总计资产条数:</label>
                </div>
                <div class="col-md-6" style="margin-left:1px;">
                    <div class="monitor-assets-div">
                        <label>原值总计:</label>
                        <span>0</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
<%--合同信息--%>
<script id="city-contract-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>6</span><i class="icon icon-sun"></i></span>
            <h3>合同信息</h3>
        </div>
        <div class="pan-content">
            <div>
                <label>合同编号 :</label>
                <span>0</span>
            </div>
            <div>
                <label>合同类型 :</label>
                <span>0</span>
            </div>
            <div>
                <label>合同状态 :</label>
                <span>0</span>
            </div>
            <div>
                <label>合同总金额 :</label>
                <span>0</span>
            </div>
            <div>
                <label>履行开始时间 :</label>
                <span>0</span>
            </div>
            <div>
                <label>履行结束时间 :</label>
                <span>0</span>
            </div>
        </div>
    </div>
</script>