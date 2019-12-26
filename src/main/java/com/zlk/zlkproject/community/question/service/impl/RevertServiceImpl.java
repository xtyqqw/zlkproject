package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.RevertMapper;
import com.zlk.zlkproject.community.question.service.RevertService;
import com.zlk.zlkproject.entity.Revert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.text.SimpleDateFormat;
import java.util.List;

import static org.springframework.data.redis.core.query.SortQueryBuilder.sort;

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

    @Override
    public List<Revert> findRevert(String questionId, Integer page, Integer size) {
        page = (page - 1) * size;
        List<Revert> list = revertMapper.findRevert(questionId, page, size);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        for (Revert a : list) {
            a.setDateString(sdf.format(a.getCreateTime()));
            for (Revert aa : a.getRevertList()) {
                aa.setDateString(sdf.format(aa.getCreateTime()));
            }
        }
        return list;
    }

    @Override
    public Integer findRevertCount(String questionId) {
        return revertMapper.findRevertCount(questionId);
    }
}
