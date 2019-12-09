package com.zlk.zlkproject.user.personal.controller.cxr;


import com.zlk.zlkproject.admin.util.LogUtil;

import com.zlk.zlkproject.user.entity.CxrPaging;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.service.cxr.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;


/**
 * 后台用户信息管理控制层
 * @author 崔新睿
 * @data 2019/11/19 - 14:28
 */
@Controller
@RequestMapping("/user")
public class UsersController {
    @Autowired
    private UserService userService;
    @Autowired
    private LogUtil logUtil;


                        //后台信息管理
        /**
         * 进入后台用户管理页面
         * @param condition
         * @return
         */

        @RequestMapping("/toUserManager")
        //通过条件进行模糊查询
        public ModelAndView toUserInfo(String condition){
        ModelAndView mv=new ModelAndView();
            //通过条件进行模糊查询，将条件放入到对象里
        mv.addObject("condition",condition);
        //设置返回页面
        mv.setViewName("view/cxr/UserInfo");
              return mv;

        }

    /**
     * 后台用户管理页面数据接口(查询所有信息，分页查询)
     * @param cxrPaging
     * @return
     */
    @RequestMapping(value = "/userInfo")
    @ResponseBody
    public Map<String,Object> userInfo(CxrPaging cxrPaging){
        Map<String,Object> map=new HashMap<>();
        //调用查询所有信息方法
        List<User> userList=userService.findUserByLimit(cxrPaging);
        //调用查询总数方法
        Integer count =userService.findTotalCountByName(cxrPaging);
        //将集合，总数放入到map里
        map.put("data",userList);
        map.put("count",count);
        map.put("code","0");
        return map;

    }

    /**
     * 修改用户信息方法
     * @param user
     * @return
     */
    @RequestMapping(value = "/updateUserInfo")
    public ModelAndView updateUserInfo(User user,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        //获取修改前用户信息
        User user1=userService.selectUserById(user.getUserId());
        //调用修改方法
        Integer flag= userService.updateUser(user);
            //对flag进行判断，弹出相应提示信息
        if(flag== 1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("view/cxr/UserInfo");
            //记录修改用户日志
            logUtil.setLog(request,"修改了前台用户"+user1.getUserRealname()+"的信息");
            return mv;
        }else{
            mv.addObject("flag","true");
            mv.addObject("msg","修改失败");
            mv.setViewName("view/cxr/UserInfo");
            return mv;
        }
    }

    /**
     * 删除方法
     * @param userId
     * @return
     */
    @RequestMapping("/deleteUserById")
    public String deleteUserById(String userId,HttpServletRequest request){
            //获取删除前用户信息
        User userId1=userService.selectUserById(userId);
            //调用删除方法
        userService.deleteByUserId(userId);
        //记录删除用户日志
        logUtil.setLog(request,"删除了前台用户"+userId1.getUserRealname()+"的信息");
        //返回页面
        return "view/cxr/UserInfo";

    }



    /**
     * 文件上传
     * @param file
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/upload/uploadImg", method = {RequestMethod.POST})
    @ResponseBody
    public Object uploadImg(@RequestParam(value="file",required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String prefix="";
        String dateStr="";
        String uploadDir="uploadDir";//这个文件夹是创建在:helloworld/target/helloworld/statics/uploadDir,以及helloworld/statics/uploadDir处
        //保存上传
        OutputStream out = null;
        InputStream fileInput=null;
        try{
            if(file!=null){
                String originalName = file.getOriginalFilename();
                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
                SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
                dateStr = format.format(new Date());
                String filepath = request.getServletContext().getRealPath("/"+ uploadDir+"/" + dateStr + "." + prefix) ;
                filepath = filepath.replace("/", "\\");//java中路径转码
                System.out.println(filepath);
                File files=new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                    //如果没有该文件夹，就创建
                if(!files.getParentFile().exists()){
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
            }
        }catch (Exception e){
        }finally{
            try {
                if(out!=null){
                    out.close();
                }
                if(fileInput!=null){
                    fileInput.close();
                }
            } catch (IOException e) {
            }
        }
        Map<String,Object> map2=new HashMap<>();
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("data",map2);
        map2.put("src","../../../"+uploadDir +"/"+ dateStr + "." + prefix);

        return map;
    }



//    /**
//     * @Author lufengxiang
//     * @Description //TODO 新增方法
//     * @Date 15:26 2019/11/19
//     * @Param [dept]
//     * @return org.springframework.web.servlet.ModelAndView
//     **/
//    @RequestMapping(value = "/insert")
//    public ModelAndView insert(Dept dept){
//        ModelAndView mv=new ModelAndView();
//        //判断部门名称是否已存在
//        Dept deptByDeptName = deptService.findDeptByDeptName(dept.getDeptName());
//        if(deptByDeptName!=null){
//            mv.addObject("flag","true");
//            mv.addObject("msg","该部门名称已存在");
//            mv.setViewName("admin/deptManager");
//            return mv;
//        }
//        dept.setDeptId(IDUtil.getUUID());
//        Integer flag = deptService.addDept(dept);
//        if(flag==1){
//            mv.addObject("flag","true");
//            mv.addObject("msg","添加成功");
//            mv.setViewName("admin/deptManager");
//            return mv;
//        }else {
//            mv.addObject("flag","true");
//            mv.addObject("msg","遇到意外错误");
//            mv.setViewName("admin/deptManager");
//            return mv;
//        }
//    }





    //                        //前台信息展示页面
//    /**
//    * 跳转页面
//     * @return
//     */
//    @RequestMapping("/toPersonInfo")
//    public String toPersonInfo(){
//            return "view/cxr/personInfo";
//    }
//
//    /**
//     * 修改方法
//     * @param user
//     * @return
//     */
//    @RequestMapping("/updateUser")
//    public ModelAndView updateUser(User user){
//
//        ModelAndView mv = new ModelAndView();
//        //调用修改方法
//         userService.updateUser(user);
//        //根据ID查询出user对象，
//        User user1=userService.selectUserById(user.getUserId());
//        mv.addObject("user", user1);
//            // 设置返回页面
//        mv.setViewName("view/cxr/personInfo");
//        return mv;
//    }
//
//    /**
//     * 根据userID查询对象，修改信息
//     * @param userId
//     * @return
//     */
//    @RequestMapping(value = "/findUser")
//    public ModelAndView findUser( HttpServletRequest request,String userId){
//        ModelAndView mv = new ModelAndView();
//        //从session中获取ID，进行修改，userId="1";为模拟数据
//       // User user1 = (User) request.getSession().getAttribute("userId");
//            userId="1";
//        //调用查询单个对象的方法
//        User user=userService.selectUserById(userId);
//        mv.addObject("user",user);
//        mv.setViewName("view/cxr/personInfo");
//       // logUtil.setLog(request,"修改了后台用户"+user.getUserRealname()+"的信息");
//        return mv;
//
//    }
//
//    /**
//     * 根据ID查询单个对象方法
//     * @param userId
//     * @return
//     */
//    @RequestMapping("/selectUserById/{userId}")
//    public User selectUserById(@PathVariable("{userId}") String userId){
//                return userService.selectUserById(userId);
//    }
//
//    /**
//     * 文件上传
//     * @param file
//     * @param request
//     * @param response
//     * @return
//     * @throws Exception
//     */
//    @RequestMapping(value = "/upload/headImg", method = {RequestMethod.POST})
//    @ResponseBody
//    public Object headImg(@RequestParam(value="file",required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
//        String prefix="";
//        String dateStr="";
//        String uploadDir="uploadDir";//这个文件夹是创建在uploadDir,
//        //保存上传
//        OutputStream out = null;
//        InputStream fileInput=null;
//        try{
//            if(file!=null){
//                String originalName = file.getOriginalFilename();
//                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
//
//                SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
//                // 将文件名以日期戳的形式保存
//                dateStr = format.format(new Date());
//                //文件路径：
//                String filepath = request.getServletContext().getRealPath("/"+ uploadDir+"/" + dateStr + "." + prefix) ;
//                filepath = filepath.replace("/", "\\");//java中路径转码
//                System.out.println(filepath);
//                File files=new File(filepath);
//                //打印查看上传路径
//                System.out.println(filepath);
//                // 如果没有文件夹，就创建文件夹
//                if(!files.getParentFile().exists()){
//                    files.getParentFile().mkdirs();
//                }
//                file.transferTo(files);
//            }
//        }catch (Exception e){
//        }finally{
//            try {
//                if(out!=null){
//                    out.close();
//                }
//                if(fileInput!=null){
//                    fileInput.close();
//                }
//            } catch (IOException e) {
//            }
//        }
//        Map<String,Object> map2=new HashMap<>();
//        Map<String,Object> map=new HashMap<>();
//        map.put("code",0);
//        map.put("msg","");
//        map.put("data",map2);
//        map2.put("src","../../../"+uploadDir +"/"+ dateStr + "." + prefix);
//
//        return map;
//    }

}
