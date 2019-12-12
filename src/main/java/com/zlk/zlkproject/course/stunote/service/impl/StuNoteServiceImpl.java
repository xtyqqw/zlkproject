package com.zlk.zlkproject.course.stunote.service.impl;

import com.zlk.zlkproject.course.stunote.mapper.StuNoteMapper;
import com.zlk.zlkproject.course.stunote.service.StuNoteService;
import com.zlk.zlkproject.entity.StuNote;
import com.zlk.zlkproject.entity.StuNoteRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 学生笔记业务实现类
 * @author: hry
 * @create: 2019-11-27 11:24
 */
@Service
public class StuNoteServiceImpl implements StuNoteService {
    @Autowired
    private StuNoteMapper stuNoteMapper;

    @Override
    public Integer addStuNote(StuNote stuNote) {
        Integer res = stuNoteMapper.addStuNote(stuNote);
        return res;
    }

    @Override
    public List<StuNoteRes> findStuNote(String userId, Integer sectionId, Integer page, Integer size) {
        page = (page -1) * size;
        List<StuNoteRes> list = stuNoteMapper.findStuNote(userId, sectionId, page, size);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for(StuNoteRes s: list) {
            s.setDateString(sdf.format(s.getDate()));
        }
        return list;
    }

    @Override
    public List<StuNoteRes> findStuNoteUp(String userId, Integer sectionId, Integer page, Integer size) {
        page = (page -1) * size;
        List<StuNoteRes> list = stuNoteMapper.findStuNoteUp(userId, sectionId, page, size);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for(StuNoteRes s: list) {
            s.setDateString(sdf.format(s.getDate()));
        }
        return list;
    }

    @Override
    public Integer findCount(Integer sectionId,String userId) {
        return stuNoteMapper.findCount(sectionId,userId);
    }

    @Override
    public Integer upAdd(Integer snId, String userId, String upOrDown) {
        /*StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getUp() + 1;
        Integer res = stuNoteMapper.updateStuNoteUp(snId, num);*/
        Integer res = stuNoteMapper.stuNoteUpAdd(snId);
        if (res != 1){
            return 0;
        }
        return stuNoteMapper.upOrDownAdd(snId,userId,upOrDown);
    }

    @Override
    public Integer downAdd(Integer snId, String userId, String upOrDown) {
        /*StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getDown() + 1;
        Integer res = stuNoteMapper.updateStuNoteDown(snId, num);*/
        Integer res = stuNoteMapper.stuNoteDownAdd(snId);
        if (res != 1){
            return 0;
        }
        return stuNoteMapper.upOrDownAdd(snId,userId,upOrDown);
    }

    @Override
    public Integer upDelete(Integer snId, String userId) {
        /*StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getUp() - 1;
        Integer res = stuNoteMapper.updateStuNoteUp(snId, num);*/
        Integer res = stuNoteMapper.stuNoteUpDelete(snId);
        if (res != 1){
            return 0;
        }
        return stuNoteMapper.upOrDownDelete(snId,userId);
    }

    @Override
    public Integer downDelete(Integer snId, String userId) {
        /*StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getDown() - 1;
        Integer res = stuNoteMapper.updateStuNoteDown(snId, num);*/
        Integer res = stuNoteMapper.stuNoteDownDelete(snId);
        if (res != 1){
            return 0;
        }
        return stuNoteMapper.upOrDownDelete(snId,userId);
    }

    @Override
    public Integer upAddDownDelete(Integer snId, String userId, String upOrDown) {
        /*StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getUp() + 1;
        Integer res = stuNoteMapper.updateStuNoteUp(snId, num);
        if (res != 1){
            return 0;
        }

        num = stuNoteRes.getDown() - 1;
        res = stuNoteMapper.updateStuNoteDown(snId, num);
        if (res != 1){
            return 0;
        }*/

        Integer res = stuNoteMapper.stuNoteUpAddDownDelete(snId);
        if (res != 1){
            return 0;
        }

        res = stuNoteMapper.updateDownOrUp(snId,userId,upOrDown);
        return res;
    }

    @Override
    public Integer downAddUpDelete(Integer snId, String userId, String upOrDown) {
        /*StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getDown() + 1;
        Integer res = stuNoteMapper.updateStuNoteDown(snId, num);
        if (res != 1){
            return 0;
        }

        num = stuNoteRes.getUp() - 1;
        res = stuNoteMapper.updateStuNoteUp(snId, num);
        if (res != 1){
            return 0;
        }*/

        Integer res = stuNoteMapper.stuNoteUpDeleteDownAdd(snId);
        if (res != 1){
            return 0;
        }

        res = stuNoteMapper.updateDownOrUp(snId,userId,upOrDown);
        return res;
    }

    @Override
    public Integer updateReport(Integer snId, String state) {
        return stuNoteMapper.updateReport(snId,state);
    }

    @Override
    public Integer updateCollect(Integer snId, String state, String userId) {
        StuNoteRes stuNoteRes = stuNoteMapper.findStuNoteBySnId(snId);
        Integer num = stuNoteRes.getCollect();
        int res = 2;
        if ("true".equals(state)){
            num ++;
            res = stuNoteMapper.addCollect(snId,userId);
            if (res != 1)
                return 0;
        }else {
            num --;
            res = stuNoteMapper.deleteCollect(snId,userId);
            if (res != 1)
                return 0;
        }
        return stuNoteMapper.updateCollect(snId,num);
    }
}
