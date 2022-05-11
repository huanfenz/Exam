package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.pojo.dto.SaveAnswerDTO;
import com.wangpeng.pojo.enums.TypeEnum;
import com.wangpeng.mapper.*;
import com.wangpeng.pojo.po.*;
import com.wangpeng.service.StudentExamService;
import com.wangpeng.pojo.vo.student.StudentQuestionVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author wangpeng
 * @description 针对表【s_student_exam(学生考试表)】的数据库操作Service实现
 * @createDate 2022-04-10 13:27:54
 */
@Service
public class StudentExamServiceImpl extends ServiceImpl<StudentExamMapper, StudentExam>
        implements StudentExamService{

    @Autowired
    StudentQuestionMapper studentQuestionMapper;

    @Autowired
    PaperMapper paperMapper;

    @Autowired
    QuestionMapper questionMapper;

    @Autowired
    ExamMapper examMapper;

    @Autowired
    PaperQuestionMapper paperQuestionMapper;

    @Autowired
    OptionMapper optionMapper;

    @Autowired
    StudentOptionMapper studentOptionMapper;

    @Override
    @Transactional
    public Integer createStudentExam(Integer studentId, Integer examId) throws RuntimeException {
        // 查看该学生考试是否存在
        QueryWrapper<StudentExam> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_id", studentId);
        queryWrapper.eq("exam_id", examId);
        StudentExam studentExam = baseMapper.selectOne(queryWrapper);

        if (studentExam != null) {
            // 考试已存在
            if (studentExam.getIsFinished() == 0) {
                // 考试没完成，返回当前考试，继续考试
                return studentExam.getId();
            } else {
                // 考试已完成，不允许再次进去考试
                throw new RuntimeException("不允许重复参加考试");
            }
        }

        // 获取exam
        Exam exam = examMapper.selectById(examId);
        // 获得paperId
        Integer paperId = exam.getPaperId();
        // 根据paperId得到paper
        Paper paper = paperMapper.selectById(paperId);

        // 初始化数据
        studentExam = new StudentExam();
        studentExam.setStartTime(new Date());
        studentExam.setStudentId(studentId);
        studentExam.setExamId(examId);
        studentExam.setTotalScore(paper.getTotalScore());
        studentExam.setQualifyScore(paper.getQualifyScore());

        // 创建学生考试
        baseMapper.insert(studentExam);
        Integer studentExamId = studentExam.getId();

        // 创建回答列表
        // 根据paperId查询该paper的所有的题目的id
        QueryWrapper<PaperQuestion> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("paper_id", paperId);
        List<PaperQuestion> paperQuestions = paperQuestionMapper.selectList(queryWrapper1);

        // 新增学生问题
        for (PaperQuestion pq : paperQuestions) {
            // 根据题目id获取题目类型
            Question question = questionMapper.selectById(pq.getQuestionId());
            TypeEnum type = question.getType();

            StudentQuestion studentQuestion = new StudentQuestion();
            studentQuestion.setStudentExamId(studentExamId);
            studentQuestion.setQuestionId(pq.getQuestionId());
            studentQuestion.setType(type);
            studentQuestion.setScore(pq.getScore());
            studentQuestion.setOrderNum(pq.getOrderNum());

            studentQuestionMapper.insert(studentQuestion);

            // 根据问题找选项，添加到student_option中
            QueryWrapper<Option> queryWrapper2 = new QueryWrapper<>();
            queryWrapper2.eq("question_id", question.getId());
            List<Option> options = optionMapper.selectList(queryWrapper2);
            int count = 0;
            for (Option option : options) {
                StudentOption studentOption = new StudentOption();
                studentOption.setStudentQuestionId(studentQuestion.getId());
                studentOption.setOptionId(option.getId());
                studentOption.setIsChecked(0);
                studentOption.setOrderNum(++count);
                char abc = (char)(65 + count - 1);
                studentOption.setAbc(String.valueOf(abc));
                studentOptionMapper.insert(studentOption);
            }
        }

        return studentExamId;
    }

    @Override
    public Exam getExam(Integer studentExamId) {
        // 根据studentExamId得到studentExam
        StudentExam studentExam = baseMapper.selectById(studentExamId);
        // 得到examId
        Integer examId = studentExam.getExamId();
        // 根据examId获取exam
        return examMapper.selectById(examId);
    }

    @Override
    public List<StudentQuestion> getStudentQuestionList(Integer studentExamId) {
        // 根据studentExamId查询StudentQuestion的List
        QueryWrapper<StudentQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_exam_id", studentExamId);
        return studentQuestionMapper.selectList(queryWrapper);
    }

    @Override
    public List<List<StudentQuestionVO>> getStudentQuestionVOListList(List<StudentQuestion> studentQuestionList) {
        // 根据type分类
        List<List<StudentQuestionVO>> lists = new ArrayList<>();
        // 创建5个
        for (int i = 0; i < 5; i++) lists.add(new ArrayList<>());

        // 根据分类添加到对应的列表
        for (StudentQuestion cur : studentQuestionList) {
            // 创建VO
            StudentQuestionVO studentQuestionVO = new StudentQuestionVO();
            // 复制属性
            BeanUtils.copyProperties(cur, studentQuestionVO);

            // 添加选项信息
            QueryWrapper<StudentOption> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("student_question_id", cur.getId());
            List<StudentOption> studentOptions = studentOptionMapper.selectList(queryWrapper);
            studentQuestionVO.setOptions(studentOptions);

            // 获取类型的index
            int index = studentQuestionVO.getType().getType();
            // 添加到列表中
            lists.get(index).add(studentQuestionVO);
        }
        return lists;
    }

    @Override
    public PaperQuestion getPaperQuestion(Integer paperId, Integer questionId) {
        QueryWrapper<PaperQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .eq("paper_id", paperId)
                .eq("question_id", questionId);
        return paperQuestionMapper.selectOne(queryWrapper);
    }

    @Override
    public List<Option> getOptions(Integer questionId) {
        QueryWrapper<Option> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("question_id", questionId);
        return optionMapper.selectList(queryWrapper1);
    }

    @Override
    public boolean updateAnswer(SaveAnswerDTO saveAnswerDTO) {
        // 获取学生问题id
        Integer studentQuestionId = saveAnswerDTO.getStudentQuestionId();
        // 获取回答
        String answer = saveAnswerDTO.getAnswer();
        // 获取选项信息
        List<StudentOption> studentOptions = saveAnswerDTO.getStudentOptions();

        // 根据studentQuestionId得到类型
        StudentQuestion sq = studentQuestionMapper.selectById(studentQuestionId);
        TypeEnum type = sq.getType();

        // 更新答案
        StudentQuestion studentQuestion = new StudentQuestion();
        studentQuestion.setId(studentQuestionId);
        if (type == TypeEnum.SINGLE || type == TypeEnum.MULTI) {
            // 更新选项
            StringBuilder stringBuilder = new StringBuilder();
            boolean flag = false;   // 是否选了一个的标志
            int count = 0;  // 正确的数量
            for (StudentOption studentOption : studentOptions) {
                studentOptionMapper.updateById(studentOption);
                if (studentOption.getIsChecked() == 1) {
                    flag = true;
                    count++;
                    if (count == 1) stringBuilder.append(studentOption.getOptionId());
                    else stringBuilder.append(',').append(studentOption.getOptionId());
                }
            }
            // 如果选了一个选项
            if (flag) {
                studentQuestion.setIsAnswered(1);
                studentQuestion.setAnswer(stringBuilder.toString());
            } else {
                studentQuestion.setIsAnswered(0);
                studentQuestion.setAnswer(null);
            }
            studentQuestionMapper.updateById(studentQuestion);
        } else {
            // 更新答案
            if (answer != null && answer.length() > 0) {
                studentQuestion.setIsAnswered(1);
                studentQuestion.setAnswer(answer);
            } else {
                studentQuestion.setIsAnswered(0);
                studentQuestion.setAnswer(null);
            }
            studentQuestionMapper.updateById(studentQuestion);
        }

        return true;
    }

    @Override
    public BigDecimal checkAnswers(Integer studentExamId) {
        // 根据studentExamId得到所有的回答
        QueryWrapper<StudentQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_exam_id", studentExamId);
        List<StudentQuestion> studentQuestions = studentQuestionMapper.selectList(queryWrapper);

        // 遍历所有的回答
        BigDecimal totalScore = new BigDecimal(0);
        for (StudentQuestion cur : studentQuestions) {
            // 根据questionId得到question
            Question question = questionMapper.selectById(cur.getQuestionId());
            // 比较答案
            String studentQuestion = cur.getAnswer();
            String rightAnswer = question.getAnswer();
            if (studentQuestion == null || rightAnswer == null) continue;
            // 得到分数
            if (studentQuestion.equals(rightAnswer)) {
                // 答案正确，更新数据库
                StudentQuestion tmpAnswer = new StudentQuestion();
                tmpAnswer.setId(cur.getId());
                tmpAnswer.setIsRight(1);
                tmpAnswer.setGotScore(cur.getScore());
                studentQuestionMapper.updateById(tmpAnswer);
                // 加分
                totalScore = totalScore.add(cur.getScore());
            }
        }
        return totalScore;
    }

    @Override
    public StudentOption getStudentOption(Integer studentQuestionId, int optionId) {
        QueryWrapper<StudentOption> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .eq("student_question_id", studentQuestionId)
                .eq("option_id", optionId);
        StudentOption studentOption = studentOptionMapper.selectOne(queryWrapper);
        return studentOption;
    }

    @Override
    public boolean onlyHasObject(Integer studentExamId) {
        // 找该学生考试的所有题目
        QueryWrapper<StudentQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_exam_id", studentExamId);
        List<StudentQuestion> studentQuestions = studentQuestionMapper.selectList(queryWrapper);
        // 遍历每个题目
        for (StudentQuestion studentQuestion : studentQuestions) {
            if (studentQuestion.getType() == TypeEnum.BLANK || studentQuestion.getType() == TypeEnum.WRITE) {
                return false;
            }
        }
        return true;
    }

}
