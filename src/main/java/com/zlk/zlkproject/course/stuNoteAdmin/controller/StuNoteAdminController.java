package com.zlk.zlkproject.course.stuNoteAdmin.controller;

import com.zlk.zlkproject.course.stuNoteAdmin.service.StuNoteAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/29 14:21
 */
@Controller
public class StuNoteAdminController {
    @Autowired
    private StuNoteAdminService stuNoteAdminService;

    /**
     *  分页查询所有数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/stuNote/selectStuNoteAllByLimit")
    @ResponseBody
    public Map selectStuNoteAllByLimit(int page, int limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",stuNoteAdminService.selectCount());
        map.put("data",stuNoteAdminService.selectAllByLimit(page, limit));
        return map;
    }

    /**
     * 根据id删除数据
     * @param snId
     * @return
     */
    @RequestMapping("/stuNote/deleteStuNoteBySnId")
    @ResponseBody
    public String deleteStuNoteBySnId(Integer snId){
        int tiaoshu = stuNoteAdminService.deleteStuNoteBySnId(snId);
        if (tiaoshu>0){
            return "删除成功";
        }
        return "删除失败";
    }
}
