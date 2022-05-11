package com.wangpeng.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 
 * @TableName s_student_option
 */
@TableName(value ="s_student_option")
@Data
public class StudentOption implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 学生问题id
     */
    private Integer studentQuestionId;

    /**
     * 选项id
     */
    private Integer optionId;

    /**
     * 是否选中
     */
    private Integer isChecked;

    /**
     * 排序号
     */
    private Integer orderNum;

    /**
     * abc的序号
     */
    private String abc;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}