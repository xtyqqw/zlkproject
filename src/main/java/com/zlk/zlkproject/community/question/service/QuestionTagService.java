package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Tag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionTagService {

    /*
     * @descrption 通过分类名查询所属标签
     * @author gby
     * @param
     * @return
     * @date 2019/12/3 11:42
     */
    List<Tag> selectTagByTypeId(String tagTypeId);
}
