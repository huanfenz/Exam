package com.wangpeng.pojo.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:29
 * @Description:
 */
@Data
public class QueryPageExamDTO {

    @NotBlank(message = "页码不能为空")
    private Integer page;

    @NotBlank(message = "每页大小不能为空")
    private Integer limit;

    /**
     * 考试名称
     */
    private String name;

    /**
     * 开始时间
     */
    private String startTime;

    /**
     * 结束时间
     */
    private String endTime;
}
