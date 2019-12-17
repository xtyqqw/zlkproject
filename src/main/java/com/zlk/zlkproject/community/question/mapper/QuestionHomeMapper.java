package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionHomeMapper {
    /*
     * @descrption 查询总数
     * @author gby
     * @param
     * @return
     * @date 2019/12/13 0:31
     */
    Integer findQuestionCount(Pagination pagination);

    /*
     * @descrption 查询全部问题，按照最新发布日期排序（默认）
     * @author gby
     * @param
     * @return
     * @date 2019/12/10 14:15
     */
    List<Question> findAll(Pagination pagination);


    /*
     * @descrption 按照用户id查找问题，按最新发布日期排序（默认）
     * @author gby
     * @param
     * @return
     * @date 2019/12/10 14:15
     */
    List<Question> findByUserId(Pagination pagination);

}
