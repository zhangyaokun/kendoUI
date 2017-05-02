<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="panel">
    <div class="panel-heading">
        <h6>
            实时动态
            <a href="javascript:;" id="icon-dynamic" data-toggle="collapse" data-target="#collapseDynamic">
                <i class="icon icon-chevron-up" style="float: right;"></i>
            </a>
        </h6>
    </div>
    <div class="panel-body in" id="collapseDynamic">
        <div id="myNiceCarousel" class="carousel slide">
            <!-- 轮播项目 -->
            <div class="row">
                <div class="carousel-inner" id="site-carousel">
                </div>
            </div>
            <!-- 项目切换按钮 -->
            <a class="left carousel-control" href="#myNiceCarousel" data-slide="prev">
                <span class="icon icon-chevron-left"></span>
            </a>
            <a class="right carousel-control" href="#myNiceCarousel" data-slide="next">
                <span class="icon icon-chevron-right"></span>
            </a>
        </div>
    </div>
</div>

<script id="dynamic" type="text/x-kendo-template">
    <div class="col-md-6">
        <div class="row">
            <div class="col-md-8">
                <img alt="First slide" id="imgUrl" src="#= imgUrl #">
            </div>
            <div class="col-md-4">
                <div class="dynContent-topNum"><span>【新增站址TOP10 - </span>#= topNum #<span> 】</span></div>
                <div class="dynContent-content">
                    <div>
                        <label>站点编码:</label>
                        <span title="#= code #">#= code #</span>
                    </div>
                    <div>
                        <label>站点名称:</label>
                        <span title="#= chinaName #">#= chinaName #</span>
                    </div>
                    <div>
                        <label>站点地址:</label>
                        <span title="#= location #">#= location #</span>
                    </div>
                    <div>
                        <label>站类型:</label>
                        <span title="#= typeIdName #">#= typeIdName #</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</script>
<script>
    //icon图标折叠
    $('#icon-dynamic').click(function () {
        if ($('#icon-dynamic i').attr('class').indexOf('icon-chevron-up') != -1) {
            $('#icon-dynamic i').removeClass('icon-chevron-up').addClass('icon-chevron-down')
        } else {
            $('#icon-dynamic i').removeClass('icon-chevron-down').addClass('icon-chevron-up')
        }
    })

    //轮播数据接口方法
    function undelStaDet(value){
        var dyModel = kendo.observable({
            navItems: [],
        });
        var template = kendo.template($("#dynamic").html());
        var siteCar = $('#site-carousel');
        progress_get({url: ajaxSrvPath('undel_sta_det'), data: {regionNo: value}})
                .done(function (result) {
                    if ('ok' == result.status) {
                        _.each(result.data, function (it, index) {
                            it.topNum = index + 1
                        })
                        var data = _.chunk(result.data, 2)
                        var html = '';
                        _.each(data, function (it, index) {
                            var innerHtml = kendo.render(template, it);
                            innerHtml = ' <div class="item">' + innerHtml + '</div>'
                            html += innerHtml
                        })
                        siteCar.html(html);
                        siteCar.find('.item').eq(0).addClass('active')
                    } else {
                        new $.zui.Messager(result.message, {
                            type: 'warning'
                        }).show();
                    }
                })
    };


</script>

<style>
    .dynContent-topNum {
        font-weight: bold;
        font-size: 18px;
    }

    .dynContent-content {
        overflow: hidden;
        margin: 10px;
        line-height: 31px;
    }

    .dynContent-content label {
        width: 65px;
        height: 32px;
    }
    .dynContent-content span{
        white-space: nowrap;
        text-overflow: ellipsis;
        width: 156px;
        overflow: hidden;
        display: inline-block;
        line-height: 18px;
    }

</style>
