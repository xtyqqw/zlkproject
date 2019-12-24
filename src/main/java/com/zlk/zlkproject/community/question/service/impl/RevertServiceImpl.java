package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.RevertMapper;
import com.zlk.zlkproject.community.question.service.RevertService;
import com.zlk.zlkproject.entity.Revert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author gby
 * @ClassName RevertServiceImpl
 * @description 社区问题回复
 * @date 2019/12/24 17:12
 */
@Service
public class RevertServiceImpl implements RevertService {
    @Autowired
    private RevertMapper revertMapper;

    @Override
    public Integer addRevert(Revert revert) {
        return revertMapper.addRevert(revert);
    }
}
