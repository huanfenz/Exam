package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.mapper.StudentExamMapper;
import com.wangpeng.pojo.dto.QueryPageExamDTO;
import com.wangpeng.pojo.po.Exam;
import com.wangpeng.pojo.po.StudentExam;
import com.wangpeng.service.ExamService;
import com.wangpeng.mapper.ExamMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author wangpeng
* @description 针对表【t_exam(考试表)】的数据库操作Service实现
* @createDate 2022-04-04 16:19:38
*/
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam>
    implements ExamService{

    @Autowired
    private StudentExamMapper studentExamMapper;

    @Override
    public Page<Exam> getPage(QueryPageExamDTO queryPageExamDTO) {
        // 获取分页对象
        Page<Exam> page = new Page<>(queryPageExamDTO.getPage(), queryPageExamDTO.getLimit());

        // 模糊查询试卷名、大于等于开始时间、小于等于结束时间
        String name = queryPageExamDTO.getName();
        String startTime = queryPageExamDTO.getStartTime();
        String endTime = queryPageExamDTO.getEndTime();

        QueryWrapper<Exam> queryWrapper = new QueryWrapper<>();
        queryWrapper
                .like(StringUtils.isNotBlank(name), "name", name)
                .ge(StringUtils.isNotBlank(startTime), "start_time", startTime)
                .le(StringUtils.isNotBlank(endTime), "end_time", endTime);

        return baseMapper.selectPage(page, queryWrapper);
    }

    @Override
    public void deleteExam(Exam exam) throws RuntimeException {
        // 找学生考试
        QueryWrapper<StudentExam> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("exam_id", exam.getId());
        Long count = studentExamMapper.selectCount(queryWrapper);
        if (count != 0) {
            throw new RuntimeException("该考试存在【" + count + "】条考试记录，无法删除！");
        }
        baseMapper.deleteById(exam);
    }
}
