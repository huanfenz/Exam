package com.wangpeng.pojo.vo;

import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.wangpeng.pojo.enums.TypeEnum;
import com.wangpeng.pojo.po.Option;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/02/16:19
 * @Description:
 */
@Data
public class PaperQuestionVO {

    /**
     * PaperQuestionId
     */
    private Integer id;

    /**
     * 试卷id
     */
    private Integer paperId;

    /**
     * 题目id
     */
    private Integer questionId;

    /**
     * 题目分数
     */
    private BigDecimal score;

    /**
     * 排序号
     */
    private Integer orderNum;

    /**
     * 题库id
     */
    private Integer repoId;

    /**
     * 章节id
     */
    private Integer chapterId;

    /**
     * 题目类型
     */
    private TypeEnum type;

    /**
     * 题目内容
     */
    private String content;

    /**
     * 题目图片
     */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String image;

    /**
     * 答案
     */
    private String answer;

    /**
     * 答案图片
     */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String answerImage;

    /**
     * 分析
     */
    private String analysis;

    /**
     * 分析图片
     */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String analysisImage;

    /**
     * 备注
     */
    private String remark;

    /**
     * 选项
     */
    private List<Option> options;
}
