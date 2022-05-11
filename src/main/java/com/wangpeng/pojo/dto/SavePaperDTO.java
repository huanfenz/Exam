package com.wangpeng.pojo.dto;

import com.wangpeng.pojo.po.Paper;
import com.wangpeng.pojo.po.PaperQuestion;
import lombok.Data;

import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/02/13:52
 * @Description:
 */
@Data
public class SavePaperDTO {

    private Paper paper;

    private List<List<PaperQuestion>> paperQuestionListList;

}
