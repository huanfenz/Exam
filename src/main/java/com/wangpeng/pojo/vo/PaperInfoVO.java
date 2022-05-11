package com.wangpeng.pojo.vo;

import lombok.Data;

import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/02/16:18
 * @Description:
 */
@Data
public class PaperInfoVO {

    private PaperVO paper;

    private List<List<PaperQuestionVO>> paperQuestionListList;

}
