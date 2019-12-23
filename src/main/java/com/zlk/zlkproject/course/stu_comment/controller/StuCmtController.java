package com.zlk.zlkproject.course.stu_comment.controller;

/**
 * @ClassName StuCmtController
 * @Description:
 * @Author LuanKe
 * Date 2019/12/23 11:25
 **/


import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.course.sections_manager.service.SectionsManagerService;
import com.zlk.zlkproject.course.stu_comment.service.StuCommentService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.StuComment;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.until.LeaveTime;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stuCmt")
public class StuCmtController {
    @Autowired
    private LogUtil logUtil;
    @Autowired
    private StuCommentService stuCommentService;
    @Autowired
    private SectionsManagerService sectionsManagerService;



    @RequestMapping(value="/findAllFromStuComment")
    @ResponseBody
    public Map<String, Object> findAllFromStuComment(Pagination pagination)throws Exception{
        List<StuComment> list = stuCommentService.findAllFromStuComment(pagination);
        Integer count = stuCommentService.findStuCommentCount(pagination);

        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    @RequestMapping("updateTeacherAnswer")
    @ResponseBody
    public Map updateTeacherAnswer(@RequestParam("smId") Integer smId,@RequestParam("teacherAnswer") String teacherAnswer,HttpServletRequest request){
        Map map = new HashMap();
        Integer res = stuCommentService.updateTeacherAnswer(smId,teacherAnswer);
        Integer error = 1;
        if (res == 1)
            error = 0;
        logUtil.setLog(request,"修改了讲师回复："+teacherAnswer+"的信息");
        map.put("error",error);
        map.put("res",res);
        return map;
    }
    @RequestMapping("deleteStudentComment")
    @ResponseBody
    public Integer deleteStudentComment(Integer smId,HttpServletRequest request) throws  Exception{
        Integer flag=stuCommentService.deleteStudentComment(smId);
        if (flag==1){
            logUtil.setLog(request,"删除了评论Id为"+smId+"的信息");
            return flag;
        }else {
            return null;
        }
    }


   /* @RequestMapping(value = "/findStuCommentListByUserId")
    @ResponseBody
    public Map<String,Object> findStuCommentListByUserId(HttpServletRequest request,StuComment stuComment, Integer page, Integer limit)throws Exception{
        User user=(User) request.getSession().getAttribute("user");
        String userId=user.getUserId();
        int yeishu = stuCommentService.findStuCommentCountByUserId(userId)/limit;
        if(stuCommentService.findStuCommentCountByUserId(userId)%limit!=0){
            yeishu++;
        }
        *//*判断前三热门详情*//*
        List<StuComment> stuCommentList=stuCommentService.findStuCommentListByUserId(stuComment,page,limit,userId);
        if (page==1){
            for(StuComment stuComment1:stuCommentList){
                stuComment1.setFlag("true");
            }
        }else if (page==2){
            stuCommentList.get(0).setFlag("true");
        }

        Map<String,Object> map=new HashMap<>();
        map.put("stuCommentList",stuCommentList);
        map.put("yeishu",yeishu);
        return map;
    }*/



    @RequestMapping(value="/findStuCommentByCoursesId")
    @ResponseBody
    public Map<String, Object> findStuCommentByCoursesId(@RequestParam("page") Integer page
            , @RequestParam("limit") Integer size,@RequestParam("courseId") Integer courseId)throws Exception{
        List<StuComment> list = stuCommentService.findStuCommentByCoursesName(page,size,courseId);
        Integer count = stuCommentService.findStuCommentCountByCoursesId(courseId);
        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    @RequestMapping(value="/findStuCommentByCoursesIdAndChapterId")
    @ResponseBody
    public Map<String, Object> findStuCommentByCoursesIdAndChapterId(@RequestParam("page") Integer page
            , @RequestParam("limit") Integer size,@RequestParam("chapterId") Integer chapterId)throws Exception{
        List<StuComment> list = stuCommentService.findStuCommentByCoursesIdAndChapterId(page,size,chapterId);
        Integer count = stuCommentService.findStuCommentCountByCoursesIdAndChapterId(chapterId);
        Map<String, Object> map = new HashMap<>();
        map.put("code", "0");
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    @RequestMapping(value = "/commentManager")
    public ModelAndView toCommentManager() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Courses> res = sectionsManagerService.findAllCourseAndChapter();
        mv.addObject("CoursesAndChapter",res);
        mv.setViewName("admin/commentManager");
        return mv;
    }

}
