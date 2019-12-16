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
     * 查询视频总时间
     * @param userId
     * @return
     */
    Integer selectUserSection(String userId,Integer sectionId);

    /**
     * 查询视频已观看时间
     * @param userId
     * @return
     */
    Integer selectUserTime(String userId,Integer sectionId);
    /**
     * 查询课程数量
     * @param pagination
     * @return
     */
    Integer findCourses(Pagination pagination);
}
