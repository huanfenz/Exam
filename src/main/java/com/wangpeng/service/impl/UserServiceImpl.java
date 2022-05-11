package com.wangpeng.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.wangpeng.mapper.StudentExamMapper;
import com.wangpeng.pojo.po.StudentExam;
import com.wangpeng.pojo.po.User;
import com.wangpeng.service.UserService;
import com.wangpeng.mapper.UserMapper;
import com.wangpeng.other.utils.ObjectRedisSerializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

/**
* @author wangpeng
* @description 针对表【sys_user(用户表)】的数据库操作Service实现
* @createDate 2022-03-20 12:27:45
*/
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService{

    @Autowired
    private RedisTemplate<Object, Object> redisTemplate;

    @Autowired
    private StudentExamMapper studentExamMapper;

    @Override
    public void redisSaveCode(String key, String code) {
        // 设置redisTemplate对象key的序列化方式
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new StringRedisSerializer());
        // 超时2分钟
        redisTemplate.opsForValue().set(key, code, 2, TimeUnit.MINUTES);
    }

    @Override
    public String redisGetCode(String key) {
        Boolean flag = redisTemplate.hasKey(key);
        if (Boolean.FALSE.equals(flag)) return null;
        return (String) redisTemplate.opsForValue().get(key);
    }

    @Override
    public void redisRemoveCode(String key) {
        redisTemplate.delete(key);
    }

    @Override
    public void redisSaveUser(String token, User user) {
        // 设置redisTemplate对象key的序列化方式
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        redisTemplate.setValueSerializer(new ObjectRedisSerializer());
        // key是token，value是用户保存到redis中，超时时间24小时
        redisTemplate.opsForValue().set(token, user, 24, TimeUnit.HOURS);
    }

    @Override
    public User redisGetUser(String token) {
        // 根据token得到user
        return (User) redisTemplate.opsForValue().get(token);
    }

    @Override
    public void redisRemoveUser(String token) {
        // 移除token
        redisTemplate.delete(token);
    }

    @Override
    public User checkExistsUsername(String username) {
        // 检查username是否存在
        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username);
        return baseMapper.selectOne(queryWrapper);
    }

    @Override
    public void deleteUser(User user) throws RuntimeException {
        if (user.getId() == 1) {
            throw new RuntimeException("主管理员无法删除");
        }
        QueryWrapper<StudentExam> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("student_id", user.getId());
        Long count = studentExamMapper.selectCount(queryWrapper);
        if (count != 0) {
            throw new RuntimeException("该用户还有考试记录存在，不能删除！");
        }
        baseMapper.deleteById(user);
    }
}
