package com.zlk.zlkproject.user.personal.mapper;


import com.zlk.zlkproject.user.entity.Item;
import org.apache.ibatis.annotations.Mapper;

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
     * @param userId
     * @return
     */
    List<Item> selectCourses(String userId);
}
