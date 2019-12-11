package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.community.question.service.QuestionTagService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author gby
 * @ClassName QuestionController
 * @description 发表提问
 * @date 2019/11/26 20:52
 */
@Controller
@RequestMapping(value = "question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private QuestionTagService questionTagService;

    /*
     * @descrption 提问提示页面
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:43
     */
    @RequestMapping(value = "/questionGuide")
    public ModelAndView main(HttpServletRequest request, Question question, String userId) throws Exception {
        ModelAndView mv = new ModelAndView();
 /*       Integer user = questionService.selectUserId(question);
        if (user != null) {
            mv.addObject("msg", "您已登录成功，请进行操作");
            mv.setViewName("/view/community/questionGuide");
            Integer check1 = questionService.selectCheck(userId);
            if (check1 != null) {
                if (question.getCheck() == 1) {
                    question.setCheck(1);
                    mv.addObject("flag", "true");
                    mv.addObject("msg", "可以发文");
                    mv.setViewName("/view/community/questionGuide");
                } else if (question.getCheck() == 0) {
                    mv.addObject("flag", "true");
                    mv.addObject("msg", "你的提问正在审核中，通过以后才能继续发表提问，我们会尽快处理，给您反馈");
                    mv.setViewName("/view/community/");
                } else {
                    mv.addObject("flag", "true");
                    mv.addObject("msg", "你之前的提问审核失败，以后发表提问请注意撰文规则，感谢您的配合");
                    mv.setViewName("/view/community");
                }
            } else {
                mv.addObject("msg", "你还没有登录，请先登录");
                mv.setViewName("/view/signin");
            }
        }*/
        mv.setViewName("/view/community/questionGuide");
        return mv;
    }

    /*
     * @descrption  提问编辑页面
     * @author gby
     * @param [type, typeName]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/12/3 14:20
     */
    @RequestMapping(value = "/editQuestion")
    public String edit(Model model, Tag tag) throws Exception {
        List<Tag> tagList = questionTagService.listByTag(tag);
        model.addAttribute("tagList", tagList);
        return "/view/community/questionEdit";
    }

    /*
     * @descrption 发布问题
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:46
     */
    @PostMapping(value = "/addQuestion")
    public ModelAndView addQuestion(Question question, User user) throws Exception {
        ModelAndView mv = new ModelAndView();
        question.setQuestionId(UUIDUtils.getId());
        question.setCreateTime(new Date());
        //发布文章的动态的状态为1
        question.setSolve(0);
        question.setZanCount(0);
        question.setCaiCount(0);
        question.setBrowseCount("0");
        question.setQuestionSetTop("1");
        question.setResponseCount(0);
        question.setAudit("1");
        question.setUserId(user.getUserRealname());
        questionService.addQuestion(question);
        if (question != null) {
            mv.addObject("flag", "true");
            mv.addObject("error", "发表成功");
            mv.setViewName("redirect:/articles/toLogin");
        } else {
            mv.addObject("flag", "true");
            mv.addObject("error", "格式不符合要求");
            mv.setViewName("redirect:/question/editQuestion");
        }
        return mv;
    }

    //文章编辑页面的图片上传方法
    @RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
    public void hello(HttpServletRequest request, HttpServletResponse
            response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            String rootPath = request.getSession().getServletContext().getRealPath("upload");
            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath = new File(rootPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            //最终文件名
            File realFile = new File(rootPath + File.separator + attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            //下面response返回的json格式是editor.md所限制的，规范输出就OK
            response.getWriter().write("{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/upload/" + attach.getOriginalFilename() + "\"}");
        } catch (Exception e) {
            try {
                response.getWriter().write("{\"success\":0, \"message\":\"上传失败\"}");
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
