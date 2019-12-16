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
     * 查询视频总时间
     * @param userId
     * @return
     */
    Integer selectUserSection(@Param("userId") String userId,@Param("sectionId") Integer sectionId);

    /**
     * 查询视频已观看时间
     * @param userId
     * @return
     */
    Integer selectUserTime(@Param("userId") String userId,@Param("sectionId") Integer sectionId);

    /**
     * 查询课程数量
     * @param pagination
     * @return
     */
    Integer findCourses(Pagination pagination);


}
