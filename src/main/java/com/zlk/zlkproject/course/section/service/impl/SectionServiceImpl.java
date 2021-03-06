package com.zlk.zlkproject.course.section.service.impl;

import com.zlk.zlkproject.course.section.mapper.SectionMapper;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.course.userSection.service.UserSectionService;
import com.zlk.zlkproject.entity.Section;
import com.zlk.zlkproject.entity.vo.SectionDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 小节业务实现类
 * @author: zyx
 * @create: 2019-11-19 14:36
 */
@Service
public class SectionServiceImpl implements SectionService {

    @Autowired
    private SectionMapper sectionMapper;

    /**
     * 服务对象
     */
    @Autowired
    private UserSectionService userSectionService;

    @Override
    public Integer findCountByCourseId(Integer courseId) {
        return sectionMapper.findCountByCourseId(courseId);
    }

    @Override
    public List<Section> findSectionByChapterId(Integer chapterId) {
        return sectionMapper.findSectionByChapterId(chapterId);
    }

    @Override
    public String findStateById(String userId,Integer sectionId) {
        return sectionMapper.findStateById(userId,sectionId);
    }

    @Override
    public Section findVideoAddrById(Integer sectionId) {
        return sectionMapper.findVideoAddrById(sectionId);
    }


    @Override
    public Map findSectionByCourseIdLimit(String userId,Integer courseId,Integer page, Integer limit) {
        Map map=new HashMap();
        List<SectionDetails> sectionDetailsList=new ArrayList<>();
        int yeishu = sectionMapper.findCountByCourseId(courseId)/3;
        if(sectionMapper.findCountByCourseId(courseId)%limit!=0){ yeishu++; }
        int offset = (page-1)*limit;
        List<Section> sectionList = sectionMapper.findSectionByCourseIdLimit(courseId,offset,limit);
        //循环赋值
        for (Section section:sectionList){
            SectionDetails sectionDetails = new SectionDetails();
            sectionDetails.setSectionId(section.getSectionId());
            sectionDetails.setSectionIntro(section.getSectionIntro());
            sectionDetails.setSectionName(section.getSectionName());
            sectionDetails.setChapterName(section.getChapterName());
            sectionDetails.setSectionTime((Integer)section.getSectionTime()/60);
            //根据小节id和用户id查询用户的观看状态
            sectionDetails.setState(sectionMapper.findStateByIdAndChapterId(section.getSectionId(),userId));
            double Sum;
            double Count;
            double SectionGrade;
            if(userSectionService.queryCountBySectionId(section.getSectionId())!=null&&userSectionService.querySumBySectionId(section.getSectionId())!=null){
                Sum = userSectionService.querySumBySectionId(section.getSectionId());
                Count = userSectionService.queryCountBySectionId(section.getSectionId())*3.0;
                SectionGrade =  Sum/Count*100;
            }else {
                Sum = 0;
                Count = 0;
                SectionGrade = 0;
            }
            sectionDetails.setSectionGrade((int)SectionGrade);
            sectionDetailsList.add(sectionDetails);
        }
        map.put("yeishu",yeishu);
        map.put("sectionDetailsList",sectionDetailsList);
        return map;
    }

    @Override
    public List<Section> findSectionByCourseId(Integer courseId) {
        return sectionMapper.findSectionByCourseId(courseId);
    }

    @Override
    public Section findSectionBySectionIdAndUserId(Integer sectionId, String userId) {
        return sectionMapper.findSectionBySectionIdAndUserId(sectionId, userId);
    }

    @Override
    public String findNameBySectionId(Integer sectionId) {
        return sectionMapper.findNameBySectionId(sectionId);
    }

    @Override
    public List<Section> findAllIdBySectionId(Integer sectionId) {
        return sectionMapper.findAllIdBySectionId(sectionId);
    }
}
