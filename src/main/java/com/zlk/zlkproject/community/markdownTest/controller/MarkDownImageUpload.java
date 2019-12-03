package com.zlk.zlkproject.community.markdownTest.controller;

import com.zlk.zlkproject.community.markdownTest.util.FileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


/**
 * @program: MarkDownImageUpload
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 12:50
 */
@Controller
public class MarkDownImageUpload {

    /**
     * @description: 测试用 调用文件上传工具类的方法实现图片上传功能 图片保存到本地
     * @param file
     * @param request
     * @param response
     * @return: void
     * @author: QianKeQin
     * @date: 2019/11/23 11:19
     */
    @RequestMapping("/imageUpload")
    public void imageUpload(@RequestParam(value = "editormd-image-file", required = true) MultipartFile file,
                            HttpServletRequest request, HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter wirte = null;
        JSONObject json = new JSONObject();
        try {
            wirte = response.getWriter();
            //文件存放的路径
            String path = request.getSession().getServletContext().getRealPath("upload");
            String url = "http://localhost:8080"
                    + request.getContextPath()
                    + "//upload//"
                    + FileUpload.upload(request, file, path);
            json.put("success", 1);
            json.put("message", "hello");
            json.put("url", url);
        } catch (Exception ignored) {
        }finally{
            wirte.print(json);
            wirte.flush();
            wirte.close();
        }
        //Sys.out.println("imageUpload");
    }
}
