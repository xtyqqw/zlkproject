package com.zlk.zlkproject.course.tag.mapper;

import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface TagKeMapper {
    List<Tag> findTagList(Tag tag, Integer startPage, Integer limit);

    /**
     *  根据方向id查找tag
     *@method findTagByTypeId
     *@params [typeId]
     *@return java.util.List<com.zlk.zlkproject.entity.Tag>
     *@author zhang
     *@time 2019/12/11  16:10
     */
    List<Tag> findTagByTypeId(Integer typeId);
}
