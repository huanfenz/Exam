package com.wangpeng.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.wangpeng.pojo.dto.QueryPagePaperDTO;
import com.wangpeng.pojo.dto.SavePaperDTO;
import com.wangpeng.pojo.po.Paper;
import com.wangpeng.pojo.vo.PaperInfoVO;
import com.wangpeng.pojo.vo.PaperVO;
import com.wangpeng.other.result.BaseResult;
import com.wangpeng.other.result.PageResult;
import com.wangpeng.service.PaperService;
import com.wangpeng.service.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/21:52
 * @Description:
 */
@RestController
@RequestMapping("/admin/paper")
public class AdminPaperController {

    @Autowired
    PaperService paperService;

    @Autowired
    UserService userService;

    /**
     * 获取数量
     * @return 记录数量
     */
    @GetMapping(value = "/getCount")
    public BaseResult getCount(){
        return BaseResult.successData(paperService.count());
    }

    /**
     * 查询所有
     * @return 对象列表
     */
    @GetMapping(value = "/queryAll")
    public PageResult queryAll(){
        List<Paper> list = paperService.list();
        return PageResult.success((long) list.size(), list);
    }

    /**
     * 查询分页
     * @param queryPagePaperDTO 查询参数
     * @return 分页结果集
     */
    @GetMapping(value = "/queryPage")
    public PageResult queryPage(QueryPagePaperDTO queryPagePaperDTO){
        // 获取分页对象
        Page<Paper> page = new Page<>(queryPagePaperDTO.getPage(), queryPagePaperDTO.getLimit());
        // 模糊查询用户名和准确查询创建人id
        String name = queryPagePaperDTO.getName();
        Integer creator = queryPagePaperDTO.getCreator();

        QueryWrapper<Paper> queryWrapper = new QueryWrapper<>();
        queryWrapper.like(StringUtils.isNotBlank(name), "name", name);
        queryWrapper.eq(creator != null, "creator", creator);

        Page<Paper> resPage = paperService.page(page, queryWrapper);
        List<Paper> papers = resPage.getRecords();
        List<PaperVO> paperVOS = new ArrayList<>();
        for (Paper cur : papers) {
            PaperVO paperVO = new PaperVO();
            // 复制属性
            BeanUtils.copyProperties(cur, paperVO);
            // 添加creatorName
            String creatorName = userService.getById(paperVO.getCreator()).getUsername();
            paperVO.setCreatorName(creatorName);
            // 添加到list中
            paperVOS.add(paperVO);
        }
        // 看看效果
        return PageResult.success(resPage.getTotal(), paperVOS);
    }

    /**
     * 获取试卷
     * @param paperId
     * @return
     */
    @GetMapping(value = "getPaper")
    public BaseResult getPaper(Integer paperId) {
        PaperInfoVO paperInfoVO = paperService.getPaper(paperId);
        return BaseResult.successData(paperInfoVO);
    }

    /**
     * 添加一个
     * @param paper 对象
     * @return 是否成功
     */
    @PostMapping(value = "/addOne")
    public BaseResult addOne(@RequestBody Paper paper){
        return BaseResult.boolResult(paperService.save(paper));
    }

    /**
     * 保存试卷
     * @param savePaperDTO
     * @return
     */
    @PostMapping(value = "savePaper")
    public BaseResult savePaper(@RequestBody SavePaperDTO savePaperDTO) {
        try {
            paperService.savePaper(savePaperDTO);
        } catch (Exception e) {
            return BaseResult.errorException(e);
        }
        return BaseResult.boolResult(true);
    }

    /**
     * 删除一个
     * @param paper 对象
     * @return 是否成功
     */
    @DeleteMapping(value = "/removePaper")
    public BaseResult removePaper(@RequestBody Paper paper){
        try {
            paperService.removePaper(paper);
        } catch (Exception e) {
            return BaseResult.errorException(e);
        }
        return BaseResult.boolResult(true);
    }

    /**
     * 删除一些
     * @param papers 对象列表
     * @return 是否成功
     */
    @DeleteMapping(value = "/removePapers")
    public BaseResult removePapers(@RequestBody List<Paper> papers){
        int successCount = 0, failureCount = 0;
        for (Paper paper : papers) {
            try {
                paperService.removePaper(paper);
                successCount++;
            } catch (Exception e) {
                failureCount++;
            }
        }
        if (successCount == papers.size()) {
            return BaseResult.boolResult(true);
        } else {
            return BaseResult.errorMsg("成功【" + successCount + "】个，失败【" + failureCount + "】个");
        }
    }

    /**
     * 更新一个
     * @param paper 对象
     * @return 是否成功
     */
    @PutMapping(value = "/updateOne")
    public BaseResult updateOne(@RequestBody Paper paper){
        return BaseResult.boolResult(paperService.updateById(paper));
    }

}
