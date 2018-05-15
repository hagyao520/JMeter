# 欢迎查阅Apache JMeter（性能自动化测试框架体系）
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

### Apache JMeter
![](https://testerhome.com/uploads/photo/2018/fdeb14b5-6163-4adb-b1e0-d11f3209639b.png!large)

    JMeter是Apache组织开发的基于Java的压力测试工具。用于对软件做压力测试，它最初被设计用于Web应用测 试但后来扩展到其他测试领域
        •  可用于压力测试及性能测试，数据库测试，Java程序的测试，HTTP及FTP测试，Web Service测试等等
        •  可用于对静态的和动态的资源（文件，Servlet，Perl脚本，java 对象，数据库和查询，FTP服务器等等）的性能进行测试
        •  可用于对服务器、网络或对象模拟巨大的负载，来在不同压力类别下测试它们的 强度和分析整体性能
        •  可用于对应用程序做功能/回归测试，通过创建带有断言的脚本来验证你的程序返回了你期望的结果

 ---
### 框架介绍
    JMeter + Dat + Excel + Ant + Jenkins 
        •  使用JMeter作为性能测试驱动程序
        •  使用Dat作为数据参数化文件，以供JMeter调用
        •  使用Excel作为测试报告数据管理工具，方便统计数据，进行数据分析生成报表
        •  使用Ant作为Java的build打包工具，方便项目代码打包
        •  使用Jenkins作为自动化持续集成平台，方便自动编译，自动打包，自动运行测试脚本，邮件发送测试报告

 ---
### 主要特性
    1.  能够对HTTP和FTP服务器进行压力和性能测试， 也可以对任何数据库进行同样的测试（通过JDBC）
    2.  完全的可移植性和100％纯java，高可扩展性
    3.  完全 Swing 和轻量组件支持（预编译的JAR使用 javax.swing.*)包
    4.  完全多线程 框架允许通过多个线程并发取样和 通过单独的线程组对不同的功能同时取样
    5.  精心的GUI设计允许快速操作和更精确的计时
    6.  缓存和离线分析/回放测试结果
    7.  可链接的取样器允许无限制的测试能力，具有提供动态输入到测试的功能（包括Javascrīpt）
    8.  各种负载统计表和可链接的计时器可供选择
    9.  数据分析和可视化插件提供了很好的可扩展性以及个性化
    10. 支持脚本变成的取样器（在1.9.2及以上版本支持BeanShell）

 ---
### 环境配置
   1. [JDK1.7以上](http://www.Oracle.com/technetwork/Java/javase/downloads/index.html)
   2. [JMeter](http://jmeter.apache.org/download_jmeter.cgi)
   3. [Ant](https://ant.apache.org) 
   4. [Jenkins](https://jenkins.io) 

 ---
### 测试实例
 - JMeter里面的元件很多，逻辑控制器，配置元件，定时器，Sampler，监听器等等，先给出一个实例，慢慢了解元件的使用方法。测试一个网站，我们至少需要：用户，发送请求，查看结果这三个过程

 ---
### 一、添加线程组
  - 在“测试计划”上右键，选择“添加”---“Thread Users”---“线程组”，如下图所示：
![](https://testerhome.com/uploads/photo/2018/139621bd-695a-4642-b253-4d6d2bd709cb.png!large)

  - 其中，对我们有影响的参数是线程数（设置发送请求的用户数目），Ramp-up period： 每个请求发生的总时间间隔，单位是秒，循环次数（请求发生的重复次数）。如果我们需要JMeter模拟五个请求者（也就是五个线程），每个请求者连续请求两次，则如下图设置：
![](https://testerhome.com/uploads/photo/2018/5b9902cd-1887-463c-9308-7f7005119640.png!large)


 ---
### 二、添加请求
 - 我们要访问一个网页，比如是百度首页，则是http请求，则添加http请求，在线程组上右键---“添加”---“Sampler”---“HTTP请求”
![](https://testerhome.com/uploads/photo/2018/838636c1-df8f-43a5-b4fd-bbf7e895ec66.png!large)

 - http请求的属性值中“Web服务器名称或IP”填写www.baidu.com就可以了：如下图所示：
![](https://testerhome.com/uploads/photo/2018/adf43487-4664-44c9-ad2b-e47ab30d126d.png!large)

 ---
### 三、加监视器
 - 监视器的种类很多，根据自己的需要添加，我们选择“查看结果树”。在线程组上右键---“添加”---“监视器”---“查看结果树”，如下图所示：
![](https://testerhome.com/uploads/photo/2018/322bf2de-9d65-4bf7-b955-3d3d728b7905.png!large)

 ---
### 四、运行
![](https://testerhome.com/uploads/photo/2018/ac1793e6-50cb-4a85-88ec-3a0f200f4b81.png!large)
![](https://testerhome.com/uploads/photo/2018/b9bfc781-df84-440f-824b-51d93254a089.png!large)
 - 运行完毕后，即可查看结果

 ---
### 五、测试报告：
 - 测试报告分为四种，前三种是Jmeter自带的聚合报告，图形结果，表格结果，最后一种是Excel做的数据分析表

 ---
#### [聚合报告](https://testerhome.com/uploads/photo/2018/2d3eef8f-f60c-4cd3-8f9d-3059ab66a29d.png!large)
![](https://testerhome.com/uploads/photo/2018/2d3eef8f-f60c-4cd3-8f9d-3059ab66a29d.png!large)

 ---
#### [图形结果](https://testerhome.com/uploads/photo/2018/46b55170-bc6d-468d-b072-e808929f42a2.png!large)
![](https://testerhome.com/uploads/photo/2018/46b55170-bc6d-468d-b072-e808929f42a2.png!large)

 ---
#### [表格结果](https://testerhome.com/uploads/photo/2018/c56237e0-b7a2-4470-9d86-97584d9549ab.png!large)
![](https://testerhome.com/uploads/photo/2018/c56237e0-b7a2-4470-9d86-97584d9549ab.png!large)

 ---
#### [Excel报表](https://testerhome.com/uploads/photo/2018/2f9f5a75-95ec-43da-936f-db4d050f7f5e.png!large)
![](https://testerhome.com/uploads/photo/2018/2f9f5a75-95ec-43da-936f-db4d050f7f5e.png!large)
![](https://testerhome.com/uploads/photo/2018/5233bb37-1b8c-4c8b-81ba-19419f6d855a.png!large)
 - Excel做的数据分析表，更加美观，清晰明朗

### 六、Jnekins持续集成：
![](https://testerhome.com/uploads/photo/2018/cb0e17fc-7e19-4e25-ac2f-4bcf8ce7cfe9.png!large)
![](https://testerhome.com/uploads/photo/2018/8daa0b0b-892b-48c4-b09f-5454a9852cd7.png!large)
 - 搭建Jenkins环境，具体请参考: https://blog.csdn.net/wuxuehong0306/article/details/50016547
 - 配置Jenkins自动化持续集成项目，即可实现远程服务器自动（构建，编译，打包）运行脚本，发送邮件测试报告等
 
 ---
### 七、感谢
#### 如果您觉得这个框架对您有用，您可以捐赠下我，让我有理由继续下去，非常感谢。
![](https://testerhome.com/uploads/photo/2018/26d494a6-7b4f-4b69-8db1-0a3b45f886b7.png!large)

**非常感谢您花费时间阅读，祝您在这里记录、阅读、分享愉快！**
**欢迎留言评论，有问题也可以联系我或者加群交流...**

作者：[@刘智King](http://shang.qq.com/email/stop/email_stop.html?qq=1306086303&sig=a1c657365db7e82805ea4b2351081fc3ebcde159f8ae49b1&tttt=1)         
QQ：1306086303     
Email：hagyao520@163.com

> QQ官方交流群 <a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=346d11a1a76d05086cd48bc8249126f514248479b50f96288189ab5ae0ca7ba5"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="126325132" title="126325132"></a>