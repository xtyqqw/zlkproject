package com.zlk.zlkproject.user.aboutus.service.impl.cxr;

import com.zlk.zlkproject.user.aboutus.mapper.cxr.AboutUsMapper;
import com.zlk.zlkproject.user.aboutus.service.cxr.AboutUsService;
import com.zlk.zlkproject.user.entity.AboutUs;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 崔新睿
 * @data 2019/11/22 - 9:55
 */
@Service
public class AboutUsServiceImpl implements AboutUsService {
    @Resource
    private AboutUsMapper aboutUsMapper;
    @Override
    public AboutUs selectAboutUsById(String aboutusId) {
        return aboutUsMapper.selectAboutUsById(aboutusId);
    }
}
