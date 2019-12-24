package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Revert;
import org.springframework.stereotype.Service;

@Service
public interface RevertService {
    /*
     * @descrption 增加一条回复信息
     * @author gby
     * @param [revert]
     * @return java.lang.Integer
     * @date 2019/12/24 17:15
     */
    Integer  addRevert(Revert revert);
}
