package com.wangpeng.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.QueryPageRecordDTO;
import com.wangpeng.pojo.enums.TypeEnum;
import com.wangpeng.pojo.po.*;
import com.wangpeng.other.result.BaseResult;
import com.wangpeng.other.result.PageResult;
import com.wangpeng.service.*;
import com.wangpeng.pojo.vo.student.StudentRecordVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: 王鹏
 * @Date: 2022/04/23/22:57
 * @Description:
 */
@RestController
@RequestMapping("/admin/record")
public class AdminRecordController {

    @Autowired
    StudentOptionService studentOptionService;

    @Autowired
    StudentQuestionService studentQuestionService;

    @Autowired
    StudentExamService studentExamService;

    @Autowired
    UserService userService;

    @Autowired
    ExamService examService;

    /**
     * 分页查询考试记录
     * @param queryPageRecordDTO
     * @return
     */
    @GetMapping("/queryPage")
    public BaseResult queryPage(QueryPageRecordDTO queryPageRecordDTO) {
        // 获取分页对象
        Page<StudentExam> page = new Page<>(queryPageRecordDTO.getPage(), queryPageRecordDTO.getLimit());

        // 获取参数
        Integer studentId = queryPageRecordDTO.getStudentId();
        Integer examId = queryPageRecordDTO.getExamId();
        Integer isFinished = queryPageRecordDTO.getIsFinished();
        Integer isQualify = queryPageRecordDTO.getIsQualify();
        Integer isChecked = queryPageRecordDTO.getIsChecked();
        String startTime = queryPageRecordDTO.getStartTime();
        String endTime = queryPageRecordDTO.getEndTime();

        // 等于学生id、等于考试id、等于是否完成、等于是否及格、大于开始时间、小于结束时间、已经完成
        QueryWrapper<StudentExam> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .eq(studentId != null, "student_id", studentId)
                .eq(examId != null, "exam_id", examId)
                .eq(isFinished != null, "is_finished", isFinished)
                .eq(isQualify != null, "is_qualify", isQualify)
                .eq(isChecked != null, "is_checked", isChecked)
                .ge(StringUtils.isNotBlank(startTime), "start_time", startTime)
                .le(StringUtils.isNotBlank(endTime), "end_time", endTime);

        // 查询
        Page<StudentExam> resPage = studentExamService.page(page, queryWrapper);
        // 获取列表
        List<StudentExam> studentExams = resPage.getRecords();
        // 整合VO
        List<StudentRecordVO> resList = new ArrayList<>();
        for (StudentExam studentExam : studentExams) {
            StudentRecordVO studentRecordVO = new StudentRecordVO();
            BeanUtils.copyProperties(studentExam, studentRecordVO);
            // 添加学生姓名和考试名
            // 根据学生id查询学生
            User student = userService.getById(studentExam.getStudentId());
            // 根据考试id查询考试
            Exam exam = examService.getById(studentExam.getExamId());
            // 整合
            studentRecordVO.setStudentName(student.getUsername());
            studentRecordVO.setExamName(exam.getName());
            // 添加到集合
            resList.add(studentRecordVO);
        }

        // 返回结果
        return PageResult.success(resPage.getTotal(), resList);
    }

    /**
     * 删除记录
     * @param studentExam
     * @return
     */
    @DeleteMapping("/deleteRecord")
    public BaseResult deleteRecord(@RequestBody StudentExam studentExam) {
        Integer studentExamId = studentExam.getId();
        // 找到相关的问题
        QueryWrapper<StudentQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_exam_id",studentExamId);
        List<StudentQuestion> list = studentQuestionService.list(queryWrapper);
        for (StudentQuestion studentQuestion : list) {
            if (studentQuestion.getType() == TypeEnum.SINGLE || studentQuestion.getType() == TypeEnum.MULTI) {
                // 找选项
                QueryWrapper<StudentOption> queryWrapper1 = new QueryWrapper<>();
                queryWrapper1.eq("student_question_id", studentQuestion.getId());
                // 删除学生选项
                studentOptionService.remove(queryWrapper1);
            }
        }
        // 删除学生问题
        studentQuestionService.remove(queryWrapper);
        // 删除学生考试
        studentExamService.removeById(studentExamId);

        return BaseResult.boolResult(true);
    }

    /**
     * 删除一些记录
     * @param studentExams
     * @return
     */
    @DeleteMapping("/deleteRecords")
    public BaseResult deleteRecords(@RequestBody List<StudentExam> studentExams) {
        for (StudentExam studentExam : studentExams) {
            deleteRecord(studentExam);
        }
        return BaseResult.boolResult(true);
    }

    /**
     * 修改分数
     * @param data
     * @return
     */
    @PutMapping("alterScore")
    public BaseResult alterScore(@RequestBody Map<String, Object> data) {
        Integer studentExamId = (Integer) data.get("studentExamId");
        Integer studentQuestionId = (Integer) data.get("studentQuestionId");
        BigDecimal newScore = new BigDecimal((String) data.get("newScore"));
        // 得到原得分
        StudentQuestion studentQuestion = studentQuestionService.getById(studentQuestionId);
        BigDecimal oldScore = studentQuestion.getGotScore();
        // 更新正确状态
        int isRight = 0;
        if (newScore.compareTo(BigDecimal.ZERO) > 0) {
            isRight = 1;
        }
        // 更新题目得分
        StudentQuestion tmpSQ = new StudentQuestion();
        tmpSQ.setId(studentQuestionId);
        tmpSQ.setGotScore(newScore);
        tmpSQ.setIsRight(isRight);
        studentQuestionService.updateById(tmpSQ);
        // 更新试卷得分
        // 得到新旧得分的差值
        BigDecimal diffScore = newScore.subtract(oldScore);
        // 得到旧的试卷得分
        StudentExam studentExam = studentExamService.getById(studentExamId);
        BigDecimal oldPaperScore = studentExam.getScore();
        // 计算新的试卷得分
        BigDecimal newPaperScore = oldPaperScore.add(diffScore);
        // 得到及格分数
        BigDecimal qualifyScore = studentExam.getQualifyScore();
        // 是否及格
        int isQualify = 0;
        if (newPaperScore.compareTo(qualifyScore) >= 0) {
            isQualify = 1;
        }
        // 更新试卷得分
        StudentExam tmpSE = new StudentExam();
        tmpSE.setId(studentExamId);
        tmpSE.setScore(newPaperScore);
        tmpSE.setIsQualify(isQualify);
        studentExamService.updateById(tmpSE);
        // 返回试卷得分
        return BaseResult.successData(newPaperScore);
    }

    /**
     * 提交批改
     * @param data
     * @return
     */
    @PostMapping("/commitCheck")
    public BaseResult commitCheck(@RequestBody Map<String, Object> data) {
        Integer studentExamId = (Integer) data.get("studentExamId");
        // 更新学生试卷
        StudentExam studentExam = new StudentExam();
        studentExam.setId(studentExamId);
        studentExam.setIsChecked(1);
        studentExamService.updateById(studentExam);

        return BaseResult.boolResult(true);
    }
}
