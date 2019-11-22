<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>社区</title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/layui/css/layui.css" media="all">

	<script src="<%=request.getContextPath() %>/js/jquery-3.1.1.min.js"></script>

	<script src="<%=request.getContextPath() %>/layui/layui.js"></script>

	<style>
		.wz_jvti{
			float: left;
			width: 92vw;
			height: 19vw;
			background-color: rgba(192,192,192,0.1);
			position: absolute;
		    margin-left: 5vw;
		    margin-top: 11vw;

		}
		.wz_jt{
			width: 82vw;
		    margin-left: 4vw;
		    position: absolute;
		    margin-top: 3vw;

		}
		.wz_jt_img img{
			width: 100%;
			height: 100%;
		}
		.wz_jt_img{
			float: left;
			width: 8vw;
			height: 8vw;
			border-radius: 60%;
			overflow: hidden;
		}
		.wz_jt_name{
			margin-left: 0.4vw;
		    margin-top: 9vw;

		    font-size: 1.3vw;
		}
		.wz_jt_gz{
			width: 8vw;
			height: 3vw;
			line-height: 3vw;
			font-size: 1.2vw;
			background-color: #0033FF;
			color: white;
			text-align: center;
			margin-top: 1vw;
			border-radius: 0.3vw;
			cursor: pointer;
		}
		.wz_jt_you{
			float: left;
			margin-left: 18vw;
			margin-top: 3vw;
		}
		.wz_jt_fl{
			font-size: 1.1vw;
			height: 1vw;
		}
		.wz_jt_time{
			margin-left: 59vw;
		}
		.wz_jt_fl li{
			height: 1.5vw;
		    font-size: 1vw;
		    line-height: 1.5vw;
		    text-align: center;
		    background-color: #B8B8B8;
		    padding: 0 0.5vw 0 0.5vw;
		    border-radius: 1vw;
		    display: inline-block;
		    float: left;
		}
		.wz_jt_fl li+li{
			margin-left: 1vw;
		}
		.wz_jt_bt{
			margin-top: 2vw;
			padding-left: -34vw;
			font-size: 1.6vw;
		}
		.wz_jt_bq{
			padding-top: 4vw;
			padding-left: -21vw;
			font-size: 1.3vw;
		}
		.wz_tj_li{
			position: relative;
			margin-top: 1vw;
			margin-left: 1vw;
			font-size: 1.2vw;
		}
		.wz_tj_li li{
			margin-top: 1vw;
			margin-left: -1vw;
			width: 11vw;
			float: left;
		}
		#zan{
        	float: left;
   	        font-size: 1.5vw;
   	    }
       .likes{
       	    float: left;
       	    margin-left: 1vw;
       	    font-size: 1.2vw;
       }
       #cai{
        	float: left;
   	        font-size: 1.5vw;
   	    }
		.wz_jt_neirong{
			width: 92vw;
			position: absolute;
		    margin-left: 5vw;
		    margin-top: 32vw;
		    padding-bottom: 5vw;
		    box-shadow: 2px 2px 5px #bbb;
		}
		.wz_jt_nr{
			margin-left: 5vw;
		    margin-top: 2vw;
		    font-size: 1.3vw;
		}
        
        .wz_jt_pinglun{
        	position: absolute;
        	width: 85vw;
        	height: 10vw;
			background-color: rgba(192,192,192,0.1);
		    margin-left: 9vw;
		    margin-top: 45vw;
		    padding-bottom: 5vw;
			box-shadow: 2px 2px 5px #bbb;
        }
        .pinlun{
        	font-size: 2vw;
        }
        
	</style>
</head>
<body>

	<div class="wz_jvti">
		<div class="wz_jt">
			<div class="wz_jt_img">
				<img src="../img/0.jpg">
			</div>
			<div class="wz_jt_name">
				<span>${alist.userName}</span>
			</div>
			<input type="button" value="关注" class="wz_jt_gz"/>
		</div>
		<div class="wz_jt_you">
			<div class="wz_jt_fl">
			<ul class="">
				<li>Java</li>
				<li>HTML5</li>
			</ul>
			<div class="wz_jt_time"><span>${alist.createTime}</span></div>
			</div>
			<div class="wz_jt_bt">
				<p>${alist.title}</p>
			</div>
			<div class="wz_jt_bq">
				<p>${alist.tagName}</p>
			</div>
			<div class="wz_tj_li">
			<ul>
				<li>
			       <i class="layui-icon" id="zan" title="赞">&#xe6c6;</i>
			       <p class="likes">&nbsp;</p>
		        </li>
		        <li>
			       <i class="layui-icon" id="cai" title="踩">&#xe6c5;</i>
			       <p class="likes">&nbsp;</p>
		        </li>
				<li>浏览&nbsp;&nbsp;${alist.browseCount}</li>
				<li>评论&nbsp;&nbsp;${alist.commentCount}</li>
			</ul>
			</div>
		</div>
	</div>
	<div class="wz_jt_neirong">
		<p class="wz_jt_nr">${alist.articleContent}</p>
	</div>

	<div class="wz_jt_pinglun">
		<ul class="pinglun">对不起，该文章暂无相关评论~~</ul>
	</div>


<script type="text/javascript">
    layui.use(['layer', 'laydate','form'], function() {
        var $ = layui.$;

    });


	$(document).ready(function(){
      var onOff=true;
      var wz_jt_gz=$(".wz_jt_gz");
      wz_jt_gz.click(function(){
         if (wz_jt_gz.onOff) {
         wz_jt_gz.val("关注");
         wz_jt_gz.onOff = false;
        } else {
         wz_jt_gz.val("已关注");
         wz_jt_gz.onOff = true;
        }
       });
    });

    //点赞
	$(function () {
		for (var i = 0; i < $('.likes').length; i++) {
			var ran = Math.floor(${alist.zanCount})
			$('.likes').eq(i).text(ran)	
		}
		var flag = true;
		$("#zan").click(function () {
			var num = $(this).next().text()
			if(flag == true){
			   num++;
			   flag=false;
			   $(this).next().text(num);
			   $(this).css('color','blue');
			}else{
               num--;
               flag=true;
               $(this).next().text(num);
			   $(this).css('color','black');
           }
		});
	});
	//点踩
	$(function () {
		for (var i = 0; i < $('.likes').length; i++) {
			var ran = Math.floor(${alist.caiCount})
			$('.likes').eq(i).text(ran)
		}
		var flag = true;
		$("#cai").click(function () {
			var num = $(this).next().text()
			if(flag == true){
				num++;
				flag=false;
				$(this).next().text(num);
				$(this).css('color','blue');
			}else{
				num--;
				flag=true;
				$(this).next().text(num);
				$(this).css('color','black');
			}
		});
	});
</script>

</body>
</html>