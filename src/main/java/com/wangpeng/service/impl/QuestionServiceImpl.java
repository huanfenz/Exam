package com.wangpeng.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.mapper.*;
import com.wangpeng.other.listener.QuestionExcelListener;
import com.wangpeng.other.utils.MyData;
import com.wangpeng.pojo.bo.QuestionExcel;
import com.wangpeng.pojo.dto.QueryPageQuestionDTO;
import com.wangpeng.pojo.dto.QueryQuestionDTO;
import com.wangpeng.pojo.dto.SaveQuestionDTO;
import com.wangpeng.pojo.enums.TypeEnum;
import com.wangpeng.pojo.po.Option;
import com.wangpeng.pojo.po.PaperQuestion;
import com.wangpeng.pojo.po.Question;
import com.wangpeng.pojo.po.StudentQuestion;
import com.wangpeng.service.MyUploadService;
import com.wangpeng.service.QuestionService;
import com.wangpeng.pojo.vo.QuestionVO;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
* @author wangpeng
* @description 针对表【t_question(题目表)】的数据库操作Service实现
* @createDate 2022-03-25 14:03:39
*/
@Service
public class QuestionServiceImpl extends ServiceImpl<QuestionMapper, Question>
    implements QuestionService{

    @Autowired
    private MyUploadService myUploadService;

    @Autowired
    private OptionMapper optionMapper;

    @Autowired
    private PaperQuestionMapper paperQuestionMapper;

    @Autowired
    private StudentQuestionMapper studentQuestionMapper;

    @Override
    public Page<QuestionVO> getQuestionVOPage(QueryPageQuestionDTO queryPageQuestionDTO) {
        Page<QuestionVO> page = new Page<>(queryPageQuestionDTO.getPage(), queryPageQuestionDTO.getLimit());
        return baseMapper.getQuestionVOPage(page
                , queryPageQuestionDTO.getRepoId()
                , queryPageQuestionDTO.getChapterId()
                ,queryPageQuestionDTO.getType()
                , queryPageQuestionDTO.getContent()
                , queryPageQuestionDTO.getExcludeIdList());
    }

    @Override
    @Transactional
    public boolean saveQuestionAndAnswer(SaveQuestionDTO saveQuestionDTO) {
        // 获取题目
        Question question = saveQuestionDTO.getQuestion();
        // 获取选项
        Option[] options = saveQuestionDTO.getOption();
        // 获取题目类型
        TypeEnum type = question.getType();

        if (baseMapper.selectById(question.getId()) != null) {
            // 如果题目存在，则更新题目
            baseMapper.updateById(question);
            // 删除该题目的所有选项
            QueryWrapper<Option> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("question_id", question.getId());
            optionMapper.delete(queryWrapper);
        } else {
            // 否则新增题目
            baseMapper.insert(question);
        }
        // 如果是单选题或多选题
        if (type == TypeEnum.SINGLE || type == TypeEnum.MULTI) {
            StringBuilder str = new StringBuilder();
            for (Option cur : options) {
                // 给选项添加问题id
                cur.setQuestionId(question.getId());
                // 增加选项
                cur.setId(null);
                optionMapper.insert(cur);
                if (cur.getIsRight() == 1) {
                    // 是答案，记录id
                    Integer curId = cur.getId();
                    if (str.length() == 0) {
                        str.append(curId);
                    } else {
                        str.append(',').append(curId);
                    }
                }
            }
            // 更新问题的答案
            question.setAnswer(str.toString());
            baseMapper.updateById(question);
        }

        return true;
    }

    @Override
    @Transactional
    public void deleteQuestion(Question question) throws RuntimeException {
        // 找试卷题目
        QueryWrapper<PaperQuestion> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("question_id", question.getId());
        Long count = paperQuestionMapper.selectCount(queryWrapper);
        if (count != 0) {
            throw new RuntimeException("该题目被【" + count + "】道试卷题目所参照，无法删除！");
        }
        // 找学生题目
        QueryWrapper<StudentQuestion> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("question_id", question.getId());
        Long count1 = studentQuestionMapper.selectCount(queryWrapper1);
        if (count1 != 0) {
            throw new RuntimeException("该题目被【" + count + "】道学生试卷题目所参照，无法删除！");
        }
        // 如果是单选题和多选题
        if (question.getType() == TypeEnum.SINGLE || question.getType() == TypeEnum.MULTI) {
            // 删除该题目的选项
            // 获取题目id
            Integer questionId = question.getId();
            // 删除该题目id的选项
            QueryWrapper<Option> queryWrapper2 = new QueryWrapper<>();
            queryWrapper2.eq("question_id", questionId);
            optionMapper.delete(queryWrapper2);
        }
        // 删除题目
        baseMapper.deleteById(question);
    }

    @Override
    public List<QuestionVO> getRandomQuestion(Integer repoId, Integer chapterId, Integer quantity, Integer typeId, List<Integer> excludeIdList) {
        return baseMapper.selectQuestionsByRandom(repoId, chapterId, quantity, typeId, excludeIdList);
    }

    // 根据选项id，得到abc
    private String getAbc(Integer optionId) {
        Option option = optionMapper.selectById(optionId);
        return option.getAbc();
    }

    // 导出数据格式转换
    private List<QuestionExcel> data(List<QuestionVO> questionVOS) {
        List<QuestionExcel> res = new ArrayList<>();

        for (QuestionVO qvo : questionVOS) {
            QuestionExcel qe = new QuestionExcel();
            // 复制属性
            BeanUtils.copyProperties(qvo, qe);

            // 处理类型
            qe.setType(qvo.getType().getTypeName());

            // 处理答案
            if (qvo.getType() == TypeEnum.SINGLE) {
                // 单选，取abc
                Integer optionId = Integer.parseInt(qvo.getAnswer());
                String newAnswer = getAbc(optionId);
                qe.setAnswer(newAnswer);
            } else if (qvo.getType() == TypeEnum.MULTI) {
                // 多选
                String[] strings = qvo.getAnswer().split(",");
                StringBuilder stringBuilder = new StringBuilder();
                for (String str : strings) {
                    Integer optionId = Integer.parseInt(str);
                    String abc = getAbc(optionId);
                    stringBuilder.append(abc);
                }
                String newAnswer = stringBuilder.toString();
                qe.setAnswer(newAnswer);
            } else if (qvo.getType() == TypeEnum.JUDGE) {
                if (qvo.getAnswer().equals("true")) {
                    qe.setAnswer("正确");
                } else {
                    qe.setAnswer("错误");
                }
            }

            // 处理选项
            StringBuilder opSb = new StringBuilder();

            for (Option option : qvo.getOptions()) {
                String content = option.getContent();
                String image = option.getImage();

                if (opSb.length() != 0) opSb.append("\n");
                if (content != null) opSb.append(content);
                if (image != null) opSb.append("(").append(image).append(")");
            }
            qe.setOptionContent(opSb.toString());

            res.add(qe);
        }

        return res;
    }

    @Override
    public String exportExcel(QueryQuestionDTO queryQuestionDTO, HttpServletRequest req) throws Exception {
        List<QuestionVO> questionVOS = baseMapper.getQuestionVO(
                queryQuestionDTO.getRepoId()
                , queryQuestionDTO.getChapterId()
                ,queryQuestionDTO.getType()
                , queryQuestionDTO.getContent());

        // 得到本地资源目录
        String localDir = MyData.resourcePath + "/output";   //本地目录
        // 如果结果目录不存在，则创建目录
        File resDirFile = new File(localDir);
        if(!resDirFile.exists()) {
            boolean flag = resDirFile.mkdirs();
            if(!flag) throw new RuntimeException("创建目录失败");
        }
        // 文件地址（加个时间戳防止重名）
        String newFileName = System.currentTimeMillis() + "题目导出表.xlsx";
        String fileName = localDir + "/" + newFileName;

        // 写入excel
        EasyExcel.write(fileName, QuestionExcel.class)
                .sheet("题目表").doWrite(data(questionVOS));

        // 上传OSS
        InputStream inputStream = new FileInputStream(fileName);
        return myUploadService.aliyunUpdate(inputStream, "exportExcel", newFileName);
    }

    @Override
    public void importExcel(String path) {
        EasyExcel.read(path, QuestionExcel.class, new QuestionExcelListener(baseMapper, optionMapper)).sheet().doRead();
    }

}
