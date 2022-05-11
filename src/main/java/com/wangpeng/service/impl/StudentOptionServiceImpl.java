package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.pojo.po.StudentOption;
import com.wangpeng.service.StudentOptionService;
import com.wangpeng.mapper.StudentOptionMapper;
import org.springframework.stereotype.Service;

/**
* @author wangpeng
* @description 针对表【s_student_option】的数据库操作Service实现
* @createDate 2022-04-16 20:52:02
*/
@Service
public class StudentOptionServiceImpl extends ServiceImpl<StudentOptionMapper, StudentOption>
    implements StudentOptionService{

}




