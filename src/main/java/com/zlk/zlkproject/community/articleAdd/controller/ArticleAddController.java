package com.zlk.zlkproject.community.articleAdd.controller;

import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Article;
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

    @RequestMapping(value = "/community/article-guide")
    public String articleGuide(){
        return "view/community/articleGuide";
    }

    @RequestMapping(value = "/community/article-no")
    public String articleNo(){
        return "view/community/articleNo";
    }

    @RequestMapping(value = "/community/article-add")
    public ModelAndView insert(Article article) {
        ModelAndView mv=new ModelAndView();
        article.setArticleId(UUIDUtils.getId());
        article.setCreateTime(new Date());
        article.setApproval(0);
        article.setArticleSetTop(1);
        Integer flag=articleAddService.createArticle(article);
        if (flag==1) {
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("view/community/articleGuide");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("view/community/articleEdit");
            return mv;
        }
    }

    @GetMapping(value = "/community/articleEdit")
    public String editArticle(HttpServletRequest request, HttpServletResponse response) {
        return "view/community/articleEdit";
    }

    //文章编辑页面的图片上传方法
    @RequestMapping(value="/uploadfile",method= RequestMethod.POST)
    public void hello(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "editormd-image-file", required = false) MultipartFile attach){
        try {
            request.setCharacterEncoding( "utf-8" );
            response.setHeader( "Content-Type" , "text/html" );
            String rootPath = request.getSession().getServletContext().getRealPath("upload");
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
