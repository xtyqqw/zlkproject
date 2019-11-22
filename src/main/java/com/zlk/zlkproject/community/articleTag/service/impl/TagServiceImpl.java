package com.zlk.zlkproject.community.articleTag.service.impl;

import com.zlk.zlkproject.community.articleTag.mapper.TagMapper;
import com.zlk.zlkproject.community.articleTag.service.TagService;
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
public class TagServiceImpl implements TagService {

    @Autowired
    private TagMapper tagMapper;

    @Override
    public List<Tag> getAllTagByTagId(Integer tagId) {
        return tagMapper.getAllTagByTagId(tagId);
    }
}
