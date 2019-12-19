package com.zlk.zlkproject.community.articleAdd.controller;

import com.zlk.zlkproject.community.articleAdd.service.ActionAddService;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddTagService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.Action;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * @program: ArticleAddController
 * @description: 创建文章控制类
 * @author: QianKeQin
 * @date: 2019/11/25 10:03
 */

@Controller
public class ArticleAddController {

    @Autowired
    private ArticleAddService articleAddService;
    @Autowired
    private ArticleAddTagService articleAddTagService;
    @Autowired
    private ActionAddService actionAddService;
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;

    //给发文规则提示页面提供接口
    @RequestMapping(value = "/community/article-guide")
    public ModelAndView articleGuide(Article article, HttpServletRequest request) throws Exception{
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView mv=new ModelAndView();
        if (user == null){
            mv.addObject("msg","未登录");
            mv.setViewName("redirect:/CommunityPage");
        }else {
            mv.setViewName("view/community/articleGuide");
        }
        return mv;
    }

    //给暂无更多文章提示页面提供接口
    @RequestMapping(value = "/community/article-no")
    public String articleNo(){
        return "view/community/articleNo";
    }

    //发文编辑页面接口
    @GetMapping(value = "/community/article-edit")
    public ModelAndView articleInput(Tag tag) {
        ModelAndView mv=new ModelAndView();
        List<Tag> tagsList=articleAddTagService.listTag();
        mv.addObject("tags",tagsList);
        mv.setViewName("view/community/articleEdit");
        return mv;
    }

    //创建文章的请求方法
    @PostMapping(value = "/articles")
    public String post(Article article, HttpServletRequest request) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        user.setUserId(userId);
        article.setUser(user);
        article.setTags(articleAddTagService.listTags(article.getTagIds()));
        Article a=articleAddService.saveArticle(article);
        return "redirect:/CommunityPage";
    }

    //文章编辑页面的图片上传方法
    @RequestMapping(value = "/uploadMarkdown",method= RequestMethod.POST)
    public void uploadMarkdown(HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile file) {
        try {
            String path = commonFileUtil.uploadFile(file);
            String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
            System.out.println(path);
            System.out.println(url);
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"" + url + "\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0, \"message\":\"上传失败\"}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }

    //文章编辑页面的图片上传方法,测试用
    @RequestMapping(value="/uploadFile",method= RequestMethod.POST)
    public void hello(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );
            String rootPath = request.getSession().getServletContext().getRealPath("uploadFolder");
            //文件路径不存在则需要创建文件路径
            File filePath=new File(rootPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            //最终文件名
            File realFile=new File(rootPath+File.separator+attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            //下面response返回的json格式是editor.md所限制的,规范输出就OK
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/uploadFolder/" + attach.getOriginalFilename() + "\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0, \"message\":\"上传失败\"}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}