package com.wangpeng.pojo.vo.student;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 学生考试表
 * @TableName s_student_exam
 */
@TableName(value ="s_student_exam")
@Data
public class StudentRecordVO implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 学生id
     */
    private Integer studentId;

    /**
     * 学生名
     */
    private String studentName;

    /**
     * 考试id
     */
    private Integer examId;

    /**
     * 考试名
     */
    private String examName;

    /**
     * 是否交卷
     */
    private Integer isFinished;

    /**
     * 开始时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date startTime;

    /**
     * 交卷时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date finishTime;

    /**
     * 得分
     */
    private BigDecimal score;

    /**
     * 总分
     */
    private BigDecimal totalScore;

    /**
     * 及格分
     */
    private BigDecimal qualifyScore;

    /**
     * 是否及格
     */
    private Integer isQualify;

    /**
     * 是否批改
     */
    private Integer isChecked;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}