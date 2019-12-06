package com.zlk.zlkproject.user.aboutus.service.impl.cxr;

import com.zlk.zlkproject.user.aboutus.mapper.cxr.ContactusMapper;
import com.zlk.zlkproject.user.aboutus.service.cxr.ContactusService;
import com.zlk.zlkproject.user.entity.Contactus;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 20:43
 */
@Service
public class ContactusServiceImpl implements ContactusService {
    @Resource
    private ContactusMapper contactusMapper;
    @Override
    public Contactus secletContactusById(String contactusId) {
        return contactusMapper.secletContactusById(contactusId);
    }
}
