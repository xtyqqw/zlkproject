<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>热门</title>
    <style type="text/css">
        .context-div{
            overflow-x:hidden;
            position: absolute;
            overflow: hidden;
            margin: auto 0;
            width: 98%;
            height: 98%;
        }
        .all{
            width: 100%;
            height: 187px;
            background-color: #FFFFFF;
            border-bottom: 1px solid #F0F0F0;
            position: relative;
        }
        .title{
            position: relative;
            left: 14px;
            top: 26px;
            float: left;
        }
        .title a{
            font-size: 22px;
            font-family: Arial;
            font-weight: bold;
            color: #383838;
            text-decoration:none;
        }
        .createArticleType{
            position: relative;
            left: 30px;
            top: 31px;
            float: left;
            width: 35px;
            height: 20px;
            background-color: #1296db;
            border-radius: 8%;
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            text-align: center;
        }
        .articleSetTop{
            position: relative;
            left: 40px;
            top: 31px;
            float: left;
            width: 35px;
            height: 20px;
            background-color: #914ff1;
            border-radius: 8%;
            text-align: center;
        }
        .articleSetTop #p{
            font-size: 15px;
            font-family: Arial;
            color: #FFFFFF;
            text-decoration:none;
            margin:0;
            padding:0;
            display: inline-block;
            vertical-align: middle;
            text-align: left;
        }
        .articleDigest{
            position: absolute;
            width: 630px;
            left: 14px;
            top: 70px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            /*border: #914ff1 2px solid;*/
            font-size: 17px;
            font-family: Arial;
            color:  #707070;
            text-decoration:none;
        }
        .figures{
            position: absolute;
            left: 680px;
            top: 28px;
            width: 170px;
            height: 95px;
            border-radius: 5px;
        }
        .icon{
            position: absolute;
            left: 690px;
            bottom: 20px;
        }
        .browseCount{
            position: absolute;
            left: 720px;
            bottom: 20px;
        }
        .browseCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .icon1{
            position: absolute;
            left: 790px;
            bottom: 20px;
        }
        .commentCount{
            position: absolute;
            left: 820px;
            bottom: 20px;

        }
        .commentCount a{
            font-size: 16px;
            font-family: "Arial";
            color: #989898;
            text-decoration:none;
        }
        .createTime{
            position: absolute;
            bottom: 20px;
            left: 150px;
            font-size: 16px;
            color: #989898;
            font-family: Arial;
        }
        .userImg{
            border: 1px crimson solid;
            width: 20px;
            height: 20px;
            position: absolute;
            left: 14px;
            bottom: 16px;
            border-radius: 50px;
        }
        .userRealname{
            border: 1px crimson solid;
            width: 70px;
            height: 20px;
            position: relative;
            left: 55px;
            top: 150px;
        }
        .more{
            font-size: 18px;
            font-family: Arial;
            color: #989898;
            background-color: #FFFFFF;
            border: none 0;
        }
        .more-button{
            text-align: center;
            position: relative;
            bottom: -20px;
        }
        .imgtest {
            width: 100%;
            height: 100%;
            object-fit:cover;
        }
    </style>
</head>
<body>
<div class="context-div">
    <c:forEach items="${articleList}" var="article" begin="0" end="4">
        <div class="all">
            <div class="title"><a href="#">${article.title}</a></div>
            <div class="createArticleType">${article.createArticleType}</div>
            <c:if test="${article.articleSetTop == 0}">
                <div class="articleSetTop"><p id="p">置顶</p></div>
            </c:if>
            <div class="articleDigest">${article.articleDigest}</div>
            <div class="createTime"><fmt:formatDate value="${article.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
            <div class="figures">
                <img class="imgtest" src="http://localhost:8080//upload//6f8e3206-fd7e-4ff9-a1eb-fc07de81435f.jpg" alt="">
            </div>
            <div class="userRealname"><a href="#">${article.userList.userRealname}</a></div>
            <div class="userImg">${article.userList.userImg}</div>
            <svg t="1574820328378" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="713" width="22" height="20"><path d="M512 608a96 96 0 1 1 0-192 96 96 0 0 1 0 192m0-256c-88.224 0-160 71.776-160 160s71.776 160 160 160 160-71.776 160-160-71.776-160-160-160" fill="#989898" p-id="714"></path><path d="M512 800c-212.064 0-384-256-384-288s171.936-288 384-288 384 256 384 288-171.936 288-384 288m0-640C265.248 160 64 443.008 64 512c0 68.992 201.248 352 448 352s448-283.008 448-352c0-68.992-201.248-352-448-352" fill="#989898" p-id="715"></path></svg>
            <div class="browseCount"><a href="#">${article.browseCount}阅读</a></div>
            <svg t="1574820647675" class="icon1" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="832" width="22" height="20"><path d="M896 128H128a32 32 0 0 0-32 32v576a32 32 0 0 0 32 32h288v-64H160V192h704v512h-256c-8.832 0-16.832 3.584-22.656 9.376l-159.968 160 45.248 45.248L621.248 768H896a32 32 0 0 0 32-32V160a32 32 0 0 0-32-32" fill="#989898" p-id="833"></path><path d="M560 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 560 448M240 448a48 48 0 1 0 95.968 0.032A48 48 0 0 0 240 448M784 448a48 48 0 1 0-95.968-0.032A48 48 0 0 0 784 448" fill="#989898" p-id="834"></path></svg>
            <div class="commentCount"><a href="#">${article.commentCount}评论</a></div>
        </div>
    </c:forEach>
    <div class="more-button">
        <button class="more" id="more">点击加载更多</button>
    </div>
</div>
</body>
</html>