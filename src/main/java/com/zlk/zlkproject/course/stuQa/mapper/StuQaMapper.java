package com.zlk.zlkproject.course.stuQa.mapper;

import com.zlk.zlkproject.entity.StuQa;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
@Mapper
public interface StuQaMapper {

    /**
     *  添加新的问答
     *@method insertStuQa
     *@params [stuQa]
     *@return java.lang.Integer
     *@author zhangyouxin
     *@time 2019/11/27  15:12
     */
    Integer insertStuQa(StuQa stuQa);

    /**
     *  添加问答标签关联信息
     *@method insertStuQaTag
     *@params [sqaId, tagId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/11/27  15:17
     */
    Integer insertStuQaTag(Integer sqaId,Integer tagId);

    /**
     *  根据sectionId分页查找所有的stuQa
     *@method findStuQaBySectionId
     *@params [sectionId, offset, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/11/28  16:17
     */
    List<StuQa> findStuQaBySectionId(Integer sectionId, Integer offset, Integer limit);

    /**
     *  通过sectionId查找全部问答数量
     *@method findCountBySectionId
     *@params [sectionId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/11/28  16:26
     */
    Integer findCountBySectionId(Integer sectionId);

    /**
     *  根据sectionId分页查找所有的stuQa并根据回答数量排序
     *@method findStuQaBySectionIdElite
     *@params [sectionId, offset, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/11/29  16:01
     */
    List<StuQa> findStuQaBySectionIdElite(Integer sectionId, Integer offset, Integer limit);

    /**
     *  根据sqaId更改共享或举报信息
     *@method updateShareOrReportBySqaId
     *@params [stuQa]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/11/29  16:39
     */
    Integer updateShareOrReportBySqaId(StuQa stuQa);

    /**
     *  根据sqaId查找stuQa
     *@method findStuQaBySqaId
     *@params [sqaId]
     *@return com.zlk.zlkproject.entity.StuQa
     *@author zhang
     *@time 2019/11/29  16:51
     */
    StuQa findStuQaBySqaId(Integer sqaId);

    /**
     *  查找当前sectionId下相同pId下的回答
     *@method findStuQaBySectionIdAndPId
     *@params [sectionId, pId, offset, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/12/2  11:25
     */
    List<StuQa> findStuQaBySectionIdAndPId(Integer sectionId,Integer pId);

    /**
     *  当前小节下当前问题回答的数量
     *@method findCountBySectionIdAndPId
     *@params [sectionId, pId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/2  11:27
     */
    Integer findCountBySectionIdAndPId(Integer sectionId,Integer pId);

    /**
     *  根据sqaId查找tagId
     *@method findTagIdBySqaId
     *@params [sqaId]
     *@return java.util.List<java.lang.Integer>
     *@author zhang
     *@time 2019/12/3  12:04
     */
    List<Integer> findTagIdBySqaId(Integer sqaId);

    /**
     *  修改stuQa信息
     *@method updateStuQaBySqaId
     *@params [stuQa]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/3  13:46
     */
    Integer updateStuQaBySqaId(StuQa stuQa);

    /**
     *  查找全部问答并分页
     *@method selectAllLimit
     *@params [startPage, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/12/6  10:31
     */
    List<StuQa> selectAllLimit(Integer startPage,Integer limit);

    /**
     *  查找全部数量
     *@method selectAllCount
     *@params []
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/6  10:39
     */
    Integer selectAllCount();

    /**
     *  根据id删除问答信息
     *@method deleteBySqaId
     *@params [stuQa]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/6  10:33
     */
    Integer deleteBySqaId(StuQa stuQa);
}
