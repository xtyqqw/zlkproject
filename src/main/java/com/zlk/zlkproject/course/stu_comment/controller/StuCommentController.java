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
import java.util.List;
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

    @RequestMapping("replySubmit")
    @ResponseBody
    public Map replySubmit(StuComment stuComment){
        HashMap map = new HashMap<>();
        stuComment.setDate(new Date());
        Integer res = stuCommentService.addStuCmt(stuComment);
        String retmsg;
        if (res == 1){
            retmsg = "回复成功";
        }else{
            retmsg = "回复失败";
        }
        map.put("retmsg",retmsg);
        return map;
    }

    @RequestMapping("findStuCmt")
    @ResponseBody
    public Map findStuCmt(@RequestParam("sectionId") Integer sectionId,
                           @RequestParam("page") Integer page,@RequestParam("size") Integer size){
        Map map = new HashMap();
        List<StuComment> stuCmtList = stuCommentService.findStuCmt(sectionId, page, size);
        Integer pages = stuCommentService.findCount(sectionId);
        if (pages % 3 != 0){
            pages = pages /3 +1;
        }else{
            pages = pages / 3;
        }
        map.put("comments",stuCmtList);
        map.put("pages",pages);
        return map;
    }

    @RequestMapping("updateUD")
    @ResponseBody
    public Map updateUD(@RequestParam("userId") String userId,
                          @RequestParam("smId") Integer smId,@RequestParam("type") String type){
        Map map = new HashMap();
        Integer res = stuCommentService.updateUD(userId, smId, type);
        Integer error = 1;
        if (res == 1)
            error = 0;
        map.put("error",error);
        return map;
    }

    @RequestMapping("updateReport")
    @ResponseBody
    public Map updateReport(@RequestParam("smId") Integer smId,@RequestParam("report") String report){
        Map map = new HashMap();
        Integer res = stuCommentService.updateReport(smId,report);
        Integer error = 1;
        if (res == 1)
            error = 0;
        map.put("error",error);
        return map;
    }

}
