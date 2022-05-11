package com.wangpeng.pojo.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

/**
 * @Author: 王鹏
 * @Date: 2022/03/20/22:19
 * @Description:
 */
@Data
public class LoginDTO {
    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空")
    private String username;

    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;

    /**
     * 验证码的key
     */
    @NotBlank(message = "key不能为空")
    private String key;

    /**
     * 验证码
     */
    @NotBlank(message = "验证码不能为空")
    private String code;
}
