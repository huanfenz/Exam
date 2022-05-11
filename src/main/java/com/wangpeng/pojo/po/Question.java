package com.wangpeng.pojo.po;

import com.baomidou.mybatisplus.annotation.*;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.wangpeng.pojo.enums.TypeEnum;
import lombok.Data;

/**
 * 题目表
 * @TableName t_question
 */
@TableName(value ="t_question")
@Data
public class Question implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

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
     * 创建时间
     */
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     */
    @TableField(fill= FieldFill.INSERT_UPDATE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}