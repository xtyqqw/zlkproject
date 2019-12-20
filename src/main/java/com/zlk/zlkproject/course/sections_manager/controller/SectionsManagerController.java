package com.zlk.zlkproject.course.sections_manager.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.section.service.SectionService;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    private SectionService sectionService;
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;
    @Autowired
    private LogUtil logUtil;

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

    @RequestMapping(value = "/deleteVideo")
    @ResponseBody
    public Map deleteVideo(@RequestParam(name = "file") MultipartFile file) throws Exception{
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
    public Map findCourseAndChapterById(@RequestParam("courseId") Integer courseId
                                        ,/*@RequestParam("chapterId") */Integer chapterId){
        Map map = new HashMap();
        Courses res = sectionsManagerService.findCourseAndChapterById(courseId);
        Integer sectionsNum = sectionsManagerService.findCountByChapterId(chapterId);
        if (sectionsNum == null)
            sectionsNum = 0;
        map.put("res",res);
        map.put("sectionsNum",sectionsNum);
        return map;
    }

    @RequestMapping("/findSectionNumsByChapterId")
    @ResponseBody
    public Map findSectionNumsByChapterId(@RequestParam("chapterId") Integer chapterId){
        Map map = new HashMap();
        Integer res = sectionsManagerService.findCountByChapterId(chapterId);
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
    public Map updateData(Section section, HttpServletRequest request){
        Map map = new HashMap();
        Integer res = sectionsManagerService.updateData(section);
        if (res == 1){
            logUtil.setLog(request,"修改了小节(ID:"+ section.getSectionId() +")的信息");
        }
        map.put("res",res);
        return map;
    }

    @RequestMapping("/deleteData")
    @ResponseBody
    public Map deleteData(Section section, HttpServletRequest request){
        Map map = new HashMap();
        Integer res = null;
        try {
            res = sectionsManagerService.deleteData(section);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("res",0);
            return map;
        }
        if (res == 1){
            logUtil.setLog(request,"删除了小节(ID:"+ section.getSectionId() +")的信息");
        }
        map.put("res",res);
        return map;
    }

    /**
     *  根据小节id查找小节名称
     *@method findNameBySectionId
     *@params [sectionId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/16  11:47
     */
    @RequestMapping(value = "/findNameBySectionId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findNameBySectionId(Integer sectionId) throws Exception{
        String sectionName = sectionService.findNameBySectionId(sectionId);
        Map<String,Object> map = new HashMap<>();
        map.put("sectionName",sectionName);
        return map;
    }

}
