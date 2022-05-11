package com.wangpeng.pojo.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:29
 * @Description:
 */
@Data
public class QueryPageRecordDTO {

    @NotBlank(message = "页码不能为空")
    private Integer page;

    @NotBlank(message = "每页大小不能为空")
    private Integer limit;

    /**
     * 学生id
     */
    private Integer studentId;

    /**
     * 考试id
     */
    private Integer examId;

    /**
     * 是否完成
     */
    private Integer isFinished;

    /**
     * 是否及格
     */
    private Integer isQualify;

    /**
     * 是否批改
     */
    private Integer isChecked;

    /**
     * 开始时间
     */
    private String startTime;

    /**
     * 结束时间
     */
    private String endTime;

}
