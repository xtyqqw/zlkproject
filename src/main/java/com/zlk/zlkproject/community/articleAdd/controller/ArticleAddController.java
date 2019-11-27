package com.zlk.zlkproject.community.articleAdd.controller;

import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.community.comment.utility.ContentUtility;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
    @ResponseBody
    public Map<String, String> createArticle(@RequestParam(value = "articleContent", required = true) String articleContent,
                                             @RequestParam(value = "title", required = true) String title,
                                             @RequestParam(value = "articleDigest", required = true) String articleDigest,
                                             @RequestParam(value = "tagName", required = true) String tagName,
                                             @RequestParam(value = "typeName", required = true) String typeName,
                                             HttpServletRequest request,
                                             HttpServletResponse response) {

        Map<String, String> map=new HashMap<>();
        int id;
        if ((id= ContentUtility.getCurrentUserId(request))!=-1) {
            Article article=new Article(id,articleContent,title,articleDigest,tagName,typeName);
            List<Integer> arttcleTagsList=new ArrayList<>();
            if (tagName.length()>4) {
                String[] tags=tagName.split(",");
                for (String tag : tags) {
                    if (tag.length() > 3) {
                        arttcleTagsList.add(Integer.parseInt(tag));
                    }
                }
            }
            articleAddService.createArticle(article, arttcleTagsList);
            map.put("articleId",""+article.getArticleId());
        } else {
            map.put("error", "请先去登录");
        }
        return map;
    }

    /*@RequestMapping(value = "/insert")
    @ResponseBody
    public ModelAndView insert(Article article, List<Integer> tagId) throws Exception{
        ModelAndView mv=new ModelAndView();
        Integer flag=articleAddService.createArticle(article, tagId);
        if(flag == 1){
            mv.setViewName("");
            return mv;
        }else {
            return null;
        }
    }*/

    @GetMapping(value = "/community/articleEdit")
    public String editArticle(HttpServletRequest request, HttpServletResponse response, Model model) {
        return "view/community/articleEdit";
    }

    //@Value("${file.uploadPath}")
    private String uploadFilePath;

    //文章编辑页面的图片上传方法
    @RequestMapping(value = "/article/uploadImage")
    public @ResponseBody
    Map<String, String> getArticleImage(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        String trueFileName = file.getOriginalFilename();
        String suffix = trueFileName.substring(trueFileName.lastIndexOf("."));
        String fileName = System.currentTimeMillis() + "_" + (new Random().nextInt(89999) + 10000) + suffix;
        String path = uploadFilePath;
        //System.out.println(path);
        File target = new File(path, fileName);
        Map<String, String> map = new HashMap<>();
        try {
            file.transferTo(target);
            map.put("success", "1");
            map.put("message", "上传成功");
        } catch (IOException e) {
            map.put("success", "0");
            map.put("message", "上传失败");
            e.printStackTrace();
        }
        map.put("url", "/" + fileName);
        return map;
    }
}
