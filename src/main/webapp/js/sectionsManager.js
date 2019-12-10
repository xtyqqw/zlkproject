window.onload = function () {

    layui.use(['table','form','layer','upload'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;
        var upload = layui.upload;

        //顶部课程下拉框选择事件
        form.on('select(course_select)', function(data){
            /*console.log(data.elem); //得到select原始DOM对象
            console.log(data.value); //得到被选中的值
            console.log(data.othis); //得到美化后的DOM对象*/

            if(data.value === ''){
                table.reload('sections_table',{
                    url : '/SMC/findAllData',
                    page: {
                        curr: 1
                    }
                });
                $("#chapterSelect").empty();
                $("#chapterSelect").append('<option value="">请选择一个章节（请先选择一个课程）</option>');
                form.render('select','chapter_select_box');
            }else {
                let ajaxData = {'courseId': data.value};
                table.reload('sections_table',{
                    url : '/SMC/findDataByCourseId',
                    where: {
                        courseId: data.value
                    },
                    page: {
                        curr: 1
                    }
                });
                $.ajax({
                    type : 'POST',
                    url : '/SMC/findCourseAndChapterById',
                    data : ajaxData,
                    dataType: "json",
                    success : function (res) {
                        $("#chapterSelect").empty();
                        $("#chapterSelect").append('<option value="">请选择一个章节</option>');
                        for(let i=0;i<res.res.chapterList.length;i++){
                            $("#chapterSelect").append('<option value="'+ res.res.chapterList[i].chapterId +'">'+ res.res.chapterList[i].chapterName +'</option>');
                        }
                        form.render('select','chapter_select_box');
                    }
                });
            }
        });

        //顶部章节下拉框选择事件
        form.on('select(chapter_select)', function(data){
            if(data.value === ''){
                if ($("#courseSelect").val() == ''){
                    table.reload('sections_table',{
                        url : '/SMC/findAllData',
                        page: {
                            curr: 1
                        }
                    });
                }else {
                    table.reload('sections_table',{
                        url : '/SMC/findDataByCourseId',
                        where: {
                            courseId: $("#courseSelect").val()
                        },
                        page: {
                            curr: 1
                        }
                    });
                }
            }else {
                table.reload('sections_table',{
                    url : '/SMC/findDataByChapterId',
                    where: {
                        chapterId: data.value
                    },
                    page: {
                        curr: 1
                    }
                });
            }
        });

        //新增弹出层课程下拉框选择事件
        form.on('select(ACB1_course_select)', function(data){

            if(data.value === ''){
                $("#ACB2_chapterSelect").empty();
                $("#ACB2_chapterSelect").append('<option value="">请选择一个章节（请先选择一个课程）</option>');
                form.render('select','ACB2_chapter_select_box');
            }else {
                let ajaxData = {'courseId': data.value};
                $.ajax({
                    type : 'POST',
                    url : '/SMC/findCourseAndChapterById',
                    data : ajaxData,
                    dataType: "json",
                    success : function (res) {
                        $("#ACB2_chapterSelect").empty();
                        $("#ACB2_chapterSelect").append('<option value="">请选择一个章节</option>');
                        for(let i=0;i<res.res.chapterList.length;i++){
                            $("#ACB2_chapterSelect").append('<option value="'+ res.res.chapterList[i].chapterId +'">'+ res.res.chapterList[i].chapterName +'</option>');
                        }
                        form.render('select','ACB2_chapter_select_box');
                    }
                });
            }

        });

        //编辑弹出层课程下拉框选择事件
        form.on('select(ECB1_course_select)', function(data){

            if(data.value === ''){
                $("#ECB2_chapterSelect").empty();
                $("#ECB2_chapterSelect").append('<option value="">请选择一个章节（请先选择一个课程）</option>');
                form.render('select','ECB2_chapter_select_box');
            }else {
                let ajaxData = {'courseId': data.value};
                $.ajax({
                    type : 'POST',
                    url : '/SMC/findCourseAndChapterById',
                    data : ajaxData,
                    dataType: "json",
                    success : function (res) {
                        $("#ECB2_chapterSelect").empty();
                        $("#ECB2_chapterSelect").append('<option value="">请选择一个章节</option>');
                        for(let i=0;i<res.res.chapterList.length;i++){
                            $("#ECB2_chapterSelect").append('<option value="'+ res.res.chapterList[i].chapterId +'">'+ res.res.chapterList[i].chapterName +'</option>');
                        }
                        form.render('select','ECB2_chapter_select_box');
                    }
                });
            }

        });


        table.render({
            elem: '#sections_table'
            ,height: 518
            ,url: '/SMC/findAllData'
            ,page: true
            ,toolbar: '#topToolBar'
            ,cols: [[
                {field: 'sectionId', title: '小节标识号', width:100}
                ,{field: 'sectionNum', title: '小节序号', width:100}
                ,{field: 'chapterId', title: '章节标识号', width:100}
                ,{field: 'courseId', title: '课程标识号', width:100}
                ,{field: 'sectionName', title: '小节名', width:100}
                ,{field: 'sectionIntro', title: '小节介绍', width: 177}
                ,{field: 'videoAddr1', title: '普清地址', width: 100}
                ,{field: 'videoAddr2', title: '超清地址', width: 100}
                ,{field: 'sectionTime', title: '小节时长', width: 100}
                ,{fixed: 'right', width:175, align:'center', toolbar: '' +
                        '<div class="layui-btn-group">\n' +
                            '<button type="button" lay-event="edit" class="layui-btn" style="height: 25px;line-height: normal">编辑</button>\n' +
                            '<button type="button" lay-event="delete" class="layui-btn" style="height: 25px;line-height: normal">删除</button>\n' +
                        '</div>'}
            ]]
        });

        var addContentBox;
        //数据表格头部工具栏监听
        table.on('toolbar(sectionsTable)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    addContentBox = layer.open({
                        type: 1,
                        area: '500px',
                        content: $('#addContentBox')
                    });
                    break;
            }
        });

        var normalVideo = upload.render({
            elem: '#normalVideo_btn' //绑定元素
            ,url: '/SMC/uploadVideo' //上传接口
            ,accept: 'video'
            ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(); //上传loading
            }
            ,done: function(res){
                layer.closeAll('loading'); //关闭loading
                $("#video_time").text(res.time);
                $("#nv_path").text(res.path);
                $("#nv_url").text(res.url);
                $("#nv_retmsg").text(res.retmsg);
            }
            ,error: function(){
                layer.closeAll('loading'); //关闭loading
            }
        });

        var normalVideoEdit = upload.render({
            elem: '#normalVideo_btn_edit' //绑定元素
            ,url: '/SMC/uploadVideo' //上传接口
            ,accept: 'video'
            ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(); //上传loading
            }
            ,done: function(res){
                layer.closeAll('loading'); //关闭loading
                $("#video_time_edit").text(res.time);
                $("#nv_path_edit").text(res.path);
                $("#nv_url_edit").text(res.url);
                $("#nv_retmsg_edit").text(res.retmsg);
            }
            ,error: function(){
                layer.closeAll('loading'); //关闭loading
            }
        });

        var superVideo = upload.render({
            elem: '#supperVideo_btn' //绑定元素
            ,url: '/SMC/uploadVideo' //上传接口
            ,accept: 'video'
            ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(); //上传loading
            }
            ,done: function(res){
                layer.closeAll('loading'); //关闭loading
                $("#video_time").text(res.time);
                $("#sv_path").text(res.path);
                $("#sv_url").text(res.url);
                $("#sv_retmsg").text(res.retmsg);
            }
            ,error: function(){
                layer.closeAll('loading'); //关闭loading
            }
        });

        var superVideoEdit = upload.render({
            elem: '#supperVideo_btn_edit' //绑定元素
            ,url: '/SMC/uploadVideo' //上传接口
            ,accept: 'video'
            ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
                layer.load(); //上传loading
            }
            ,done: function(res){
                layer.closeAll('loading'); //关闭loading
                $("#video_time_edit").text(res.time);
                $("#sv_path_edit").text(res.path);
                $("#sv_url_edit").text(res.url);
                $("#sv_retmsg_edit").text(res.retmsg);
            }
            ,error: function(){
                layer.closeAll('loading'); //关闭loading
            }
        });

        $("#sectionNum").blur(function () {
            if(/^[1-9]\d*$/.test($(this).val())){
                submitState = true;
            }else {
                submitState = false;
                layer.msg('小节序号请输入一个非零正整数');
            }
        });

        $("#sectionNumEdit").blur(function () {
            if(/^[1-9]\d*$/.test($(this).val())){
                submitState = true;
            }else {
                submitState = false;
                layer.msg('小节序号请输入一个非零正整数');
            }
        });

        //清空新增弹出层内容
        function clearAddContent(){
            $("#ACB2_chapterSelect").empty();
            $("#ACB2_chapterSelect").append('<option value="">请选择一个章节（请先选择一个课程）</option>');
            $("#ACB1_courseSelect").val('');
            form.render('select','ACB1_course_select_box');
            form.render('select','ACB2_chapter_select_box');
            $("#sectionNum").val('');
            $("#sectionName").val('');
            $("#sectionIntro").val('');
            $("#nv_retmsg").text('尚未上传');
            $("#sv_retmsg").text('尚未上传');
            $("#nv_path").text('');
            $("#nv_url").text('');
            $("#sv_path").text('');
            $("#sv_url").text('');
        }

        //重置页面
        function resetPage(){
            table.reload('sections_table',{
                url : '/SMC/findAllData',
                page: {
                    curr: 1
                }
            });
            $("#chapterSelect").empty();
            $("#chapterSelect").append('<option value="">请选择一个章节（请先选择一个课程）</option>');
            form.render('select','chapter_select_box');
            $("#courseSelect").val('');
            form.render('select','course_select_box');
        }

        let submitState = true;
        //新增弹出层提交按钮点击事件
        $("#addSubmitBtn").click(function () {
            let courseId = $("#ACB1_courseSelect").val();
            if (courseId === ''){
                layer.msg('请选择一个课程');
                return ;
            }
            let chapterId = $("#ACB2_chapterSelect").val();
            if (chapterId === ''){
                layer.msg('请选择一个章节');
                return ;
            }
            let sectionNum = $("#sectionNum").val();
            if (sectionNum === ''){
                layer.msg('请输入小节序号');
                return ;
            }
            let sectionName = $("#sectionName").val();
            if (sectionName === ''){
                layer.msg('请输入小节名');
                return ;
            }
            let sectionIntro = $("#sectionIntro").val();
            if (sectionIntro === ''){
                layer.msg('请输入小节简介');
                return ;
            }

            if (submitState){
                let data = {
                    'chapterId':parseInt(chapterId),
                    'sectionNum':parseInt(sectionNum),
                    'sectionName':sectionName,
                    'sectionIntro':sectionIntro,
                    'sectionTime':parseInt($("#video_time").text()),
                    'videoPath1':$("#nv_path").text(),
                    'videoAddr1':$("#nv_url").text(),
                    'videoPath2':$("#sv_path").text(),
                    'videoAddr2':$("#sv_url").text()
                };
                $.ajax({
                    type: 'POST',
                    url: '/SMC/addData',
                    data: data,
                    dataType: 'json',
                    success: function (res) {
                        if (res.res === 1){
                            layer.msg('提交成功');
                            layer.close(addContentBox);
                            clearAddContent();
                            resetPage();
                        }
                    }
                });

            }else{
                layer.msg('小节序号格式不正确，请输入一个非零正整数');
            }

        });

        let submitStateEdit = true;
        //编辑弹出层提交按钮点击事件
        $("#editSubmitBtn").click(function () {
            let courseId = $("#ECB1_courseSelect").val();
            if (courseId === ''){
                layer.msg('请选择一个课程');
                return ;
            }
            let chapterId = $("#ECB2_chapterSelect").val();
            if (chapterId === ''){
                layer.msg('请选择一个章节');
                return ;
            }
            let sectionNum = $("#sectionNumEdit").val();
            if (sectionNum === ''){
                layer.msg('请输入小节序号');
                return ;
            }
            let sectionName = $("#sectionNameEdit").val();
            if (sectionName === ''){
                layer.msg('请输入小节名');
                return ;
            }
            let sectionIntro = $("#sectionIntroEdit").val();
            if (sectionIntro === ''){
                layer.msg('请输入小节简介');
                return ;
            }

            if (submitStateEdit){
                let data = {
                    'sectionId':sectionId,
                    'chapterId':parseInt(chapterId),
                    'sectionNum':parseInt(sectionNum),
                    'sectionName':sectionName,
                    'sectionIntro':sectionIntro,
                    'sectionTime':parseInt($("#video_time_edit").text()),
                    'videoPath1':$("#nv_path_edit").text(),
                    'videoAddr1':$("#nv_url_edit").text(),
                    'videoPath2':$("#sv_path_edit").text(),
                    'videoAddr2':$("#sv_url_edit").text()
                };
                $.ajax({
                    type: 'POST',
                    url: '/SMC/updateData',
                    data: data,
                    dataType: 'json',
                    success: function (res) {
                        if (res.res === 1){
                            layer.msg('提交成功');
                            layer.close(editContentBox);
                            resetPage();
                        }
                    }
                });

            }else{
                layer.msg('小节序号格式不正确，请输入一个非零正整数');
            }

        });

        //编辑弹出层回填
        function editBackFill(data){
            $("#ECB1_courseSelect").val(data.courseId);
            form.render('select','ECB1_course_select_box');

            let ajaxData = {'courseId': data.courseId};
            $.ajax({
                type : 'POST',
                url : '/SMC/findCourseAndChapterById',
                data : ajaxData,
                dataType: "json",
                success : function (res) {
                    $("#ECB2_chapterSelect").empty();
                    $("#ECB2_chapterSelect").append('<option value="">请选择一个章节</option>');
                    for(let i=0;i<res.res.chapterList.length;i++){
                        $("#ECB2_chapterSelect").append('<option value="'+ res.res.chapterList[i].chapterId +'">'+ res.res.chapterList[i].chapterName +'</option>');
                    }
                    $("#ECB2_chapterSelect").val(data.chapterId);
                    form.render('select','ECB2_chapter_select_box');
                }
            });

            $("#sectionNumEdit").val(data.sectionNum);
            $("#sectionNameEdit").val(data.sectionName);
            $("#sectionIntroEdit").val(data.sectionIntro);
            $("#video_time_edit").text(data.sectionTime);

            if(data.videoAddr1 !== '' && data.videoAddr1 !== null){
                $("#nv_retmsg_edit").text('已上传');
                $("#nv_url_edit").text(data.videoAddr1);
            }
            if(data.videoAddr2 !== '' && data.videoAddr2 !== null){
                $("#sv_retmsg_edit").text('已上传');
                $("#sv_url_edit").text(data.videoAddr2);
            }
        }

        var sectionId;
        var editContentBox;
        //监听行工具栏
        table.on('tool(sectionsTable)', function(obj){
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent === 'edit'){
                sectionId = parseInt(data.sectionId);
                editBackFill(data);
                editContentBox = layer.open({
                    type: 1,
                    area: '500px',
                    content: $('#editContentBox')
                });
            } else { //删除
                layer.confirm('真的删除行么', function (index) {
                    /*obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令*/

                    let sectionId = data.sectionId;
                    $.ajax({
                        type:'POST',
                        url : '/SMC/deleteData',
                        data : {'sectionId':sectionId},
                        dataType: "json",
                        success: function (res) {
                            if (res.res === 1){
                                layer.msg('删除成功');
                                resetPage();
                            }
                        }
                    });
                });
            }
        });

    });

};