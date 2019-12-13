package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.ResponseService;
import com.zlk.zlkproject.community.util.UUIDUtils;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gby
 * @ClassName ResponseController
 * @description 用户回答
 * @date 2019/12/11 16:27
 */
@Controller
@RequestMapping(value = "response")
public class ResponseController {
    @Autowired
    private ResponseService responseService;

    /*
     * @descrption 提交回复
     * @author gby
     * @param [response]
     * @return java.lang.String
     * @date 2019/12/12 20:00
     */
    @RequestMapping(value = "/save")
    public String save(Response response) throws Exception {
        response.setResponseId(UUIDUtils.getId());
        response.setCreateTime(new Date());
        response.setCaiCount(0);
        response.setZanCount(0);
        response.setReplyCount(0);
        responseService.save(response);
        return "redirect:/question/findQuestion";
    }

    /*
     * @descrption 全部回复
     * @author gby
     * @param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @date 2019/12/12 21:48
     */
    @RequestMapping(value = "responseAll")
    @ResponseBody
    public Map<String,Object> responseAll(Pagination pagination)throws Exception {
        List<Response> responseAllList =responseService.findAll(pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("responseAllList", responseAllList);
        return map;

    }

    /*
     * @descrption 最新回复
     * @author gby
     * @param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @date 2019/12/12 20:08
     */
    @RequestMapping(value = "/responseNew")
    @ResponseBody
    public Map<String,Object> responseNew(Pagination pagination)throws Exception{
        List<Response> responseNewList=responseService.findByResponseTime(pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("responseNewList", responseNewList);
        return map;
    }

    //回答编辑页面的图片上传方法
    @RequestMapping(value = "/responseImg", method = RequestMethod.POST)
    public static void uploadFile(MultipartFile file, HttpServletRequest request, String path)
            throws IllegalStateException, IOException {
            request.getSession().getServletContext().getRealPath("/upload"); //服务器地址
        if (!file.isEmpty()) {
            // 文件保存路径
            String filePath = path + file.getOriginalFilename();
            // 转存文件
            file.transferTo(new File(filePath));
        }
    }



}
