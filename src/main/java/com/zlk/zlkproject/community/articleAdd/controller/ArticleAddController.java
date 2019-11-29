package com.zlk.zlkproject.community.articleAdd.controller;

import com.alibaba.fastjson.JSONArray;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

    //给发文规则提示页面提供接口
    @RequestMapping(value = "/community/article-guide")
    public String articleGuide(){
        return "view/community/articleGuide";
    }

    //给暂无更多文章提示页面提供接口
    @RequestMapping(value = "/community/article-no")
    public String articleNo(){
        return "view/community/articleNo";
    }

    //发文编辑页面接口
    @GetMapping(value = "/community/articleEdit")
    public String editArticle(HttpServletRequest request, HttpServletResponse response) {
        return "view/community/articleEdit";
    }

    /**
     * @description: 增加文章
     * @param article
     * @param setTags
     * @return: org.springframework.web.servlet.ModelAndView
     * @author: QianKeQin
     * @date: 2019/11/28 12:11
     */
    @RequestMapping(value = "/community/article-add")
    public ModelAndView insert(Article article, HttpServletRequest request, @RequestParam(value = "setTags")String setTags) {
        ModelAndView mv=new ModelAndView();
        //使用主键生成器给主键赋值
        article.setArticleId(UUIDUtils.getId());
        //发表文章时设置发文时间
        article.setCreateTime(new Date());
        //发表文章时默认审核状态为审核中
        article.setApproval(0);
        //发表文章时默认置顶状态为不置顶
        article.setArticleSetTop(1);
        //HttpSession session=request.getSession();
        article.setUserId(UUIDUtils.getId());
        Integer flag=articleAddService.createArticle(article);
        if (flag==1 && setTags!=null) {
            //解析前台选择的类别
            List<Tag> tagList= JSONArray.parseArray(setTags,Tag.class);
            List<Integer> integerList=new ArrayList<>();
            for (Tag tag : tagList) {
                //文章选择类别
                integerList.add(articleAddService.setArticleTags(article.getArticleId(), tag.getTagId()));
            }
            for (Integer integer : integerList) {
                if (integer == 0) {
                    mv.addObject("flag", "true");
                    mv.addObject("msg", "遇到意外错误");
                    mv.setViewName("view/community/articleEdit");
                    return mv;
                }
            }
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
