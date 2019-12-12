package com.zlk.zlkproject.user.aboutus.controller.cxr;

import com.zlk.zlkproject.user.aboutus.service.cxr.OpinionService;
import com.zlk.zlkproject.user.entity.Opinion;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @author 崔新睿，意见反馈
 * @data 2019/11/25 - 13:46
 */
@Controller
@RequestMapping("/opinion")
public class OpinionController {
    @Autowired
    private OpinionService opinionService;
    @RequestMapping("/toOpinion")
    public String toOpinion(){
        return "view/cxr/opinion";
    }
    @RequestMapping("/addOpinion")
    public ModelAndView addOpinion(HttpServletRequest request, Opinion opinion){
        ModelAndView mv=new ModelAndView();

//        //userId="1";
//       opinion.setOpinionUserId("1");


        //从session中获取ID，进行修改，userId="1";为模拟数据
        User user1 = (User) request.getSession().getAttribute("user");
        //获取用户id
        opinion.setOpinionUserId(user1.getUserId());

            int i=opinionService.addOpinion(opinion);
            if(i>0){
                mv.setViewName("view/cxr/opinion");
                return mv;

        }else{
            return null;
        }

    }
}
