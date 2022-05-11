package com.wangpeng.controller.student;

import com.wangpeng.controller.admin.AdminExamController;
import com.wangpeng.pojo.dto.QueryPageExamDTO;
import com.wangpeng.pojo.dto.SaveAnswerDTO;
import com.wangpeng.pojo.enums.TypeEnum;
import com.wangpeng.pojo.po.*;
import com.wangpeng.other.result.BaseResult;
import com.wangpeng.other.result.PageResult;
import com.wangpeng.service.*;
import com.wangpeng.pojo.vo.PaperQuestionVO;
import com.wangpeng.pojo.vo.student.AnswerInfoVO;
import com.wangpeng.pojo.vo.student.StudentQuestionVO;
import com.wangpeng.pojo.vo.student.StudentExamQuestionVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:04
 * @Description:
 */
@RestController
@RequestMapping("/student/exam")
public class StudentExamController {

    @Autowired
    AdminExamController adminExamController;

    @Autowired
    QuestionService questionService;

    @Autowired
    PaperService paperService;

    @Autowired
    ExamService examService;

    @Autowired
    StudentExamService studentExamService;
    
    @Autowired
    StudentOptionService studentOptionService;

    @Autowired
    UserService userService;

    /**
     * 查询分页
     * @param queryPageExamDTO 查询参数
     * @return 分页结果集
     */
    @GetMapping(value = "/queryPage")
    public PageResult queryPage(QueryPageExamDTO queryPageExamDTO){
        return adminExamController.queryPage(queryPageExamDTO);
    }

    /**
     * 检查考试密码
     * @param data
     * @return
     */
    @PostMapping("/checkPassword")
    public BaseResult checkPassword(@RequestBody Map<String, Object> data) {
        // 获取examId
        Integer examId = (Integer) data.get("examId");
        // 获取password
        String password = (String) data.get("password");
        // 校验参数
        if (examId == null || password == null) return BaseResult.errorMsg("参数错误");

        // 获取Exam对象
        Exam exam = examService.getById(examId);
        // 返回校验结果
        return BaseResult.boolResult(password.equals(exam.getPassword()));
    }

    /**
     * 创建学生考试
     * @param data
     * @return
     */
    @PostMapping("/createStudentExam")
    public BaseResult createStudentExam(@RequestBody Map<String, Object> data) {
        // 获取学生id
        Integer studentId = (Integer) data.get("studentId");
        // 获取考试id
        Integer examId = (Integer) data.get("examId");

        // 创建学生考试
        Integer studentExamId;
        try {
            studentExamId = studentExamService.createStudentExam(studentId, examId);
        } catch (RuntimeException e) {
            return BaseResult.errorMsg(e.getMessage());
        }

        // 返回结果
        return BaseResult.successData(studentExamId);
    }

    /**
     * 获取考试信息（包括考试信息和答题信息）
     * @param studentExamId
     * @return
     */
    @GetMapping("/getExamInfo")
    public BaseResult getExamInfo(Integer studentExamId) {
        // 根据studentExamId得到exam
        Exam exam = studentExamService.getExam(studentExamId);

        // 根据studentExamId得到studentQuestionList
        List<StudentQuestion> studentQuestionList = studentExamService.getStudentQuestionList(studentExamId);

        // studentQuestionList 转成 StudentQuestionVOListList
        List<List<StudentQuestionVO>> lists = studentExamService.getStudentQuestionVOListList(studentQuestionList);

        // 得到studentExam
        StudentExam studentExam = studentExamService.getById(studentExamId);

        // 得到开始时间
        Date startTime = studentExam.getStartTime();
        // 得到当前时间
        Date curTime = new Date();
        // 已经过了的时间
        long passSeconds = (curTime.getTime() - startTime.getTime()) / 1000;
        // 计算剩余时间
        long leftSeconds = exam.getDuration() * 60 - passSeconds;

        // 整合
        Map<String, Object> res = new HashMap<>();
        res.put("examInfo", exam);
        res.put("questionList", lists);
        res.put("leftSeconds", leftSeconds);

        // 返回结果
        return BaseResult.successData(res);
    }

    /**
     * 根据paperId和questionId获取问题
     * @param questionId
     * @return
     */
    @GetMapping("/getQuestion")
    public BaseResult getQuestion(Integer paperId, Integer questionId) {
        // 获取question
        Question question = questionService.getById(questionId);

        // 获取paperQuestion
        PaperQuestion paperQuestion = studentExamService.getPaperQuestion(paperId, questionId);

        // 根据questionId查询选项
        List<Option> options = studentExamService.getOptions(question.getId());

        // 整合VO
        StudentExamQuestionVO studentExamQuestionVO = new StudentExamQuestionVO();
        BeanUtils.copyProperties(question, studentExamQuestionVO);
        BeanUtils.copyProperties(paperQuestion, studentExamQuestionVO);
        studentExamQuestionVO.setOptions(options);

        // 返回结果
        return BaseResult.successData(studentExamQuestionVO);
    }

    /**
     * 保存回答
     * @param saveAnswerDTO
     * @return
     */
    @PostMapping("/saveAnswer")
    public BaseResult saveAnswer(@RequestBody SaveAnswerDTO saveAnswerDTO) {
        // 更新回答
        studentExamService.updateAnswer(saveAnswerDTO);

        // 返回结果
        return BaseResult.boolResult(true);
    }

    /**
     * 提交试卷
     * @param data
     * @return
     */
    @PostMapping("/commitPaper")
    public BaseResult commitPaper(@RequestBody Map<String, Object> data) {
        Integer studentExamId = (Integer) data.get("studentExamId");

        // 核对答案并返回得分
        BigDecimal score = studentExamService.checkAnswers(studentExamId);

        // 得到及格分数
        // 根据studentExamId查询examId
        StudentExam studentExam = studentExamService.getById(studentExamId);
        BigDecimal qualifyScore = studentExam.getQualifyScore();

        // 是否及格
        int isQualify = 0;
        if (score.compareTo(qualifyScore) >= 0) {
            isQualify = 1;
        }

        // 如果只有客观题，则直接批改完成
        int isChecked = 0;
        if (studentExamService.onlyHasObject(studentExamId)) {
            isChecked = 1;
        }

        // 更新考试结果
        StudentExam tmpExam = new StudentExam();
        tmpExam.setId(studentExamId);
        // 设置分数
        tmpExam.setScore(score);
        // 设置完成时间
        tmpExam.setFinishTime(new Date());
        // 设置及格情况
        tmpExam.setIsQualify(isQualify);
        // 设置已完成
        tmpExam.setIsFinished(1);
        // 设置已批改
        tmpExam.setIsChecked(isChecked);
        studentExamService.updateById(tmpExam);

        // 返回结果
        return BaseResult.successData(true);
    }

    /**
     * 获得分数
     * @param studentExamId
     * @return
     */
    @GetMapping("/getScore")
    public BaseResult getScore(Integer studentExamId) {
        StudentExam studentExam = studentExamService.getById(studentExamId);
        BigDecimal score = studentExam.getScore();
        return BaseResult.successData(score);
    }

    /**
     * 获得详情
     * @param studentExamId
     * @return
     */
    @GetMapping("/getDetail")
    public BaseResult getDetail(Integer studentExamId) {
        // 得到考试信息
        Exam exam = studentExamService.getExam(studentExamId);
        // 得到学生考试信息
        StudentExam studentExam = studentExamService.getById(studentExamId);

        // 获得考试名
        String examName = exam.getName();
        // 获得完成时间
        Date finishTime = studentExam.getFinishTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String finishTimeStr = sdf.format(finishTime);

        // 获得学生姓名
        Integer studentId = studentExam.getStudentId();
        User user = userService.getById(studentId);
        String studentName = user.getUsername();
        // 计算使用时间
        Date startTime = studentExam.getStartTime();
        long start = startTime.getTime();
        long finish = finishTime.getTime();
        long useTime = (finish - start) / 1000 / 60;
        // 获得分数
        BigDecimal score = studentExam.getScore();
        // 获得paperQuestionVOListList
        List<List<PaperQuestionVO>> paperQuestionVOListList = paperService.getPaperQuestionVOListList(exam.getPaperId());
        // 获得回答信息
        List<List<AnswerInfoVO>> AnswerInfoVOListList = new ArrayList<>();
        for (int i = 0; i < 5; i++) AnswerInfoVOListList.add(new ArrayList<>());
        List<StudentQuestion> studentQuestionList = studentExamService.getStudentQuestionList(studentExamId);

        for (StudentQuestion studentQuestion : studentQuestionList) {
            // 得到学生题目id
            Integer studentQuestionId = studentQuestion.getId();
            // 得到题目类型
            TypeEnum typeEnum = studentQuestion.getType();
            // 得到您的答案
            String yourAnswer = studentQuestion.getAnswer();
            if (yourAnswer != null) {
                // 转换答案
                if (typeEnum == TypeEnum.SINGLE) {
                    int optionId = Integer.parseInt(yourAnswer);
                    StudentOption two = studentExamService.getStudentOption(studentQuestionId, optionId);
                    yourAnswer = two.getAbc();
                } else if (typeEnum == TypeEnum.MULTI) {
                    String[] strings = yourAnswer.split(",");
                    StringBuilder stringBuilder = new StringBuilder();
                    for (String str : strings) {
                        int optionId = Integer.parseInt(str);
                        StudentOption one = studentExamService.getStudentOption(studentQuestionId, optionId);
                        stringBuilder.append(one.getAbc());
                    }
                    yourAnswer = stringBuilder.toString();
                } else if (typeEnum == TypeEnum.JUDGE) {
                    if (yourAnswer.equals("true")) {
                        yourAnswer = "正确";
                    } else {
                        yourAnswer = "错误";
                    }
                }
            }

            // 得到是否正确
            Integer isRight = studentQuestion.getIsRight();
            // 得到得分
            BigDecimal gotScore = studentQuestion.getGotScore();

            AnswerInfoVO answerInfoVO = new AnswerInfoVO();
            answerInfoVO.setStudentQuestionId(studentQuestionId);
            answerInfoVO.setYourAnswer(yourAnswer);
            answerInfoVO.setIsRight(isRight);
            answerInfoVO.setGotScore(gotScore);

            int index = typeEnum.getType();
            AnswerInfoVOListList.get(index).add(answerInfoVO);
        }

        Map<String, Object> resMap = new HashMap<>();
        resMap.put("examName", examName);
        resMap.put("finishTime", finishTimeStr);
        resMap.put("studentName", studentName);
        resMap.put("useTime", useTime);
        resMap.put("score", score);
        resMap.put("questionList", paperQuestionVOListList);
        resMap.put("answerList", AnswerInfoVOListList);

        return BaseResult.successData(resMap);
    }
}
