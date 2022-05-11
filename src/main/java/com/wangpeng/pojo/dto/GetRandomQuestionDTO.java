package com.wangpeng.pojo.dto;

import lombok.Data;

import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/24/13:27
 * @Description:
 */
@Data
public class GetRandomQuestionDTO {

    Integer typeId;

    Integer repoId;

    Integer chapterId;

    Integer quantity;

    private List<Integer> excludeIdList;
}
