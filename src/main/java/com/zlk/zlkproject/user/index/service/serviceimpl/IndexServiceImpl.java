package com.zlk.zlkproject.user.index.service.serviceimpl;

import com.zlk.zlkproject.entity.*;
import com.zlk.zlkproject.user.entity.Signin;
import com.zlk.zlkproject.user.index.mapper.IndexMapper;
import com.zlk.zlkproject.user.index.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @ClassName： IndexServiceImpl
 * @Description： index service接口实现类
 * @Author： yzh
 * @Date： 2019/11/21 19:28
 */
@Service
public class IndexServiceImpl implements IndexService {
    @Autowired(required = false)
    private IndexMapper indexMapper;
    /**
     * 查询所有课程
     * @return List<Courses>
     */
    @Override
    public List<Courses> findCoursesAll() {
        return indexMapper.findCoursesAll();
    }
    /**
     * 按照学习总时长从多到少查询用户
     * @return List<User>
     */
    @Override
    public List<User> findUsersByAllTime() {
        return indexMapper.findUsersByAllTime();
    }
    /**
     * 按照学习总时长从少到多查询用户
     * @return List<User>
     */
    @Override
    public List<User> findUsersByTime() {
        return indexMapper.findUsersByTime();
    }
    /**
     * 根据ID查询用户
     * @param userId
     * @return User
     */
    @Override
    public User findUsersById(String userId) {
        return indexMapper.findUsersById(userId);
    }
    /**
     * 根据ID查询学习时长排序后用户的排名
     * @param userId
     * @return Integer
     */
    @Override
    public Integer findUserRankById(String userId) {
        return indexMapper.findUserRankById(userId);
    }
    /**
     * 查询用户总数
     * @return Integer
     */
    @Override
    public Integer findUserCount() {
        return indexMapper.findUserCount();
    }
    /**
     *流加载查询分页课程
     * @param pagination
     * @return List<Courses>
     */
    @Override
    public List<Courses> findCoursesList(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return indexMapper.findCoursesList(pagination);
    }
    /**
     *查询所有方向
     * @return List<Type>
     */
    @Override
    public List<Type> findTypeAll() {
        return indexMapper.findTypeAll();
    }
    /**
     *根据方向ID查询包含类别
     * @param tagTypeId
     * @return List<Tag>
     */
    @Override
    public List<Tag> findTagsById(Integer tagTypeId) {
        return indexMapper.findTagsById(tagTypeId);
    }
    /**
     *根据方向ID查询课程
     * @param typeId
     * @return List<Courses>
     */
    @Override
    public List<Courses> findCoursesByTypeId(Integer typeId) {
        return indexMapper.findCoursesByTypeId(typeId);
    }
    /**
     *根据今天日期返回day
     * @param today
     * @return String
     */
    @Override
    public String findDayByDate(Date today) {
        return indexMapper.findDayByDate(today);
    }
    /**
     *根据用户ID查询上次签到日期
     * @param userId
     * @return String
     */
    @Override
    public String findDayByUserId(String userId) {
        return indexMapper.findDayByUserId(userId);
    }
    /**
     *根据用户ID查询连续签到次数
     * @param userId
     * @return Integer
     */
    @Override
    public Signin findSigninByUserId(String userId){
        return indexMapper.findSigninByUserId(userId);
    }
    /**
     *签到
     * @param signin
     * @return Integer
     */
    @Override
    public Integer signByUserId(Signin signin) {
        return indexMapper.signByUserId(signin);
    }
    /**
     *首次签到
     * @param signin
     * @return Integer
     */
    @Override
    public Integer signFirst(Signin signin) {
        return indexMapper.signFirst(signin);
    }
}
