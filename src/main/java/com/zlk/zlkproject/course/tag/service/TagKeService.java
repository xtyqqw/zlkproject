package com.zlk.zlkproject.course.tag.service;

import com.zlk.zlkproject.entity.Tag;

import java.util.List;

/**
 * @ClassName tagService
 * @Description:
 * @Author LuanKe
 * Date 2019/12/6 16:58
 **/
public interface TagKeService {
    List<Tag> findTagList(Tag tag,Integer page, Integer limit);



}
