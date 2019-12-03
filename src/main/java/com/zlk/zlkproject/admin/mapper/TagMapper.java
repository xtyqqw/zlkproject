package com.zlk.zlkproject.admin.mapper;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagMapper {
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询类别
     * @Date 10:39 2019/11/21
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Tag>
     **/
    List<Tag> findTagByLimit(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 查询类别总数(可根据类别名称模糊查询)
     * @Date 10:39 2019/11/21
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    Integer findTotalCountByTagName(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过tagTypeId查询Tag信息
     * @Date 16:48 2019/11/21
     * @Param [tagTypeId]
     * @return com.zlk.zlkproject.entity.Tag
     **/
    List<Tag> findTagByTagTypeId(Integer tagTypeId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过tagID查询tag信息
     * @Date 9:12 2019/11/22
     * @Param [tagId]
     * @return com.zlk.zlkproject.entity.Tag
     **/
    Tag findTagByTagId(Integer tagId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过tagName查询tag信息
     * @Date 9:19 2019/11/22
     * @Param [tagName]
     * @return com.zlk.zlkproject.entity.Tag
     **/
    Tag findTagByTagName(String tagName);

    /**
     * @Author lufengxiang
     * @Description //TODO 新增类别
     * @Date 14:35 2019/11/21
     * @Param [tag]
     * @return java.lang.Integer
     **/
    Integer addTag(Tag tag);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过类别ID修改类别信息
     * @Date 14:52 2019/11/21
     * @Param [tag]
     * @return java.lang.Integer
     **/
    Integer updateTagByTagID(Tag tag);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过类别ID删除类别
     * @Date 15:03 2019/11/21
     * @Param [tagId]
     * @return java.lang.Integer
     **/
    Integer deleteTagByTagId(Integer tagId);
}
