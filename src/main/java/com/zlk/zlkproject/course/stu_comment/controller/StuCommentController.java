package com.zlk.zlkproject.course.stu_comment.controller;

import com.zlk.zlkproject.course.stu_comment.service.StuCommentService;
import com.zlk.zlkproject.entity.StuComment;

import com.zlk.zlkproject.utils.FdfsConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("stuComment")
public class StuCommentController {

    @Autowired
    private FdfsConfig fdfsConfig;
    @Autowired
    private StuCommentService stuCommentService;

    @RequestMapping("uploadPic")
    @ResponseBody
    public Map uploadPic(@RequestParam(name = "file") MultipartFile file) throws Exception{
        Map map = new HashMap();
        /*String path = commonFileUtil.uploadFile(file);
        String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
        System.out.println(path);
        System.out.println(url);*/
        String[] arr = {"http://47.98.183.4:8888/group1/M00/00/00/rBBUH13d2WmALLHIAAJJwIweOCo999.jpg"};
        map.put("errno",0);
        map.put("data",arr);
        return map;
    }

    @RequestMapping("submit")
    @ResponseBody
    public Map submit(StuComment stuComment){
        HashMap map = new HashMap<>();
        stuComment.setPId(0);
        stuComment.setDate(new Date());
        Integer res = stuCommentService.addStuCmt(stuComment);
        String retmsg;
        if (res == 1){
            retmsg = "保存成功";
        }else{
            retmsg = "保存失败";
        }
        map.put("retmsg",retmsg);
        return map;
    }


}
