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
