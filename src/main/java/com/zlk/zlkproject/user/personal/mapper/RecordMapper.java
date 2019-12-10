package com.zlk.zlkproject.user.personal.mapper;


import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.Item;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @ClassName： Record
 * @Description： 学习记录
 * @Author： sd
 * @Date： 2019/11/26 9:28
 */
@Mapper
public interface RecordMapper {
    /**
     * 查询学习课程
     * @param pagination
     * @return
     */
    List<Item> selectCourses(Pagination pagination);

    /**
     * 查询小结状态总数
     * @param userId
     * @return
     */
    Integer selectUserSection(@Param("userId") String userId,@Param("coursesId") Integer coursesId);

    /**
     * 查询小结已完成数量
     * @param userId
     * @return
     */
    Integer selectUser(@Param("userId") String userId,@Param("coursesId") Integer coursesId);

    /**
     * 查询课程数量
     * @param pagination
     * @return
     */
    Integer findCourses(Pagination pagination);

    /**
     * 分页查询我的学习记录
     * @param pagination
     * @return
     *//*
    List<Courses> findCoursesAll(Pagination pagination);*/
}
