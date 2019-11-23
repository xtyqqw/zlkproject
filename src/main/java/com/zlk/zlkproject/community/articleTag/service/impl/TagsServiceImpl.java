package com.zlk.zlkproject.community.articleTag.service.impl;

import com.zlk.zlkproject.community.articleTag.mapper.TagsMapper;
import com.zlk.zlkproject.community.articleTag.service.TagsService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: TagServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 17:06
 */
@Service
public class TagsServiceImpl implements TagsService {

    @Autowired
    private TagsMapper tagsMapper;

    @Override
    public List<Tag> getAllTagByTagId(Tag tag) {
        return tagsMapper.getAllTagByTagId(tag);
    }
}
