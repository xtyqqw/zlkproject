package com.zlk.zlkproject.course.stuQa.service.impl;

import com.zlk.zlkproject.course.stuQa.mapper.StuQaMapper;
import com.zlk.zlkproject.course.stuQa.service.StuQaService;
import com.zlk.zlkproject.entity.StuQa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 学生问答业务实现类
 * @author: zyx
 * @create: 2019-11-27 15:22
 */
@Service
public class StuQaServiceImpl implements StuQaService {

    @Autowired
    private StuQaMapper stuQaMapper;

    @Override
    @Transactional
    public String insertStuQa(StuQa stuQa, List<Integer> tagIdList) {
        Integer integer = stuQaMapper.insertStuQa(stuQa);
        Integer sqaId = stuQa.getSqaId();
        Integer flag = 0;
        String message;
        for (Integer tagId : tagIdList) {
            Integer integer1 = stuQaMapper.insertStuQaTag(sqaId, tagId);
            if (integer1>0){
                flag ++;
            }
        }
        if (integer>0 && flag == tagIdList.size()){
            message = "添加成功";
        }else {
            message = "添加失败";
        }
        return message;
    }

    @Override
    public List<StuQa> findStuQaBySectionId(Integer sectionId, Integer page, Integer limit) {
        Integer offset = (page-1) * limit;
        return stuQaMapper.findStuQaBySectionId(sectionId,offset,limit);
    }

    @Override
    public Integer getPages(Integer sectionId, Integer limit) {
        Integer count = stuQaMapper.findCountBySectionId(sectionId);
        Integer pages;
        if (count%limit==0){
            pages = count/limit;
        }else {
            pages = count/limit +1;
        }
        return pages;
    }

    @Override
    public List<StuQa> findStuQaBySectionIdElite(Integer sectionId, Integer page, Integer limit) {
        Integer offset = (page-1) * limit;
        return stuQaMapper.findStuQaBySectionIdElite(sectionId, offset, limit);
    }

    @Override
    public Integer updateShareOrReportBySqaId(StuQa stuQa) {
        return stuQaMapper.updateShareOrReportBySqaId(stuQa);
    }

    @Override
    public StuQa findStuQaBySqaId(Integer sqaId) {
        return stuQaMapper.findStuQaBySqaId(sqaId);
    }

    @Override
    public List<StuQa> findStuQaBySectionIdAndPId(Integer sectionId, Integer pId) {
//        Integer offset = (page-1) * limit;
        return stuQaMapper.findStuQaBySectionIdAndPId(sectionId, pId);
    }

    @Override
    public Integer getPages(Integer sectionId, Integer pId, Integer limit) {
        Integer count = stuQaMapper.findCountBySectionIdAndPId(sectionId,pId);
        Integer pages;
        if (count%limit==0){
            pages = count/limit;
        }else {
            pages = count/limit +1;
        }
        return pages;
    }

    @Override
    public List<Integer> findTagIdBySqaId(Integer sqaId) {
        return stuQaMapper.findTagIdBySqaId(sqaId);
    }

    @Override
    public Integer updateStuQaBySqaId(StuQa stuQa) {
        return stuQaMapper.updateStuQaBySqaId(stuQa);
    }

    @Override
    @Transactional
    public String updateAnswerNum(Integer sectionId,Integer sqaId) {
        //根据sqaId查找主问题信息
        StuQa stuQa = stuQaMapper.findStuQaBySqaId(sqaId);
        Integer count = stuQaMapper.findCountBySectionIdAndPId(sectionId, sqaId);
        stuQa.setAnswerNum(count);
        //修改问题回答数
        Integer flag = stuQaMapper.updateStuQaBySqaId(stuQa);
        if (flag>0){
            return "修改成功";
        }else {
            return "修改失败";
        }
    }

    @Override
    public List<StuQa> selectAllLimit(Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return stuQaMapper.selectAllLimit(startPage,limit);
    }

    @Override
    public Integer selectAllCount() {
        return stuQaMapper.selectAllCount();
    }

    @Override
    public Integer deleteBySqaId(StuQa stuQa) {
        return stuQaMapper.deleteBySqaId(stuQa);
    }

    @Override
    public List<StuQa> selectByReportDesc(Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return stuQaMapper.selectByReportDesc(startPage,limit);
    }

    @Override
    public List<StuQa> fuzzySearchByUserName(String userRealname, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return stuQaMapper.fuzzySearchByUserName(userRealname, startPage, limit);
    }

    @Override
    public List<StuQa> fuzzySearchBySectionName(String sectionName, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return stuQaMapper.fuzzySearchBySectionName(sectionName, startPage, limit);
    }

    @Override
    public Integer selectCountByUserNameFuzzySelect(String userRealname) {
        return stuQaMapper.selectCountByUserNameFuzzySelect(userRealname);
    }

    @Override
    public Integer selectCountBySectionNameFuzzySelect(String sectionName) {
        return stuQaMapper.selectCountBySectionNameFuzzySelect(sectionName);
    }


}
