package com.zlk.zlkproject.user.personal.controller;

import com.alibaba.druid.sql.visitor.functions.Now;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.service.cxr.UserService;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName： PersonalController
 * @Description： 个人中心各功能跳转,用户基本信息的修改
 * @Author： wy
 * @Date： 2019/11/19 16:43
 */
@Controller
@RequestMapping("/personal")
public class PersonalController {

    @Autowired
    private UserService userService;
    @Autowired
    private LogUtil logUtil;
    //文件上传工具类
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;
    /**
     * 测试个人中心
     * @return
     */
    @RequestMapping("/person")
    public ModelAndView jsp(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        ModelAndView mv = new ModelAndView();
        mv.addObject("user",user);
        mv.setViewName("view/personal/personal");
        return mv;
    }

    //用户前台信息展示页面
    /**
     * 跳转页面
     * @return
     */
    @RequestMapping("/toPersonInfo")
    public String toPersonInfo(){
        return "view/cxr/personInfo";
    }

    /**
     * 修改 用户信息方法
     * @param user
     * @return
     */
    @RequestMapping("/updateUser")
    public ModelAndView updateUser(User user,HttpServletRequest request){

        ModelAndView mv = new ModelAndView();
        //调用修改方法
        userService.updateUser(user);
        //根据ID查询出user对象，
        User user1=userService.selectUserById(user.getUserId());
        request.getSession().removeAttribute("user");
        request.getSession().setAttribute("user",user1);
        mv.addObject("user", user1);
        // 设置返回页面
        mv.setViewName("view/cxr/personInfo");
        return mv;
    }

    /**
     * 根据userID查询对象，修改信息
     * @param userId
     * @return
     */
    @RequestMapping(value = "/findUser")
    public ModelAndView findUser(HttpServletRequest request, String userId){
        ModelAndView mv = new ModelAndView();
//         userId="1";
//
//        User user=userService.selectUserById(userId);

        //从session中获取ID，进行修改，userId="1";为模拟数据
       User user1 = (User) request.getSession().getAttribute("user");

       //调用查询单个对象的方法
        User user=userService.selectUserById(user1.getUserId());

        mv.addObject("user",user);
        mv.setViewName("view/cxr/personInfo");
        // logUtil.setLog(request,"修改了后台用户"+user.getUserRealname()+"的信息");
        return mv;

    }

    /**
     * 根据ID查询单个对象方法
     * @param userId
     * @return
     */
    @RequestMapping("/selectUserById/{userId}")
    public User selectUserById(@PathVariable("{userId}") String userId){

        return userService.selectUserById(userId);
    }
    /**
     * 头像文件上传到服务器方法
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping("/uploadHeadPic")
    @ResponseBody
    public Map uploadHeadPic(@RequestParam(name = "file") MultipartFile file) throws Exception{
        Map<String,Object> map=new HashMap<>();
            //path是文件上传到服务器上的路径
        String path = commonFileUtil.uploadFile(file);
        // url是最终访问文件资源的地址，
        // fdfsConfig.getResHost()是获取服务器ip，
        // fdfsConfig.getStoragePort()获取服务器端口
        String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
        //打印服务器上的路径
        System.out.println(path);
        //最终访问文件资源的地址，
        System.out.println(url);
        //把URL和上传成功的信息放入到map集合里
        map.put("url",url);
        map.put("message","上传成功");
        //返回map集合
        return map;
    }
}
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
//       //前缀
//        String prefix="";
//        String dateStr="";
//        //文件夹名称
//        String uploadDir="uploadDir";//这个文件夹是创建在uploadDir,
//        //保存上传
//        OutputStream out = null;
//        InputStream fileInput=null;
//        try{
//            if(file!=null){
//                //得到上传时的文件名
//                String originalName = file.getOriginalFilename();
//                //前缀=文件名拼接
//                prefix=originalName.substring(originalName.lastIndexOf(".")+1);
//
//                SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
//                // 将文件名以日期戳的形式保存
//                dateStr = format.format(new Date());
//                //文件路径：
//                String filepath = request.getServletContext().getRealPath("/"+ uploadDir+"/" + dateStr + "." + prefix) ;
//               //   将文件路径中的"\\"替换成"/"
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


