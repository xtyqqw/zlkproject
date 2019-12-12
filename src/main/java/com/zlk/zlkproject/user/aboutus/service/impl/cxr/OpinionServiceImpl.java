package com.zlk.zlkproject.user.aboutus.service.impl.cxr;

import com.zlk.zlkproject.user.aboutus.mapper.cxr.OpinionMapper;
import com.zlk.zlkproject.user.aboutus.service.cxr.OpinionService;
import com.zlk.zlkproject.user.entity.Opinion;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 13:44
 */
@Service
public class OpinionServiceImpl implements OpinionService {
    @Resource
    private OpinionMapper opinionMapper;
    @Override
    public int addOpinion(Opinion opinion) {
        return opinionMapper.addOpinion(opinion);
    }

    @Override
    public int insertOpinion(Opinion opinion) {
        return opinionMapper.insertOpinion(opinion);
    }
}
