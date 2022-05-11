package com.wangpeng.mapper;

import com.wangpeng.pojo.po.PaperQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
* @author wangpeng
* @description 针对表【t_paper_question(试卷题目表)】的数据库操作Mapper
* @createDate 2022-04-02 15:48:39
* @Entity com.wangpeng.pojo.po.PaperQuestion
*/
@Repository
public interface PaperQuestionMapper extends BaseMapper<PaperQuestion> {

}




