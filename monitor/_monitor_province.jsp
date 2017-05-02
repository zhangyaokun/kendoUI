<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--基本信息--%>
<script id="province-info-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>1</span><i class="icon icon-sun"></i></span>
            <h3>基本信息</h3>
        </div>
        <div class="province-info">
            <div>
                <label>站点总数量(座):</label>
                <span>#= stationCount #</span>
            </div>
            <div>
                <label>塔类站点总数量(座):</label>
                <span>#= towerCount #</span>
            </div>
            <div>
                <label>室分站点数量(座):</label>
                <span>#= roomCount #</span>
            </div>
            <div>
                <label>自建站点数量(座):</label>
                <span>#= selfCount #</span>
            </div>
            <div>
                <label>注入站点数量(座):</label>
                <span>#= injectCount #</span>
            </div>
        </div>
    </div>
</script>
<%--订单信息--%>
<script id="province-order-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>3</span><i class="icon icon-sun"></i></span>
            <h3>订单信息</h3>
        </div>
        <div class="pan-content-oth">
            <div>
                <label>订单总数量:</label>
                <span>#= allOrdNum #</span>
            </div>
            <div>
                <label>新建订单数量:</label>
                <span>#= addOrdNum #</span>
            </div>
            <div>
                <label>改造订单数量:</label>
                <span>#= changeOrdNum #</span>
            </div>
            <%--<div>
                <label>存量直接满足:</label>
                <span>#= changeOrdNum #</span>
            </div>--%>
            <div>
                <label>塔类订单数:</label>
                <span>#= towerOrdNum #</span>
            </div>
            <div>
                <label>室分订单数:</label>
                <span>#= roomOrdNum #</span>
            </div>
        </div>
    </div>
</script>
<%--项目信息--%>
<script id="province-pro-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>5</span><i class="icon icon-sun"></i></span>
            <h3>项目信息</h3>
        </div>
        <div class="pan-content-oth">
            <div>
                <label>项目总数量:</label>
                <span>#= allProNum #</span>
            </div>
            <div>
                <label>新建项目数:</label>
                <span>#= newProNum #</span>
            </div>
            <div>
                <label>改造项目数:</label>
                <span>#= changeProNum #</span>
            </div>
            <div>
                <label>塔类项目数:</label>
                <span>#= towerProNum #</span>
            </div>
            <div>
                <label>室分项目数:</label>
                <span>#= roomProNum #</span>
            </div>
        </div>
    </div>
</script>
<%--成本情况--%>
<script id="province-const-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>2</span><i class="icon icon-sun"></i></span>
            <h3>成本信息</h3>
        </div>
        <div class="monitor-const">
            <div>
                <label style="width: 130px;">当月电费成本(元):</label>
                <span>#= elecCharge #</span>
            </div>
            <div>
                <label>维护费成本(元):</label>
                <span>#= maintenanceFee #</span>
            </div>
            <div>
                <label>场租成本(元):</label>
                <span>#= siteFee #</span>
            </div>
        </div>
    </div>
</script>
<%--资产信息--%>
<script id="province-assets-data" type="text/x-kendo-template">
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
                <div class="col-md-6" style="margin-left:-12px">
                    <label>总计资产条数:</label>
                </div>
                <div class="col-md-6" style="margin-left:1px">
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
<script id="province-contract-data" type="text/x-kendo-template">
    <div class="">
        <div class="monitor-title">
            <span class="numb-icon"><span>6</span><i class="icon icon-sun"></i></span>
            <h3>合同信息</h3>
        </div>
        <div class="pan-content" style="line-height:24px;">
            <div>
                <label>合同总数量(份):</label>
                <span>0</span>
            </div>
            <div>
                <label>合同总金额(万元):</label>
                <span>0</span>
            </div>
            <div>
                <label>塔类合同数量(份):</label>
                <span>0</span>
            </div>
            <div>
                <label>室分合同数量(份):</label>
                <span>0</span>
            </div>
            <div>
                <label>塔类合同总金额(万元):</label>
                <span>0</span>
            </div>
            <div>
                <label>室分合同总金额(万元):</label>
                <span>0</span>
            </div>
        </div>
    </div>
</script>