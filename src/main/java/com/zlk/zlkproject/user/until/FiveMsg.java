package com.zlk.zlkproject.user.until;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.MyFollower;

/**
 * @program: FiveMsg
 * @description: 计算用户学习5项信息
 * @author: xty
 * @create: 2019/11/27 13:41
 **/
public class FiveMsg {
    public static MyFollower userFiveMsg(MyFollower myFollower){

        //计算技能水平
        myFollower.setStudyStandard(Arith.ride(myFollower.getUserAllTime()));
        //计算学习成长量
        myFollower.setStudyGrowup(Arith.plus(myFollower.getUserDateTime()));
        //计算学习力
        myFollower.setStudyPower(myFollower.getUserAllTime()+myFollower.getUserDateTime()*3);
        //计算学习聊率
        myFollower.setStudyEfficiency(myFollower.getUserAllTime()/3+myFollower.getUserDateTime());
        return myFollower;
    }
}
