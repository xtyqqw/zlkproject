package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.LogMapper;
import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName LogServiceImpl
 * @Description: 日志记录业务逻辑类
 * @Author lufengxiang
 * Date 2019/11/19 19:22
 **/
@Service
public class LogServiceImpl implements LogService {
    @Autowired
    private LogMapper logMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询日志记录
     * @Date 19:42 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Log>
     **/
    @Override
    public List<Log> findLogByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return logMapper.findLogByLimit(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查询日志总数(可根据操作者名称模糊查询)
     * @Date 19:43 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findTotalCountByName(Pagination pagination) {
        return logMapper.findTotalCountByName(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 登陆记录
     * @Date 19:23 2019/11/19
     * @Param [log]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addLog(Log log) {
        return logMapper.addLog(log);
    }

    @Override
    public Integer deleteLogByLogId(String logId) {
        return logMapper.deleteLogByLogId(logId);
    }
}
