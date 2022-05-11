package com.wangpeng.other.result;

import lombok.Data;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/17:55
 * @Description:
 */
@Data
public class PageResult extends BaseResult{

    /**
     * 数量
     */
    private Long count;

    /**
     * 成功，count和data
      * @param count
     * @param data
     * @return
     */
    public static PageResult success(Long count, Object data) {
        PageResult result = new PageResult();
        result.setStatus(200);
        result.setMessage("成功");
        result.setCount(count);
        result.setData(data);
        return result;
    }

    /**
     * 成功，message，count，data
     * @param message
     * @param data
     * @return
     */
    public static PageResult successMsg(String message, Long count, Object data) {
        PageResult result = new PageResult();
        result.setStatus(200);
        result.setMessage(message);
        result.setCount(count);
        result.setData(data);
        return result;
    }

}
