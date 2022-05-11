package com.wangpeng.pojo.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @Author: 王鹏
 * @Date: 2022/03/19/20:46
 * @Description:
 */
@Getter
@AllArgsConstructor
public enum RoleEnum {

    ADMIN(0, "管理员"),
    STUDENT(1, "学生");

    @EnumValue
    private Integer role;

    @JsonValue
    private String roleName;

}
