package com.wangpeng.pojo.vo.student;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @Author: 王鹏
 * @Date: 2022/04/15/23:09
 * @Description:
 */
@Data
public class AnswerInfoVO {

    /**
     * 学生考试问题id
     */
    Integer studentQuestionId;

    /**
     * 您的答案
     */
    String yourAnswer;

    /**
     * 是否正确
     */
    Integer isRight;

    /**
     * 得分
     */
    BigDecimal gotScore;

}
