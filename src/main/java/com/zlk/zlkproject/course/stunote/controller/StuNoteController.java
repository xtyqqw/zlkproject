package com.zlk.zlkproject.course.stuNote.controller;

import com.zlk.zlkproject.course.stuNote.service.StuNoteService;
import com.zlk.zlkproject.entity.StuNote;
import com.zlk.zlkproject.utils.CommonFileUtil;
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
    public Map submit(StuNote stuNote){
        HashMap map = new HashMap<>();
        stuNote.setSnSectionId(1);
        stuNote.setSnUserId(1);
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
}
