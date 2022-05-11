package com.wangpeng.pojo.dto;

import com.wangpeng.pojo.enums.TypeEnum;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/0:29
 * @Description:
 */
@Data
public class QueryPageQuestionDTO {

    @NotBlank(message = "页码不能为空")
    private Integer page;

    @NotBlank(message = "每页大小不能为空")
    private Integer limit;

    private Integer repoId;

    private Integer chapterId;

    private TypeEnum type;

    private String content;

    private List<Integer> excludeIdList;

}
