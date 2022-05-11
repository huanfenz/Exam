package com.wangpeng.pojo.bo;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.annotation.write.style.ColumnWidth;
import com.alibaba.excel.annotation.write.style.ContentRowHeight;
import com.alibaba.excel.annotation.write.style.ContentStyle;
import com.alibaba.excel.enums.BooleanEnum;
import com.wangpeng.pojo.enums.TypeEnum;
import lombok.Data;

import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/25/22:44
 * @Description:
 */
@Data
@ContentStyle(wrapped = BooleanEnum.TRUE)
@ContentRowHeight(70)
public class QuestionExcel {

    /**
     * 题库id
     */
    @ExcelProperty("题库id")
    private Integer repoId;

    /**
     * 章节id
     */
    @ExcelProperty("章节id")
    private Integer chapterId;

    /**
     * 题目类型
     */
    @ExcelProperty("类型")
    private String type;

    /**
     * 题目内容
     */
    @ColumnWidth(40)
    @ExcelProperty("题目内容")
    private String content;

    /**
     * 题目图片
     */
    @ColumnWidth(15)
    @ExcelProperty("题目图片")
    private String image;

    /**
     * 答案
     */
    @ColumnWidth(40)
    @ExcelProperty("题目答案")
    private String answer;

    /**
     * 答案图片
     */
    @ColumnWidth(15)
    @ExcelProperty("答案图片")
    private String answerImage;

    /**
     * 分析
     */
    @ColumnWidth(40)
    @ExcelProperty("题目分析")
    private String analysis;

    /**
     * 分析图片
     */
    @ColumnWidth(15)
    @ExcelProperty("分析图片")
    private String analysisImage;

    /**
     * 选项内容
     */
    @ColumnWidth(40)
    @ExcelProperty("选项内容(图片用括号跟在后面)")
    private String optionContent;

    /**
     * 备注
     */
    @ColumnWidth(15)
    @ExcelProperty("备注")
    private String remark;

}
