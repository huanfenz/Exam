package com.wangpeng.pojo.dto;

import com.wangpeng.pojo.po.Option;
import com.wangpeng.pojo.po.Question;
import lombok.Data;

/**
 * @Author: 王鹏
 * @Date: 2022/03/27/13:34
 * @Description:
 */
@Data
public class SaveQuestionDTO {

    private Question question;

    private Option[] option;

}
