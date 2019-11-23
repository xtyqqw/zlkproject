package com.zlk.zlkproject.community.articleTag.mapper;

import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: TagMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 16:46
 */
@Mapper
public interface TagsMapper {

    List<Tag> getAllTagByTagId(Tag tag);
}
