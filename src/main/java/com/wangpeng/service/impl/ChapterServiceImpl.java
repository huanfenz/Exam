package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.mapper.QuestionMapper;
import com.wangpeng.pojo.po.Chapter;
import com.wangpeng.pojo.po.Question;
import com.wangpeng.pojo.vo.ChapterVO;
import com.wangpeng.service.ChapterService;
import com.wangpeng.mapper.ChapterMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
* @author wangpeng
* @description 针对表【t_chapter(章节表)】的数据库操作Service实现
* @createDate 2022-03-21 23:40:10
*/
@Service
public class ChapterServiceImpl extends ServiceImpl<ChapterMapper, Chapter>
    implements ChapterService{

    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public List<ChapterVO> getChapterVOS(Integer repoId) {
        // 题库id相等
        QueryWrapper<Chapter> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(repoId != null, "repo_id", repoId);
        // 按照order_num升序排序
        queryWrapper.orderByAsc("order_num");
        List<Chapter> list = baseMapper.selectList(queryWrapper);
        // 整合VO
        List<ChapterVO> voList = new ArrayList<>();
        for (Chapter chapter : list) {
            ChapterVO chapterVO = new ChapterVO();
            // 复制相同属性
            BeanUtils.copyProperties(chapter, chapterVO);
            // 获得该章节的题目数量
            QueryWrapper<Question> queryWrapper1 = new QueryWrapper<>();
            queryWrapper1.eq("chapter_id", chapter.getId());
            Long questionCount = questionMapper.selectCount(queryWrapper1);
            // 设置题目数量
            chapterVO.setQuestionCount(questionCount);
            // 添加列表
            voList.add(chapterVO);
        }
        return voList;
    }

    @Override
    @Transactional
    public Boolean saveChapters(List<Chapter> chapters) {
        // 获取题库id
        Integer repoId = chapters.get(0).getRepoId();
        if (repoId == null) {
            throw new RuntimeException("没有题库id，不能添加章节");
        }

        // 给列表添加order_num，顺便检查题库id，添加到集合中
        int count = 0;
        for (Chapter cur : chapters) {
            cur.setOrderNum(++count);
        }

        // 删除当前题库的章节列表
        QueryWrapper<Chapter> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq( "repo_id", repoId);
        baseMapper.delete(queryWrapper);

        // 重新添加章节
        for (Chapter cur : chapters) {
            baseMapper.insert(cur);
        }

        return true;
    }
}
