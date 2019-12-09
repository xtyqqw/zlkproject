package com.zlk.zlkproject.course.stuQa.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.stuQa.service.StuQaService;
import com.zlk.zlkproject.entity.StuQa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 问答后台管理控制器
 * @author: zyx
 * @create: 2019-12-09 14:10
 */
@Controller
@RequestMapping(value = "/stuQaManager")
public class StuQaManagerController {

    @Autowired
    private StuQaService stuQaService;

    @Autowired
    private LogUtil logUtil;

    /**
     *  跳转至后台问答管理页面
     *@method toStuQaManager
     *@params []
     *@return java.lang.String
     *@author zhang
     *@time 2019/12/6  10:42
     */
    @RequestMapping(value = "/toStuQaManager")
    public String toStuQaManager() throws Exception{
        return "view/StuQaManager";
    }

    /**
     *  查找全部问答
     *@method findStuQaList
     *@params [page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/6  10:43
     */
    @RequestMapping(value = "/selectAllLimit",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectAllLimit(Integer page, Integer limit) throws Exception{
        //分页查询stuQa
        List<StuQa> stuQaList = stuQaService.selectAllLimit(page, limit);
        //获得全部数量
        Integer count = stuQaService.selectAllCount();
        Map<String,Object> map= new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",stuQaList);
        return map;
    }

    /**
     *  根据id删除stuQa
     *@method deleteStuQa
     *@params [stuQa]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/6  13:58
     */
    @RequestMapping(value = "/deleteStuQa",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteStuQa(HttpServletRequest request,StuQa stuQa) throws Exception{
        Integer integer = stuQaService.deleteBySqaId(stuQa);
        Map<String,Object> map= new HashMap<>();
        if (integer>0){
            map.put("msg","删除成功");
            logUtil.setLog(request,"删除了问答id为"+stuQa.getSqaId()+"的信息");
        }else {
            map.put("msg","删除失败");
        }
        return map;
    }

    @RequestMapping(value = "/fuzzySelect",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> fuzzySelect(String name,String val,Integer page,Integer limit) throws Exception{
        List<StuQa> stuQaList = new ArrayList<>();
        Integer count = 0;
        if ("userRealname".equals(name)){
            stuQaList = stuQaService.fuzzySearchByUserName(val, page, limit);
            count = stuQaService.selectCountByUserNameFuzzySelect(val);
        }else if ("sectionName".equals(name)){
            stuQaList = stuQaService.fuzzySearchBySectionName(val,page,limit);
            count = stuQaService.selectCountBySectionNameFuzzySelect(val);
        }

        Map<String,Object> map= new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",stuQaList);
        return map;
    }

    /**
     *  分享与举报按钮点击
     *@method \
     *@params [stuQa]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/2  11:35
     */
    @RequestMapping(value = "/updateReport")
    @ResponseBody
    public Map<String,Object> updateReport(HttpServletRequest request,StuQa stuQa) throws Exception{
        Integer integer = stuQaService.updateShareOrReportBySqaId(stuQa);
        Map<String,Object> map = new HashMap<>();
        if (integer >0){
            map.put("msg","修改成功");
            logUtil.setLog(request,"修改了问答id为"+stuQa.getSqaId()+"的举报信息");

        }else {
            map.put("msg","修改失败");
        }
        return map;
    }

    /**
     *  将已举报优先排列
     *@method reportDesc
     *@params [page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/9  16:57
     */
    @RequestMapping(value = "reportDesc")
    @ResponseBody
    public Map<String,Object> reportDesc(Integer page,Integer limit) throws Exception {
        //按照已举报优先排列
        List<StuQa> stuQaList = stuQaService.selectByReportDesc(page, limit);
        //获得全部数量
        Integer count = stuQaService.selectAllCount();
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", stuQaList);
        return map;
    }
}
