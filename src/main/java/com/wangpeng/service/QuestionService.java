package com.wangpeng.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.QueryPageQuestionDTO;
import com.wangpeng.pojo.dto.QueryQuestionDTO;
import com.wangpeng.pojo.dto.SaveQuestionDTO;
import com.wangpeng.pojo.po.Question;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wangpeng.pojo.vo.QuestionVO;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* @author wangpeng
* @description 针对表【t_question(题目表)】的数据库操作Service
* @createDate 2022-03-25 14:03:39
*/
public interface QuestionService extends IService<Question> {

    Page<QuestionVO> getQuestionVOPage(QueryPageQuestionDTO queryPageQuestionDTO);

    boolean saveQuestionAndAnswer(SaveQuestionDTO saveQuestionDTO);

    void deleteQuestion(Question question);

    List<QuestionVO> getRandomQuestion(Integer repoId, Integer chapterId, Integer quantity, Integer typeId, List<Integer> excludeIdList);

    String exportExcel(QueryQuestionDTO queryQuestionDTO, HttpServletRequest req) throws Exception;

    void importExcel(String path);

}
