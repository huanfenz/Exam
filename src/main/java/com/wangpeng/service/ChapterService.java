package com.wangpeng.service;

import com.wangpeng.pojo.po.Chapter;
import com.baomidou.mybatisplus.extension.service.IService;
import com.wangpeng.pojo.vo.ChapterVO;

import java.util.List;

/**
* @author wangpeng
* @description 针对表【t_chapter(章节表)】的数据库操作Service
* @createDate 2022-03-21 23:40:10
*/
public interface ChapterService extends IService<Chapter> {

    List<ChapterVO> getChapterVOS(Integer repoId);

    Boolean saveChapters(List<Chapter> chapters);

}
