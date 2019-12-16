package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.Item;
import com.zlk.zlkproject.user.entity.Users;

import java.util.List;

/**
 * @ClassName： RecordService
 * @Description： 查询项目名称
 * @Author： sd
 * @Date： 2019/11/26 10:57
 */
public interface RecordService {
    /**
     * 查询学习项目
     * @param pagination
     * @return
     */
    List<Item> selectCourses(Pagination pagination);
    /**
     * 查询小结状态总数
     * @param userId
     * @return
     */
    Integer selectUserSection(String userId,Integer coursesId);

    /**
     * 查询小结已完成数量
     * @param userId
     * @return
     */
    Integer selectUser(String userId,Integer coursesId);
    /**
     * 查询课程数量
     * @param pagination
     * @return
     */
    Integer findCourses(Pagination pagination);
}
