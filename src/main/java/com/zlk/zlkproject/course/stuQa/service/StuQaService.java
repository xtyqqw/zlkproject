package com.zlk.zlkproject.course.stuQa.service;

import com.zlk.zlkproject.entity.StuQa;

import java.util.List;


public interface StuQaService {


    /**
     *  功能栏添加学生提问
     *@method insertStuQa
     *@params [stuQa, tagIdList]
     *@return java.lang.String
     *@author zhang
     *@time 2019/11/28  16:18
     */
    String insertStuQa(StuQa stuQa, List<Integer> tagIdList);

    /**
     *  根据sectionId分页查找所有的stuQa
     *@method findStuQaBySectionId
     *@params [sectionId, page, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/11/28  16:17
     */
    List<StuQa> findStuQaBySectionId(Integer sectionId, Integer page, Integer limit);

    /**
     *  根据sectionId分页查找的页数
     *@method getPages
     *@params [sectionId, limit]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/11/28  16:30
     */
    Integer getPages(Integer sectionId ,Integer limit);

    /**
     *  根据sectionId分页查找所有的stuQa并根据回答数量排序
     *@method findStuQaBySectionIdElite
     *@params [sectionId, page, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/11/29  16:01
     */
    List<StuQa> findStuQaBySectionIdElite(Integer sectionId, Integer page, Integer limit);

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
     *@params [sectionId, pId, page, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/12/2  11:25
     */
    List<StuQa> findStuQaBySectionIdAndPId(Integer sectionId,Integer pId);

    /**
     *  根据sectionId和pId分页查找的页数
     *@method getPages
     *@params [sectionId, pId, limit]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/2  11:32
     */
    Integer getPages(Integer sectionId ,Integer pId,Integer limit);

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
     *  根据id修改回答数量
     *@method updateAnswerNum
     *@params [sqaId]
     *@return java.lang.String
     *@author zhang
     *@time 2019/12/3  13:57
     */
    String updateAnswerNum(Integer sqaId);

    /**
     *  查找全部问答并分页
     *@method selectAllLimit
     *@params [page, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.StuQa>
     *@author zhang
     *@time 2019/12/6  10:31
     */
    List<StuQa> selectAllLimit(Integer page,Integer limit);

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

//    fuzzySelect(String name,String val,Integer page,Integer limit)
}
