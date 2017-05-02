<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="warnModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">关闭</span></button>
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a data-tab href="#payments">收支不抵站点:
                            <span id="paymentsNum">0</span>
                            <i class="icon icon-download-alt"></i>
                        </a>
                    </li>
                    <li>
                        <a data-tab href="#delay-project" id="error-project">项目施工进度延误:
                            <span id="proDetNum"></span>
                            <i class="icon icon-download-alt" id="export-errProDet"></i>
                        </a>
                    </li>
                    <li>
                        <a data-tab href="#delay-resources" id="resources">资源交付延迟:
                            <span id="resourcesNum"></span>
                            <i class="icon icon-download-alt" id="export-resources"></i>
                        </a>
                    </li>
                </ul>
                <div class="tab-content">
                    <%--收支不抵站点--%>
                    <div class="tab-pane active" id="payments">
                        <%--<div id="payments-table"></div>--%>
                        <table class="table" id="table-payments">
                            <thead>
                            <tr>
                                <th>省份</th>
                                <th>地市</th>
                                <th>区域</th>
                                <th>站址编码</th>
                                <th>站址名称</th>
                                <th>电费成本</th>
                                <th>维护费成本</th>
                                <th>维护费收入</th>
                                <th>场租成本</th>
                                <th>场租收入</th>
                                <th>合计成本</th>
                                <th>合计收入</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                            </tr>
                            <tr>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                            </tr>
                            <tr>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                            </tr>
                            <tr>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                            </tr>
                            <tr>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                            </tr>
                            <tr>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                                <td>...</td>
                            </tr>
                            </tbody>
                        </table>
                        <ul class="pager">
                            <li class="previous"><a href="your/nice/url">«</a></li>
                            <li><a href="your/nice/url">1</a></li>
                            <li class="active"><a href="your/nice/url">2</a></li>
                            <li><a href="your/nice/url">3</a></li>
                            <li><a href="your/nice/url">4</a></li>
                            <li><a href="your/nice/url">5</a></li>
                            <li class="next"><a href="your/nice/url">»</a></li>
                        </ul>
                    </div>
                    <%--项目施工进度延误--%>
                    <div class="tab-pane" id="delay-project"></div>
                    <%--资源交付延迟--%>
                    <div class="tab-pane" id="delay-resources"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

</script>