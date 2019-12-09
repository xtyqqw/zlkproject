package com.zlk.zlkproject.course.sections_manager.controller;

import com.zlk.zlkproject.course.sections_manager.service.SectionsManagerService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Section;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/SMC")
public class SectionsManagerController {
    @Autowired
    private SectionsManagerService sectionsManagerService;
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;

    @RequestMapping(value = "/uploadVideo")
    @ResponseBody
    public Map uploadTest(@RequestParam(name = "file") MultipartFile file) throws Exception{
        Map map = new HashMap();
        File resFile = sectionsManagerService.multipartFileToFile(file);
        Encoder encoder = new Encoder();
        MultimediaInfo m = encoder.getInfo(resFile);
        long ms = m.getDuration();
        int time = (int) (ms/1000);

        String path = commonFileUtil.uploadFile(file);
        String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
        System.out.println(path);
        System.out.println(url);
        map.put("code",0);
        map.put("time",time);
        map.put("path",path);
        map.put("url",url);
        map.put("retmsg","上传完成");
        return map;
    }

    @RequestMapping(value = "/toSectionsManager")
    public ModelAndView toSectionsManager() throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Courses> res = sectionsManagerService.findAllCourseAndChapter();
        mv.addObject("CourseAndChapter",res);
        mv.setViewName("admin/sectionsManager");
        return mv;
    }

    @RequestMapping("/findAllData")
    @ResponseBody
    public Map findAllData(@RequestParam("page") Integer page, @RequestParam("limit") Integer size){
        Map map = new HashMap();
        List<Section> res = sectionsManagerService.findAllData(page, size);
        Integer count = sectionsManagerService.findAllCount();
        map.put("code",0);
        map.put("count",count);
        map.put("data",res);
        return map;
    }

    @RequestMapping("/findDataByCourseId")
    @ResponseBody
    public Map findDataByCourseId(@RequestParam("page") Integer page
                                , @RequestParam("limit") Integer size,@RequestParam("courseId") Integer courseId){
        Map map = new HashMap();
        List<Section> res = sectionsManagerService.findDataByCourseId(page,size,courseId);
        Integer count = sectionsManagerService.findCountByCourseId(courseId);
        map.put("code",0);
        map.put("count",count);
        map.put("data",res);
        return map;
    }

    @RequestMapping("/findDataByChapterId")
    @ResponseBody
    public Map findDataByChapterId(@RequestParam("page") Integer page
            , @RequestParam("limit") Integer size,@RequestParam("chapterId") Integer chapterId){
        Map map = new HashMap();
        List<Section> res = sectionsManagerService.findDataByChapterId(page,size,chapterId);
        Integer count = sectionsManagerService.findCountByChapterId(chapterId);
        map.put("code",0);
        map.put("count",count);
        map.put("data",res);
        return map;
    }

    @RequestMapping("/findCourseAndChapterById")
    @ResponseBody
    public Map findCourseAndChapterById(@RequestParam("courseId") Integer courseId){
        Map map = new HashMap();
        Courses res = sectionsManagerService.findCourseAndChapterById(courseId);
        map.put("res",res);
        return map;
    }

    @RequestMapping("/addData")
    @ResponseBody
    public Map addData(Section section){
        Map map = new HashMap();
        Integer res = sectionsManagerService.addData(section);
        map.put("res",res);
        return map;
    }

    @RequestMapping("/updateData")
    @ResponseBody
    public Map updateData(Section section){
        Map map = new HashMap();
        Integer res = sectionsManagerService.updateData(section);
        map.put("res",res);
        return map;
    }

    @RequestMapping("/deleteData")
    @ResponseBody
    public Map deleteData(Section section){
        Map map = new HashMap();
        Integer res = sectionsManagerService.deleteData(section);
        map.put("res",res);
        return map;
    }

}
