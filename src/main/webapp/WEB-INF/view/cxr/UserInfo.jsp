
<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿}
  Date: 2019/11/26
  Time: 14:17
  To change this template use File | Settings | File Templates.
--%>
<%--jstl约束--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户信息管理后台</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <link href="favicon.ico" rel="shortcut icon">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css">

    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

    <style type="text/css">
        /* 导航栏css */
        *{
            margin: 0px;
            padding: 0px;
        }

        /*信息完善css*/

        .layui-form{
              /*margin-top: 1vw;*/
            font-size: 1vw;
        }

        /*.laytable-cell-1-userImg{*/
            /*height: 100%;*/
            /*max-width: 100%;*/
        /*}*/

        p{
            font-size: 1.5vw;
            color: red;
            text-align: center;
        }
        /*h2{*/
            /*text-align: center;*/
        /*}*/
        /*图片在表格里完整显示*/
        .layui-table-cell{
            text-align:center;
            height: 30px;
            white-space: normal;
        }
        /*图片在表格里完整显示*/
        .layui-table img{
            max-width:30px;
        }

        .layui-table-view{
            border-style:none;
        }

    </style>

</head>
<body>

<%--<h2>用户信息管理</h2>--%>
<%--点击按钮后，提示框信息--%>
<input type="hidden" value="${msg}" id="msg">

<!-- 信息完善/账号绑定 -->

    <!-- 修改信息 -->
<div class="layui-table-view">
    <form class="layui-form"  id="updateUser" style="width: 35vw; display: none;"action="<%=request.getContextPath()%>/user/updateUserInfo" method="post">
        <%--用户编号--%>
        <div class="layui-form-item" style="display: none;">
            <label class="layui-form-label">编号</label>
            <div class="layui-input-block">
                <input type="text" name="userId"id="userId" value="${user.userId}" class="layui-input">
            </div>
        </div>
        <%--用户姓名--%>
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-block">
                <input type="text" name="userRealname"id="userRealname"  value="${user.userRealname}"  placeholder="请输入你的真实姓名(不能包含空格数字)" autocomplete="off" class="layui-input" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
                           onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))" maxlength="5">
            </div>
        </div>

        <%--手机号码,在页面中回显。不可修改--%>
        <%--<div class="layui-form-item">--%>
            <%--<label class="layui-form-label">手机号码</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<input type="text" name="phonenum" id="phonenum"  placeholder="请输入你的手机" autocomplete="off" class="layui-input" readonly="readonly"  onchange="phone()" maxlength="11">--%>
                <%--<span class="error" id="phoneError"></span>--%>
            <%--</div>--%>
        <%--</div>--%>

        <%--性别--%>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block ">
                <select name="userSex" value="${user.userSex}" id="userSex">
                    <option value="">${user.userSex}</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>
        <%--出生年月--%>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">出生年月</label>
                <div class="layui-input-block">
                    <input type="text" name="userBirthday" value="${user.userBirthday}" id="userBirthday" autocomplete="off" class="layui-input"
                           style="width: 25.5vw;">
                </div>
            </div>
        </div>

        <%--<!-- 修改上传头像 -->--%>
        <label class="layui-form-label">上传头像</label>
        <div class="layui-input-inline uploadHeadImage" style="margin-bottom:2vw;">
            <div class="layui-upload-drag" id="headImg">
                <i class="layui-icon"></i>
                <p style="font-size: 1vw;">点击上传图片</p>
            </div>
            <%--将图片上传信息放入到隐藏的input输入框中，一起提交--%>
            <input type="hidden" name="userImg" id="userImg1"  >
        </div>
            <%--文件信息反显--%>
        <div class="layui-input-inline" style="margin-bottom:2vw;">

            <div class="layui-upload-list">
                <img class="layui-upload-img headImage"  src="${user.userImg}"  id="userImg"
                     style="width: 8vw; height: 8vw;">
                <p id="demoText"></p>
            </div>
        </div>
            <%--籍贯--%>
        <div class="layui-form-item">
            <label class="layui-form-label">籍贯</label>
            <div class="layui-input-block">
                <input type="text" name="userNative" id="userNative" value="${user.userNative}" placeholder="请输入籍贯（与身份证一致）" autocomplete="off" class="layui-input">
            </div>
        </div>
        <%--婚否--%>
        <div class="layui-form-item">
            <label class="layui-form-label">婚否</label>
            <div class="layui-input-block">
                <select name="userMarry"  value="${user.userMarry}" id="userMarry">
                    <option value="">${user.userMarry}</option>
                    <option value="已婚">已婚</option>
                    <option value="未婚">未婚</option>
                </select>
            </div>
        </div>
        <%--所在城市--%>
        <div class="layui-form-item">
            <label class="layui-form-label">所在城市</label>
            <div class="layui-input-block">
                <input type="text" name="userCity"  value="${user.userCity}" id="userCity" placeholder="请输入所在城市" autocomplete="off" class="layui-input">
            </div>
        </div>
            <%--现状--%>
        <div class="layui-form-item">
            <label class="layui-form-label">现状</label>
            <div class="layui-input-block">
                <select name="userState" value="${user.userState}" id="userState" >
                    <option value="">${user.userState}</option>
                    <option value="在职">在职</option>
                    <option value="离职">已离职</option>
                </select>
            </div>
        </div>
        <%--目标职位--%>
        <div class="layui-form-item">
            <label class="layui-form-label">目标职位</label>
            <div class="layui-input-block">
                <select name="userTarget" value="${user.userTarget}" id="userTarget" >
                    <option value="">${user.userTarget}</option>
                    <option value="前台工程师">前端工程师</option>
                    <option value="后端开发">后端开发</option>
                    <option value="项目经理">项目经理</option>
                    <option value="测试人员">测试人员</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
            <%--所属行业--%>
        <div class="layui-form-item">
            <label class="layui-form-label">所属行业</label>
            <div class="layui-input-block">
                <select name="userIndustry" value="${user.userIndustry}" id="userIndustry">
                    <option value="">${user.userIndustry}</option>
                    <option value="医疗">医疗</option>
                    <option value="IT计算机">IT计算机</option>
                    <option value="公务员">公务员</option>
                    <option value="教育">教育</option>
                    <option value="娱乐">娱乐</option>
                    <option value="餐饮">餐饮</option>
                    <option value="其他">其他</option>
                </select>
            </div>
        </div>
        <%--兴趣爱好--%>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">兴趣爱好</label>
            <div class="layui-input-block">
                <textarea name="userHobby" value="${user.userHobby}" id="userHobby" placeholder="请输入你的兴趣爱好(不超过50字)" class="layui-textarea" maxlength="50"></textarea>
            </div>
        </div>
        <%--自我评价--%>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">自我评价</label>
            <div class="layui-input-block">
                <textarea name="userSelfappraise" value="${user.userSelfappraise}" id="userSelfappraise" placeholder="请输入自我评价内容(不超过100字)" class="layui-textarea" maxlength="100"></textarea>
            </div>
        </div>
        <%--最高学历--%>
        <div class="layui-form-item">
            <label class="layui-form-label">最高学历</label>
            <div class="layui-input-block">
                <select name="userEducation"  value="${user.userEducation}" id="userEducation">
                    <option value="">${user.userEducation}</option>
                    <option value="博士后">博士后</option>
                    <option value="博士">博士</option>
                    <option value="硕士">硕士</option>
                    <option value="研究生">研究生</option>
                    <option value="本科">本科</option>
                    <option value="专科">专科</option>
                    <option value="高中">高中</option>
                </select>
            </div>
        </div>
        <%--所在院校--%>
        <div class="layui-form-item">
            <label class="layui-form-label">所在院校</label>
            <div class="layui-input-block">
                <input type="text" name="userAcademy" value="${user.userAcademy}" id="userAcademy"  placeholder="请输入所在院校" autocomplete="off" class="layui-input" maxlength="25">
            </div>
        </div>
        <%--所属专业--%>
        <div class="layui-form-item">
            <label class="layui-form-label">所属专业</label>
            <div class="layui-input-block">
                <input type="text" name="userSpecialty" value="${user.userSpecialty}" id="userSpecialty"  placeholder="请输入所属专业（不超过20个字）" autocomplete="off" class="layui-input" maxlength="20">
            </div>
        </div>
        <%--确认提交按钮--%>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="submit" hidden="hidden" id="updateSubmit" value="确认">
            </div>
        </div>
    </form>
</div>
<%--表格样式--%>
<div class="layui-fluid">
    <table class="layui-table" id="demo" lay-filter="test"></table>
</div>

<%--js事件--%>
<script>
    <%--鼠标悬停时，显示内容--%>
    //后台用户管理页面中，籍贯的移入事件，显示具体内容，重点
    $('body').on('mouseenter','.layui-table-view td[data-field = "userNative"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });
    //后台用户管理页面中，姓名的移入事件，显示具体内容
    $('body').on('mouseenter','.layui-table-view td[data-field = "userRealname"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });
    //后台用户管理页面中，所在城市的移入事件，显示具体内容
    $('body').on('mouseenter','.layui-table-view td[data-field = "userCity"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });
    //后台用户管理页面中，兴趣爱好的移入事件，显示具体内容
    $('body').on('mouseenter','.layui-table-view td[data-field = "userHobby"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });
    //后台用户管理页面中，自我评价的移入事件，显示具体内容
    $('body').on('mouseenter','.layui-table-view td[data-field = "userSelfappraise"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });
    //后台用户管理页面中，所在院校的移入事件，显示具体内容
    $('body').on('mouseenter','.layui-table-view td[data-field = "userAcademy"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });
    //后台用户管理页面中，所属专业的移入事件，显示具体内容
    $('body').on('mouseenter','.layui-table-view td[data-field = "userSpecialty"]',function () {
        var msg = $(this).find('div').text();
        //如果msg不为空，执行悬停显示内容操作，即msg为空或msg为空字符串时，悬停事件不执行
        if(msg!=null&msg!=""){
            tipsInx = layer.tips(msg, this,{
                tips: [3, '#5c6cdb'],
                time: 2000
            });
        }
    });

    //js表格
    layui.use(['table', 'laydate', 'form', 'util', 'layer'], function () {
        var table = layui.table;
        var laydate = layui.laydate;
        var layer = layui.layer;
        var util = layui.util;
        var form = layui.form;
        <c:if test="${flag}">
        <%--获取msg信息--%>
        $(function () {
            layer.alert($("#msg").val());
        })
        </c:if>
        laydate.render({
            elem: '#createTime'
            , type: 'datetime'
            , format: 'yyyy-MM-dd'

        });
        form.render();
        //第一个实例
        table.render({
            elem: '#demo'
            //通过控制层返回查询所有信息，（包括分页和模糊查询）
            , url: '<%=request.getContextPath()%>/user/userInfo?condition=${condition}'
            , page: true //开启分页
            , height: $(document).height()-$('#demo').offset().top-20
            , cols: [[ //表头
                //
                // {type: 'checkbox'}
                                    //序号自动排序  type:'numbers'
                {field:'zizeng',title:'序号',type:'numbers'}
                // , {field: 'userId', title: '编号', width: 80, sort: true}
                                    //图片返显至表格：templet:'<div><img src="{{d.userImg}}">'
                , {field: 'userImg', title: '头像', width: 60,templet:'<div><img src="{{d.userImg}}">'}
                , {field: 'userRealname', title: '姓名', width: 80, sort: true}
                , {field: 'userSex', title: '性别', width: 60}
                , {field: 'phonenum', title: '手机号码', width: 120}
                                                 //日期格式：templet: '<div>{{ layui.util.toDateString(d.userBirthday,"yyyy-MM-dd") }}</div>'
                , {field: 'userBirthday', title: '出生年月', templet: '<div>{{ layui.util.toDateString(d.userBirthday,"yyyy-MM-dd") }}</div>',width: 120}
                , {field: 'userMarry', title: '婚否', width: 60}
                , {field: 'userNative', title: '籍贯', width: 120}
                , {field: 'userCity', title: '所在城市', width: 120}
                , {field: 'userState', title: '现状', width: 60}
                , {field: 'userTarget', title: '目标职位', width: 100}
                , {field: 'userIndustry', title: '所属行业', width: 90}
                , {field: 'userHobby', title: '兴趣爱好', width: 90}
                , {field: 'userSelfappraise', title: '自我评价', width: 90}
                , {field: 'userEducation', title: '学历', width: 75}
                , {field: 'userAcademy', title: '所在学校', width: 90}
                , {field: 'userSpecialty', title: '所属专业', width: 90}

                , {
                    title: '操作', width: 180, align: 'center', fixed: 'right', toolbar: '' +
                        '<div class="layui-btn-group">' +
                        '<button type="button" class="layui-btn" lay-event="edit">编辑</button>' +
                        '<button type="button" class="layui-btn layui-btn-danger" lay-event="del">删除</button>' +
                        '</div>'
                }
            ]]
            , limits: [5, 10, 20]
            , toolbar:
                        //拼接新增按钮
                // '<div class="layui-btn-group">' +
                // '<button type="button" class="layui-btn" lay-event="add">增加</button>' +
                    //    拼接模糊查询输入框和按钮
                '<div class="layui-card search">\n' +
                '        <div class="layui-form layui-card-header layuiadmin-card-header-auto" >\n' +
                '            <div class="layui-form-item">' +
                                //模糊查询的表单
                '               <form type="post" action="/user/toUserManager" style="margin-top:0vw;margin-left:-2vw;"> \n' +
                '                <div class="layui-inline">\n' +
                '                    <label class="layui-form-label hint">姓名查询</label>\n' +

                '                    <div class="layui-input-block">\n' +
                '                        <input type="text" id="condition" name="condition" value="${condition}"  placeholder="请输入要查询的用户名称" autocomplete="off" class="layui-input">\n' +
                '                    </div>\n' +
                '                </div>\n' +
                '                <div class="layui-inline">\n' +
                '                    <button type="submit" class="layui-btn layuiadmin-btn-useradmin" id="sel">\n' +
                '                        <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>\n' +
                '                    </button>\n' +
                '                </div>' +
                '               </form>\n' +
                '            </div>\n' +
                '        </div>\n' +
                '    </div>' +
                '</div>'
        });
        //头工具栏事件,添加方法
        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'add':
                    layer.open({
                        title: "添加",
                        type: 1,
                        area: ['30%', '70%'],
                        content: $("#addForm"),
                        btn: ['提交'],
                        yes: function (index, layero) {
                                                    //添加安扭ID
                            layero.find("form").find("#insertSubmit").click();
                        }
                    });
                    break;
            }
            ;
        });

        //监听行工具事件，删除方法
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //定义对象id变量
            var userId = data.userId;
            if (obj.event === 'del') {
                layer.confirm('是否确认删除', function (index) {
                    obj.del();
                    $.ajax({
                        type: "POST",
                        url: "<%=request.getContextPath()%>/user/deleteUserById?userId=" + userId,
                        success: function (msg) {
                            layer.alert("删除成功");
                        },
                        error: function (msg) {
                            layer.alert("遇到意外错误");
                        }
                    });
                    layer.close(index);
                });
                //修改方法
            } else if (obj.event === 'edit') {
                //获取需要修改的变量
                $("#userId").val(data.userId);
                $("#userRealname").val(data.userRealname);
                $("#phonenum").val(data.phonenum);
                $("#userSex").val(data.userSex);
                $("#userBirthday").val(data.userBirthday);
                $("#userNative").val(data.userNative);
                $("#userMarry").val(data.userMarry);
                $("#userCity").val(data.userCity);
                $("#userState").val(data.userState);
                $("#userTarget").val(data.userTarget);
                $("#userIndustry").val(data.userIndustry);
                $("#userHobby").val(data.userHobby);
                $("#userSelfappraise").val(data.userSelfappraise);
                $("#userTarget").val(data.userTarget);
                $("#userAcademy").val(data.userAcademy);
                $("#userEducation").val(data.userEducation);
                $("#userSpecialty").val(data.userSpecialty);
                $("#userImg").val(data.userImg);
                layer.open({
                    title: "修改",
                    type: 1,
                    area: ['43%', '90%'],
                    content: $("#updateUser"),
                    btn: ['提交'],
                    // 更新渲染,将下拉框的内容反显至页面
                    success: function(){
                       form.render('select');
                    },
                    yes: function (index, layero) {
                                                //修改按钮
                        layero.find("form").find("#updateSubmit").click();
                    }
                });
            }
        });
    });
</script>



<script type="text/javascript">

    //日期
    layui.use('laydate',function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#userBirthday'
             //  设置选择日期不能超过当前日期
            ,max : getNowFormatDate()
        });


        // laydate.render({
        //     elem: '#userBirthday'
        //     ,type: 'date'
        // });

    });


    //  设置选择日期不能超过当前日期
    function getNowFormatDate() {
        var date = new Date();
        var seperator1 = "-";
        var seperator2 = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 0 && strDate <= 9) {
            strDate = "0" + strDate;
        }
        var currentdate = date.getFullYear() + seperator1 + month
            + seperator1 + strDate + " " + date.getHours() + seperator2
            + date.getMinutes() + seperator2 + date.getSeconds();
        return currentdate;
    }


    // 图片上传js
    layui.use(["jquery", "upload", "form", "layer", "element"], function () {
        var $ = layui.$,
            element = layui.element,
            layer = layui.layer,
            upload = layui.upload,
            form = layui.form;
        //拖拽上传
        var uploadInst = upload.render({
            elem: '#headImg'
            //文件上传地址
            , url: '<%=request.getContextPath()%>/user/uploadImg'
            , size: 500
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#userImg').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //本地上传回调
                // //如果上传失败
                // if (res.code > 0) {
                //     return layer.msg('上传失败');
                // }
                // //上传成功
                // //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..
                // /*   console.log(res.data.src);*/
                // //window.parent.uploadHeadImage(res.data.src);
                //
                // //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台,
                // $("#userImg1").val(res.data.src);
                // //反显图片，并显示上传成功信息
                // var demoText = $('#demoText');
                // demoText.html('<span style="color: red;">上传成功!!!</span>');

                //服务器上传成功
                layer.msg(res.message);
                //获取图片路径URL
                $("#userImg1").val(res.url);
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
        element.init();
    });


</script>
<script>

    //验证手机号
    function phone() {
        var regPhone = /^1([356789]\d|5[0-35-9]|7[3678])\d{8}$/;
        var phone = document.getElementById("userPhonenum").value;
        var bool = regPhone.test(phone);
        if(bool == true){
            document.getElementById("phoneError").innerHTML="";
            return true;
        } else {
            document.getElementById("phoneError").innerHTML="请输入正确的手机号";
            document.getElementById("phoneError").style.color="red";
            return false;
        }
    }



    //密码
    function checkpwd1() {
        var check = false;
        //获取密码输入框输入的值
        var password = document.getElementById("pwd1").value;
        if (password.length == 6) {
            document.getElementById("checktext2").innerHTML = "";
            check = true;
        } else {
            document.getElementById("checktext2").innerHTML = "密码必须是六位";
            check = false;
        }
        return check;
    }


    //确认密码
    function checkpwd2() {
        var check = false;
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
        if (pwd1 != pwd2) {
            document.getElementById("checktext3").innerHTML = "两次输入密码不一致";
            check = false;
        } else {
            document.getElementById("checktext3").innerHTML = "";
            check = true;
        }
        return check;
    }

</script>
</body>
</html>

