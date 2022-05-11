package com.wangpeng.other.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.wangpeng.mapper.OptionMapper;
import com.wangpeng.mapper.QuestionMapper;
import com.wangpeng.pojo.bo.QuestionExcel;
import com.wangpeng.pojo.enums.TypeEnum;
import com.wangpeng.pojo.po.Option;
import com.wangpeng.pojo.po.Question;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/26/20:49
 * @Description:
 */

public class QuestionExcelListener extends AnalysisEventListener<QuestionExcel> {

    private static final Logger LOGGER = LoggerFactory.getLogger(QuestionExcelListener.class);

    private static final int BATCH_COUNT = 5;
    List<QuestionExcel> list = new ArrayList<>();

    QuestionMapper questionMapper;
    OptionMapper optionMapper;

    public QuestionExcelListener(QuestionMapper questionMapper, OptionMapper optionMapper) {
        this.questionMapper = questionMapper;
        this.optionMapper = optionMapper;
    }

    /**
     * 执行业务
     * @param data
     * @param context
     */
    @Override
    public void invoke(QuestionExcel data, AnalysisContext context) {
//        System.out.println(JSON.toJSONString(data));
        list.add(data);
        System.out.println(list);
        // 达到BATCH_COUNT了，需要去存储一次数据库，防止数据几万条数据在内存，容易OOM
        if (list.size() >= BATCH_COUNT) {
            saveData();
            // 存储完成清理 list
            list.clear();
        }
    }

    /**
     * AOP执行后
     * @param context
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext context) {
        // 这里也要保存数据，确保最后遗留的数据也存储到数据库
        saveData();
        LOGGER.info("所有数据解析完成！");
    }

    // abc转索引（从0开始）
    private int toIndex(char c) {
        return (int)c - 65;
    }

    private void saveData() {
        for (QuestionExcel qe : list) {
            // 添加题目
            Question question = new Question();
            // 复制属性
            BeanUtils.copyProperties(qe, question);
            // 处理类型和答案
            List<Integer> answerIndex = new ArrayList<>();
            if (qe.getType().equals("单选题")) {
                question.setType(TypeEnum.SINGLE);
                // 处理答案
                char c = qe.getAnswer().charAt(0);
                answerIndex.add(toIndex(c));
            } else if (qe.getType().equals("多选题")) {
                question.setType(TypeEnum.MULTI);
                // 处理答案
                char[] chars = qe.getAnswer().toCharArray();
                for (char c : chars) {
                    answerIndex.add(toIndex(c));
                }
            } else if (qe.getType().equals("判断题")) {
                question.setType(TypeEnum.JUDGE);
                if (qe.getAnswer().equals("正确")) {
                    question.setAnswer("true");
                } else {
                    question.setAnswer("false");
                }
            } else if (qe.getType().equals("填空题")) {
                question.setType(TypeEnum.BLANK);
            } else if (qe.getType().equals("简答题")) {
                question.setType(TypeEnum.WRITE);
            }
            questionMapper.insert(question);

            // 处理选项
            if (question.getType() == TypeEnum.SINGLE || question.getType() == TypeEnum.MULTI) {
                List<Integer> answerIds = new ArrayList<>();

                String[] strings = qe.getOptionContent().split("\n");
                for (int i = 0; i < strings.length; i++) {
                    Option option = new Option();
                    option.setQuestionId(question.getId());

                    int imageStIndex = strings[i].lastIndexOf("(");
                    String content = strings[i];
                    String image = null;
                    if (imageStIndex != -1) {
                        content = strings[i].substring(0, imageStIndex);
                        image = strings[i].substring(imageStIndex + 1, strings[i].length() - 1);
                    }
                    option.setContent(content);
                    option.setImage(image);

                    if (answerIndex.contains(i)) {
                        // 是答案
                        option.setIsRight(1);
                    } else {
                        option.setIsRight(0);
                    }

                    option.setOrderNum(i + 1);
                    option.setAbc(String.valueOf((char)(65 + i)));

                    optionMapper.insert(option);
                    if (option.getIsRight() == 1) {
                        answerIds.add(option.getId());
                    }
                }

                // 再次处理答案
                if (question.getType() == TypeEnum.SINGLE || question.getType() == TypeEnum.MULTI) {
                    StringBuilder str = new StringBuilder();
                    for (Integer answerId : answerIds) {
                        // 是答案，记录id
                        Integer curId = answerId;
                        if (str.length() == 0) {
                            str.append(curId);
                        } else {
                            str.append(',').append(curId);
                        }
                    }
                    // 更新问题的答案
                    question.setAnswer(str.toString());
                    questionMapper.updateById(question);
                }
            }
        }
    }
}
