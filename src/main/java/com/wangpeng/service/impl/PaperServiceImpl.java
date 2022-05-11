package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.pojo.dto.SavePaperDTO;
import com.wangpeng.mapper.*;
import com.wangpeng.pojo.po.*;
import com.wangpeng.service.ExamService;
import com.wangpeng.service.PaperService;
import com.wangpeng.pojo.vo.PaperInfoVO;
import com.wangpeng.pojo.vo.PaperQuestionVO;
import com.wangpeng.pojo.vo.PaperVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
* @author wangpeng
* @description 针对表【t_paper(试卷表)】的数据库操作Service实现
* @createDate 2022-03-28 11:25:29
*/
@Service
public class PaperServiceImpl extends ServiceImpl<PaperMapper, Paper>
    implements PaperService{

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private OptionMapper optionMapper;

    @Autowired
    private PaperQuestionMapper paperQuestionMapper;

    @Autowired
    private ExamMapper examMapper;

    /**
     * 保存试卷
     * @param savePaperDTO
     * @return
     */
    @Override
    @Transactional
    public void savePaper(SavePaperDTO savePaperDTO) throws RuntimeException {
        // 如果发布了考试，同样不能修改
        QueryWrapper<Exam> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("paper_id", savePaperDTO.getPaper().getId());
        Long count = examMapper.selectCount(queryWrapper);
        if (count != 0) {
            throw new RuntimeException("该试卷发布了【" + count + "】场考试，无法更改试卷！");
        }

        // 获取Paper
        Paper paper = savePaperDTO.getPaper();

        if (paper.getId() == null) {
            // 添加试卷
            baseMapper.insert(paper);
        } else {
            // 更新试卷
            baseMapper.updateById(paper);

            // 删除所有的PaperQuestion
            QueryWrapper<PaperQuestion> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("paper_id", paper.getId());
            paperQuestionMapper.delete(queryWrapper1);
        }

        // 获取PaperQuestion的List
        List<List<PaperQuestion>> scoreQuestionDTOListList = savePaperDTO.getPaperQuestionListList();
        for (List<PaperQuestion> pql : scoreQuestionDTOListList) {
            int count1 = 0;
            for (PaperQuestion pq : pql) {
                // 添加paperId
                pq.setPaperId(paper.getId());
                // 添加orderNum
                pq.setOrderNum(++count1);
                // 添加paperQuestion
                paperQuestionMapper.insert(pq);
            }
        }
    }

    /**
     * 获得paperVO
     * @param paperId
     * @return
     */
    public PaperVO getPaperVO(Integer paperId) {
        // 根据id查询试卷
        Paper paper = baseMapper.selectById(paperId);
        // 根据creator查询creatorName
        User user = userMapper.selectById(paper.getCreator());
        // 整合VO
        PaperVO paperVO = new PaperVO();
        BeanUtils.copyProperties(paper, paperVO);
        paperVO.setCreatorName(user.getUsername());
        return paperVO;
    }

    /**
     * 根据paperId得到paperQuestionVOListList
     * @param paperId
     * @return
     */
    public List<List<PaperQuestionVO>> getPaperQuestionVOListList(Integer paperId) {
        // 根据试卷id查询paperQuestion
        QueryWrapper<PaperQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("paper_id", paperId);
        List<PaperQuestion> paperQuestions = paperQuestionMapper.selectList(queryWrapper);
        // 结果集合
        List<List<PaperQuestionVO>> paperQuestionVOListList = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            paperQuestionVOListList.add(new ArrayList<>());
        }
        // 处理问题
        for (PaperQuestion paperQuestion : paperQuestions) {
            // 根据问题id查询问题
            Question question = questionMapper.selectById(paperQuestion.getQuestionId());
            // 根据问题id查询选项
            QueryWrapper<Option> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("question_id", question.getId());
            List<Option> options = optionMapper.selectList(queryWrapper1);

            // 整合VO
            PaperQuestionVO paperQuestionVO = new PaperQuestionVO();
            BeanUtils.copyProperties(paperQuestion, paperQuestionVO);
            BeanUtils.copyProperties(question, paperQuestionVO);
            paperQuestionVO.setId(paperQuestion.getId());
            paperQuestionVO.setOptions(options);

            // 添加到集合中
            int typeId = paperQuestionVO.getType().getType();
            paperQuestionVOListList.get(typeId).add(paperQuestionVO);
        }
        return paperQuestionVOListList;
    }

    /**
     * 获得试卷信息
     * @param paperId
     * @return
     */
    @Override
    @Transactional
    public PaperInfoVO getPaper(Integer paperId) {
        // 获得paperVO
        PaperVO paperVO = getPaperVO(paperId);

        // 获得PaperQuestionListList
        List<List<PaperQuestionVO>> paperQuestionVOListList = getPaperQuestionVOListList(paperId);

        // 最终结果
        PaperInfoVO paperInfoVO = new PaperInfoVO();
        paperInfoVO.setPaper(paperVO);
        paperInfoVO.setPaperQuestionListList(paperQuestionVOListList);

        return paperInfoVO;
    }

    @Override
    public void removePaper(Paper paper) throws RuntimeException {
        // 找考试
        QueryWrapper<Exam> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("paper_id", paper.getId());
        Long count = examMapper.selectCount(queryWrapper);
        if (count != 0) {
            throw new RuntimeException("该试卷发布了【" + count + "】场考试，无法删除！");
        }
        // 删除paperQuestion，paperId
        QueryWrapper<PaperQuestion> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("paper_id", paper.getId());
        paperQuestionMapper.delete(queryWrapper1);

        // 删除paper
        baseMapper.deleteById(paper);
    }

}
