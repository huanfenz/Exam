package com.wangpeng.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.QueryPageExamDTO;
import com.wangpeng.pojo.po.Exam;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author wangpeng
* @description 针对表【t_exam(考试表)】的数据库操作Service
* @createDate 2022-04-04 16:19:38
*/
public interface ExamService extends IService<Exam> {

    Page<Exam> getPage(QueryPageExamDTO queryPageExamDTO);

    void deleteExam(Exam exam);
}
