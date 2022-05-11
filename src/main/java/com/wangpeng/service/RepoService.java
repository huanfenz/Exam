package com.wangpeng.service;

import com.wangpeng.pojo.po.Repo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author wangpeng
* @description 针对表【t_repo(课程表)】的数据库操作Service
* @createDate 2022-03-21 21:51:45
*/
public interface RepoService extends IService<Repo> {

    void deleteRepo(Repo repo);
}
