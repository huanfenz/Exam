package com.wangpeng.pojo.enums;

/**
 * @Author: 王鹏
 * @Date: 2022/03/25/14:08
 * @Description:
 */

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum TypeEnum {

        SINGLE(0, "单选题"),
        MULTI(1, "多选题"),
        JUDGE(2, "判断题"),
        BLANK(3, "填空题"),
        WRITE(4, "简答题");

        @EnumValue
        private Integer type;

        @JsonValue
        private String typeName;

}
