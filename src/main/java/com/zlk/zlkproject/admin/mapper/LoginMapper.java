package com.zlk.zlkproject.admin.mapper;

import com.zlk.zlkproject.entity.Admin;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    Admin findAdminByAdminName(String adminName);
}
