package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.TagMapper;
import com.zlk.zlkproject.admin.service.TagService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName KindServiceImpl
 * @Description: 类别管理业务逻辑类
 * @Author lufengxiang
 * Date 2019/11/21 10:40
 **/
@Service
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO
     * @Date 10:41 2019/11/21
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Tag>
     **/
    @Override
    public List<Tag> findTagByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return tagMapper.findTagByLimit(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO
     * @Date 10:41 2019/11/21
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findTotalCountByTagName(Pagination pagination) {
        return tagMapper.findTotalCountByTagName(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过tagTypeId查询Tag信息
     * @Date 16:48 2019/11/21
     * @Param [tagTypeId]
     * @return com.zlk.zlkproject.entity.Tag
     **/
    @Override
    public Tag findTagByTagTypeId(Integer tagTypeId) {
        return tagMapper.findTagByTagTypeId(tagTypeId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过tagID查询tag信息
     * @Date 9:12 2019/11/22
     * @Param [tagId]
     * @return com.zlk.zlkproject.entity.Tag
     **/
    @Override
    public Tag findTagByTagId(Integer tagId) {
        return tagMapper.findTagByTagId(tagId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过tagName查询tag信息
     * @Date 9:19 2019/11/22
     * @Param [tagName]
     * @return com.zlk.zlkproject.entity.Tag
     **/
    @Override
    public Tag findTagByTagName(String tagName) {
        return tagMapper.findTagByTagName(tagName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增类别
     * @Date 14:48 2019/11/21
     * @Param [tag]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addTag(Tag tag) {
        return tagMapper.addTag(tag);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过类别ID修改类别信息
     * @Date 14:53 2019/11/21
     * @Param [tag]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateTagByTagID(Tag tag) {
        return tagMapper.updateTagByTagID(tag);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过类别ID删除类别信息
     * @Date 15:04 2019/11/21
     * @Param [tagId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteTagByTagId(Integer tagId) {
        return tagMapper.deleteTagByTagId(tagId);
    }
}
