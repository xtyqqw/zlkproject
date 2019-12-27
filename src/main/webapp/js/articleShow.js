var replyEditorArr = [];

$(document).ready(function () {

    var localObj = window.location;
    var basePath = localObj.protocol+"//"+localObj.host;

    layui.use(['element', 'flow', 'layer', 'form'], function () {
        var element = layui.element,
            $ = layui.jquery,
            flow = layui.flow,
            layer = layui.layer,
            form = layui.form,
            articleId = parseInt($("#articleId").text());

        //弹出层设置
        layer.config({
            offset: '35%'
        });

        {
            $("#artCmt_btn").click(function () {
                let isEmpty = true;
                let lengthState = true;
                let contentHtml = '' + artCmt_editor.txt.html();
                let contentText = '' + artCmt_editor.txt.text();
                contentHtml = contentHtml.replace(/'/g,"\\\'");
                if (contentText === ''){
                    isEmpty = true;
                }else {
                    isEmpty = false;
                }
                let articleId = '1';
                let userId = '1';
                let data = {'articleId':articleId, 'userId':userId, 'content':contentHtml};
                if (isEmpty){
                    layer.msg("内容为空无法提交！");
                }
                if(contentHtml.length>200){
                    layer.msg("内容超出最大长度限制！");
                    lengthState = false;
                }
                if(lengthState && !isEmpty){
                    $.ajax({
                        type : "POST",
                        url : basePath+"/artComment/submit",
                        data : data,
                        success : function (res) {
                            layer.msg(res.retmsg);
                            if (res.retmsg === '评论成功'){
                                artCmt_editor.txt.clear();
                            }
                        },
                        error : function () {
                            layer.msg('发表评论前，请先登录！');
                            artCmt_editor.txt.clear();
                        }
                    });
                }
                lengthState = true;
            });

            let artCmtE = window.wangEditor;
            let artCmt_editor = new artCmtE('#div_artCmt_toolBar', '#div_artCmt_text');
            artCmt_editor.customConfig.menus = [
                'bold',
                'italic',
                'underline',
                'code'
            ];
            artCmt_editor.customConfig.showLinkImg = false;
            artCmt_editor.create();
        }

        {
            let userId = '1';
            let articleId = '1';
            let flag = 0;
            function cmtFlowLoad(url) {
                flag = 0;
                $("#art_cmt_stream").empty();
                flow.load({
                    elem: '#art_cmt_stream',//流加载容器
                    isAuto: false,
                    done: function (page, next) { //加载下一页
                        let lis = [];
                        let size = 3;
                        let data = {"articleId": articleId, "page": page, "size": size};
                        $.ajax({
                            type: "POST",
                            url: ""+url,
                            dataType: "json",
                            data: data,
                            success: function (result) {
                                var str = "";
                                let str1 = "";
                                let replyStr = "";
                                let heightStr = "";
                                let data_type = "";
                                let zanCaiState = "";
                                let zanStr = '';
                                let caiStr = '';
                                layui.each(result.comments, function (i, comment) {
                                    str1 = '';
                                    let len = comment.articleCommentList.length;
                                    for (let i=0;i<len;i++){
                                        zanCaiState = 'none';
                                        zanStr = '<i class="iconfont icon-qinziAPPtubiao-1 ART_ZCbtn" data_name="zan" style="font-size: 20px;color: rgb(121,121,121)"></i>';
                                        caiStr = '<i class="iconfont icon-qinziAPPtubiao- ART_ZCbtn" data_name="cai" style="font-size: 18px;color: rgb(121,121,121)"></i>';
                                        for (let l=0;l<comment.articleCommentList[i].articleCommentZanCaiList.length;l++){
                                            if(comment.articleCommentList[i].articleCommentZanCaiList[l].userId === $("#userId").text() + ''){
                                                zanCaiState = comment.articleCommentList[i].articleCommentZanCaiList[l].zanCai;
                                                if (zanCaiState === 'zan')
                                                    zanStr = '<i class="iconfont icon-dianzan ART_ZCbtn" data_name="zan" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                                else if (zanCaiState === 'cai')
                                                    caiStr = '<i class="iconfont icon-dianzan_active ART_ZCbtn" data_name="cai" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                            }
                                        }

                                        if(comment.articleCommentList[i].replyPerson != null){
                                            replyStr = '回复 '+ comment.articleCommentList[i].replyPerson +' :';
                                            heightStr = '131px';
                                            data_type = 'short';
                                        }else {
                                            replyStr = '';
                                            heightStr = '150px';
                                            data_type = 'normal';
                                        }
                                        str1=str1 + '<div class="ART_content" style="width: 96%">\n' +
                                                        '<span style="display:none;">'+ comment.articleCommentList[i].articleCommentId +'</span>' +
                                                        '<div class="ART_c_lbox" style="height: 200px">\n' +
                                                            '<div class="ART_user_Box">\n' +
                                                                '<div class="ART_headPhoto_Box" style="width: 7vw;height: 7vw">\n' +
                                                                    '<img src="'+ comment.articleCommentList[i].userImg +'" style="width: 100%;height: 100%">\n' +
                                                                '</div>\n' +
                                                                '<div class="ART_userName_Box" style="width: 7vw;height: 20px;font-size: 16px">'+ comment.articleCommentList[i].userRealName +'</div>\n' +
                                                            '</div>\n' +
                                                        '</div>\n' +
                                                        '<div class="ART_c_rbox">\n' +
                                                            '<div id="ART_r_toolBar'+ flag +'" class="ART_toolBar" style="display: none"></div>\n' +
                                                            replyStr +
                                                            '<div id="ART_r_textEditor'+ flag +'" class="ART_textEditor" style="height: '+ heightStr +';display: block"></div>\n' +
                                                            '<div class="ART_c_replyBox">' +
                                                                '<div id="ART_reply_ToolBar'+ flag +'" class="ART_replyToolBar"></div>\n' +
                                                                '<div id="ART_reply_Editor'+ flag +'" class="ART_replyEditor"></div>\n' +
                                                                '<span style="display: none">'+ flag +'</span>' +
                                                                '<div class="ART_replyBtn" data_type="son">回复</div>' +
                                                                '<span style="display: none">'+ comment.articleCommentId +'</span>' +
                                                            '</div>\n' +
                                                            '<div class="ART_cmt_toolBox">' +
                                                                '<span style="display: none">'+ zanCaiState +'</span>' +
                                                                '<span style="display: none">yes</span> ' +
                                                                '<div class="ART_spaceDiv" style="float: left"></div>' +
                                                                '<div class="ART_c_t_box" style="float: left;width: 30px">' +
                                                                    zanStr +
                                                                '</div>' +
                                                                '<div class="ART_c_t_box" style="float: left;width: 40px;padding: 5px 0 0 0">'+ comment.articleCommentList[i].zan +'</div>' +
                                                                '<div class="ART_c_t_box" style="float: left;width: 30px;padding: 6px 0 0 0">' +
                                                                    caiStr +
                                                                '</div>' +
                                                                '<div class="ART_c_t_box" style="float: left;width: 40px;padding: 5px 0 0 0">'+ comment.articleCommentList[i].cai +'</div>' +
                                                                '<div class="ART_c_t_box" style="float: left">' +
                                                                    '<span style="display: none">false</span>' +
                                                                    '<span class="ART_flexBtn" data_type="'+ data_type +'" style="cursor: pointer">展开/收起</span>' +
                                                                '</div>' +
                                                                /*'<div class="ART_c_t_box" style="float: left;width: 65px">' +
                                                                    '<span style="display: none">false</span>' +
                                                                    '<span class="ART_reportBtn">举报</span>' +
                                                                '</div>' +*/
                                                                '<div class="ART_c_t_box" style="float: left;width: 50px">' +
                                                                    '<span style="display: none">false</span>' +
                                                                    '<span class="replyBtn" style="cursor: pointer">回复</span>' +
                                                                '</div>' +
                                                                '<div class="ART_c_t_box" style="float: right;width: 150px;font-size: 15px;padding: 7px 0 0 0;height: 23px">'+
                                                                    comment.articleCommentList[i].dateString +
                                                                '</div>' +
                                                            '</div>\n' +
                                                        '</div>\n' +
                                                    '</div>' +
                                                    '<script>' +
                                                    'let ART_r_E = window.wangEditor;\n' +
                                                    'let ART_r_editor'+ flag +' = new ART_r_E(\'#ART_r_toolBar'+ flag +'\', \'#ART_r_textEditor'+ flag +'\');\n' +
                                                    'ART_r_editor'+ flag +'.create();\n' +
                                                    'ART_r_editor'+ flag +'.txt.html(\''+ comment.articleCommentList[i].content +'\');\n' +
                                                    'ART_r_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +

                                                    'let ART_reply_E = window.wangEditor;\n' +
                                                    'let ART_reply_editors'+ flag +' = new ART_reply_E(\'#ART_reply_ToolBar'+ flag +'\', \'#ART_reply_Editor'+ flag +'\');\n' +
                                                    'replyEditorArr.push(ART_reply_editors'+ flag +');' +
                                                    'ART_reply_editors'+ flag +'.customConfig.menus = [\n' +
                                                        '\'bold\',\n' +
                                                        '\'italic\',\n' +
                                                        '\'underline\',\n' +
                                                        '\'code\'\n' +
                                                    '];\n' +
                                                    'ART_reply_editors'+ flag +'.customConfig.showLinkImg = false;\n' +
                                                    'ART_reply_editors'+ flag +'.create();\n' +
                                                    '</script>\n';
                                        flag++;
                                    }
                                    zanCaiState = 'none';
                                    zanStr = '<i class="iconfont icon-qinziAPPtubiao-1 ART_ZCbtn" data_name="zan" style="font-size: 20px;color: rgb(121,121,121)"></i>';
                                    caiStr = '<i class="iconfont icon-qinziAPPtubiao- ART_ZCbtn" data_name="cai" style="font-size: 18px;color: rgb(121,121,121)"></i>';
                                    for (let i=0;i<comment.articleCommentZanCaiList.length;i++){
                                        if(comment.articleCommentZanCaiList[i].userId === $("#userId").text() + ''){
                                            zanCaiState = comment.articleCommentZanCaiList[i].zanCai;
                                            if (zanCaiState === 'zan')
                                                zanStr = '<i class="iconfont icon-dianzan ART_ZCbtn" data_name="zan" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                            else if (zanCaiState === 'cai')
                                                caiStr = '<i class="iconfont icon-dianzan_active ART_ZCbtn" data_name="cai" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                        }
                                    }
                                    str='<div class="ART_content">\n' +
                                            '<span style="display: none">'+ comment.articleCommentId +'</span>' +
                                            '<div class="ART_c_lbox">\n' +
                                                '<div class="ART_user_Box">\n' +
                                                    '<div class="ART_headPhoto_Box">\n' +
                                                        '<img src="'+ comment.userImg +'" style="width: 100%;height: 100%">\n' +
                                                    '</div>\n' +
                                                    '<div class="ART_userName_Box">'+ comment.userRealName +'</div>\n' +
                                                '</div>\n' +
                                            '</div>\n' +
                                            '<div class="ART_c_rbox">\n' +
                                                '<div id="ART_toolBar'+ flag +'" style="display: none"></div>\n' +
                                                '<div id="ART_textEditor'+ flag +'" class="ART_textEditor"></div>\n' +
                                                '<div class="ART_c_replyBox">' +
                                                    '<div id="ART_replyToolBar'+ flag +'" class="ART_replyToolBar"></div>\n' +
                                                    '<div id="ART_replyEditor'+ flag +'" class="ART_replyEditor"></div>\n' +
                                                    '<span style="display: none">'+ flag +'</span>' +
                                                    '<div class="ART_replyBtn">回复</div>' +
                                                    '<span style="display: none">'+ comment.articleCommentId +'</span>' +
                                                '</div>\n' +
                                                '<div class="ART_cmt_toolBox">' +
                                                    '<span style="display: none">'+ zanCaiState +'</span>' +
                                                    '<span style="display: none">yes</span>' +
                                                    '<div class="ART_spaceDiv" style="float: left"></div>' +
                                                    '<div class="ART_c_t_box" style="float: left;width: 30px">' +
                                                        zanStr +
                                                    '</div>' +
                                                    '<div class="ART_c_t_box" style="float: left;width: 60px;padding: 5px 0 0 0">'+ comment.zan +'</div>' +
                                                    '<div class="ART_c_t_box" style="float: left;width: 30px;padding: 6px 0 0 0">' +
                                                        caiStr +
                                                    '</div>' +
                                                    '<div class="ART_c_t_box" style="float: left;width: 60px;padding: 5px 0 0 0">'+ comment.cai +'</div>' +
                                                    '<div class="ART_c_t_box" style="float: left">' +
                                                        '<span style="display: none">false</span>' +
                                                        '<span class="ART_flexBtn" style="cursor: pointer">展开/收起</span>' +
                                                    '</div>' +
                                                    /*'<div class="ART_c_t_box" style="float: left;width: 65px">' +
                                                        '<span style="display: none">false</span>' +
                                                        '<span class="ART_reportBtn">举报</span>' +
                                                    '</div>' +*/
                                                    '<div class="ART_c_t_box" style="float: left;width: 50px">' +
                                                        '<span style="display: none">false</span>' +
                                                        '<span class="replyBtn" style="cursor: pointer">回复</span>' +
                                                    '</div>' +
                                                    '<div class="ART_c_t_box" style="float: right;width: 150px;font-size: 15px;padding: 7px 0 0 0;height: 23px">'+
                                                        comment.dateString +
                                                    '</div>' +
                                                '</div>\n' +
                                                '<div class="ART_reply_toolBox">' +
                                                    '<div class="ART_spaceDiv" style="float: left"></div>' +
                                                    '<div class="ART_r_t_box" style="float: left">回复：'+ comment.articleCommentList.length +'</div>' +
                                                    '<div class="ART_spaceDiv" style="float: right"></div>' +
                                                    '<span style="display: none">'+ comment.articleCommentList.length +'</span>' +
                                                    '<div class="ART_r_t_box replyFlex" style="float: right;text-align: right;cursor: pointer">收起/展开</div>' +
                                                    '<span style="display: none">false</span>' +
                                                '</div>\n' +
                                                '<div class="ART_replyBox">'+ str1 +'</div>\n' +
                                            '</div>\n' +
                                        '</div>' +
                                        '<script>' +
                                        'let ART_E = window.wangEditor;\n' +
                                        'let ART_editor'+ flag +' = new ART_E(\'#ART_toolBar'+ flag +'\', \'#ART_textEditor'+ flag +'\');\n' +
                                        'ART_editor'+ flag +'.create();\n' +
                                        'ART_editor'+ flag +'.txt.html(\''+ comment.content +'\');\n' +
                                        'ART_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +
                                        'let ART_reply_E = window.wangEditor;\n' +
                                        'let ART_reply_editor'+ flag +' = new ART_reply_E(\'#ART_replyToolBar'+ flag +'\', \'#ART_replyEditor'+ flag +'\');\n' +
                                        'replyEditorArr.push(ART_reply_editor'+ flag +')\n' +
                                        'ART_reply_editor'+ flag +'.customConfig.menus = [\n' +
                                            '\'bold\',\n' +
                                            '\'italic\',\n' +
                                            '\'underline\',\n' +
                                            '\'code\'\n' +
                                        '];\n' +
                                        'ART_reply_editor'+ flag +'.customConfig.showLinkImg = false;\n' +
                                        'ART_reply_editor'+ flag +'.create();\n' +
                                        '</script>';
                                    flag++;
                                    lis.push(str);
                                });
                                next(lis.join(''), page < result.pages);
                            }
                            /*,error : function () {
                                layer.msg('查看评论前，请先登录！');
                            }*/
                        });
                    }
                });
            }

            //文章评论选项卡 点击事件
            $("#look_artCmt").click(function () {
                replyEditorArr.length = 0;
                cmtFlowLoad(basePath+"/artComment/findArtCmt");
            });

            //举报点击事件
            /*$("#ART_contentBox").on('click','.ART_reportBtn',function () {
                let articleCommentId = parseInt($(this).parent().parent().parent().prev().prev().text());
                let type = $(this).prev().text();
                let data;
                let thisObj = $(this);
                if(type === 'false'){
                    $(this).prev().text('true');
                    data = {'articleCommentId':articleCommentId,'inform':'true'};
                    $.ajax({
                        type: "POST",
                        url: basePath+"/artComment/updateInform",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.text('已举报');
                                thisObj.css('color','rgb(102,71,238)');
                            }
                        }
                    });
                }else {
                    $(this).prev().text('false');
                    data = {'articleCommentId':articleCommentId,'inform':'false'};
                    $.ajax({
                        type: "POST",
                        url: basePath+"/artComment/updateInform",
                        dataType: "json",
                        data: data,
                        success:function (res) {
                            if (res.error === 0){
                                thisObj.text('举报');
                                thisObj.css('color','black');
                            }
                        }
                    });
                }
            });*/

            //赞踩按钮点击事件
            $("#ART_contentBox").on('click','.ART_ZCbtn',function () {
                let ZCState = $(this).parent().parent().children().eq(0).text();
                let articleCommentId = parseInt($(this).parent().parent().parent().prev().prev().text());
                let type = $(this).attr('data_name');
                let data;
                let thisObj = $(this);
                let completeState = thisObj.parent().parent().children().eq(1).text() + '';
                if (completeState === 'yes'){
                    thisObj.parent().parent().children().eq(1).text('no');
                    if (type === 'zan'){
                        if(ZCState === 'zan'){
                            data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanMinus'};
                            $.ajax({
                                type: "POST",
                                url: basePath+"/artComment/updateZC",
                                dataType: "json",
                                data: data,
                                success:function (res) {
                                    if (res.error === 0){
                                        thisObj.parent().parent().children().eq(0).text('none');
                                        thisObj.removeClass('icon-dianzan');
                                        thisObj.addClass('icon-qinziAPPtubiao-1');
                                        thisObj.css('color','rgb(121,121,121)');
                                        let num = parseInt(thisObj.parent().next().text());
                                        num --;
                                        thisObj.parent().next().text(num);
                                    }
                                    thisObj.parent().parent().children().eq(1).text('yes');
                                }
                            });
                        }else if(ZCState === 'none'){
                            data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanAdd'};
                            $.ajax({
                                type: "POST",
                                url: basePath+"/artComment/updateZC",
                                dataType: "json",
                                data: data,
                                success:function (res) {
                                    if (res.error === 0){
                                        thisObj.parent().parent().children().eq(0).text('zan');
                                        thisObj.removeClass('icon-qinziAPPtubiao-1');
                                        thisObj.addClass('icon-dianzan');
                                        thisObj.css('color','rgb(102,71,238)');
                                        let num = parseInt(thisObj.parent().next().text());
                                        num ++;
                                        thisObj.parent().next().text(num);
                                    }
                                    thisObj.parent().parent().children().eq(1).text('yes');
                                }
                            });
                        }else {
                            data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanAddCaiMinus'};
                            $.ajax({
                                type: "POST",
                                url: basePath+"/artComment/updateZC",
                                dataType: "json",
                                data: data,
                                success: function (res) {
                                    if (res.error === 0) {
                                        thisObj.parent().parent().children().eq(0).text('zan');
                                        thisObj.removeClass('icon-qinziAPPtubiao-1');
                                        thisObj.addClass('icon-dianzan');
                                        thisObj.css('color','rgb(102,71,238)');
                                        let num = parseInt(thisObj.parent().next().text());
                                        num ++;
                                        thisObj.parent().next().text(num);
                                        thisObj.parent().next().next().children().eq(0).removeClass('icon-dianzan_active');
                                        thisObj.parent().next().next().children().eq(0).addClass('icon-qinziAPPtubiao-');
                                        thisObj.parent().next().next().children().eq(0).css('font-size','18px');
                                        thisObj.parent().next().next().children().eq(0).css('color','rgb(121,121,121)');
                                        num = parseInt(thisObj.parent().next().next().next().text());
                                        num --;
                                        thisObj.parent().next().next().next().text(num);
                                    }
                                    thisObj.parent().parent().children().eq(1).text('yes');
                                }
                            });
                        }
                    }else {
                        if(ZCState === 'cai'){
                            data = {'userId':userId,'articleCommentId':articleCommentId,'type':'CaiMinus'};
                            $.ajax({
                                type: "POST",
                                url: basePath+"/artComment/updateZC",
                                dataType: "json",
                                data: data,
                                success:function (res) {
                                    if (res.error === 0){
                                        thisObj.parent().parent().children().eq(0).text('none');
                                        thisObj.removeClass('icon-dianzan_active');
                                        thisObj.addClass('icon-qinziAPPtubiao-');
                                        thisObj.css('font-size','18px');
                                        thisObj.css('color','rgb(121,121,121)');
                                        let num = parseInt(thisObj.parent().next().text());
                                        num --;
                                        thisObj.parent().next().text(num);
                                    }
                                    thisObj.parent().parent().children().eq(1).text('yes');
                                }
                            });
                        }else if (ZCState === 'none'){
                            data = {'userId':userId,'articleCommentId':articleCommentId,'type':'CaiAdd'};
                            $.ajax({
                                type: "POST",
                                url: basePath+"/artComment/updateZC",
                                dataType: "json",
                                data: data,
                                success:function (res) {
                                    if (res.error === 0){
                                        thisObj.parent().parent().children().eq(0).text('cai');
                                        thisObj.removeClass('icon-qinziAPPtubiao-');
                                        thisObj.addClass('icon-dianzan_active');
                                        thisObj.css('font-size','20px');
                                        thisObj.css('color','rgb(102,71,238)');
                                        let num = parseInt(thisObj.parent().next().text());
                                        num ++;
                                        thisObj.parent().next().text(num);
                                    }
                                    thisObj.parent().parent().children().eq(1).text('yes');
                                }
                            });
                        }else {
                            data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanMinusCaiAdd'};
                            $.ajax({
                                type: "POST",
                                url: basePath+"/artComment/updateZC",
                                dataType: "json",
                                data: data,
                                success:function (res) {
                                    if (res.error === 0){
                                        thisObj.parent().parent().children().eq(0).text('cai');
                                        thisObj.removeClass('icon-qinziAPPtubiao-');
                                        thisObj.addClass('icon-dianzan_active');
                                        thisObj.css('font-size','20px');
                                        thisObj.css('color','rgb(102,71,238)');
                                        let num = parseInt(thisObj.parent().next().text());
                                        num ++;

                                        thisObj.parent().next().text(num);
                                        thisObj.parent().prev().prev().children().eq(0).removeClass('icon-dianzan');
                                        thisObj.parent().prev().prev().children().eq(0).addClass('icon-qinziAPPtubiao-1');
                                        thisObj.parent().prev().prev().children().eq(0).css('color','rgb(121,121,121)');
                                        num = parseInt(thisObj.parent().prev().text());
                                        num --;
                                        thisObj.parent().prev().text(num);
                                    }
                                    thisObj.parent().parent().children().eq(1).text('yes');
                                }
                            });
                        }
                    }
                }
            });

            //回复富文本编辑器 回复按钮点击事件
            $("#ART_contentBox").on('click','.ART_replyBtn',function (ev) {
                let index = parseInt($(this).prev().text());
                let pid = parseInt($(this).next().text());
                let replyPerson = $(this).parent().parent().prev().children().eq(0).children().eq(1).text();
                let type = $(this).attr('data_type');
                let isEmpty = true;
                let lengthState = true;
                let contentHtml = '' + replyEditorArr[index].txt.html();
                let contentText = '' + replyEditorArr[index].txt.text();
                if (contentText === ''){
                    isEmpty = true;
                }else {
                    isEmpty = false;
                }
                let articleId = '1';
                let userId = '1';
                let data;
                if (type === 'son'){
                    data = {'articleId':articleId, 'userId':userId, 'content':contentHtml, 'pId':pid, 'replyPerson':replyPerson};
                }else {
                    data = {'articleId':articleId, 'userId':userId, 'content':contentHtml, 'pId':pid};
                }
                if(contentHtml.length>200){
                    layer.msg("内容超出最大长度限制！",{offset:''+ev.clientY});
                    lengthState = false;
                }
                if (isEmpty){
                    layer.msg("内容为空无法提交！",{offset:''+ev.clientY});
                }
                if(lengthState && !isEmpty){
                    $.ajax({
                        type : "POST",
                        url : basePath+"/artComment/replySubmit",
                        data : data,
                        success : function (res) {
                            layer.msg(res.retmsg,{offset:''+ev.clientY});
                            if (res.retmsg === '回复成功'){
                                replyEditorArr.length = 0;
                                cmtFlowLoad(basePath+"/artComment/findArtCmt");
                            }
                        }
                    });
                }
                lengthState = true;
            });

            //回复工具栏 收起/展开 按钮点击事件
            $("#ART_contentBox").on('click','.replyFlex',function () {
                let state = $(this).next().text();
                if('false' === state){
                    $(this).next().text('true');
                    let num = parseInt($(this).prev().text());
                    if(num > 0){
                        $(this).parent().next().css('display','block');
                    }
                }else {
                    $(this).next().text('false');
                    $(this).parent().next().css('display','none');
                }
            });

            //评论工具栏 回复 按钮点击事件
            $("#ART_contentBox").on('click','.replyBtn',function () {
                let state = $(this).prev().text();
                if('false' === state){
                    $(this).prev().text('true');
                    $(this).parent().parent().prev().css('display','block');
                }else {
                    $(this).prev().text('false');
                    $(this).parent().parent().prev().css('display','none');
                }
            });

            //评论工具栏 展开/收起 按钮点击事件
            $("#ART_contentBox").on('click','.ART_flexBtn',function () {
                let state = $(this).prev().text();
                let type = $(this).attr("data_type");
                if('false' === state){
                    $(this).prev().text('true');
                    let height = $(this).parent().parent().prev().prev().children().eq(0).height();
                    if(height > 220){
                        $(this).parent().parent().prev().prev().css('height','auto');
                    }
                }else {
                    $(this).prev().text('false');
                    if(type === 'normal'){
                        $(this).parent().parent().prev().prev().css('height','150px');
                    }else if (type === 'short'){
                        $(this).parent().parent().prev().prev().css('height','131px');
                    }else {
                        $(this).parent().parent().prev().prev().css('height','220px');
                    }
                }
            });

            $("#ART_contentBox").on("mouseover",".ART_content",function () {
                $(this).css("background-color",'rgb(255,255,255)');
                $(this).css('box-shadow','0 0 15px rgb(181,179,180)');
                $(this).children().eq(2).children().eq(1).css('background-color','rgb(245,245,245)');
                $(this).children().eq(2).children().eq(3).css('background-color','rgb(245,245,245)');
                $(this).children().eq(2).children().eq(4).css('background-color','rgb(245,245,245)');
            });

            $("#ART_contentBox").on("mouseout",".ART_content",function () {
                $(this).css("background-color",'rgb(245,245,245)');
                $(this).css('box-shadow','0 0 0 rgb(255,255,255)');
                $(this).children().eq(2).children().eq(1).css('background-color','rgb(255,255,255)');
                $(this).children().eq(2).children().eq(3).css('background-color','rgb(255,255,255)');
                $(this).children().eq(2).children().eq(4).css('background-color','rgb(255,255,255)');
            });
        }
    });
});