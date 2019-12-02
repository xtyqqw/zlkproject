package com.zlk.zlkproject.community.markdownTest.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * @program: FileUpload
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 13:01
 */
public class FileUpload {
    /*
     *图片上传工具类
     */
    public static String upload(HttpServletRequest request, MultipartFile file, String path) {
        String fileName = file.getOriginalFilename();
        fileName= UUID.randomUUID()+fileName.substring(fileName.indexOf("."),fileName.length());
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //保存
        try {
            file.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fileName;
    }
}
