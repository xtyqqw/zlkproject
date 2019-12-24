package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.RevertService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Revert;
import com.zlk.zlkproject.entity.User;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author gby
 * @ClassName RevertController
 * @description 社区问题回复
 * @date 2019/12/24 17:13
 */
@Controller
@RequestMapping(value = "revert")
public class RevertController {
    @Autowired
    private RevertService revertService;

    @RequestMapping(value = "/addRevert")
    public Map addRevert(Revert revert, HttpServletRequest request)throws Exception{
        User user = (User) request.getSession().getAttribute("user");
        String userId="" + user.getUserId();
        String questionId = (String) request.getSession().getAttribute("questionId");
        HashMap map = new HashMap<>();
        revert.setRevertId(UUIDUtils.getId());
        revert.setUserId(userId);
        revert.setQuestionId(questionId);
        revert.setCreateTime(new Date());
        revert.setZanCount(0);
        revert.setCaiCount(0);
        revert.setRevertCount(0);
        revert.setAccep("0");
        Integer reverts = revertService.addRevert(revert);
        String retmsg;;
        if(reverts == 1){
            retmsg="回复成功";
        }else {
            retmsg="回复失败";
        }
        map.put("retmsg",retmsg);
        return map;
    }
}
