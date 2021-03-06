package com.zlk.zlkproject.community.comment.controller;

import com.zlk.zlkproject.community.comment.service.ArticleCommentsService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.ArticleComment;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: CommentController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:34
 */

@Controller
@RequestMapping(value = "/artComment")
public class ArticleCommentsController {

    @Autowired
    private ArticleCommentsService articleCommentsService;

    @RequestMapping(value = "/submit")
    @ResponseBody
    public Map submit(ArticleComment articleComment, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        HashMap map = new HashMap<>();
        String userId = "" + user.getUserId();
        String articleId = (String) request.getSession().getAttribute("articleId");
        Article article = (Article) request.getSession().getAttribute("article");
        Integer articleCommentCount = article.getCommentCount();
        article.setCommentCount(articleCommentCount+1);
        articleComment.setArticleId(articleId);
        articleComment.setUserId(userId);
        articleComment.setPId(0);
        articleComment.setDate(new Date());
        Integer count = articleCommentsService.countByArticle(article);
        Integer res = articleCommentsService.addArtCmt(articleComment);
        String retmsg;
        if (res == 1) {
            retmsg = "评论成功";
        }else {
            retmsg = "评论失败";
        }
        map.put("count",count);
        map.put("retmsg",retmsg);
        return map;
    }

    @RequestMapping(value = "/replySubmit")
    @ResponseBody
    public Map replySubmit(ArticleComment articleComment, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        String articleId = (String) request.getSession().getAttribute("articleId");
        Article article = (Article) request.getSession().getAttribute("article");
        HashMap map = new HashMap<>();
        Integer articleCommentCount = article.getCommentCount();
        article.setCommentCount(articleCommentCount+1);
        articleComment.setArticleId(articleId);
        articleComment.setUserId(userId);
        articleComment.setDate(new Date());
        Integer count = articleCommentsService.countByArticle(article);
        Integer res = articleCommentsService.addArtCmt(articleComment);
        String retmsg;
        if (res == 1) {
            retmsg = "回复成功";
        }else {
            retmsg = "回复失败";
        }
        map.put("count",count);
        map.put("retmsg",retmsg);
        return map;
    }

    @RequestMapping(value = "/findArtCmt")
    @ResponseBody
    public Map findArtCmt(@RequestParam("articleId") String articleId,
                          @RequestParam("page") Integer page,@RequestParam("size") Integer size, HttpServletRequest request) {
        articleId = (String) request.getSession().getAttribute("articleId");
        Map map = new HashMap();
        List<ArticleComment> artCmtList = articleCommentsService.findArtCmt(articleId, page, size);
        Integer pages = articleCommentsService.findArtCmtCount(articleId);
        if (pages % 3 != 0){
            pages = pages /3 +1;
        }else{
            pages = pages / 3;
        }
        map.put("comments",artCmtList);
        map.put("pages",pages);
        return map;
    }

    @RequestMapping(value = "/updateZC")
    @ResponseBody
    public Map updateZC(@RequestParam("userId") String userId,
                        @RequestParam("articleCommentId") Integer articleCommentId,
                        @RequestParam("type") String type, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        userId = "" + user.getUserId();
        Map map = new HashMap();
        Integer res = articleCommentsService.updateZC(userId, articleCommentId, type);
        Integer error = 1;
        if (res == 1) {
            error = 0;
        }
        map.put("error",error);
        return map;
    }

    @RequestMapping(value = "/updateInform")
    @ResponseBody
    public Map updateInform(@RequestParam("articleCommentId") Integer articleCommentId,
                            @RequestParam("inform") String inform) {
        Map map = new HashMap();
        Integer res = articleCommentsService.updateArtCmtInform(articleCommentId, inform);
        Integer error = 1;
        if (res == 1) {
            error = 0;
        }
        map.put("error",error);
        return map;
    }
}
