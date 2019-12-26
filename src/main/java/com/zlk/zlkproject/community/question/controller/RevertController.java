package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.RevertService;
import com.zlk.zlkproject.entity.Revert;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gby
 * @ClassName RevertController
 * @description 社区问题回复
 * @date 2019/12/24 17:13
 */
@Controller
@RequestMapping(value = "revert")
public class RevertController {
    @Autowired
    private RevertService revertService;

    /*
     * @descrption 增加一条评论信息
     * @author gby
     * @param
     * @return
     * @date 2019/12/26 0:22
     */

    @RequestMapping(value = "/addRevert")
    public Map addRevert(Revert revert, HttpServletRequest request)throws Exception{
        User user = (User) request.getSession().getAttribute("user");
        String userId="" + user.getUserId();
        String questionId = (String) request.getSession().getAttribute("questionId");

        HashMap map = new HashMap<>();
        revert.setUserId(userId);
        revert.setQuestionId(questionId);
        revert.setRid(0);
        revert.setCreateTime(new Date());
        Integer reverts = revertService.addRevert(revert);
        String retmsg;
        if(reverts == 1){
            retmsg="评论成功";
        }else {
            retmsg="评论失败";
        }
        map.put("retmsg",retmsg);
        return map;
    }
    @RequestMapping(value = "/revertSubmit")
    @ResponseBody
    public Map replySubmit(Revert Revert, HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        String questionId = (String) request.getSession().getAttribute("questionId");

        HashMap map = new HashMap<>();
        Revert.setQuestionId(questionId);
        Revert.setUserId(userId);
        Revert.setCreateTime(new Date());
        Integer res = revertService.addRevert(Revert);
        String retmsg;
        if (res == 1) {
            retmsg = "回复成功";
        }else {
            retmsg = "回复失败";
        }
        map.put("retmsg",retmsg);
        return map;
    }

    @RequestMapping(value = "/findRevert")
    @ResponseBody
    public Map findArtCmt(@RequestParam("questionId") String questionId,
                          @RequestParam("page") Integer page,@RequestParam("size") Integer size, HttpServletRequest request) {
        questionId = (String) request.getSession().getAttribute("questionId");
        Map map = new HashMap();
        List<Revert> revertList = revertService.findRevert(questionId, page, size);
        Integer pages = revertService.findRevertCount(questionId);
        if (pages % 3 != 0){
            pages = pages /3 +1;
        }else{
            pages = pages / 3;
        }
        map.put("reverts",revertList);
        map.put("pages",pages);
        return map;
    }

}
