package com.zlk.zlkproject.user.aboutus.service.impl;

import com.zlk.zlkproject.user.aboutus.mapper.LecturerMapper;
import com.zlk.zlkproject.user.aboutus.service.LecturerService;
import com.zlk.zlkproject.user.entity.Lecturer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LecturerServiceImpl implements LecturerService {
    /*加载外部资源*/
    @Autowired(required = false)
    private LecturerMapper lecturerMapper;
    /*查询讲师合作*/
    @Override
    public List<Lecturer> selectLecturer(){
        return lecturerMapper.selectLecturer();
    }
}
