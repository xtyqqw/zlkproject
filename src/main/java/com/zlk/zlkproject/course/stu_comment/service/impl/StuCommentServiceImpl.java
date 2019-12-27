package com.zlk.zlkproject.course.stu_comment.service.impl;

import com.zlk.zlkproject.course.sections_manager.mapper.SectionsManagerMapper;
import com.zlk.zlkproject.course.stu_comment.mapper.StuCommentMapper;
import com.zlk.zlkproject.course.stu_comment.service.StuCommentService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.StuComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 学生评论业务实现类
 * @author: hry
 * @create: 2019-12-03 11:12
 */
@Service
public class StuCommentServiceImpl implements StuCommentService {
    @Autowired
    private StuCommentMapper stuCommentMapper;


    @Override
    public Integer addStuCmt(StuComment stuComment) {
        return stuCommentMapper.addStuCmt(stuComment);
    }

    @Override
    public List<StuComment> findStuCmt(Integer sectionId, Integer page, Integer size) {
        page = (page - 1) * size;
        List<StuComment> list = stuCommentMapper.findStuCmt(sectionId, page, size);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        for(StuComment s: list) {
            s.setDateString(sdf.format(s.getDate()));
            for (StuComment ss:s.getStuCommentList()){
                ss.setDateString(sdf.format(ss.getDate()));
            }
        }
        return list;
    }

    @Override
    public Integer findCount(Integer sectionId) {
        return stuCommentMapper.findCount(sectionId);
    }

    @Override
    public Integer updateUD(String userId, Integer smId, String type) {
        if("UpAdd".equals(type)){
            Integer res = stuCommentMapper.addSuu(smId, userId, "up");
            if(res != 1)
                return 0;
        }else if ("UpMinus".equals(type)){
            Integer res = stuCommentMapper.deleteSuu(smId, userId);
            if(res != 1)
                return 0;
        }else if ("DownAdd".equals(type)){
            Integer res = stuCommentMapper.addSuu(smId, userId, "down");
            if(res != 1)
                return 0;
        }else if ("DownMinus".equals(type)){
            Integer res = stuCommentMapper.deleteSuu(smId, userId);
            if(res != 1)
                return 0;
        }else if ("UpAddDownMinus".equals(type)){
            Integer res = stuCommentMapper.updateSuu(smId, userId, "up");
            if(res != 1)
                return 0;
        }else if ("UpMinusDownAdd".equals(type)){
            Integer res = stuCommentMapper.updateSuu(smId, userId, "down");
            if(res != 1)
                return 0;
        }
        return stuCommentMapper.updateUpDownNumBySmId(smId,type);
    }

    @Override
    public Integer updateReport(Integer smId, String report) {
        return stuCommentMapper.updateReport(smId,report);
    }

    @Override
    public List<StuComment> findAllFromStuComment(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return stuCommentMapper.findAllFromStuComment(pagination);
    }

    @Override
    public Integer findStuCommentCount(Pagination pagination) {
        return stuCommentMapper.findStuCommentCount(pagination);
    }

    @Override
    public Integer updateTeacherAnswer(Integer smId, String teacherAnswer) {
        return stuCommentMapper.updateTeacherAnswer(smId,teacherAnswer);
    }

    @Override
    public Integer deleteStudentComment(Integer smId) {
        return stuCommentMapper.deleteStudentComment(smId);
    }

    @Override
    public List<StuComment> findStuCommentListByUserId(StuComment stuComment, Integer page, Integer limit, String userId) {
        stuComment.getUserRealName();

        Integer startPage = (page-1)*limit;
        return stuCommentMapper.findStuCommentListByUserId(stuComment,startPage,limit,userId);
    }

    @Override
    public Integer findStuCommentCountByUserId(String userId) {
        return stuCommentMapper.findStuCommentCountByUserId(userId);
    }

    @Override
    public List<StuComment> findStuCommentByCoursesName(Integer page, Integer size, Integer courseId) {
        page = (page - 1) * size;
        List<StuComment> list = stuCommentMapper.findStuCommentByCoursesName(page, size, courseId);
        return list;
    }

    @Override
    public Integer findStuCommentCountByCoursesId(Integer courseId) {
        /*Courses courses = sectionsManagerMapper.findCourseAndChapterById(courseId);
        List<Integer> list = new ArrayList<>();
        for(Chapter c:courses.getChapterList()){
            list.add(c.getChapterId());
        }
        if (list.size() == 0){
            return 0;
        }
        Integer res = stuCommentMapper.findStuCommentCountByCoursesId(courseId);*/
        return stuCommentMapper.findStuCommentCountByCoursesId(courseId);
    }

    @Override
    public List<StuComment> findStuCommentByCoursesIdAndChapterId(Integer page, Integer size, Integer chapterId) {
        page = (page - 1) * size;
        return stuCommentMapper.findStuCommentByCoursesIdAndChapterId(page,size,chapterId);

    }

    @Override
    public Integer findStuCommentCountByCoursesIdAndChapterId( Integer chapterId) {
        return stuCommentMapper.findStuCommentCountByCoursesIdAndChapterId(chapterId);
    }
}
