package com.wangpeng.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;

import com.wangpeng.pojo.enums.TypeEnum;
import lombok.Data;

/**
 * 学生答题表
 * @TableName s_student_question
 */
@TableName(value ="s_student_question")
@Data
public class StudentQuestion implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 学生考试id
     */
    private Integer studentExamId;

    /**
     * 题目id
     */
    private Integer questionId;

    /**
     * 题目类型
     */
    private TypeEnum type;

    /**
     * 题目分数
     */
    private BigDecimal score;

    /**
     * 题目得分
     */
    private BigDecimal gotScore;

    /**
     * 题目排序
     */
    private Integer orderNum;

    /**
     * 回答
     */
    private String answer;

    /**
     * 是否已答
     */
    private Integer isAnswered;

    /**
     * 是否答对
     */
    private Integer isRight;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}