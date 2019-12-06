package com.zlk.zlkproject.admin.mapper;

import com.zlk.zlkproject.entity.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    /**
     * @Author lufengxiang
     * @Description //TODO 判断用户名是否存在
     * @Date 10:02 2019/11/28
     * @Param [adminName]
     * @return com.zlk.zlkproject.entity.Admin
     **/
    Admin findAdminByAdminName(String adminName);

    /**
     * @Author lufengxiang
     * @Description //TODO 查找浏览量
     * @Date 16:16 2019/12/3
     * @Param []
     * @return java.lang.Integer
     **/
    Integer findVisitNumber();

    /**
     * @Author lufengxiang
     * @Description //TODO 每次被访问访问量+1
     * @Date 16:28 2019/12/3
     * @Param []
     * @return java.lang.Integer
     **/
    Integer updateVisitNumber();
}
