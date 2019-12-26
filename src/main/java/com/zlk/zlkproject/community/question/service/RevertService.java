package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Revert;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RevertService {
   /*
     * @descrption 增加一条评论信息
     * @author gby
     * @param [revert]
     * @return java.lang.Integer
     * @date 2019/12/24 17:15
     */
    Integer  addRevert(Revert revert);
    /*
     * @descrption 查询问题评论按时间排序
     * @author gby
     * @param [questionId, page, size]
     * @return java.util.List<com.zlk.zlkproject.entity.Revert>
     * @date 2019/12/26 1:23
     */
    List<Revert> findRevert(String questionId, Integer page, Integer size);

    /*
     * @descrption 查询评论总条数
     * @author gby
     * @param [questionId]
     * @return java.lang.Integer
     * @date 2019/12/26 1:23
     */
    Integer findRevertCount(String questionId);

}
