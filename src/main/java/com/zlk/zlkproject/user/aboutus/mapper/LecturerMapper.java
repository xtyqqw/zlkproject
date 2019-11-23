package com.zlk.zlkproject.user.aboutus.mapper;

import com.zlk.zlkproject.user.entity.Lecturer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LecturerMapper {
    /*查询合作讲师*/
    List<Lecturer> selectLecturer();
}
