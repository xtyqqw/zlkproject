package com.zlk.zlkproject.course.stunote.controller;

import com.zlk.zlkproject.course.stuNote.service.StuNoteService;
import com.zlk.zlkproject.entity.StuNote;
import com.zlk.zlkproject.entity.StuNoteRes;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stuNote")
public class StuNoteController {
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;
    @Autowired
    private StuNoteService stuNoteService;

    @RequestMapping("uploadPic")
    @ResponseBody
    public Map uploadPic(@RequestParam(name = "file") MultipartFile file) throws Exception{
        Map map = new HashMap();
        String path = commonFileUtil.uploadFile(file);
        String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
        System.out.println(path);
        System.out.println(url);
        String[] arr = {url};
        map.put("errno",0);
        map.put("data",arr);
        return map;
    }

    @RequestMapping("submit")
    @ResponseBody
    public Map submit(StuNote stuNote, HttpServletRequest request){
        HashMap map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        stuNote.setSnSectionId(sectionId);
        stuNote.setSnUserId(userId);
        stuNote.setDate(new Date());
        Integer res = stuNoteService.addStuNote(stuNote);
        String retmsg;
        if (res == 1){
            retmsg = "保存成功";
        }else{
            retmsg = "保存失败";
        }
        map.put("retmsg",retmsg);
        return map;
    }

    @RequestMapping("findStuNote")
    @ResponseBody
    public Map findStuNote(@RequestParam("sectionId") Integer sectionId,
                           @RequestParam("page") Integer page,@RequestParam("size") Integer size,String userId
                            ,HttpServletRequest request){

        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }
        sectionId = (Integer) request.getSession().getAttribute("sectionId");

        HashMap map = new HashMap<>();
        List<StuNoteRes> list = stuNoteService.findStuNote(userId, sectionId, page, size);
        Integer pages = stuNoteService.findCount(sectionId,userId);
        if (pages % 3 != 0){
            pages = pages /3 +1;
        }else{
            pages = pages / 3;
        }
        map.put("notes",list);
        map.put("pages",pages);
        return map;
    }

    @RequestMapping("findStuNoteUp")
    @ResponseBody
    public Map findStuNoteUp(@RequestParam("sectionId") Integer sectionId,
                           @RequestParam("page") Integer page,@RequestParam("size") Integer size,String userId
                            ,HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }
        sectionId = (Integer) request.getSession().getAttribute("sectionId");

        HashMap map = new HashMap<>();
        List<StuNoteRes> list = stuNoteService.findStuNoteUp(userId, sectionId, page, size);
        Integer pages = stuNoteService.findCount(sectionId,userId);
        if (pages % 3 != 0){
            pages = pages /3 +1;
        }else{
            pages = pages / 3;
        }
        map.put("notes",list);
        map.put("pages",pages);
        return map;
    }

    @RequestMapping("upAdd")
    @ResponseBody
    public Map upAdd(@RequestParam("snId") Integer snId, @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.upAdd(snId, userId, "up");
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("downAdd")
    @ResponseBody
    public Map downAdd(@RequestParam("snId") Integer snId, @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.downAdd(snId, userId, "down");
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("upDelete")
    @ResponseBody
    public Map upDelete(@RequestParam("snId") Integer snId, @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.upDelete(snId, userId);
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("downDelete")
    @ResponseBody
    public Map downDelete(@RequestParam("snId") Integer snId, @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.downDelete(snId, userId);
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("upAddDownDelete")
    @ResponseBody
    public Map upAddDownDelete(@RequestParam("snId") Integer snId, @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.upAddDownDelete(snId,userId,"up");
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("downAddUpDelete")
    @ResponseBody
    public Map downAddUpDelete(@RequestParam("snId") Integer snId, @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.downAddUpDelete(snId,userId,"down");
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("report")
    @ResponseBody
    public Map report(@RequestParam("snId") Integer snId, @RequestParam("state") String state){
        HashMap map = new HashMap<>();
        Integer res = stuNoteService.updateReport(snId,state);
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }

    @RequestMapping("collect")
    @ResponseBody
    public Map collect(@RequestParam("snId") Integer snId, @RequestParam("state") String state,
                       @RequestParam("userId") String userId, HttpServletRequest request){
        if(!userId.equals("-1")){
            User user = (User) request.getSession().getAttribute("user");
            userId = "" + user.getUserId();
        }

        HashMap map = new HashMap<>();
        Integer res = stuNoteService.updateCollect(snId,state,userId);
        if (res == 1){
            map.put("error",0);
        }else{
            map.put("error",1);
        }
        return map;
    }
}
