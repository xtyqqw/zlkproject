package com.zlk.zlkproject.course.tag.service.impl;

import com.zlk.zlkproject.course.tag.mapper.TagKeMapper;
import com.zlk.zlkproject.course.tag.service.TagKeService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName tagServiceImpl
 * @Description:
 * @Author LuanKe
 * Date 2019/12/6 16:59
 **/
@Service
public class TagKeKeServiceImpl implements TagKeService {
    @Autowired
    private TagKeMapper tagKeMapper;

    @Override
    public List<Tag> findTagList(Tag tag,Integer page,Integer limit) {
        Integer startPage = (page - 1) * limit;
        return tagKeMapper.findTagList(tag, startPage, limit);

    }

    @Override
    public List<Tag> findTagByTypeId(Integer typeId) {
        return tagKeMapper.findTagByTypeId(typeId);
    }
}
