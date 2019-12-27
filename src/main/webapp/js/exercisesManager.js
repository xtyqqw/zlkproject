window.onload = function () {

    var localObj = window.location;
    var basePath = localObj.protocol+"//"+localObj.host;

    layui.use(['table','form','layer','upload'], function(){
        var table = layui.table;
        var form = layui.form;
        var layer = layui.layer;

        table.render({
            elem: '#exercises'
            ,height:$(document).height()-$('#exercises').offset().top-20
            ,url:basePath+'/exercisesManager/selectAll'
            ,method:'POST'
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                {field:'eid', width:100, title: '习题ID',sort: true}
                ,{field:'sectionId', width:100, title: '小节ID', sort: true}
                ,{field:'type', width:100, title: '题型'}
                ,{field:'exerciseNum', width:100, title: '练习题序号'}
                ,{field:'title', width:100, title: '题目内容'}
                ,{field:'answerA', width:100, title: '备选答案A'}
                ,{field:'answerB', width:100, title: '备选答案B'}
                ,{field:'answerC', width:100, title: '备选答案C'}
                ,{field:'answerD', width:100, title: '备选答案D'}
                ,{field:'truth', width:100, title: '正确答案'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(exercises)', function(obj){
            var event = obj.event;
            if (event==="insert"){
                $("#sectionDiv").empty();
                $("#sectionDiv").append('<label class="layui-form-label">小节名称:</label>\n' +
                    '                    <div class="layui-input-block layui-form" lay-filter="sectionNameInsertDiv">\n' +
                    '                        <select class="layui-select" name="sectionId" id="sectionNameInsertSelect" lay-filter="sectionNameSelect" lay-search>\n' +
                    '                            <option value="">请选择一个小节(请先选择一个章节)</option>\n' +
                    '\n' +
                    '                        </select>\n' +
                    '                    </div>');

                form.render('select');
                layer.open({
                    title: "新增",
                    type: 1,
                    area: ['80%', '80%'],
                    content: $("#insertExercisesDiv"),
                    btn:['提交'],
                    success:function(index,layero){
                        form.on('submit(submit)',function (data) {
                            $.ajax({
                                type: "POST",
                                url: basePath+"/exercisesManager/insertExercises",
                                data: data.field,
                                dataType:"json",
                                success:function (result) {
                                    layer.msg(result.msg);
                                    table.reload('exercises', {
                                        url: basePath+'/exercisesManager/selectAll'
                                        , height:$(document).height()-$('#exercises').offset().top-20
                                        , method:"POST"
                                        , page:{
                                            curr:1
                                        }
                                        , toolbar: '#toolbarDemo'
                                    });
                                }
                            })
                        })
                    },
                    yes:function (index, layero) {
                        layero.find('form').find('button[lay-submit]').click();
                    },
                    end:function () {
                        clear();
                    }
                });
            }
        });

        //监听行工具事件
        table.on('tool(exercises)', function(obj){
            var data = obj.data;
            // console.log(obj);
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        type : "POST",
                        async: false,
                        url : basePath+"/exercisesManager/deleteExercises",
                        data: {"eId":data.eid},
                        success: function (result) {
                            layer.msg(result.msg);
                            table.reload('exercises', {
                                url: basePath+'/exercisesManager/selectAll'
                                , height:$(document).height()-$('#exercises').offset().top-20
                                , method:"POST"
                                , page:{
                                    curr:1
                                }
                                , toolbar: '#toolbarDemo'
                            });
                        }
                    });
                });
            } else if(obj.event === 'edit') {
                $("#eId").val(data.eid);
                // $("#coursesNameInsertSelect").val(data.coursesId);
                // form.render('select');
                // $("#chapterName").val(data.chapterName);
                $.ajax({
                    type:"POST",
                    url: basePath+"/exercisesManager/findAllIdBySectionId",
                    data:{"sectionId":data.sectionId},
                    dataType:"json",
                    success:function (res) {
                        $("#sectionNameInsertSelect").empty();
                        $("#sectionNameInsertSelect").append('<option value="">请选择小节名称</option>');
                        $.each(res.sectionList,function (i, section) {
                            $("#sectionNameInsertSelect").append('<option value="'+section.sectionId+'">'+section.sectionName+'</option>');
                        });
                        $("#sectionNameInsertSelect").val(data.sectionId);
                        $("#sectionNameInsertSelect").attr("disabled","disabled");
                        form.render('select','sectionNameInsertDiv');
                    }
                });
                $("#type").val(data.type);
                form.render('select');
                $.ajax({
                    type:"POST",
                    url:basePath+"/exercisesManager/selectExerciseNumBySectionId",
                    data:{"eId":data.eid},
                    data:{"sectionId":data.sectionId},
                    dataType:"json",
                    success:function (res) {
                        $("#exerciseNumSelect").empty();
                        $("#exerciseNumSelect").append(
                            '<input type="text" name="exerciseNum" id="exerciseNum" class="layui-input" disabled="true">'
                        );


                        /*$("#exerciseNumSelect").append('<option value="'+res.count1+'">'+res.count1+'</option>');*/
                        /*$.each(res.exerciseNumList,function (i, exerciseNum) {
                            $("#exerciseNumSelect").append('<option value="'+exerciseNum+'">'+exerciseNum+'</option>');
                        });*/
                        $("#exerciseNumSelect").val(data.exercisesNum);
                        form.render('select','exerciseNumDiv');
                    }
                });
                $("#chapterLastNum").val(data.chapterNum);
                $("#exerciseNum").val(data.exerciseNum)
                $("#title").val(data.title);
                $("#answerA").val(data.answerA);
                $("#answerB").val(data.answerB);
                $("#answerC").val(data.answerC);
                $("#answerD").val(data.answerD);
                $("#truth").val(data.truth);
                layer.open({
                    title: "编辑",
                    type: 1,
                    area: ['80%', '80%'],
                    content: $("#insertExercisesDiv"),
                    btn: ['提交'],
                    success: function (index, layero) {
                        $("#coursesDiv").css("display","none");
                        $("#chapterDiv").css("display","none");
                        form.on('submit(submit)', function (data) {
                            $("#sectionNameInsertSelect").removeAttr("disabled","disabled");
                            $.ajax({
                                type: "POST",
                                async: false,
                                url: basePath+"/exercisesManager/updateExercises",
                                data: data.field,
                                dataType: "json",
                                success: function (result) {
                                    layer.msg(result.msg);
                                    table.reload('exercises', {
                                        url: basePath+'/exercisesManager/selectAll'
                                        , height:$(document).height()-$('#exercises').offset().top-20
                                        , method:"POST"
                                        , page:{
                                            curr:1
                                        }
                                        , toolbar: '#toolbarDemo'
                                    });
                                }
                            })
                        })
                    },
                    yes: function (index, layero) {
                        layero.find('form').find('button[lay-submit]').click();
                    },
                    end: function () {
                        clear();
                    }
                });
            }
        });

        //页面课程下拉框监听事件
        form.on('select(coursesName)', function (data) {
            let coursesId = data.value;
            if (coursesId === ''){
                $("#chapterNameSelect").empty();
                $("#chapterNameSelect").append('<option value="">请选择一个章节(请先选择一个课程)</option>');
                form.render('select','chapterNameDiv');
                $("#sectionNameSelect").empty();
                $("#sectionNameSelect").append('<option value="">请选择一个小节(请先选择一个章节)</option>');
                form.render('select','sectionNameDiv');
            }else {
                $.ajax({
                    type:"POST",
                    url: basePath+"/exercisesManager/selectChapterByCoursesId",
                    data:{"coursesId":coursesId},
                    dataType:"json",
                    success:function (res) {
                        $("#chapterNameSelect").empty();
                        $("#chapterNameSelect").append('<option value="">请选择一个章节(请先选择一个课程)</option>');
                        $.each(res.chapterList,function (i, chapter) {
                            $("#chapterNameSelect").append('<option value="'+chapter.chapterId+'">'+chapter.chapterName+'</option>');
                        });
                        form.render('select','chapterNameDiv');
                    }
                });
            }
            table.reload('exercises', {
                url: basePath+'/exercisesManager/selectByCoursesId'
                , height:$(document).height()-$('#exercises').offset().top-20
                , method: "POST"
                , where:{
                    coursesId:coursesId
                }
                , page: {
                    curr: 1
                }
                , toolbar: '#toolbarDemo'
            });
        });

        //页面章节下拉框监听事件
        form.on('select(chapterName)', function (data) {
            let chapterId = data.value;
            if (chapterId === ''){
                $("#sectionNameSelect").empty();
                $("#sectionNameSelect").append('<option value="">请选择一个小节(请先选择一个章节)</option>');
                form.render('select','sectionNameDiv');
            }else {
                $.ajax({
                    type:"POST",
                    url: basePath+"/exercisesManager/findSectionByChapterId",
                    data:{"chapterId":chapterId},
                    dataType:"json",
                    success:function (res) {
                        $("#sectionNameSelect").empty();
                        $("#sectionNameSelect").append('<option value="">请选择一个小节(请先选择一个章节)</option>');
                        $.each(res.sectionList,function (i, section) {
                            $("#sectionNameSelect").append('<option value="'+section.sectionId+'">'+section.sectionName+'</option>');
                        });
                        form.render('select','sectionNameDiv');
                    }
                });
            }
            table.reload('exercises', {
                url: basePath+'/exercisesManager/selectByChapterId'
                , height:$(document).height()-$('#exercises').offset().top-20
                , method: "POST"
                , where:{
                    chapterId:chapterId
                }
                , page: {
                    curr: 1
                }
                , toolbar: '#toolbarDemo'
            });
        });

        //页面小节下拉框监听事件
        form.on('select(sectionName)', function (data) {
            let sectionId = data.value;
            table.reload('exercises', {
                url: basePath+'/exercisesManager/selectBySectionId'
                , height:$(document).height()-$('#exercises').offset().top-20
                , method: "POST"
                , where:{
                    sectionId:sectionId
                }
                , page: {
                    curr: 1
                }
                , toolbar: '#toolbarDemo'
            });
        });

        //弹窗课程下拉框监听事件
        form.on('select(coursesNameSelect)', function (data) {
            let coursesId = data.value;
            if (coursesId === ''){
                $("#chapterNameInsertSelect").empty();
                $("#chapterNameInsertSelect").append('<option value="">请选择一个章节(请先选择一个课程)</option>');
                form.render('select','chapterNameInsertDiv');
            }else {
                $.ajax({
                    type:"POST",
                    url: basePath+"/exercisesManager/selectChapterByCoursesId",
                    data:{"coursesId":coursesId},
                    dataType:"json",
                    success:function (res) {
                        $("#chapterNameInsertSelect").empty();
                        $("#chapterNameInsertSelect").append('<option value="">请选择一个章节(请先选择一个课程)</option>');
                        $.each(res.chapterList,function (i, chapter) {
                            $("#chapterNameInsertSelect").append('<option value="'+chapter.chapterId+'">'+chapter.chapterName+'</option>');
                        });
                        form.render('select','chapterNameInsertDiv');
                    }
                });
            }
        });

        //弹窗章节下拉框监听事件
        form.on('select(chapterNameSelect)', function (data) {
            let chapterId = data.value;
            if (chapterId === ''){
                $("#sectionNameInsertSelect").empty();
                $("#sectionNameInsertSelect").append('<option value="">请选择一个小节(请先选择一个章节)</option>');
                form.render('select','sectionNameInsertDiv');
            }else {
                $.ajax({
                    type:"POST",
                    url: basePath+"/exercisesManager/findSectionByChapterId",
                    data:{"chapterId":chapterId},
                    dataType:"json",
                    success:function (res) {
                        $("#sectionNameInsertSelect").empty();
                        $("#sectionNameInsertSelect").append('<option value="">请选择一个小节(请先选择一个章节)</option>');
                        $.each(res.sectionList,function (i, section) {
                            $("#sectionNameInsertSelect").append('<option value="'+section.sectionId+'">'+section.sectionName+'</option>');
                        });
                        form.render('select','sectionNameInsertDiv');
                    }
                });
            }
        });

        //弹窗小节下拉框监听事件
        form.on('select(sectionNameSelect)', function (data) {
            let sectionId = data.value;
            if (sectionId === ''){
                $("#exerciseNumSelect").empty();
                $("#exerciseNumSelect").append('<option value="">请选择习题序号(请先选择一个章节)</option>');
                form.render('select','sectionNameInsertDiv');
            }else {
                $.ajax({
                    type:"POST",
                    url: basePath+"/exercisesManager/",
                    data:{"sectionId":sectionId},
                    dataType:"json",
                    success:function (res) {
                        $("#sectionNameInsertSelect").empty();
                        $("#sectionNameInsertSelect").append('<option value="">请选择一个小节(请先选择一个章节)</option>');
                        $.each(res.sectionList,function (i, section) {
                            $("#sectionNameInsertSelect").append('<option value="'+section.sectionId+'">'+section.sectionName+'</option>');
                        });
                        form.render('select','sectionNameInsertDiv');
                    }
                });
            }
        });

        //清空表单数据
        function clear() {
            $("#eId").val("");
            $("#sectionNameInsertSelect").val("");
            $("#type").val("");
            form.render('select');
            $("#title").val("");
            $("#answerA").val("");
            $("#answerB").val("");
            $("#answerC").val("");
            $("#answerD").val("");
            $("#truth").val("");
            $("#coursesDiv").css("display","block");
            $("#chapterDiv").css("display","block");
            form.render();
        }

    });

};