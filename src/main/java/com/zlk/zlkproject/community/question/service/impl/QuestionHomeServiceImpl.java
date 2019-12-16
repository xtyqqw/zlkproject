package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.dao.QuestionHomeDao;
import com.zlk.zlkproject.community.question.mapper.QuestionHomeMapper;
import com.zlk.zlkproject.community.question.service.QuestionHomeService;
import com.zlk.zlkproject.community.util.MarkdownUtils;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Question;
import javassist.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * @author gby
 * @ClassName QuestionHomeServiceImpl
 * @description 问答首页业务类
 * @date 2019/12/6 15:54
 */
@Service
public class QuestionHomeServiceImpl implements QuestionHomeService {
    @Autowired
    private QuestionHomeMapper questionHomeMapper;
    @Autowired
    private QuestionHomeDao questionHomeDao;

    @Override
    public Integer findQuestionCount(Pagination pagination) {
        return questionHomeMapper.findQuestionCount(pagination);
    }


    @Override
    public List<Question> findAll(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return questionHomeMapper.findAll(pagination);
    }
    @Override
    public List<Question> findByUserId(Pagination pagination,String userId) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return questionHomeMapper.findByUserId(pagination,userId);

    }

    @Transactional
    @Override
    public Question getAndConvert(String questionId){
        Question question = questionHomeDao.findById(questionId).get();
        if(question == null){
            try {
                throw new NotFoundException("该问题不存在");
            }catch (NotFoundException e){
                e.printStackTrace();
            }
        }
        Question q = new Question();
        BeanUtils.copyProperties(question,q);
        String count = q.getQuestionContent();
        q.setQuestionContent(MarkdownUtils.markdownToHtmlExtensions(count));
        questionHomeDao.editBrowseCount(questionId);
        return q;
    }

}
