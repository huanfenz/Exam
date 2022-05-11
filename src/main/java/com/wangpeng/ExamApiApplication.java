package com.wangpeng;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.wangpeng.mapper")
public class ExamApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(ExamApiApplication.class, args);
    }

}
