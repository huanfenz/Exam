package com.wangpeng.pojo.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:29
 * @Description:
 */
@Data
public class QueryPageUserDTO {

    @NotBlank(message = "页码不能为空")
    private Integer page;

    @NotBlank(message = "每页大小不能为空")
    private Integer limit;

    private String username;

}
