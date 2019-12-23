package com.zlk.zlkproject.course.stu_comment.service;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.StuComment;

import java.util.List;

public interface StuCommentService {
    /**
     *  新增学生评论
     *@method addStuCmt
     *@params [StuComment]
     *@return Integer
     *@author hry
     *@time 2019/12/03  11:11
     */
    public Integer addStuCmt(StuComment stuComment);

    /**
     *  查询学生评论按时间
     *@method findStuCmt
     *@params [Integer]
     *@return List<StuComment>
     *@author hry
     *@time 2019/12/03  17:30
     */
    public List<StuComment> findStuCmt(Integer sectionId, Integer page, Integer size);

    /**
     *  查询学生评论总条数
     *@method findStuCmtCount
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/03  17:35
     */
    public Integer findCount(Integer sectionId);

    /**
     *  行该学生评论赞踩数
     *@method updateUD
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/06  13:39
     */
    public Integer updateUD(String userId,Integer smId,String type);

    /**
     *  修改 stu_comment report数据
     *@method updateReport
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  16:20
     */
    public Integer updateReport(Integer smId,String report);

    /**
     *@Author luanke
     *@Description //查询评论表所有内容
     *@Date 11:22 2019/12/16
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.StuComment>
     **/
    List<StuComment> findAllFromStuComment(Pagination pagination);


    /**
     *@Author luanke
     *@Description //查询评论表所有数量
     *@Date 11:22 2019/12/16
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.StuComment>
     **/
    Integer findStuCommentCount(Pagination pagination);


    /**
     *@Author luanke
     *@Description //修改讲师回复
     *@Date 14:31 2019/12/16
     *@Param [smId, teacherAnswer]
     *@return java.lang.Integer
    **/
    Integer updateTeacherAnswer(Integer smId,String teacherAnswer);

    /**
     *@Author luanke
     *@Description //删除
     *@Date 14:30 2019/12/16
     *@Param [smId, userId]
     *@return java.lang.Integer
     **/
    Integer deleteStudentComment(Integer smId);

    /**
     *@Author luanke
     *@Description //根据userId查询所有
     *@Date 19:16 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Comment>
     **/
    List<StuComment> findStuCommentListByUserId(StuComment stuComment,Integer page,Integer limit,String userId);

    /**
     *@Author luanke
     *@Description //查询userId评论总数
     *@Date 10:35 2019/12/10
     *@Param [comment, startPage, limit, commentUserId]
     *@return java.util.List<com.zlk.zlkproject.entity.Comment>
     **/
    Integer findStuCommentCountByUserId(String userId);

    /**
     *@Author luanke
     *@Description //根据coursesId查询内容
     *@Date 11:51 2019/12/19
     *@Param [pagination, coursesId]
     *@return java.util.List<com.zlk.zlkproject.entity.StuComment>
     **/
    List<StuComment> findStuCommentByCoursesName(Integer page,Integer size,Integer courseId);

    /**
     *@Author luanke
     *@Description //根据coursesId查询的数量
     *@Date 11:55 2019/12/19
     *@Param [pagination, coursesId]
     *@return java.lang.Integer
    **/
    Integer findStuCommentCountByCoursesId(Integer courseId);

    /**
     *@Author luanke
     *@Description //根据chapterId查询内容
     *@Date 11:51 2019/12/19
     *@Param [pagination, coursesId]
     *@return java.util.List<com.zlk.zlkproject.entity.StuComment>
     **/
    List<StuComment> findStuCommentByCoursesIdAndChapterId(Integer page,Integer size,Integer chapterId);

    /**
     *@Author luanke
     *@Description //根据chapterId查询的数量
     *@Date 12:02 2019/12/19
     *@Param [pagination, coursesId]
     *@return java.lang.Integer
     **/
    Integer findStuCommentCountByCoursesIdAndChapterId(Integer chapterId);

}
