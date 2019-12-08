package com.zlk.zlkproject.community.question.service;

import com.sun.xml.bind.v2.runtime.unmarshaller.TagName;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionTagService {
    /*
     * @descrption 通过查询所有标签
     * @author gby
     * @param
     * @return
     * @date 2019/12/3 11:42
     */
    List<Tag> listByTag(Tag tag);
}
