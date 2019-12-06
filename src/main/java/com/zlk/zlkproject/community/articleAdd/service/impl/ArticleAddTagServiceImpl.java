package com.zlk.zlkproject.community.articleAdd.service.impl;

import com.zlk.zlkproject.community.articleAdd.dao.ArticleAddTagRepository;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddTagService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: ArticleAddTagServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/3 14:16
 */
@Service
public class ArticleAddTagServiceImpl implements ArticleAddTagService {

    @Autowired
    private ArticleAddTagRepository articleAddTagRepository;

    @Override
    public List<Tag> listTag() {
        return articleAddTagRepository.findAll();
    }

    @Override
    public List<Tag> listTags(String ids) { //1,2,3
        return articleAddTagRepository.findAllById(converToList(ids));
    }

    private List<Integer> converToList(String ids) {
        List<Integer> list=new ArrayList<>();
        if (!"".equals(ids) && ids != null) {
            String[] idarray = ids.split(",");
            for (int i=0; i < idarray.length;i++) {
                list.add(new Integer(idarray[i]));
            }
        }
        return list;
    }
}
