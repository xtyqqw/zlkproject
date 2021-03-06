package com.zlk.zlkproject.course.courseHomePage.mapper;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName CourseHomePageMapper
 * @Description:
 * @Author LuanKe
 * Date 2019/11/19 16:33
 **/
@Mapper
public interface CourseHomePageMapper {
    /**
     *@Author luanke
     *@Description //根据Id查询表
     *@Date 19:15 2019/11/21
     *@Param [coursesId]
     *@return com.zlk.zlkproject.entity.Courses
    **/
    Courses selectCoursesByCoursesId(Integer coursesId);

    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:16 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
    **/
    List<Courses> findCoursesList(Pagination pagination);

    /**
     *@Author luanke
     *@Description //多表查询所有内容和时间
     *@Date 11:01 2019/11/23
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
    **/
    List<Courses> findUserCoursesList(Pagination pagination);

    Integer findCoursesCount(Pagination pagination);
    /**
     *@Author luanke
     *@Description //查询项目首页所有内容
     *@Date 17:00 2019/11/28
     *@Param [courseHomePageMapper, startPage, limit, commentUserId]
     *@return java.util.List<com.zlk.zlkproject.course.courseHomePage.mapper.CourseHomePageMapper>
    **/
    List<Courses> findAll(Courses courses,Integer startPage,Integer limit);
    /**
     *@Author luanke
     *@Description //按标签名字查询项目首页所有内容
     *@Date 17:00 2019/11/28
     *@Param [courseHomePageMapper, startPage, limit, commentUserId]
     *@return java.util.List<com.zlk.zlkproject.course.courseHomePage.mapper.CourseHomePageMapper>
     **/
    List<Courses> findAllByTag(Courses courses,String tagName,Integer startPage,Integer limit);


    /**
     * 修改数据
     *
     * @param courses 实例对象
     * @return 影响行数
     */
    int updateByCoursesId(Courses courses);

    /**
     * 根据coursesId删除数据
     *
     * @param coursesId
     * @return
     */
    int deleteByCoursesId(Integer coursesId);

    /**
     * 查询全部并分页
     *
     * @param offset
     * @param limit
     * @return
     */
    List<Courses> selectCoursesByLimit(Integer offset,Integer limit);

    /**
     * 新增数据
     *
     * @param courses 实例对象
     * @return 影响行数
     */
    int insertByCourses(Courses courses);

    /**
     * 查询课程数量
     * @return 课程数量
     */
    Integer selectCount();

    /**
     *  根据课程名称模糊查询并分页
     *@method findByCoursesNameLimit
     *@params [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
     *@author zhang
     *@time 2019/12/4  11:10
     */
    List<Courses> findByCoursesNameLimit(String coursesName,Integer startPage,Integer limit);

    /**
     *  根据课程名称模糊查询总数量
     *@method findCountsByCoursesName
     *@params [coursesName]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/4  11:19
     */
    Integer findCountsByCoursesName(String coursesName);

    /**
     * 查找全部课程id与名字
     *@method findAllCourses
     *@params []
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
     *@author zhang
     *@time 2019/12/10  16:01
     */
    List<Courses> findAllCourses();
}

