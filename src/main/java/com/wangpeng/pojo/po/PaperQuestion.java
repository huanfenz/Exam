package com.wangpeng.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;

import lombok.Data;

/**
 * 试卷题目表
 * @TableName t_paper_question
 */
@TableName(value ="t_paper_question")
@Data
public class PaperQuestion implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
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

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}