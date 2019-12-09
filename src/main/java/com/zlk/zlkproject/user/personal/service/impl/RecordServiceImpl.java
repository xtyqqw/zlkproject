package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.Item;
import com.zlk.zlkproject.user.personal.mapper.RecordMapper;
import com.zlk.zlkproject.user.personal.service.RecordService;
import com.zlk.zlkproject.user.until.LeaveTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * @ClassName： RecordServiceImpl
 * @Description： 查询学习记录
 * @Author： sd
 * @Date： 2019/11/26 10:58
 */
@Service
public class RecordServiceImpl implements RecordService {
    /**
     * 注入外部资源
     */
    @Autowired
    private RecordMapper recordMapper;

    /**
     * 根据userId查询学习记录
     * @param userId
     * @return
     */
    @Override
    public List<Item> selectCourses(Pagination pagination){
        /*followerPage.setIndex((followerPage.getPage()-1)*followerPage.getLimit());*/
        List<Item> list=recordMapper.selectCourses(pagination);
        int s=list.size();
        for(int i=0;i<s;i++){
            Item item=list.get(i);
            item.setStuTime(LeaveTime.alterDate(item.getStudyTime()));
            list.set(i,item);
        }
        return list;
    }
    @Override
    public Integer selectUserSection(String userId){
        return recordMapper.selectUserSection(userId);
    }
    @Override
    public Integer selectUser(String userId){
        return recordMapper.selectUser(userId);
    }
    @Override
    public Integer findCourses(String userId){
        return recordMapper.findCourses(userId);
    }
}
