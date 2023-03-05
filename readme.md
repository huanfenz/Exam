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

![1](http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202205111254004.png)

题目管理

![2](http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202205111255314.png)

组卷界面

![3](http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202205111256158.png)

考试界面

![4](http://wangpeng-imgsubmit.oss-cn-hangzhou.aliyuncs.com/img/202205111257098.png)

更多功能就在演示地址自己看吧！:smile:

## 演示地址

> 为节省服务器资源，暂不开放

项目演示地址：http://localhost:8093/

管理员账号`admin`，密码`admin`

读者账号`wangpeng`，密码`123456`

>   注意：请试用时尽量不要影响到原有的记录。

## 项目描述

暂略

## 联系方式

我的博客地址：[个人博客](http://huanfenz.top)，[CSDN博客](https://blog.csdn.net/qq_34245098)。欢迎大家来踩。

我的联系方式，欢迎联系我：

* 邮箱：`huanfenz@qq.com`
