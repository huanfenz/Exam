package com.wangpeng.controller.admin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.QueryPageExamDTO;
import com.wangpeng.pojo.po.Exam;
import com.wangpeng.pojo.po.Paper;
import com.wangpeng.other.result.BaseResult;
import com.wangpeng.other.result.PageResult;
import com.wangpeng.service.ExamService;
import com.wangpeng.service.PaperService;
import com.wangpeng.pojo.vo.ExamVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:04
 * @Description:
 */
@RestController
@RequestMapping("/admin/exam")
public class AdminExamController {

    @Autowired
    ExamService examService;

    @Autowired
    PaperService paperService;

    /**
     * 获取数量
     * @return 记录数量
     */
    @GetMapping(value = "/getCount")
    public BaseResult getCount(){
        return BaseResult.successData(examService.count());
    }

    /**
     * 查询所有
     * @return 对象列表
     */
    @GetMapping(value = "/queryAll")
    public PageResult queryAll(){
        List<Exam> list = examService.list();
        return PageResult.success((long) list.size(), list);
    }

    /**
     * 查询分页
     * @param queryPageExamDTO 查询参数
     * @return 分页结果集
     */
    @GetMapping(value = "/queryPage")
    public PageResult queryPage(QueryPageExamDTO queryPageExamDTO){
        // 根据条件得到分页
        Page<Exam> resPage = examService.getPage(queryPageExamDTO);

        // 得到旧的list
        List<Exam> list = resPage.getRecords();

        // 整合VO
        List<ExamVO> newList = new ArrayList<>();
        for (Exam exam : list) {
            // 根据 paperId 查询 paperName
            Paper paper = paperService.getById(exam.getPaperId());
            ExamVO examVO = new ExamVO();
            BeanUtils.copyProperties(exam, examVO);
            examVO.setPaperName(paper.getName());
            newList.add(examVO);
        }

        return PageResult.success(resPage.getTotal(), newList);
    }

    /**
     * 添加一个
     * @param exam 对象
     * @return 是否成功
     */
    @PostMapping(value = "/addOne")
    public BaseResult addOne(@RequestBody Exam exam){
        return BaseResult.boolResult(examService.save(exam));
    }

    /**
     * 删除一个
     * @param exam 对象
     * @return 是否成功
     */
    @DeleteMapping(value = "/deleteOne")
    public BaseResult deleteOne(@RequestBody Exam exam){
        try {
            examService.deleteExam(exam);
        } catch (Exception e) {
            return BaseResult.errorException(e);
        }
        return BaseResult.boolResult(true);
    }

    /**
     * 删除一些
     * @param exams 对象列表
     * @return 是否成功
     */
    @DeleteMapping(value = "/deleteSome")
    public BaseResult deleteSome(@RequestBody List<Exam> exams){
        int successCount = 0, failureCount = 0;
        for (Exam exam : exams) {
            try {
                examService.deleteExam(exam);
                successCount++;
            } catch (Exception e) {
                failureCount++;
            }
        }
        if (exams.size() == successCount) {
            return BaseResult.boolResult(true);
        } else {
            return BaseResult.errorMsg("成功【" + successCount + "】个，失败【" + failureCount + "】个");
        }
    }

    /**
     * 更新一个
     * @param exam 对象
     * @return 是否成功
     */
    @PutMapping(value = "/updateOne")
    public BaseResult updateOne(@RequestBody Exam exam){
        return BaseResult.boolResult(examService.updateById(exam));
    }

}
