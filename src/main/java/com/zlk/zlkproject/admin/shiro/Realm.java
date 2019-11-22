package com.zlk.zlkproject.admin.shiro;

import com.zlk.zlkproject.admin.service.LoginService;
import com.zlk.zlkproject.entity.Admin;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @ClassName Realm
 * @Description: 自定义Realm
 * @Author lufengxiang
 * Date 2019/11/18 17:53
 **/
public class Realm extends AuthorizingRealm {

    @Autowired
    private LoginService loginService;

    /**
     * @Author lufengxiang
     * @Description //TODO shiro授权方法
     * @Date 17:55 2019/11/18
     * @Param [principalCollection]
     * @return org.apache.shiro.authz.AuthorizationInfo
     **/
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO shiro认证方法
     * @Date 17:55 2019/11/18
     * @Param [authenticationToken]
     * @return org.apache.shiro.authc.AuthenticationInfo
     **/
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authenticationToken;
        Admin admin = loginService.findAdminByAdminName(token.getUsername());
        if(admin==null){
            throw new UnknownAccountException("该用户不存在");
        }
        String adminPassword=admin.getAdminPassword();
        return new SimpleAuthenticationInfo(token.getPrincipal(),adminPassword,getName());
    }
}
