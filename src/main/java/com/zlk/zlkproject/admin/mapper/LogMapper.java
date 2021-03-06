package com.zlk.zlkproject.admin.mapper;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Log;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface LogMapper {
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询所有日志信息
     * @Date 19:38 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Log>
     **/
    List<Log> findLogByLimit(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 查询日志总数(可根据操作者名称模糊查询)
     * @Date 19:39 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    Integer findTotalCountByName(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 登陆记录
     * @Date 19:21 2019/11/19
     * @Param [log]
     * @return java.lang.Integer
     **/
    Integer addLog(Log log);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过日志ID删除日志信息
     * @Date 20:16 2019/11/19
     * @Param [logId]
     * @return java.lang.Integer
     **/
    Integer deleteLogByLogId(@Param("logList") List<Log> logList);
}
