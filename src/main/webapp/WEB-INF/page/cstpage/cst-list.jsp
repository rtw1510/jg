<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../../include/publicMeta.jsp"%>
<%@include file="../../include/publicHeader.jsp"%>
<%@include file="../../include/publicMenu.jsp"%>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        用户管理
        <span class="c-gray en">&gt;</span>
        用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>

    <div id="xiugaimodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content radius">
                <div class="modal-header">
                    <h3 class="modal-title">修改信息</h3>
                    <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
                </div>
                <div class="modal-body" style="width:50%;position: relative;margin: 0 auto">
                            <input type="hidden" id="id">
                    用户名：<input type="text" class="input-text radius size-M" id="name">
                    密码：<input type="text"  class="input-text radius size-M" id="psw">
                    职位：<input type="text"  class="input-text radius size-M" id="posi">
                    <span class="select-box" style="width:30%">
                          <select class="select" size="1" name="demo1" id="level">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                          </select>
                    </span>
                </div>
                <div class="modal-footer">
<%--                    <button class="btn btn-primary">确定</button>--%>
                    <button class="btn" data-dismiss="modal" aria-hidden="true" id="xiugaistaff">确定</button>
                </div>
            </div>
        </div>
    </div>

    <div id="shanchumodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content radius">
                <div class="modal-header">
                    <h3 class="modal-title">警告！</h3>
                    <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
                </div>
                <div class="modal-body">
                    <p>确定删除吗?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true" id="delstaff">确定</button>
                </div>
            </div>
        </div>
    </div>

    <div id="xinzengmodal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content radius">
                <div class="modal-header">
                    <h3 class="modal-title">新增用户</h3>
                    <a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void(0);">×</a>
                </div>
                <div class="modal-body" style="width:50%;position: relative;margin: 0 auto">
                    用户名：<input type="text" class="input-text radius size-M" id="xzname">
                    密码：<input type="text"  class="input-text radius size-M" id="xzpsw">
                    职位：<input type="text"  class="input-text radius size-M" id="xzposi">
                    <span class="select-box" style="width:30%">
                          <select class="select" size="1" name="demo1" id="xzlevel">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                          </select>
                    </span>
                </div>
                <div class="modal-footer">
                    <%--                    <button class="btn btn-primary">确定</button>--%>
                    <button class="btn" data-dismiss="modal" aria-hidden="true" id="xzbtn">确定</button>
                </div>
            </div>
        </div>
    </div>


    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray mt-20">
                <button class="btn btn-secondary radius" onclick="insertmodal()">新增</button>
                <button class="btn btn-secondary radius">选中删除</button>
                <span class="r">共有数据：<strong>${num}</strong>条</span>
            </div>
            <table class="table table-border table-bordered table-bg" id="mytable">
                <thead>
                <tr>
                    <th scope="col" colspan="10">员工列表</th>
                </tr>
                <tr class="text-c">
                    <th width="25"><input type="checkbox"></th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>职位</th>
                    <th>职位等级</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${staffPage}" var="i">
                    <tr class="text-c">
                        <td><input type="checkbox"></td>
                        <td>${i.username}</td>
                        <td>${i.password}</td>
                        <td>${i.position}</td>
                        <td>${i.positionGrade}</td>
                        <td>
                            <a title="修改" href="javascript:;"
                               onClick="editmodaldemo('${i.username}','${i.password}','${i.position}','${i.positionGrade}','${i.id}')";
                               class="ml-5" style="text-decoration:none">
                                <span class="label label-success radius">修改</span>
                            </a>
                            <a deleteLink="true" title="删除"
                               class="ml-5" style="text-decoration:none" onclick="delmodal('${i.id}')">
                                <span class="label label-success radius">删除</span>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </article>
        <article class="cl pd-20">
            <%@include file="../adminPage.jsp" %>
        </article>
    </div>


</section>
<%@include file="../../include/publicFooter.jsp"%>
</body>
<script type="text/javascript">
    editmodaldemo = function(username,password,positions,positionGrade,id){
        $("#xiugaimodal").modal("show")
        $("#name").val(username)
        $("#psw").val(password)
        $("#posi").val(positions)
        $("#level").val(positionGrade)
        // alert()
        $("#id").val(id)
    }
    delmodal = function(id) {
        $("#shanchumodal").modal("show")
        $("#delstaff").click(function () {
            $.ajax({
                url:"staff/delete",
                type: "post",
                dataType: "text",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.href=data;
                }
            })
        })
    }
    insertmodal = function(){
        $("#xinzengmodal").modal("show")
    }

    $(function () {
        $("#xiugaistaff").click(function () {
            $.ajax({
                url:"staff/update",
                type:"post",
                dataType:"text",
                data:{
                    "id":$("#id").val(),
                    "username":$("#name").val(),
                    "password":$("#psw").val(),
                    "position":$("#posi").val(),
                    "positionGrade":$("#level").val()
                },
                success:function (data) {
                    var pageNumber = <%=request.getAttribute("page")%>
                    if(pageNumber){
                        window.location.href=data+pageNumber;
                    }else {
                        window.location.href="staff/list"
                    }
                }
            })
        })
        $("#xzbtn").click(function () {
            $.ajax({
                url:"staff/insert",
                type:"post",
                data:{
                    "username":$("#xzname").val(),
                    "password":$("#xzpsw").val(),
                    "position":$("#xzposi").val(),
                    "positionGrade":$("#xzlevel").val()
                },
                success:function (data) {
                    window.location.href=data;
                }
            })
        })
    })
</script>
</html>
