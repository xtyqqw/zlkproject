package com.zlk.zlkproject.course.comment.controller;

import com.zlk.zlkproject.course.comment.service.CommentService;
import com.zlk.zlkproject.course.stu_comment.service.StuCommentService;
import com.zlk.zlkproject.entity.Comment;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.StuComment;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName CommentController
 * @Description: 控制层
 * @Author LuanKe
 * Date 2019/11/27 9:52
 **/
@Controller(value = "CommentController")
@RequestMapping(value="/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private StuCommentService stuCommentService;

    @RequestMapping(value = "/findCommentListByUserId")
    @ResponseBody
    public Map<String,Object> findCommentListByUserId(HttpServletRequest request,Comment comment, Integer page, Integer limit)throws Exception{
        User user=(User) request.getSession().getAttribute("user");
        String userId=user.getUserId();
        int yeishu = commentService.findCommentCountByUserId(userId)/limit;
        if(commentService.findCommentCountByUserId(userId)%limit!=0){
            yeishu++;
        }
       /*判断前三热门详情*/
        List<Comment> commentList=commentService.findCommentListByUserId(comment,page,limit,userId);
        if (page==1){
            for(Comment comment1:commentList){
                comment1.setFlag("true");
            }
        }else if (page==2){
            commentList.get(0).setFlag("true");
        }

        Map<String,Object> map=new HashMap<>();
        map.put("commentList",commentList);
        map.put("yeishu",yeishu);
        return map;
    }

    @RequestMapping(value = "/findStuCommentListByUserId")
    @ResponseBody
    public Map<String,Object> findStuCommentListByUserId(HttpServletRequest request, StuComment stuComment, Integer page, Integer limit)throws Exception{
        User user=(User) request.getSession().getAttribute("user");
        String userId=user.getUserId();
        int yeishu = stuCommentService.findStuCommentCountByUserId(userId)/limit;
        if(stuCommentService.findStuCommentCountByUserId(userId)%limit!=0){
            yeishu++;
        }
        /*判断前三热门详情*/
        List<StuComment> stuCommentList=stuCommentService.findStuCommentListByUserId(stuComment,page,limit,userId);
        if (page==1){
            for(StuComment stuComment1:stuCommentList){
                stuComment1.setFlag("true");
            }
        }else if (page==2){
            stuCommentList.get(0).setFlag("true");
        }

        Map<String,Object> map=new HashMap<>();
        map.put("stuCommentList",stuCommentList);
        map.put("yeishu",yeishu);
        return map;
    }

}
