package com.wangpeng.service;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.Map;

/**
 * @Author: 王鹏
 * @Date: 2022/05/04/22:21
 * @Description:
 */
public interface MyUploadService {

    /**
     * 阿里云上传
     * @param inputStream
     * @param dirName
     * @param fileName
     * @return
     */
    String aliyunUpdate(InputStream inputStream, String dirName, String fileName);

    /**
     * 上传OSS
     * @param req
     * @param dirName
     * @return
     */
    Map<String,String> uploadOSS(HttpServletRequest req, String dirName);

    /**
     * 上传本地
     * @param req
     * @param dirName
     * @return
     */
    Map<String, String> uploadLocal(HttpServletRequest req, String dirName);

}
