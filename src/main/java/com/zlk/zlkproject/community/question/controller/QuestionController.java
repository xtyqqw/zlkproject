package com.zlk.zlkproject.community.question.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author gby
 * @ClassName QuestionController
 * @description 问答
 * @date 2019/11/26 20:52
 */
@Controller
@RequestMapping(value = "question")
public class QuestionController {

    /*
     * @descrption 社区首页按钮
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:43
     */
    @RequestMapping(value = "/main")
    public String main(){

        return "/view/community/tagTest";
    }

    /*
     * @descrption 提问提示页面
     * @author gby
     * @param
     * @return
     * @date 2019/11/26 20:58
     */
    @RequestMapping(value = "/hint")
    public String hint(){

        return "/view/community/questionGuide";
    }
    /*
     * @descrption 提问编辑页面
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:43
     */
    @RequestMapping(value = "/edit")
    public String edit(){

        return "/view/community/questionEdit";
    }
    /*
     * @descrption 发布问题
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:46
     */
    @RequestMapping(value = "/addQuestion")
    public String addQuestion(){

        return "/view/community/communityMain";
    }


}
