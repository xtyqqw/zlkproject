$(document).ready(function () {

    {
        $("#stuCmt_btn1").click(function () {
            let isEmpty = true;
            let lengthState = true;
            let contentHtml = '' + artCmt_editor.txt.html();
            let contentText = '' + artCmt_editor.txt.text();
            if (contentText === ''){
                isEmpty = true;
            }else {
                isEmpty = false;
            }
            let arrP = $("#div_stuCmt_text").children().eq(0).children();
            for (let i=0;i<arrP.length;i++){
                if (arrP.eq(i).children("img").length > 0){
                    isEmpty = false;
                }
            }
            //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            let articleId = 1;
            //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            let userId = 1;
            let data = {'articleId':articleId, 'userId':userId, 'content':contentHtml};
            if(contentHtml.length>512){
                alert("内容超出最大长度限制！");
                lengthState = false;
            }
            if (isEmpty){
                alert("内容为空无法提交！");
            }
            if(lengthState && !isEmpty){
                $.ajax({
                    type : "POST",
                    url : "/artComment/submit",
                    data : data,
                    success : function (res) {
                        alert(res.retmsg);
                        if (res.retmsg === '评论成功'){
                            artCmt_editor.txt.clear();
                        }
                    }
                });
            }
            lengthState = true;
        });

        let artCmt = window.wangEditor;
        let artCmt_editor = new artCmt('#div_stuCmt_toolBar', '#div_stuCmt_text');
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
        //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        let userId = '1';
        //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        let articleId =1;

        function cmtFlowLoad(url) {
            $("#ACS_ul_stream").empty();
            flow.load({
                elem: '#ACS_ul_stream',//流加载容器
                isAuto: false,
                done: function (page, next) { //加载下一页
                    let lis = [];
                    let size = 3;
                    let flag = 0;
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
                                    zanStr = '<i class="iconfont icon-qinziAPPtubiao-1 SCS_UDbtn" data_name="zan" style="font-size: 20px;color: rgb(121,121,121)"></i>';
                                    caiStr = '<i class="iconfont icon-qinziAPPtubiao- SCS_UDbtn" data_name="cai" style="font-size: 18px;color: rgb(121,121,121)"></i>';
                                    for (let l=0;l<comment.articleCommentList[i].articleCommentZanCaiList.length;l++){
                                        if(comment.articleCommentList[i].articleCommentZanCaiList[l].userId === userId){
                                            zanCaiState = comment.articleCommentList[i].articleCommentZanCaiList[l].zanCai;
                                            if (zanCaiState === 'zan')
                                                zanStr = '<i class="iconfont icon-dianzan SCS_UDbtn" data_name="zan" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                            else if (zanCaiState === 'cai')
                                                caiStr = '<i class="iconfont icon-dianzan_active SCS_UDbtn" data_name="cai" style="font-size: 20px;color: rgb(102,71,238);"></i>';
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
                                    str1=str1 + '<div class="SCS_content" style="width: 96%">\n' +
                                                    '<span style="display:none;">'+ comment.articleCommentList[i].articleCommentId +'</span>' +
                                                    '<div class="SCS_c_lbox" style="height: 200px">\n' +
                                                        '<div class="SCS_userBox">\n' +
                                                            '<div class="SCS_headPhoto_box" style="width: 7vw;height: 7vw">\n' +
                                                                '<img src="'+ comment.articleCommentList[i].userImg +'" style="width: 100%;height: 100%">\n' +
                                                            '</div>\n' +
                                                            '<div class="SCS_userName_box" style="width: 7vw;height: 20px;font-size: 16px">'+ comment.articleCommentList[i].userRealName +'</div>\n' +
                                                        '</div>\n' +
                                                    '</div>\n' +
                                                    '<div class="SCS_c_rbox">\n' +
                                                        '<div id="SCS_r_toolBar'+ flag +'" class="SCS_toolBar" style="display: none"></div>\n' +
                                                        replyStr +
                                                        '<div id="SCS_r_textEditor'+ flag +'" class="SCS_textEditor" style="height: '+ heightStr +';display: block"></div>\n' +
                                                        '<div class="SCS_c_replyBox">' +
                                                            '<div id="SCS_reply_ToolBar'+ flag +'" class="SCS_replyToolBar"></div>\n' +
                                                            '<div id="SCS_reply_Editor'+ flag +'" class="SCS_replyEditor"></div>\n' +
                                                            '<span style="display: none">'+ flag +'</span>' +
                                                            '<div class="SCS_replyBtn" data_type="son" style="left: 476px">回复</div>' +
                                                            '<span style="display: none">'+ comment.articleCommentId +'</span>' +
                                                        '</div>\n' +
                                                        '<div class="SCS_cmt_toolBox">' +
                                                            '<span style="display: none">'+ zanCaiState +'</span>' +
                                                            '<div class="SCS_spaceDiv" style="float: left"></div>' +
                                                            '<div class="SCS_c_t_box" style="float: left;width: 30px">' +
                                                                zanStr +
                                                            '</div>' +
                                                            '<div class="SCS_c_t_box" style="float: left;width: 40px;padding: 5px 0 0 0">'+ comment.articleCommentList[i].zan +'</div>' +
                                                            '<div class="SCS_c_t_box" style="float: left;width: 30px;padding: 6px 0 0 0">' +
                                                                caiStr +
                                                            '</div>' +
                                                            '<div class="SCS_c_t_box" style="float: left;width: 40px;padding: 5px 0 0 0">'+ comment.articleCommentList[i].cai +'</div>' +
                                                            '<div class="SCS_c_t_box" style="float: left">' +
                                                                '<span style="display: none">false</span>' +
                                                                '<span class="SCS_flexBtn" data_type="'+ data_type +'" style="cursor: pointer">展开/收起</span>' +
                                                            '</div>' +
                                                            '<div class="SCS_c_t_box" style="float: left;width: 65px">' +
                                                                '<span style="display: none">false</span>' +
                                                                '<span class="SCS_reportBtn">举报</span>' +
                                                            '</div>' +
                                                            '<div class="SCS_c_t_box" style="float: left;width: 50px">' +
                                                                '<span style="display: none">false</span>' +
                                                                '<span class="replyBtn" style="cursor: pointer">回复</span>' +
                                                            '</div>' +
                                                            '<div class="SCS_c_t_box" style="float: right;width: 150px;font-size: 15px;padding: 7px 0 0 0;height: 23px">'+
                                                                comment.articleCommentList[i].dateString +
                                                            '</div>' +
                                                        '</div>\n' +
                                                    '</div>\n' +
                                                '</div>' +
                                                '<script>' +
                                                'let SCS_r_E = window.wangEditor;\n' +
                                                'let SCS_r_editor'+ flag +' = new SCS_r_E(\'#SCS_r_tooBar'+ flag +'\', \'#SCS_r_textEditor'+ flag +'\');\n' +
                                                'SCS_r_editor'+ flag +'.create();\n' +
                                                'SCS_r_editor'+ flag +'.txt.html(\''+ comment.articleCommentList[i].content +'\');\n' +
                                                'SCS_r_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +
                                                'let SCS_reply_E = window.wangEditor;\n' +
                                                'let SCS_reply_editors'+ flag +' = new SCS_reply_E(\'#SCS_reply_ToolBar'+ flag +'\', \'#SCS_reply_Editor'+ flag +'\');\n' +
                                                'replyEditorArr.push(SCS_reply_editors'+ flag +');' +
                                                'SCS_reply_editors'+ flag +'.customConfig.menus = [\n' +
                                                    '\'bold\',\n' +
                                                    '\'italic\',\n' +
                                                    '\'underline\',\n' +
                                                    '\'code\'\n' +
                                                '];\n' +
                                                'SCS_reply_editors'+ flag +'.customConfig.showLinkImg = false;\n' +
                                                'SCS_reply_editors'+ flag +'.create();\n' +
                                                '</script>\n';
                                    flag++;
                                }
                                zanCaiState = 'none';
                                zanStr = '<i class="iconfont icon-qinziAPPtubiao-1 SCS_UDbtn" data_name="zan" style="font-size: 20px;color: rgb(121,121,121)"></i>';
                                caiStr = '<i class="iconfont icon-qinziAPPtubiao- SCS_UDbtn" data_name="cai" style="font-size: 18px;color: rgb(121,121,121)"></i>';
                                for (let i=0;i<comment.articleCommentZanCaiList.length;i++){
                                    if(comment.articleCommentZanCaiList[i].userId === userId){
                                        zanCaiState = comment.articleCommentZanCaiList[i].zanCai;
                                        if (zanCaiState === 'zan')
                                            zanStr = '<i class="iconfont icon-dianzan SCS_UDbtn" data_name="zan" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                        else if (zanCaiState === 'cai')
                                            caiStr = '<i class="iconfont icon-dianzan_active SCS_UDbtn" data_name="cai" style="font-size: 20px;color: rgb(102,71,238);"></i>';
                                    }
                                }
                                str='<div class="SCS_content">\n' +
                                        '<span style="display: none">'+ comment.articleCommentId +'</span>' +
                                        '<div class="SCS_c_lbox">\n' +
                                            '<div class="SCS_userBox">\n' +
                                                '<div class="SCS_headPhoto_box">\n' +
                                                    '<img src="'+ comment.userImg +'" style="width: 100%;height: 100%">\n' +
                                                '</div>\n' +
                                                '<div class="SCS_userName_box">'+ comment.userRealName +'</div>\n' +
                                            '</div>\n' +
                                        '</div>\n' +
                                        '<div class="SCS_c_rbox">\n' +
                                            '<div id="SCS_toolBar'+ flag +'" style="display: none"></div>\n' +
                                            '<div id="SCS_textEditor'+ flag +'" class="SCS_textEditor"></div>\n' +
                                            '<div class="SCS_c_replyBox">' +
                                                '<div id="SCS_replyToolBar'+ flag +'" class="SCS_replyToolBar"></div>\n' +
                                                '<div id="SCS_replyEditor'+ flag +'" class="SCS_replyEditor"></div>\n' +
                                                '<span style="display: none">'+ flag +'</span>' +
                                                '<div class="SCS_replyBtn">回复</div>' +
                                                '<span style="display: none">'+ comment.articleCommentId +'</span>' +
                                            '</div>\n' +
                                            '<div class="SCS_cmt_toolBox">' +
                                                '<span style="display: none">'+ zanCaiState +'</span>' +
                                                '<div class="SCS_spaceDiv" style="float: left"></div>' +
                                                '<div class="SCS_c_t_box" style="float: left;width: 30px">' +
                                                    zanStr +
                                                '</div>' +
                                                '<div class="SCS_c_t_box" style="float: left;width: 60px;padding: 5px 0 0 0">'+ comment.zan +'</div>' +
                                                '<div class="SCS_c_t_box" style="float: left;width: 30px;padding: 6px 0 0 0">' +
                                                    caiStr +
                                                '</div>' +
                                                '<div class="SCS_c_t_box" style="float: left;width: 60px;padding: 5px 0 0 0">'+ comment.cai +'</div>' +
                                                '<div class="SCS_c_t_box" style="float: left">' +
                                                    '<span style="display: none">false</span>' +
                                                    '<span class="SCS_flexBtn" style="cursor: pointer">展开/收起</span>' +
                                                '</div>' +
                                                '<div class="SCS_c_t_box" style="float: left;width: 65px">' +
                                                    '<span style="display: none">false</span>' +
                                                    '<span class="SCS_reportBtn">举报</span>' +
                                                '</div>' +
                                                '<div class="SCS_c_t_box" style="float: left;width: 50px">' +
                                                    '<span style="display: none">false</span>' +
                                                    '<span class="replyBtn" style="cursor: pointer">回复</span>' +
                                                '</div>' +
                                                '<div class="SCS_c_t_box" style="float: right;width: 150px;font-size: 15px;padding: 7px 0 0 0;height: 23px">'+
                                                    comment.dateString +
                                                '</div>' +
                                            '</div>\n' +
                                            '<div class="SCS_reply_toolBox">' +
                                                '<div class="SCS_spaceDiv" style="float: left"></div>' +
                                                '<div class="SCS_r_t_box" style="float: left">回复：'+ comment.articleCommentList.length +'</div>' +
                                                '<div class="SCS_spaceDiv" style="float: right"></div>' +
                                                '<span style="display: none">'+ comment.articleCommentList.length +'</span>' +
                                                '<div class="SCS_r_t_box replyFlex" style="float: right;text-align: right;cursor: pointer">收起/展开</div>' +
                                                '<span style="display: none">false</span>' +
                                            '</div>\n' +
                                            '<div class="SCS_replyBox">'+ str1 +'</div>\n' +
                                        '</div>\n' +
                                    '</div>' +
                                    '<script>' +
                                    'let SCS_E = window.wangEditor;\n' +
                                    'let SCS_editor'+ flag +' = new SCS_E(\'#SCS_tooBar'+ flag +'\', \'#SCS_textEditor'+ flag +'\');\n' +
                                    'SCS_editor'+ flag +'.create();\n' +
                                    'SCS_editor'+ flag +'.txt.html(\''+ comment.content +'\');\n' +
                                    'SCS_editor'+ flag +'.$textElem.attr(\'contenteditable\', false);\n' +
                                    'let SCS_reply_E = window.wangEditor;\n' +
                                    'let SCS_reply_editor'+ flag +' = new SCS_reply_E(\'#SCS_replyToolBar'+ flag +'\', \'#SCS_replyEditor'+ flag +'\');\n' +
                                    'replyEditorArr.push(SCS_reply_editor'+ flag +')\n' +
                                    'SCS_reply_editor'+ flag +'.customConfig.menus = [\n' +
                                        '\'bold\',\n' +
                                        '\'italic\',\n' +
                                        '\'underline\',\n' +
                                        '\'code\'\n' +
                                    '];\n' +
                                    'SCS_reply_editor'+ flag +'.customConfig.showLinkImg = false;\n' +
                                    'SCS_reply_editor'+ flag +'.create();\n' +
                                    '</script>';
                                flag++;
                                lis.push(str);
                            });
                            next(lis.join(''), page < result.pages);
                        }
                    });
                }
            });
        }

        //文章评论选项卡 点击事件
        $("#selection_stuCmt").click(function () {
            replyEditorArr.length = 0;
            cmtFlowLoad("/artComment/findArtCmt");
        });

        //举报点击事件
        $("#SCS_contentBox").on('click','.SCS_reportBtn',function () {
            let articleCommentId = parseInt($(this).parent().parent().parent().prev().prev().text());
            let type = $(this).prev().text();
            let data;
            let thisObj = $(this);
            if(type === 'false'){
                $(this).prev().text('true');
                data = {'articleCommentId':articleCommentId,'inform':'true'};
                $.ajax({
                    type: "POST",
                    url: "/artComment/updateInform",
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
                    url: "/artComment/updateInform",
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
        });

        //赞踩按钮点击事件
        $("#SCS_contentBox").on('click','.SCS_UDbtn',function () {
            let ZCState = $(this).parent().parent().children().eq(0).text();
            let articleCommentId = parseInt($(this).parent().parent().parent().prev().prev().text());
            let type = $(this).attr('data_name');
            let data;
            let thisObj = $(this);
            if (type === 'zan'){
                if(ZCState === 'zan'){
                    data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanMinus'};
                    $.ajax({
                        type: "POST",
                        url: "/artComment/updateZC",
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
                        }
                    });
                }else if(ZCState === 'none'){
                    data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanAdd'};
                    $.ajax({
                        type: "POST",
                        url: "/artComment/updateZC",
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
                        }
                    });
                }else {
                    data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanAddCaiMinus'};
                    $.ajax({
                        type: "POST",
                        url: "/artComment/updateZC",
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
                        }
                    });
                }
            }else {
                if(ZCState === 'cai'){
                    data = {'userId':userId,'articleCommentId':articleCommentId,'type':'CaiMinus'};
                    $.ajax({
                        type: "POST",
                        url: "/artComment/updateZC",
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
                        }
                    });
                }else if (ZCState === 'none'){
                    data = {'userId':userId,'articleCommentId':articleCommentId,'type':'CaiAdd'};
                    $.ajax({
                        type: "POST",
                        url: "/artComment/updateZC",
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
                        }
                    });
                }else {
                    data = {'userId':userId,'articleCommentId':articleCommentId,'type':'ZanMinusCaiAdd'};
                    $.ajax({
                        type: "POST",
                        url: "/artComment/updateZC",
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
                        }
                    });
                }
            }
        });

        //回复富文本编辑器 回复按钮点击事件
        $("#SCS_contentBox").on('click','.SCS_replyBtn',function () {
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
            let arrP = $(this).prev().prev().children().eq(0).children();
            for (let i=0;i<arrP.length;i++){
                if (arrP.eq(i).children("img").length > 0){
                    isEmpty = false;
                }
            }
            //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            let articleId = 1;
            //需接入++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            let userId = 1;
            let data;
            if (type === 'son'){
                data = {'articleId':articleId, 'userId':userId, 'content':contentHtml, 'pId':pid, 'replyPerson':replyPerson};
            }else {
                data = {'articleId':articleId, 'userId':userId, 'content':contentHtml, 'pId':pid};
            }

            if(contentHtml.length>1024){
                alert("内容超出最大长度限制！");
                lengthState = false;
            }
            if (isEmpty){
                alert("内容为空无法提交！");
            }
            if(lengthState && !isEmpty){
                $.ajax({
                    type : "POST",
                    url : "/artComment/replySubmit",
                    data : data,
                    success : function (res) {
                        alert(res.retmsg);
                        if (res.retmsg === '回复成功'){
                            replyEditorArr.length = 0;
                            cmtFlowLoad("/artComment/findArtCmt");
                        }
                    }
                });
            }
            lengthState = true;
        });

        //回复工具栏 收起/展开 按钮点击事件
        $("#SCS_contentBox").on('click','.replyFlex',function () {
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
        $("#SCS_contentBox").on('click','.replyBtn',function () {
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
        $("#SCS_contentBox").on('click','.SCS_flexBtn',function () {
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

        $("#SCS_contentBox").on("mouseover",".SCS_content",function () {
            $(this).css("background-color",'rgb(255,255,255)');
            $(this).css('box-shadow','0 0 15px rgb(181,179,180)');
            $(this).children().eq(2).children().eq(1).css('background-color','rgb(245,245,245)');
            $(this).children().eq(2).children().eq(3).css('background-color','rgb(245,245,245)');
            $(this).children().eq(2).children().eq(4).css('background-color','rgb(245,245,245)');
        });

        $("#SCS_contentBox").on("mouseout",".SCS_content",function () {
            $(this).css("background-color",'rgb(245,245,245)');
            $(this).css('box-shadow','0 0 0 rgb(255,255,255)');
            $(this).children().eq(2).children().eq(1).css('background-color','rgb(255,255,255)');
            $(this).children().eq(2).children().eq(3).css('background-color','rgb(255,255,255)');
            $(this).children().eq(2).children().eq(4).css('background-color','rgb(255,255,255)');
        });
    }
});