

$(function () {
    $.ajax({
        type : "POST",
        async: false,
        url :"/courseHomePage/selectCoursesByCoursesId?coursesId=1",
        data:{},
        success: function (data) {
            console.log(data.url);
            console.log(data);
            console.log(data.courses.studentNum);

            $("#renshu").text("学习人数:  "+data.courses.studentNum+"人");
            $("#zhang").text(data.courses.chapterNum+"章");
            $("#jie").text(+data.courses.sectionNum+"节");
            $("#jin").text("￥"+data.courses.price);


        },
        error: function (data) {
            alert(JSON.stringify(data));
        }
    });
});