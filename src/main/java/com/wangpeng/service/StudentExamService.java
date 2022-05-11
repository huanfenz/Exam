package com.wangpeng.service;

import com.wangpeng.pojo.dto.SaveAnswerDTO;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wangpeng.pojo.po.*;
import com.wangpeng.pojo.vo.student.StudentQuestionVO;

import java.math.BigDecimal;
import java.util.List;

/**
* @author wangpeng
* @description 针对表【s_student_exam(学生考试表)】的数据库操作Service
* @createDate 2022-04-10 17:47:28
*/
public interface StudentExamService extends IService<StudentExam> {
    
    Integer createStudentExam(Integer studentId, Integer examId);

    Exam getExam(Integer studentExamId);

    List<StudentQuestion> getStudentQuestionList(Integer studentExamId);

    List<List<StudentQuestionVO>> getStudentQuestionVOListList(List<StudentQuestion> studentQuestionList);

    PaperQuestion getPaperQuestion(Integer paperId, Integer questionId);

    List<Option> getOptions(Integer questionId);

    boolean updateAnswer(SaveAnswerDTO saveAnswerDTO);

    BigDecimal checkAnswers(Integer studentExamId);

    StudentOption getStudentOption(Integer studentQuestionId, int optionId);

    boolean onlyHasObject(Integer studentExamId);
}
