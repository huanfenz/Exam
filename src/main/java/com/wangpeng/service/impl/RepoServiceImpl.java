package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.mapper.QuestionMapper;
import com.wangpeng.pojo.po.Question;
import com.wangpeng.pojo.po.Repo;
import com.wangpeng.service.RepoService;
import com.wangpeng.mapper.RepoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
* @author wangpeng
* @description 针对表【t_repo(课程表)】的数据库操作Service实现
* @createDate 2022-03-21 21:51:45
*/
@Service
public class RepoServiceImpl extends ServiceImpl<RepoMapper, Repo>
    implements RepoService{

    @Autowired
    QuestionMapper questionMapper;

    @Override
    public void deleteRepo(Repo repo) throws RuntimeException {
        // 查询属于该题库的题目的数量
        QueryWrapper<Question> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("repo_id", repo.getId());
        long count = questionMapper.selectCount(queryWrapper);
        if (count == 0) {
            baseMapper.deleteById(repo.getId());
        } else {
            throw new RuntimeException("题库【" + repo.getName() + "】还有【" + count + "】道题目存在，删除失败");
        }
    }
}




