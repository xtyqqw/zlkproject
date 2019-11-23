package com.zlk.zlkproject.community.comment.utility;

import com.zlk.zlkproject.community.comment.config.StaticConfigParam;
import com.zlk.zlkproject.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @program: ContentUtility
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 14:51
 */
public class ContentUtility {

    public static int getCurrentUserId(HttpServletRequest request){
        HttpSession session=request.getSession();
        if(session.getAttribute(StaticConfigParam.LOGIN_IN_USER_ID)!=null){
            return (Integer)session.getAttribute(StaticConfigParam.LOGIN_IN_USER_ID);
        }else{
            return -1;
        }
    }
    public static User getCurrentUserBySession(HttpSession session){
        if(session.getAttribute(StaticConfigParam.LOGIN_USER)!=null){
            return (User)session.getAttribute(StaticConfigParam.LOGIN_USER);
        }else {
            return null;
        }
    }
}
