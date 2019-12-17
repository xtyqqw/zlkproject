<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/editormd/css/editormd.css" />
    <link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.css" rel="stylesheet">
    <script src="<%=request.getContextPath()%>/layui/layui.js"></script>
</head>
<style>

</style>
<body>
<div>
<form action="<%=request.getContextPath()%>/article/update" class="form" method="post">
    <input type="hidden" name="articleId" id="articleId" value="${articles.articleId}"><br>

    <table class="editorTable" align="center" style="margin: auto;border-collapse: separate;border-spacing: 20px;">
        <tr>
            <td style="width: 100px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;" valign="bottom">文章标题</td>
            <td><input type="text" required id="title" placeholder="请输入文章标题(不超过20个字)" name="title" value="${articles.title}" maxlength="20"></td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">浏览数</td>
            <td><input type="text" required id="browseCount" placeholder="请输入浏览数" name="browseCount" value="${articles.browseCount}" oninput = "value=value.replace(/[^\d]/g,'')"></td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">评论数</td>
            <td><input type="text" required id="commentCount" placeholder="请输入浏览数" name="commentCount" value="${articles.commentCount}" oninput = "value=value.replace(/[^\d]/g,'')"></td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">发布时间</td>
            <td><input type="text" required id="createTime" placeholder="请输入发布时间" name="createTime" value="${articles.createTime}"></td>
        </tr>
        <tr>
            <td valign="bottom">更新时间</td>
            <td><input type="text" required id="updateTime" placeholder="请输入更新时间" name="updateTime" value="${articles.updateTime}"></td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">插图相对路径</td>
            <td><input type="text" required id="figures" placeholder="请输入插图相对路径" name="figures" value="${articles.figures}"></td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">赞数</td>
            <td><input type="text" required id="zanCount" placeholder="请输入赞数" name="zanCount" value="${articles.zanCount}" oninput = "value=value.replace(/[^\d]/g,'')"></td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">踩数</td>
            <td><input type="text" required id="caiCount" placeholder="请输入踩数" name="caiCount" value="${articles.caiCount}" oninput = "value=value.replace(/[^\d]/g,'')"></td>
        </tr>
        <tr>
            <td style="width: 100px;text-align: center;" valign="bottom">举报</td>
            <td><select type="text" required id="inform" placeholder="请输入举报" name="inform" value="${articles.inform}">
                <option value="0">是</option>
                <option value="1">否</option>
            </select>
            </td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">发文类型</td>
            <td><select type="text" required id="createArticleType" placeholder="请输入发文类型" name="createArticleType" value="${articles.createArticleType}">
                <option value="0">原创</option>
                <option value="1">转载</option>
                <option value="2">翻译</option>
            </select>
            </td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">文章置顶</td>
            <td><select type="text" required id="articleSetTop" placeholder="请输入文章置顶" name="articleSetTop" value="${articles.articleSetTop}">
                <option value="0">置顶</option>
                <option value="1">不置顶</option>
            </select>
            </td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">审核</td>
            <td><select type="text" required id="approval" placeholder="请输入审核状态" name="approval" value="${articles.approval}">
                <option value="0">审核中</option>
                <option value="1">审核过</option>
                <option value="2">审核未过</option>
            </select>
            </td>
        </tr>
        <tr>
            <td style="width: 100px;" valign="bottom">文章方向</td>
            <td><input type="text" required readonly id="typeName" placeholder="请输入文章方向" name="typeName" value="${articles.typeName}"></td>
        </tr>
        <tr>
            <td style="width: 100px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">文章摘要</td>
            <td><textarea rows="5" cols="69" required id="articleDigest" name="articleDigest" value="${articles.articleDigest}"></textarea><br></td>
        </tr>
        <%--<tr>
            <td style="width: 100px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">HTML格式文章内容</td>
            <td><textarea rows="5" cols="69" required id="articleContentHtml" name="articleContentHtml"></textarea><br></td>
        </tr>
        <tr>
            <td style="width: 100px;">文章内容</td>
            <td><pre required id="articleContent" name="articleContent"><code class="language-css"></code></pre><br></td>
        </tr>--%>
    </table>

    <div id="md-content">
        <textarea class="editormd-markdown-textarea" name="articleContent" style="display: none">${articles.articleContent}</textarea>
        <textarea class="editormd-html-textarea" name="articleContentHtml" style="display: none">${articles.articleContentHtml}</textarea>
    </div>

    <input type="submit" hidden="hidden" id="updateSubmit" value="确认">
</form>
</div>

<script src="<%=request.getContextPath() %>/js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath() %>/editormd/editormd.min.js"></script>
<script type="text/javascript">
    /*MarkDown组件*/
    var testEditor;
    $(function() {
        testEditor = editormd("md-content", {
            width : "80%",
            height : 640,
            syncScrolling : "single",
            //你的lib目录的路径
            path : "<%=request.getContextPath() %>/editormd/lib/",
            imageUpload : true,
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/uploadfile",
            //这个配置是为了能够提交表单,使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中,方便post提交表单
            saveHTMLToTextarea : true
        });
    });


</script>

</body>
</html>
