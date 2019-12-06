package com.zlk.zlkproject.course.stu_comment.mapper;

import com.zlk.zlkproject.entity.StuComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StuCommentMapper {
    /**
     *  新增学生评论
     *@method addStuCmt
     *@params [StuComment]
     *@return Integer
     *@author hry
     *@time 2019/12/03  11:16
     */
    public Integer addStuCmt(StuComment stuComment);

    /**
     *  查询学生评论按时间
     *@method addStuCmt
     *@params [Integer]
     *@return List<StuComment>
     *@author hry
     *@time 2019/12/03  17:42
     */
    public List<StuComment> findStuCmt(Integer sectionId, Integer page, Integer size);

    /**
     *  查询学生评论pid=0的条数
     *@method addStuCmt
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/03  19:11
     */
    public Integer findCount(Integer sectionId);

    /**
     *  通过smId查询学生评论赞踩数
     *@method findUpDownNumBySmId
     *@params [Integer]
     *@return StuComment
     *@author hry
     *@time 2019/12/06  13:44
     */
    public StuComment findUpDownNumBySmId(Integer smId);

    /**
     *  通过smId查询学生评论赞踩数
     *@method updateUpDownNumBySmId
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  13:59
     */
    public Integer updateUpDownNumBySmId(Integer smId,String type);

    /**
     *  增加 stucmt_user_updown 数据
     *@method addSuu
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  14:15
     */
    public Integer addSuu(Integer smId,String userId,String upOrDown);

    /**
     *  删除 stucmt_user_updown 数据
     *@method deleteSuu
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  14:19
     */
    public Integer deleteSuu(Integer smId,String userId);

    /**
     *  修改 stucmt_user_updown 数据
     *@method updateSuu
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  14:22
     */
    public Integer updateSuu(Integer smId,String userId,String upOrDown);

    /**
     *  修改 stu_comment report数据
     *@method updateReport
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  16:18
     */
    public Integer updateReport(Integer smId,String report);
}
