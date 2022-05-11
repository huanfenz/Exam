package com.wangpeng.mapper;

import com.wangpeng.pojo.bo.QuestionExcel;

import java.util.List;

/**
 * @Author: 王鹏
 * @Date: 2022/04/26/20:51
 * @Description:
 */

/**
 * 假设这个是你的DAO存储。当然还要这个类让spring管理，当然你不用需要存储，也不需要这个类。
 **/
public class QuestionExcelDao {
    public void save(List<QuestionExcel> list) {
        // 如果是mybatis,尽量别直接调用多次insert,自己写一个mapper里面新增一个方法batchInsert,所有数据一次性插入
    }
}
