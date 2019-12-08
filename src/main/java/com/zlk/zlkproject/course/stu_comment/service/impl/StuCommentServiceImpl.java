package com.zlk.zlkproject.course.stu_comment.service.impl;

import com.zlk.zlkproject.course.stu_comment.mapper.StuCommentMapper;
import com.zlk.zlkproject.course.stu_comment.service.StuCommentService;
import com.zlk.zlkproject.entity.StuComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 学生评论业务实现类
 * @author: hry
 * @create: 2019-12-03 11:12
 */
@Service
public class StuCommentServiceImpl implements StuCommentService {
    @Autowired
    private StuCommentMapper stuCommentMapper;

    @Override
    public Integer addStuCmt(StuComment stuComment) {
        return stuCommentMapper.addStuCmt(stuComment);
    }

    @Override
    public List<StuComment> findStuCmt(Integer sectionId, Integer page, Integer size) {
        page = (page - 1) * size;
        List<StuComment> list = stuCommentMapper.findStuCmt(sectionId, page, size);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for(StuComment s: list) {
            s.setDateString(sdf.format(s.getDate()));
            for (StuComment ss:s.getStuCommentList()){
                ss.setDateString(sdf.format(ss.getDate()));
            }
        }
        return list;
    }

    @Override
    public Integer findCount(Integer sectionId) {
        return stuCommentMapper.findCount(sectionId);
    }

    @Override
    public Integer updateUD(String userId, Integer smId, String type) {
        if("UpAdd".equals(type)){
            Integer res = stuCommentMapper.addSuu(smId, userId, "up");
            if(res != 1)
                return 0;
        }else if ("UpMinus".equals(type)){
            Integer res = stuCommentMapper.deleteSuu(smId, userId);
            if(res != 1)
                return 0;
        }else if ("DownAdd".equals(type)){
            Integer res = stuCommentMapper.addSuu(smId, userId, "down");
            if(res != 1)
                return 0;
        }else if ("DownMinus".equals(type)){
            Integer res = stuCommentMapper.deleteSuu(smId, userId);
            if(res != 1)
                return 0;
        }else if ("UpAddDownMinus".equals(type)){
            Integer res = stuCommentMapper.updateSuu(smId, userId, "up");
            if(res != 1)
                return 0;
        }else if ("UpMinusDownAdd".equals(type)){
            Integer res = stuCommentMapper.updateSuu(smId, userId, "down");
            if(res != 1)
                return 0;
        }
        return stuCommentMapper.updateUpDownNumBySmId(smId,type);
    }

    @Override
    public Integer updateReport(Integer smId, String report) {
        return stuCommentMapper.updateReport(smId,report);
    }
}
