package com.zlk.zlkproject.course.comment.controller;

import com.zlk.zlkproject.course.comment.service.CommentService;
import com.zlk.zlkproject.entity.Comment;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/findCommentListByUserId")
    @ResponseBody
    public Map<String,Object> findCommentListByUserId(Comment comment,Integer page,Integer limit,Integer commentUserId)throws Exception{
        List<Comment> commentList=commentService.findCommentListByUserId(comment,page,limit,commentUserId);

        Map<String,Object> map=new HashMap<>();
        map.put("commentList",commentList);
        return map;
    }


}
