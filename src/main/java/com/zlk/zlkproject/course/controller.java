package com.zlk.zlkproject.course;

import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: zlkproject
 * @description: 控制类
 * @author: zyx
 * @create: 2019-11-18 14:44
 */
@Controller
public class controller {

    @RequestMapping(value = "/toVideo")
    public String toVideo(HttpServletRequest request, Integer sectionId) throws Exception{
       if (sectionId==null){
           return "/view/videoPlayer";
       }
        request.getSession().setAttribute("sectionId",sectionId);
        return "/view/videoPlayer";
    }

    @RequestMapping(value = "/HomePage")
    public String toLogin() throws Exception {//跳转项目页
        return "view/courseHomePage";
    }
    @RequestMapping(value = "/HomePageTag")
    public String toHomePageTag(HttpServletRequest request,String tagName) throws Exception {//跳转登录页页面的方法
        request.getSession().setAttribute("tagName",tagName);
        return "view/courseHomePageTag";
    }



    @Autowired
    //对文件进行上传的工具类
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;
    @RequestMapping(value = "/uploadTest")
    @ResponseBody
    public String uploadTest(@RequestParam(name = "file") MultipartFile file) throws Exception{
        //path是文件上传到FastDFS服务器上的路径
        String path = commonFileUtil.uploadFile(file);

        /*
        * url是最终访问文件资源的地址
        * fdfsConfig.getResHost()获取的是服务器的ip
        * fdfsConfig.getStoragePort()获取的是服务器的端口
        */
        String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
        System.out.println(path);
        System.out.println(url);
        return url;
    }
}
