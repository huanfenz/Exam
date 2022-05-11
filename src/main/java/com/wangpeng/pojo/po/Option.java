package com.wangpeng.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 题目选项表
 * @TableName t_option
 */
@TableName(value ="t_option")
@Data
public class Option implements Serializable {
    /**
     * 主键
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 题目id
     */
    private Integer questionId;

    /**
     * 答案内容
     */
    private String content;

    /**
     * 图片
     */
    private String image;

    /**
     * 是否答案
     */
    private Integer isRight;

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