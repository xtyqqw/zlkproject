package com.zlk.zlkproject.admin.shiro;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @ClassName ShrioConfig
 * @Description: Shiro配置类
 * @Author lufengxiang
 * Date 2019/11/18 17:52
 **/
@Configuration
public class ShrioConfig {

    /**
     * @return org.apache.shiro.spring.web.ShiroFilterFactoryBean
     * @Author lufengxiang
     * @Description //TODO 创建ShiroFilterFactoryBean
     * @Date 18:04 2019/11/18
     * @Param [securityManager]
     **/
    @Bean
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Qualifier("securityManager") DefaultWebSecurityManager securityManager) {
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        //设置安全管理器
        shiroFilterFactoryBean.setSecurityManager(securityManager);
        //修改拦截跳转页面
        shiroFilterFactoryBean.setLoginUrl("/loginController/toLogin");
        shiroFilterFactoryBean.setSuccessUrl("/loginController/toSuccess");
        //添加Shiro内置过滤器
        Map<String, String> filterMap = new LinkedHashMap<String, String>();
        filterMap.put("/loginController/login", "anon");
        filterMap.put("/loginController/*", "authc");
        filterMap.put("/admin/*", "authc");
        filterMap.put("/role/*", "authc");
        filterMap.put("/dept/*", "authc");
        filterMap.put("/log/*", "authc");
        filterMap.put("/function/*", "authc");
        filterMap.put("/tag/*", "authc");
        filterMap.put("/type/*", "authc");
        filterMap.put("/user/*", "authc");
        filterMap.put("/article/*", "authc");
        filterMap.put("/courseManager/*", "authc");
        filterMap.put("/stuQaManager/*", "authc");
        filterMap.put("/note/*", "authc");
        filterMap.put("/chapterManager/*", "authc");
        filterMap.put("/SMC/*", "authc");
        filterMap.put("/stuCmt/*","authc");
        filterMap.put("/exercisesManager/*","authc");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterMap);
        return shiroFilterFactoryBean;
    }

    /**
     * @return org.apache.shiro.web.mgt.DefaultWebSecurityManager
     * @Author lufengxiang
     * @Description //TODO 创建DefaultWebSecurityManager
     * @Date 18:04 2019/11/18
     * @Param [realm]
     **/
    @Bean(name = "securityManager")
    public DefaultWebSecurityManager getDefaultWebSecurityManager(@Qualifier("realm") Realm realm) {
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        //关联Realm
        securityManager.setRealm(realm);
        return securityManager;
    }

    /**
     * @return com.zlk.zlkproject.admin.shiro.Realm
     * @Author lufengxiang
     * @Description //TODO 创建Realm
     * @Date 18:03 2019/11/18
     * @Param []
     **/
    @Bean(name = "realm")
    public Realm getRealm() {
        return new Realm();
    }
}
