package com.zlk.zlkproject.course.stuNote.controller;

import com.zlk.zlkproject.course.stuNote.service.StuNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/27 13:59
 */
@Controller
public class StuNoteController {

    @Autowired
    private StuNoteService stuNoteService;

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
        map.put("count",stuNoteService.selectCount());
        map.put("data",stuNoteService.selectAllByLimit(page, limit));
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
        int tiaoshu = stuNoteService.deleteStuNoteBySnId(snId);
        if (tiaoshu>0){
            return "删除成功";
        }
        return "删除失败";
    }
}
