package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.community.question.service.QuestionTagService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;

    /*
     * @descrption 提问提示页面
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:43
     */
    @RequestMapping(value = "/questionGuide")
    public ModelAndView questionGuide(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            mv.addObject("spanmsg", "你还没有登录，请先登录");
            mv.setViewName("/view/signin");
            return mv;
        } else {
            mv.addObject("spanmsg", "您已登录成功，请进行操作");
            mv.setViewName("/view/community/questionGuide");
            return mv;
        }
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
    public String addQuestion(Question question, HttpServletRequest request) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        user.setUserId(userId);
        question.setUser(user);
        questionService.saveQuestion(question);
        return "redirect:/CommunityPage";
    }

    /*makedown图片上传到服务器*/
    @RequestMapping(value = "/uploadMarkdownImg",method= RequestMethod.POST)
    public void uploadMarkdown(HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile file) {
        try {
            String path = commonFileUtil.uploadFile(file);
            String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
            System.out.println(path);
            System.out.println(url);
            //下面response返回的json格式是editor.md所规范的
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"" + url + "\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0, \"message\":\"上传失败\"}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
    //问题编辑页面的图片本地上传方法
    @RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
    public void hello(HttpServletRequest request, HttpServletResponse
            response, @RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {
        try {
            request.setCharacterEncoding("utf-8");
            response.setHeader("Content-Type", "text/html");
            String rootPath = request.getSession(). getServletContext().getRealPath("upload");
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
