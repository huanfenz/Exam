package com.wangpeng.controller.student;

import com.wangpeng.controller.admin.AdminRecordController;
import com.wangpeng.pojo.dto.QueryPageRecordDTO;
import com.wangpeng.other.result.BaseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: 王鹏
 * @Date: 2022/04/24/18:51
 * @Description:
 */
@RestController
@RequestMapping("/student/record")
public class StudentRecordController {

    @Autowired
    AdminRecordController adminRecordController;

    @GetMapping("/queryPage")
    public BaseResult queryPage(QueryPageRecordDTO queryPageRecordDTO) {
        return adminRecordController.queryPage(queryPageRecordDTO);
    }

}
