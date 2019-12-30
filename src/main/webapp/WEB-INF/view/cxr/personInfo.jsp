<%--
  Created by IntelliJ IDEA.
  User: ${崔新睿}个人信息完善
  Date: 2019/11/19
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>个人信息完善</title>
    <script src="http://apps.bdimg.com/libs/jquery/1.6.4/jquery.min.js"></script>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css" type="text/css">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>




    <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->


    <style type="text/css">
        /* 导航栏css */
        *{
            margin: 0px;
            padding: 0px;
        }

        /*信息完善css*/
        .xuanxiangka{
            font-size: 1vw;
        }

        .layui-form{
            width: 35vw;

            float: left;
            margin-top: 3vw;
            font-size: 1.3vw;
            margin-left: -4vw;

        }

        .layui-tab{
            margin-left: 2vw;
            float: left;
            margin-top: 2vw;
        }


        /*账号绑定样式*/
        .layui-tab-item{
            width: 68vw;
            height: 7vw;
        }
        .youxiang{
            float: left;
            background-color: 	#F8F8F8;
            width: 68vw;
            height: 10vw;
            margin-top: 2vw;
            font-size: 1vw;
        }
        .yxbd{
            float: left;
            margin-top: 2vw;
            margin-left: 3vw;
            width: 10vw;
            height: 4vw;
            font-size: 1.5vw;
            line-height: 4vw;
        }
        .yxbd i{
            font-size: 2vw;
        }
        .yxxx{
            float: left;
            margin-top: 2vw;
            margin-left: 1vw;
            width: 47vw;
            height: 4vw;
            line-height: 4vw;
        }
        .butt{
            float: right;
            margin-top: -1vw;
            margin-right: 3vw;
            line-height: 2vw;
            font-size: 1vw;
            text-align: center;
        }


        .phone{
            float: left;
            background-color: 	#F8F8F8;
            width: 68vw;
            height: 10vw;
            margin-top: 2vw;
            font-size: 1vw;
        }

        .sjbd{
            float: left;
            margin-top: 2vw;
            margin-left: 3vw;
            width: 47vw;
            height: 4vw;
            line-height: 4vw;
            height: 4vw;
            font-size: 1.5vw;
        }
        .sjbd i{
            font-size: 2vw;
        }
        .sjxx{
            float: left;
            margin-top: -4vw;
            margin-left: 14vw;
            width: 47vw;
            height: 4vw;
            line-height: 4vw;
        }

        .zuhe{
            float: right;

        }

        .butt1{
            float: left;
            margin-right: 1vw;
            margin-top: -1vw;
            line-height: 2vw;
            font-size: 1vw;
            text-align: center;

        }


        .dsf{
            float: left;
            background-color: 	#F8F8F8;
            width: 68vw;
            height: 16vw;
            margin-top: 2vw;
            font-size: 1vw;
        }
        .dsf i{
            font-size: 2vw;
        }


        .layui-btn{
            font-size: 1.5vw;
        }
        .dsf_left{
            width: 12vw;

            height: 12vw;
            float: left;
            font-size: 1.5vw;
            line-height: 6vw;
            text-align:center;
            margin-left: 1vw;
        }
        .dsf_right{
            width: 50vw;

            height: 12vw;
            float: left;
        }
        .dsf_right_top{
            width: 56vw;

            height: 9vw;
        }
        .dsf_right_di{
            width: 56vw;

            height: 3vw;
            font-size: 1.2vw;
        }
        .weixin{
            width: 15vw;
            height: 9vw;
            float: left;
            line-height: 6vw;
            font-size: 1vw;
            margin-left: 20px;
        }
        .weibo{
            width: 15vw;
            margin-left: 20px;
            height: 9vw;
            float: left;
            line-height: 6vw;
            font-size: 1vw;
        }
        .qq{
            width: 15vw;
            margin-left: 20px;
            height: 9vw;
            float: left;
            line-height: 6vw;
            font-size: 1vw;
        }
        .wenzi{
            width: 10vw;
            float: left;
            font-size: 1.2vw;
        }
        .i{
            width: 3vw;
            float: left;
        }
        .wenzi p{
            height: 1.5vw;
            font-size: 1.5vw;
        }
        #bangding{
            font-size: 0.8vw;
        }
        #bangding1{
            font-size: 0.8vw;
        }
        #bangding2{
              font-size: 0.8vw;
          }

        .youce{
            float: left;
            margin-top:-60vw;
            margin-left: 40vw;
            width: 45vw;
        }
        .xzk{
            margin-top: 4vw;
        }
        .buttonb{
            margin-left: 10vw;
            margin-top: 1.5vw;
        }
    </style>

</head>
<body>

<%--<div style="font-size: 1.2vw;color: red; display: none; text-align: center;" id="bccg">保存成功</div>--%>
<!-- 信息完善/账号绑定 -->
<div class="xxzt">
<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
    <ul class="layui-tab-title">
        <li class="layui-this">信息完善</li>
        <li>账号绑定</li>

    </ul>
    <div class="layui-tab-content" style="height: 100px;">
        <div class="layui-tab-item layui-show">

            <%--<!-- 信息完善 -->--%>
            <form class="layui-form" action="<%=request.getContextPath()%>/personal/updateUser" method="post" >
                <%--隐藏 的userid--%>
                <div class="layui-form-item" style="display: none">
                    <label class="layui-form-label">用户编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="userId" value="${user.userId}" readonly="readonly" autocomplete="off" class="layui-input">
                    </div>
                </div>
                  <%--姓名--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <%--onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"--%>
                        <%--onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))"--%>
                        <input type="text" name="userRealname" value="${user.userRealname}" required  lay-verify="required" placeholder="请输入你的真实姓名(不超过6个字)"
                               onkeyup="value=value.replace(/[\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))"
                               autocomplete="off" class="layui-input" maxlength="6">
                    </div>
                </div>




                <%--性别--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block ">
                        <select name="userSex" value="${user.userSex}" id="userSex"lay-verify="required">
                            <option value="">${user.userSex}</option>
                            <option value="男">男</option>
                            <option value="女">女</option>
                        </select>
                    </div>
                </div>
                    <%--出生年月--%>
                    <div class="layui-form-item" style="margin-bottom: 30px">
                        <div class="layui-inline">
                            <label class="layui-form-label">出生年月</label>
                            <div class="layui-input-block">
                                <input type="text" name="userBirthday" value="${user.userBirthday}" id="userBirthday" autocomplete="off" class="layui-input"
                                       style="width: 24.5vw;">
                            </div>
                        </div>
                    </div>





                <!-- 修改上传头像 -->
                <label class="layui-form-label" style="margin-bottom: 30px">上传头像</label>
                <div class="layui-input-inline uploadHeadImage" style="margin-bottom:2vw;">
                    <div class="layui-upload-drag"  id="headImg">
                        <i class="layui-icon"></i>
                        <p style="font-size: 1vw;">点击上传图片</p>
                    </div>
                            <%--文件上传的隐藏input输入框 带着该输入框一起提交--%>
                    <input type="hidden" name="userImg" id="userImg"  >

                </div>
                    <%--动态反显图片--%>
                <div class="layui-input-inline" style="margin-bottom:3vw;">
                    <div class="layui-upload-list">
                        <img class="layui-upload-img headImage" name="userImg" src="${user.userImg}"   id="demo1"
                             style="width: 8vw; height: 8vw;">
                        <p id="demoText"></p>
                    </div>
                </div>
                 <%--籍贯--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">籍贯</label>
                    <div class="layui-input-block">
                        <input type="text" name="userNative" value="${user.userNative}"  placeholder="请输入籍贯（与身份证一致，最多10个字）"  maxlength="10" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <%--婚否--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">婚否</label>
                    <div class="layui-input-block">
                        <select name="userMarry" value="${user.userMarry}" id="userMarry">
                            <option value="">${user.userMarry}</option>
                            <option value="已婚">已婚</option>
                            <option value="未婚">未婚</option>
                        </select>
                    </div>
                </div>
            <%--所在城市--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">所在城市</label>
                    <div class="layui-input-block">
                        <input type="text" name="userCity" value="${user.userCity}" maxlength="20" placeholder="请输入所在城市（最多10个字）" autocomplete="off" class="layui-input" maxlength="10">
                    </div>
                </div>
                    <%--现状--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">现状</label>
                    <div class="layui-input-block">
                        <select name="userState" value="${user.userState}">
                            <option value="">${user.userState}</option>
                            <option value="在职">在职</option>
                            <option value="离职">已离职</option>
                        </select>
                    </div>
                </div>

                <%--目标职位--%>
                    <div class="youce" style="margin-bottom: 30px">
                <div class="layui-form-item">
                    <label class="layui-form-label">目标职位</label>
                    <div class="layui-input-block">
                        <select name="userTarget" value="${user.userTarget}">
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
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">所属行业</label>
                    <div class="layui-input-block">
                        <select name="userIndustry" value="${user.userIndustry}">
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

                <div class="layui-form-item layui-form-text" style="margin-bottom: 30px">
                    <label class="layui-form-label">兴趣爱好</label>
                    <div class="layui-input-block" style="height: 10vw;">
                        <textarea name="userHobby" value="${user.userHobby}" placeholder="请输入你的兴趣爱好(不超过50字)" class="layui-textarea" maxlength="50" >${user.userHobby}</textarea>
                    </div>
                </div>
                <%--自我评价--%>
                <div class="layui-form-item layui-form-text" style="margin-top: 2vw;margin-bottom: 30px">
                    <label class="layui-form-label">自我评价</label>
                    <div class="layui-input-block" style="height: 9vw;">
                        <textarea name="userSelfappraise" value="${user.userSelfappraise}" placeholder="请输入自我评价内容(不超过100字)" class="layui-textarea" maxlength="100" >${user.userSelfappraise}</textarea>
                    </div>
                </div>
                <%--最高学历--%>
                        <div class="xzk">
                            <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">最高学历</label>
                    <div class="layui-input-block">
                        <select name="userEducation"  value="${user.userEducation}">
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
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">所在院校</label>
                    <div class="layui-input-block">
                        <input type="text" name="userAcademy" value="${user.userAcademy}" placeholder="请输入所在院校" autocomplete="off" class="layui-input" maxlength="25">
                    </div>
                </div>
                <%--所属专业--%>
                <div class="layui-form-item" style="margin-bottom: 30px">
                    <label class="layui-form-label">所属专业</label>
                    <div class="layui-input-block">
                        <input type="text" name="userSpecialty" value="${user.userSpecialty}" placeholder="请输入所属专业（不超过20个字）" autocomplete="off" class="layui-input" maxlength="20">
                    </div>
                </div>
                <div class="buttonb">
                <div class="layui-form-item">
                    <div class="layui-input-block" style="margin-top: 50px">
                        <%--保存按钮--%>
                        <button class="layui-btn" type="submit" id="baocun">保存</button>

                        <%--重置按钮--%>
                        <button type="reset" id="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
                </div>
            </form>
        </div>
    </div>
</div>

        <!-- 账号绑定 -->
        <div class="layui-tab-item">

            <!-- 邮箱 -->
            <div class="youxiang zhanghao">

                <div class="yxbd">
                    <i class="layui-icon layui-icon-picture-fine" style="font-size: 30px"></i>
                    <span>邮箱绑定</span>
                </div>

                <%--邮箱信息--%>
                <div class="yxxx">
                    <span style="font-size: 16px">你还没绑定任何邮箱，快去绑定吧</span>
                </div>


                    <%--弹出绑定邮箱--%>
                <div class="butt">
                    <!-- layui弹出层 -->
                    <div class="site-demo-button" id="layerDemo1" style="margin-bottom: 0;">

                        <button data-method="bdyx" class="layui-btn">绑定邮箱</button>
                        <%--<button data-method="offset" data-type="lt" class="layui-btn layui-btn-normal">左上弹出</button>--%>
                    </div>
                    <!-- 结束 -->
                </div>

            </div>


            <!-- 手机绑定 -->
            <div class="phone zhanghao">

                <div class="sjbd">
                    <i class="layui-icon layui-icon-cellphone" style="font-size: 30px"></i>
                    <span>手机绑定</span>
                </div>

                    <%--手机信息--%>
                <div class="sjxx">
                    <span style="font-size: 16px">${user.phonenum}</span>
                </div>

                <%--手机修改信息--%>
                <div class="zuhe">
                    <div class="butt">
                        <!-- layui弹出层 -->
                        <div class="site-demo-button" id="layerDemo2" style="margin-bottom: 0;">
                            <button data-method="xgmm" class="layui-btn">修改密码</button>
                        </div>
                        <!-- 结束 -->
                    </div>
                    <%--更改手机号提示框--%>
                    <div class="butt1">
                        <!-- layui弹出层 -->
                        <div class="site-demo-button" id="layerDemo3" style="margin-bottom: 0;">
                            <button data-method="genggaisj" class="layui-btn">更改</button>
                        </div>
                        <!-- 结束 -->
                    </div>
                </div>
            </div>


            <!--  第三方绑定-->
            <div class="dsf">

                <%--第三方绑定死数据--%>
                <div class="dsf_left">
                    <i class="layui-icon layui-icon-user" style="font-size: 30px"></i>
                    <span>第三方绑定</span>
                </div>

                <%--微信绑定--%>
                <div class="dsf_right">
                    <div class="dsf_right_top">
                        <div class="weixin">
                            <div class="i"><i class="layui-icon layui-icon-login-wechat "></i>
                            </div>
                            <div class="wenzi">
                                <p>微信</p>
                                <p id="bangding1" style="font-size: 1vm">已绑定</p>
                                <div class="butt3">
                                    <!-- layui弹出层 -->
                                    <div class="site-demo-button" id="layerDemo4" style="margin-bottom: 0;">

                                        <button data-method="jiechubd" class="layui-btn" style="margin-top: 25px">解除绑定</button>
                                    </div>
                                    <!-- 结束 -->
                                </div>
                            </div>
                        </div>
                        <%--微博绑定--%>
                        <div class="weibo">
                            <div class="i"><i class="layui-icon layui-icon-login-weibo"></i>
                            </div>
                            <div class="wenzi">
                                <p>微博</p>
                                <p id="bangding2" style="font-size: 1vm">已绑定</p>

                                <div class="butt3">
                                    <!-- layui弹出层 -->
                                    <div class="site-demo-button" id="layerDemo5" style="margin-bottom: 0;">

                                        <button data-method="jiechubd" class="layui-btn" style="margin-top: 25px">解除绑定</button>
                                    </div>
                                    <!-- 结束 -->
                                </div>
                            </div>
                        </div>
                            <%--QQ绑定--%>
                        <div class="qq">
                            <div class="i"><i class="layui-icon layui-icon-login-qq"></i></div>
                            <div class="wenzi">
                                <p>腾讯QQ</p>
                                <p id="bangding" style="font-size: 1vm">未绑定</p>

                                <div class="butt3">
                                    <!-- layui弹出层 -->
                                    <div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">

                                        <button data-method="tianjiabd" class="layui-btn" style="margin-top: 25px">添加绑定</button>
                                    </div>
                                    <!-- 结束 -->
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="dsf_right_di" style="margin-top: 30px">
                        <span>绑定第三方账号后，可以直接登录，还可以将内容同步到对应平台，与更多好友分享？</span>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>


<%--js事件--%>
<script type="text/javascript">

    //
    //信息完善js, 选项卡切换js
    layui.use('element', function(){
        var $ = layui.jquery
            ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabChange: function(){
                //切换到指定Tab项
                element.tabChange('demo', '22'); //切换到：用户管理
            }
        };

        $('.site-demo-active').on('click', function(){
            var othis = $(this), type = othis.data('type');
            active[type] ? active[type].call(this, othis) : '';
        });

    });


    //日期js
    layui.use('laydate',function(){
        var laydate=layui.laydate;
        laydate.render({
            elem: '#userBirthday'
            //类型
            ,type:'date'
          //  设置选择日期不能超过当前日期
            ,max : getNowFormatDate()
        });
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


    //转换日期格式
    //获取出生年月的值
    var date = $("#userBirthday").val();
    function formatDate(date){
        date = new Date(date);
        //获取年月日,时分秒的值
        var y=date.getFullYear();
        var m=date.getMonth()+1;
        var d=date.getDate();
        var h=date.getHours();
        var m1=date.getMinutes();
        var s=date.getSeconds();
        m = m<10?("0"+m):m;
        d = d<10?("0"+d):d;
        return y+"-"+m+"-"+d;
    }
    date = formatDate(date);
    //将格式化后的值放入到出生年月中
    $("#userBirthday").val(date);

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
            , url: '<%=request.getContextPath()%>/personal/uploadHeadPic'
            , size: 500
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
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
                // $("#userImg").val(res.data.src);
                // //上传成功后提示信息
                // var demoText = $('#demoText');
                // demoText.html('<span style="color: red;">上传成功!!!</span>');


                //服务器上传成功
                layer.msg(res.message,{icon: 1});
                //获取图片路径URL
                $("#userImg").val(res.url)
            }
            //错误重新上传
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




    //保存按钮点击事件,当点击重置按钮时，显示信息
    $("#baocun").click(function () {
        layer.msg('保存成功', {
            shift: -1
           , icon: 1,
            time: 4000 //2秒关闭（如果不配置，默认是3秒）
        }, function(){
            location.reload();
        });
    });



    //重置按钮点击事件,当点击重置按钮时，显示信息
    $("#reset").click(function () {
        layer.msg("信息已重置",{ icon:6});
    });


    //账户绑定js
    layui.use('layer', function(){ //独立版的layer无需执行这一句
        var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

        //触发事件
        var active = {
            setTop: function(){
                var that = this;
                //多窗口模式，层叠置顶
                layer.open({
                    type: 2 //此处以iframe举例
                    ,title: '当你选择该窗体时，即会在最顶端'
                    ,area: ['390px', '260px']
                    ,shade: 0
                    ,maxmin: true
                    ,offset: [ //为了演示，随机坐标
                        Math.random()*($(window).height()-300)
                        ,Math.random()*($(window).width()-390)
                    ]
                    ,content: '//layer.layui.com/test/settop.html'
                    ,btn: ['继续弹出', '全部关闭'] //只是为了演示
                    ,yes: function(){
                        $(that).click();
                    }
                    ,btn2: function(){
                        layer.closeAll();
                    }

                    ,zIndex: layer.zIndex //重点1
                    ,success: function(layero){
                        layer.setTop(layero); //重点2
                    }
                });
            }

            //绑定邮箱
            ,bdyx: function(){

                layer.open({
                    type: 1
                    //弹出框置顶
                    ,offset: ['5vw', '15vw']
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '50vw'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['提交', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<form>'+
                        '<center>'+
                        '<input class="layui-input-block" style="width:40vw; margin-left: -0.5vw; margin-top:2vw;height:2vw;" type="email" name="email" placeholder="请输入你的邮箱地址" id="user_email" onchange="email()" />'+
                        '<br><span class="error" id="emailError"></span>'+
                        '<br>'+
                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-left:-4.2vw;margin-top:2vw;" type="text" name="text" placeholder="请输入你的验证码"/>'+
                        '<button style="height:2vw;font-size:1vw;margin-left:1vw;">获取验证码</button>'+
                        '</center>'+
                        '</form>'
                    ,success: function(layero){
                    //        成功之后的方法回调
                    }
                });
            }

            //修改密码
            ,xgmm: function(){

                layer.open({
                    type: 1
                    //弹出框置顶
                    ,offset: ['5vw', '15vw']
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '50vw'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['提交', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<form action="">'+
                        '<center>'+

                        '<input class="layui-input-block" style="width:40vw; margin-left:8vw; margin-top:2vw;height:2vw;" type="tel" name="userPhonenum" placeholder="请输入你的手机号" id="user_phonenum" onchange="phone()"/>'+
                        '<br/><span class="error" id="phoneError"></span>'+
                        '<br>'+

                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-left:5vw;margin-top:2vw;" type="text" name="duanxin" placeholder="请输入你的短信验证码"/>'+
                        '<button style="height:2vw;font-size:1vw;margin-left:1vw;">获取验证码</button>'+'<br>'+

                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-left:-2vw;margin-top:2vw;" name="userPwd" type="password" name="password" placeholder="请输入6-18位的字母或数字" id="pwd1" onchange="checkpwd1()"/>'+
                        '<br/><span class="error" id="checktext2"></span>'+
                        '<br>'+

                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-left:-2vw;margin-top:2vw;" type="password" name="password" placeholder="请再次输入密码"  id="pwd2" onchange="checkpwd2()"/>'+
                        '<br/><span class="error" id="checktext3"></span>'+

                        '</center>'+
                        '</form>'
                    ,success: function(layero){
                        // var btn = layero.find('.layui-layer-btn');
                        // btn.find('.layui-layer-btn0').attr({
                        //   href: 'http://www.layui.com/'
                        //   ,target: '_blank'
                        // });
                    }
                });
            }

            //更改手机
            ,genggaisj: function(){

                layer.open({
                    type: 1
                    //弹出框置顶
                    ,offset: ['5vw', '15vw']
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '50vw'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['提交', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<form>'+'<center>'+
                        '<p style="font-size:1.5vw;">提示:解绑后将再不能使用第三方账号登录了'+'</p>'+'<br>'+
                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-top:1vw; margin-left: 2vw;" type="text" name="phone" placeholder="请输入已绑定的手机号" />'+

                        '</center>'+
                        '<a href="#" style="float:right;margin-right:10vw;">忘记密码</a>'+
                        '</form>'
                    ,success: function(layero){
                        // var btn = layero.find('.layui-layer-btn');
                        // btn.find('.layui-layer-btn0').attr({
                        //   href: 'http://www.layui.com/'
                        //   ,target: '_blank'
                        // });
                    }
                });
            }



            //解除绑定
            ,jiechubd: function(){

                layer.open({
                    type: 1
                    //弹出框置顶
                    ,offset: ['5vw', '15vw']
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '50vw'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['提交', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<form>'+'<center>'+
                        '<p style="font-size:1.5vw;">提示:解绑后将再不能使用第三方账号登录了'+
                        '</p>'+'<br>'+
                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-top:1vw;  margin-left: 2vw;" type="password" name="password" placeholder="请输入智量库登录密码"/>'+
                        '</center>'+
                        '<a href="#" style="float:right;margin-right:10vw;">忘记密码</a>'+
                        '</form>'
                    ,success: function(layero){
                        // var btn = layero.find('.layui-layer-btn');
                        // btn.find('.layui-layer-btn0').attr({
                        //   href: 'http://www.layui.com/'
                        //   ,target: '_blank'
                        // });
                    }
                });
            }
            //添加绑定
            ,tianjiabd: function(){

                layer.open({
                    type: 1
                    //弹出框置顶
                    ,offset: ['5vw', '15vw']
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,area: '50vw'
                    ,shade: 0.8
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['提交', '取消']
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<form>'+'<center>'+
                        '<p style="font-size:1.5vw;">提示:解绑后将再不能使用第三方账号登录了'+
                        '</p>'+'<br>'+
                        '<input class="layui-input-block" style="width:30vw;height:2vw;margin-top:1vw;  margin-left: 2vw;" type="password" name="password" placeholder="请输入智量库登录密码"/>'+
                        '</center>'+
                        '<a href="#" style="float:right;margin-right:10vw;">忘记密码</a>'+
                        '</form>'
                    ,success: function(layero){
                        // var btn = layero.find('.layui-layer-btn');
                        // btn.find('.layui-layer-btn0').attr({
                        //   href: 'http://www.layui.com/'
                        //   ,target: '_blank'
                        // });
                    }
                });
            }
            //记号
        };
        //    点击按钮时，弹出框显示
        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#layerDemo1 .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#layerDemo2 .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#layerDemo3 .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#layerDemo4 .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
        $('#layerDemo5 .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });

</script>
<script>

    //验证手机号
    function phone() {
        var regPhone = /^1([356789]\d|5[0-35-9]|7[3678])\d{8}$/;
        var phone = document.getElementById("user_phonenum").value;
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


    //密码验证
    function checkpwd1() {
        var check = false;
        //获取密码输入框输入的值
        var password = document.getElementById("pwd1").value;
        var regpass = /^[a-zA-Z]{1}(?![a-zA-Z]+$)([a-zA-Z0-9]|[._]){5,17}$/;
        var bool = regpass.test(password);
        if (bool == true) {
            document.getElementById("checktext2").innerHTML = "";
            check = true;
        } else {
            document.getElementById("checktext2").innerHTML = "密码必须以字母开头包含6-18数字字母和._符号";
            document.getElementById("checktext2").style.color="red";
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
            document.getElementById("checktext3").style.color="red";
            check = false;
        } else {
            document.getElementById("checktext3").innerHTML = "";
            check = true;
        }
        return check;
    }

    //验证邮箱
    function email() {
        var id = /^[A-Za-z0-9-._]+@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,6})$/;
        var txtemail= document.getElementById("user_email").value;
        var bool = id.test(txtemail);
        if(bool == true){
            document.getElementById("emailError").innerHTML="";
            return true;
        }else{
            document.getElementById("emailError").innerHTML="格式不对如jack@163.com";
            document.getElementById("emailError").style.color="red";
            return false;
        }
    }
    function check(){
        var check = checkpwd1() && checkpwd2() && email() && phone();
        return check;
    }

</script>

</body>
</html>
