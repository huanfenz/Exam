package com.wangpeng.mapper;

import com.wangpeng.pojo.po.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

/**
* @author wangpeng
* @description 针对表【sys_user(用户表)】的数据库操作Mapper
* @createDate 2022-03-20 12:27:45
* @Entity com.wangpeng.pojo.po.User
*/
@Repository
public interface UserMapper extends BaseMapper<User> {

}




