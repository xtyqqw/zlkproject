package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.ResponseService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * @author gby
 * @ClassName ResponseController
 * @description 用户回答
 * @date 2019/12/11 16:27
 */
@Controller
@RequestMapping(value = "response")
public class ResponseController {
    @Autowired
    private ResponseService responseService;

    @RequestMapping("test")
    public String test() {
        return "/view/community/particulars";
    }

    @RequestMapping(value = "/save")
    public String save(Response response) throws Exception {
        response.setResponseId(UUIDUtils.getId());
        response.setCreateTime(new Date());
        response.setCaiCount(0);
        response.setZanCount(0);
        response.setReplyCount(0);
        responseService.save(response);
        return "/view/community/questionParticulars";
    }


}
