package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Revert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RevertMapper {
    /*
     * @descrption 增加一条回复信息
     * @author gby
     * @param [revert]
     * @return java.lang.Integer
     * @date 2019/12/24 17:14
     */
    Integer  addRevert(Revert revert);


}
