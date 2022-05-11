package com.wangpeng.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.QueryPageRepoDTO;
import com.wangpeng.pojo.po.Repo;
import com.wangpeng.other.result.BaseResult;
import com.wangpeng.other.result.PageResult;
import com.wangpeng.service.RepoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/21:52
 * @Description:
 */
@RestController
@RequestMapping("/admin/repo")
public class AdminRepoController {

    @Autowired
    RepoService repoService;

    /**
     * 获取数量
     * @return 记录数量
     */
    @GetMapping(value = "/getCount")
    public BaseResult getCount(){
        return BaseResult.successData(repoService.count());
    }

    /**
     * 查询所有
     * @return 对象列表
     */
    @GetMapping(value = "/queryAll")
    public PageResult queryAll(){
        List<Repo> list = repoService.list();
        return PageResult.success((long) list.size(), list);
    }

    /**
     * 查询分页
     * @param queryPageRepoDTO 查询参数
     * @return 分页结果集
     */
    @GetMapping(value = "/queryPage")
    public PageResult queryPage(QueryPageRepoDTO queryPageRepoDTO){
        // 获取分页对象
        Page<Repo> page = new Page<>(queryPageRepoDTO.getPage(), queryPageRepoDTO.getLimit());
        // 模糊查询用户名
        String name = queryPageRepoDTO.getName();
        QueryWrapper<Repo> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(name), "name", name);
        Page<Repo> resPage = repoService.page(page, queryWrapper);
        return PageResult.success(resPage.getTotal(), resPage.getRecords());
    }

    /**
     * 添加一个
     * @param repo 对象
     * @return 是否成功
     */
    @PostMapping(value = "/addOne")
    public BaseResult addOne(@RequestBody Repo repo){
        return BaseResult.boolResult(repoService.save(repo));
    }

    /**
     * 删除一个
     * @param repo 对象
     * @return 是否成功
     */
    @DeleteMapping(value = "/deleteOne")
    public BaseResult deleteOne(@RequestBody Repo repo){
        try {
            repoService.deleteRepo(repo);
        } catch (Exception e) {
            return BaseResult.errorException(e);
        }
        return BaseResult.boolResult(true);
    }

    /**
     * 删除一些
     * @param repos 对象列表
     * @return 是否成功
     */
    @DeleteMapping(value = "/deleteSome")
    public BaseResult deleteSome(@RequestBody List<Repo> repos){
        int successCount = 0, failureCount = 0;
        for (Repo repo : repos) {
            try {
                repoService.deleteRepo(repo);
                successCount++;
            } catch (Exception e) {
                failureCount++;
            }
        }
        if (repos.size() == successCount) {
            return BaseResult.boolResult(true);
        } else {
            return BaseResult.errorMsg("成功【" + successCount + "】个，失败【" + failureCount + "】个");
        }
    }

    /**
     * 更新一个
     * @param repo 对象
     * @return 是否成功
     */
    @PutMapping(value = "/updateOne")
    public BaseResult updateOne(@RequestBody Repo repo){
        return BaseResult.boolResult(repoService.updateById(repo));
    }

}
