package com.zlk.zlkproject.community.articleAdd.controller;

import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddTagService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
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

    //给发文规则提示页面提供接口
    @RequestMapping(value = "/community/article-guide")
    public ModelAndView articleGuide(Article article, HttpServletRequest httpServletRequest) throws Exception{
        ModelAndView mv=new ModelAndView();
        //进入发文提示页面前先判断当前用户的登录状态
        article.setUser((User) httpServletRequest.getSession().getAttribute("user"));
        if (httpServletRequest.getSession().getAttribute("user") == null){
            mv.addObject("flag", "true");
            mv.addObject("msg","想发文，请先进行登录");
            mv.setViewName("view/");
        }
        //进入发文提示页面前先判断当前用户下发表的所有文章的审核状态
        Article approval=articleAddService.getArticleInApproval(article.getApproval());
        if (approval != null) {
            if (article.getApproval()==1) {
                mv.addObject("flag", "true");
                mv.addObject("msg","可以发文");
                mv.setViewName("view/community/articleGuide");
            }else if (article.getApproval()==0){
                mv.addObject("flag", "true");
                mv.addObject("msg","你的文章正在审核中，通过以后才能继续发表文章，我们会尽快处理，给您反馈");
                mv.setViewName("view/");
            }else {
                mv.addObject("flag", "true");
                mv.addObject("msg","你之前的文章审核失败，以后发表文章请注意撰文规则，感谢您的配合");
                mv.setViewName("view/");
            }
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
    public String post(Article article, RedirectAttributes attributes, HttpServletRequest httpServletRequest) throws Exception {
        //article.setUser((User) httpServletRequest.getSession().getAttribute("user"));
        article.setTags(articleAddTagService.listTags(article.getTagIds()));
        Article a=articleAddService.saveArticle(article);
        if (a == null) {
            attributes.addFlashAttribute("message","操作失败");
        } else {
            attributes.addFlashAttribute("message","操作成功");
        }
        return "redirect:/community/article-guide";
    }

    //文章编辑页面的图片上传方法
    @RequestMapping(value="/uploadfile",method= RequestMethod.POST)
    public void hello(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );
            String rootPath = request.getSession().getServletContext().getRealPath("upload");
            //文件路径不存在则需要创建文件路径
            File filePath=new File(rootPath);
            if(!filePath.exists()){
                filePath.mkdirs();
            }
            //最终文件名
            File realFile=new File(rootPath+File.separator+attach.getOriginalFilename());
            FileUtils.copyInputStreamToFile(attach.getInputStream(), realFile);
            //下面response返回的json格式是editor.md所限制的,规范输出就OK
            response.getWriter().write( "{\"success\": 1, \"message\":\"上传成功\",\"url\":\"/upload/" + attach.getOriginalFilename() + "\"}" );
        } catch (Exception e) {
            try {
                response.getWriter().write( "{\"success\":0, \"message\":\"上传失败\"}" );
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
