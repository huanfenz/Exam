# 在线考试系统（Online examination system, Created by SpringBoot framework）

[![我的博客](https://img.shields.io/badge/%E6%88%91%E7%9A%84%E5%8D%9A%E5%AE%A2-huanfenz.top-brightgreen)](http://huanfenz.top)    [![演示地址](https://img.shields.io/badge/%E6%BC%94%E7%A4%BA%E5%9C%B0%E5%9D%80-%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B-blue)](https://github.com/huanfenz/ExamApi#演示地址)    [![联系方式](https://img.shields.io/badge/%E8%81%94%E7%B3%BB%E6%96%B9%E5%BC%8F-%E7%82%B9%E5%87%BB%E6%9F%A5%E7%9C%8B-green)](https://github.com/huanfenz/ExamApi#联系方式)

## 项目介绍

在线考试系统后端使用SpringBoot+Mybatis，前端使用Vue+ElementUI，数据库使用MySQL。

前端工程：https://github.com/huanfenz/ExamVue

## 环境介绍

| 名称     | 描述                                       |
| ------ | ---------------------------------------- |
| Java版本 | JDK 11                                |
| IDE工具  | IntelliJ IDEA 2021.2.1(Ultimate Edition) |
| 构建工具   | Maven 3.3.9                              |
| Web服务器 | SpringBoot内嵌的Tomcat                      |
| 数据库    | MySQL 5.7                                |

## 运行步骤

1. 数据库导入，新建数据库exam，将`exam.sql`文件导入并运行。
2. 打开项目，打开`src/main/resources/baseApplication.yaml`，修改配置文件，并将文件名改为application.yaml。
   1. 配置 MySQL 数据库
   2. 配置 Redis
   3. 配置阿里云 OSS
3. 运行后端工程。
   1. SpringBoot 工程运行
4. 运行前端工程。
   1. `npm install`
   2. `npm run dev`

## 项目截图

登录界面

![ex1](https://github.com/huanfenz/Exam/assets/49386166/d3501d90-478d-47dc-a06f-8d6ba48a9c21)


题目管理

![ex2](https://github.com/huanfenz/Exam/assets/49386166/95249a07-10c4-4020-af6a-86b8dc15410e)


组卷界面

![ex3](https://github.com/huanfenz/Exam/assets/49386166/8caf805f-35b6-491b-81d8-07eaa25968a7)


考试界面

![ex4](https://github.com/huanfenz/Exam/assets/49386166/2c59cc23-9007-48ec-8ea7-fc056bc479e1)


更多功能就在演示地址自己看吧！:smile:

## 演示地址

项目演示地址：[http://exam.huanfenz.top/](http://exam.huanfenz.top/)

管理员账号`admin`，密码`admin`

读者账号`wangpeng`，密码`123456`

>   数据库每天自动恢复，请勿保存重要信息。
>   图片因 OSS 服务关闭，暂时无法使用，等有空了会改成服务器的本地图片。

## 项目描述

### 业务流程

![image](https://github.com/huanfenz/Exam/assets/49386166/bdf20d7e-8085-4ae4-bc8d-4bf8ca5aff49)

### 功能模块

![image](https://github.com/huanfenz/Exam/assets/49386166/4c531e82-7213-43a0-a294-8e0f4bb5620b)

### 技术架构

![image](https://github.com/huanfenz/Exam/assets/49386166/0c87df7a-bf1d-43c6-ad26-ed802c7d6001)

### ER 图

省略属性：

![image](https://github.com/huanfenz/Exam/assets/49386166/25297d6d-ed7c-42e5-be8f-f9754a9e16a3)

## 联系方式

我的博客地址：[个人博客](http://huanfenz.top)。欢迎大家来踩。

我的联系方式，欢迎联系我：

* 邮箱：`huanfenz@qq.com`
* 微信：huanfenz
