package com.zlk.zlkproject.course.courseDetails;

import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.course.userChapter.service.UserChapterService;
import com.zlk.zlkproject.course.userCourses.service.UserCoursesService;
import com.zlk.zlkproject.course.userSection.service.UserSectionService;
import com.zlk.zlkproject.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/26 11:36
 */
@Controller
public class DetailsController {
    @Autowired
    private UserChapterService userChapterService;

    @Autowired
    private UserCoursesService userCoursesService;

    @Autowired
    private UserSectionService userSectionService;

    @Autowired
    private CourseHomePageService courseHomePageService;

    @Autowired
    private ChapterService chapterService;

    @Autowired
    private SectionService sectionService;
    /**
     * 跳转到课程介绍页面
     * @return 课程介绍页面路径
     */
    @RequestMapping("/kecheng/kechengjianjie")
    public String kechenjianjie(){
        return "/view/kechengjeishao";
    }

    /**
     * 跳转章节下的所有小节的页面
     * @return
     */
    @RequestMapping("/kecheng/kechenxianqing")
    public String kechenxianqing(){
        return "/view/kechengxianqing";
    }

    /**
     * 加入课程的方法
     * @param coursesId
     * @return
     */
    @RequestMapping("/kecheng/insertCourses")
    @ResponseBody
    public String insertCourses(Integer coursesId){
        int userId=1;
        List<Section> sectionList = sectionService.findSectionByCourseId(coursesId);
        List<Chapter> chapterList = chapterService.findChapterByCoursesId(coursesId);
        Courses courses=courseHomePageService.selectCoursesByCoursesId(coursesId);
        courses.setStudentNum(courses.getStudentNum()+1);
        courseHomePageService.updateByCoursesId(courses);
        UserCourses userCourses=new UserCourses();
        userCourses.setCoursesId(coursesId);
        userCourses.setUserId(userId);
        userCoursesService.insert(userCourses);
        for (Section section:sectionList){
            UserSection userSection = new UserSection();
            userSection.setSectionId(section.getSectionId());
            userSection.setUserId(userId);
            userSectionService.insert(userSection);
        }
        for (Chapter chapter:chapterList){
            UserChapter userChapter = new UserChapter();
            userChapter.setChapterId(chapter.getChapterId());
            userChapter.setUserId(userId);
            userChapterService.insert(userChapter);
        }

        return "参加成功";
    }

    /**
     * 根据用户id和课程id查询该用户是否参加课程
     * @param userCourses
     * @return 是或否
     */
    @RequestMapping("/kecheng/seleUserCoursesByUserCourses")
    @ResponseBody
    public boolean seleUserCoursesByUserCourses(UserCourses userCourses){
        userCourses.setUserId(1);
        userCourses.setCoursesId(1);
        List<UserCourses> UC=userCoursesService.queryAll(userCourses);
        if(UC.size()!=0){
            return true;
        }
        return false;
    }

    /**
     * 跳转到笔记管理页面
     * @return
     */
    @RequestMapping("/note/toNoteManager")
    public String toNoteManager(){
        return "/view/toNoteManager";
    }

    /**
     * 跳转到课程管理页面
     * @return
     */
    @RequestMapping("/course/toCourseManager")
    public String toCourseManager(){
        return "/view/toCourseManager";
    }

}
