package com.wangpeng.controller.admin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.GetRandomQuestionDTO;
import com.wangpeng.pojo.dto.QueryPageQuestionDTO;
import com.wangpeng.pojo.dto.QueryQuestionDTO;
import com.wangpeng.pojo.dto.SaveQuestionDTO;
import com.wangpeng.pojo.po.Question;
import com.wangpeng.other.result.BaseResult;
import com.wangpeng.other.result.PageResult;
import com.wangpeng.service.OptionService;
import com.wangpeng.service.QuestionService;
import com.wangpeng.pojo.vo.QuestionVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:04
 * @Description:
 */
@RestController
@RequestMapping("/admin/question")
public class AdminQuestionController {

    @Autowired
    QuestionService questionService;

    @Autowired
    OptionService optionService;

    /**
     * 获取数量
     * @return 记录数量
     */
    @GetMapping(value = "/getCount")
    public BaseResult getCount(){
        return BaseResult.successData(questionService.count());
    }

    /**
     * 查询所有
     * @return 对象列表
     */
    @GetMapping(value = "/queryAll")
    public PageResult queryAll(){
        List<Question> list = questionService.list();
        return PageResult.success((long) list.size(), list);
    }

    /**
     * 查询分页
     * @param queryPageQuestionDTO 查询参数
     * @return 分页结果集
     */
    @GetMapping(value = "/queryPage")
    public PageResult queryPage(QueryPageQuestionDTO queryPageQuestionDTO){
        Page<QuestionVO> page = questionService.getQuestionVOPage(queryPageQuestionDTO);
        return PageResult.success(page.getTotal(), page.getRecords());
    }

    /**
     * 添加一个
     * @param question 对象
     * @return 是否成功
     */
    @PostMapping(value = "/addOne")
    public BaseResult addOne(@RequestBody Question question){
        return BaseResult.boolResult(questionService.save(question));
    }

    /**
     * 删除一些
     * @param questions 对象列表
     * @return 是否成功
     */
    @DeleteMapping(value = "/deleteSome")
    public BaseResult deleteSome(@RequestBody List<Question> questions){
        return BaseResult.boolResult(questionService.removeBatchByIds(questions));
    }

    /**
     * 更新一个
     * @param question 对象
     * @return 是否成功
     */
    @PutMapping(value = "/updateOne")
    public BaseResult updateOne(@RequestBody Question question){
        return BaseResult.boolResult(questionService.updateById(question));
    }

    /**
     * 保存题目
     * @param saveQuestionDTO
     * @return
     */
    @PostMapping("/saveQuestion")
    public BaseResult saveQuestion(@RequestBody SaveQuestionDTO saveQuestionDTO) {
        boolean flag = questionService.saveQuestionAndAnswer(saveQuestionDTO);
        return BaseResult.boolResult(flag);
    }

    /**
     * 移除题目
     * @param question
     * @return
     */
    @PostMapping("/removeQuestion")
    public BaseResult removeQuestion(@RequestBody Question question) {
        try {
            questionService.deleteQuestion(question);
        } catch (Exception e) {
            return BaseResult.errorException(e);
        }
        return BaseResult.boolResult(true);
    }

    /**
     * 移除一些题目
     * @param questions
     * @return
     */
    @PostMapping("/removeQuestions")
    public BaseResult removeQuestions(@RequestBody List<Question> questions) {
        int successCount = 0, failureCount = 0;
        for (Question cur : questions) {
            try {
                questionService.deleteQuestion(cur);
                successCount++;
            } catch (Exception e) {
                failureCount++;
            }
        }
        if (successCount == questions.size()) {
            return BaseResult.boolResult(true);
        } else {
            return BaseResult.errorMsg("成功【" + successCount + "】个，失败【" + failureCount + "】个");
        }
    }

    /**
     * 得到随机题目
     * @param getRandomQuestionDTO
     * @return
     */
    @GetMapping("/getRandomQuestion")
    public BaseResult getRandomQuestion(GetRandomQuestionDTO getRandomQuestionDTO) {
        Integer repoId = getRandomQuestionDTO.getRepoId();
        Integer chapterId = getRandomQuestionDTO.getChapterId();
        Integer quantity = getRandomQuestionDTO.getQuantity();
        Integer typeId = getRandomQuestionDTO.getTypeId();
        List<Integer> excludeIdList = getRandomQuestionDTO.getExcludeIdList();

        if (typeId == null) {
            return BaseResult.errorMsg("类型id不能为空");
        }
        if (quantity == null || quantity == 0) {
            return BaseResult.errorMsg("数量不能为空或0");
        }

        List<QuestionVO> questions = questionService.getRandomQuestion(repoId, chapterId, quantity, typeId, excludeIdList);

        if (questions.size() < quantity) {
            return BaseResult.errorMsg("题目数量不够，期待"+quantity+"题，仅有"+questions.size()+"题，请检查！");
        }

        return BaseResult.successData(questions);
    }

    /**
     * 导出题目
     * @param queryQuestionDTO
     * @param req
     * @return
     * @throws Exception
     */
    @PostMapping("/exportExcel")
    public BaseResult exportExcel(@RequestBody QueryQuestionDTO queryQuestionDTO, HttpServletRequest req) throws Exception {
        String url = questionService.exportExcel(queryQuestionDTO, req);
        return BaseResult.successData(url);
    }

}
