package com.wangpeng.other.result;

import lombok.Data;

/**
 * @Author: 王鹏
 * @Date: 2022/03/21/16:33
 * @Description: 通用结果类
 * 200：表示成功
 * 500：表示错误，错误信息不重要，前端自己定义
 * 501：表示错误，错误信息在msg中
 * 502：表示错误，错误信息在data中
 * 555：异常抛出信息
 */
@Data
public class BaseResult {

    /**
     * 状态码
     */
    private Integer status;

    /**
     * 消息
     */
    private String message;

    /**
     * 数据
     */
    private Object data;

    /**
     * 时间戳
     */
    private Long timestamp;

    public BaseResult() {
        timestamp = System.currentTimeMillis();
    }

    /**
     * 成功
     * @return
     */
    public static BaseResult success() {
        BaseResult result = new BaseResult();
        result.setStatus(200);
        result.setMessage("成功");
        return result;
    }

    /**
     * 成功，message
     * @param message
     * @return
     */
    public static BaseResult successMsg(String message) {
        BaseResult result = new BaseResult();
        result.setStatus(200);
        result.setMessage(message);
        return result;
    }

    /**
     * 成功，data
     * @param data
     * @return
     */
    public static BaseResult successData(Object data) {
        BaseResult result = new BaseResult();
        result.setStatus(200);
        result.setMessage("成功");
        result.setData(data);
        return result;
    }

    /**
     * 成功，message和data
     * @param message
     * @param data
     * @return
     */
    public static BaseResult successMsgAndData(String message, Object data) {
        BaseResult result = new BaseResult();
        result.setStatus(200);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

    /**
     * 失败
     * @return
     */
    public static BaseResult error() {
        BaseResult result = new BaseResult();
        result.setStatus(500);
        result.setMessage("失败");
        return result;
    }

    /**
     * 错误，message
     * @param message
     * @return
     */
    public static BaseResult errorMsg(String message) {
        BaseResult result = new BaseResult();
        result.setStatus(501);
        result.setMessage(message);
        return result;
    }

    /**
     * 错误，message和data
     * @param data
     * @return
     */
    public static BaseResult errorMsgAndData(String message, Object data) {
        BaseResult result = new BaseResult();
        result.setStatus(502);
        result.setMessage(message);
        result.setData(data);
        return result;
    }

    /**
     * 错误，exception
     * @param e
     * @return
     */
    public static BaseResult errorException(Exception e) {
        BaseResult result = new BaseResult();
        result.setStatus(555);
        result.setMessage(e.getMessage());
        return result;
    }

    /**
     * 布尔类型结果
     * @param flag
     * @return
     */
    public static BaseResult boolResult(boolean flag) {
        BaseResult result = new BaseResult();
        if (flag) {
            result.setStatus(200);
            result.setMessage("成功");
        } else {
            result.setStatus(500);
            result.setMessage("失败");
        }
        return result;
    }


}
