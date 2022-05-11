package com.wangpeng.mapper;

import com.wangpeng.pojo.po.StudentQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
* @author wangpeng
* @description 针对表【s_student_question(学生答题表)】的数据库操作Mapper
* @createDate 2022-04-10 13:50:27
* @Entity com.wangpeng.pojo.po.StudentQuestion
*/
@Repository
public interface StudentQuestionMapper extends BaseMapper<StudentQuestion> {

}




