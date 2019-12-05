package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.community.question.service.QuestionTagService;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.Tag;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author gby
 * @ClassName QuestionController
 * @description 问答
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
     * @descrption 提问首页
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/5 10:19
     */
    @RequestMapping(value = "/questionMain")
    public String question(){

        return "/view/community/main";
    }

    /*
     * @descrption 社区首页按钮
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:43
     */
    @RequestMapping(value = "/main")
    public ModelAndView main(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        Object userId = request.getSession().getAttribute("userId");
        if (userId == null) {
            mv.addObject("msg","你还没有登录，请先登录");
            mv.setViewName("redirect:/user/test");
            return mv;
        } else {
            mv.addObject("msg","您已登录成功，请进行操作");
            mv.setViewName("/view/community/questionMain");
            return mv;
        }
    }

    /*
     * @descrption 提问提示页面
     * @author gby
     * @param
     * @return
     * @date 2019/11/26 20:58
     */
    @RequestMapping(value = "/hint")
    public String hint() {

        return "/view/community/questionGuide";
    }

    /*
     * @descrption  提问编辑页面
     * @author gby
     * @param [type, typeName]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/12/3 14:20
     */
    @RequestMapping(value = "/editQuestion")
    public ModelAndView edit(Tag tag) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Tag> tagList = questionTagService.listTagAll();
        mv.addObject("tagList",tagList);
        mv.setViewName("/view/community/questionEdit");
        return mv;
    }

    /*
     * @descrption 发布问题
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:46
     */
    @PostMapping(value = "/addQuestion")
    public String addQuestion(Question question, RedirectAttributes attributes) throws Exception {
        Integer qu = questionService.addQuestion(question);
        if (qu != null){
            attributes.addAttribute("msg","发表成功");
            return "/view/community/communityMain";
        }else {
            attributes.addAttribute("msg","发表失败");
            return "/view/community/questionEdit";
        }
    }

    //文章编辑页面的图片上传方法
    @RequestMapping(value="/uploadImg",method= RequestMethod.POST)
    public void hello(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );
            String rootPath = request.getSession().getServletContext().getRealPath("community/upload1");
            /**
             * 文件路径不存在则需要创建文件路径
             */
            File filePath=new File(rootPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            //最终文件名
            File realFile=new File(rootPath+File.separator+attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            //下面response返回的json格式是editor.md所限制的，规范输出就OK
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/community/upload1/" + attach.getOriginalFilename() + "\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0, \"message\":\"上传失败\"}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }


}
