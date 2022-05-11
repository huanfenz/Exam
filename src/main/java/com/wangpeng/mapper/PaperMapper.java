package com.wangpeng.mapper;

import com.wangpeng.pojo.po.Paper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
* @author wangpeng
* @description 针对表【t_paper(试卷表)】的数据库操作Mapper
* @createDate 2022-03-28 11:25:29
* @Entity com.wangpeng.pojo.po.Paper
*/
@Repository
public interface PaperMapper extends BaseMapper<Paper> {

}

