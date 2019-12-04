package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.Faq;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.entity.MyResponse;
import com.zlk.zlkproject.user.personal.mapper.FaqqMapper;
import com.zlk.zlkproject.user.personal.service.FaqqService;
import com.zlk.zlkproject.user.until.LeaveTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: FaqqServiceImpl
 * @description: 问答业务层
 * @author: xty
 * @create: 2019/12/3 15:56
 **/
@Service
public class FaqqServiceImpl implements FaqqService {
    @Autowired
    FaqqMapper faqqMapper;
    @Override
    public List findAll(String userId) {
        List<MyQuestions> qList = faqqMapper.findQuestion(userId);
        for(int i = 0;i<qList.size();i++){
            qList.get(i).setFormatDate(LeaveTime.formatDate(qList.get(i).getCreateTime()));
        }
        List<MyResponse> rList = faqqMapper.findResponse(userId);
        for(int i = 0;i<rList.size();i++){
            rList.get(i).setFormatDate(LeaveTime.formatDate(rList.get(i).getCreateTime()));
        }
        List allList = new ArrayList();
        allList.addAll(qList);
        allList.addAll(rList);
        allList = LeaveTime.byTime(allList);
        return allList;
    }

    @Override
    public List<MyQuestions> findQuestion(String userId) {
        List<MyQuestions> list = faqqMapper.findQuestion(userId);
        for(int i = 0;i<list.size();i++){
            list.get(i).setFormatDate(LeaveTime.formatDate(list.get(i).getCreateTime()));
        }
        list = LeaveTime.byTime(list);
        return list;
    }

    @Override
    public List<MyResponse> findResponse(String userId) {
        List<MyResponse> list = faqqMapper.findResponse(userId);
        for(int i = 0;i<list.size();i++){
            list.get(i).setFormatDate(LeaveTime.formatDate(list.get(i).getCreateTime()));
        }
        list = LeaveTime.byTime(list);
        return list;
    }


    @Override
    public Integer deleteResponse(Integer responseId) {
        return faqqMapper.deleteResponse(responseId);
    }

    @Override
    public Integer updateResponse(MyResponse myResponse) {
        return faqqMapper.updateResponse(myResponse);
    }
}
