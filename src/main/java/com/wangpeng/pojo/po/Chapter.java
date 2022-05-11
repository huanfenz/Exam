package com.wangpeng.pojo.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

/**
 * 章节表
 * @TableName t_chapter
 */
@TableName(value ="t_chapter")
@Data
public class Chapter implements Serializable {
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
     * 章节名
     */
    private String name;

    /**
     * 排序号
     */
    private Integer orderNum;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}