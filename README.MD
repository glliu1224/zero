#项目说明

######学习本身就是值得学习的，所以我们需要不断学习
##方法
1. 定位问题，给出解决方案
2. 有力执行，及时反馈并修正
3. 总结记录，并继续

#这个项目是做甚的
1. 一个博客系统，功用：发表/修改文章，评论，等功能
2. 用户权限系统，关注、屏蔽等功能
3. 致力于原创分享。

用户模块：
-----------------
注册
登录
绑定第三方账号
找回密码
修改密码
访问权限
用户组




文章模块：
-----------------
文章概览列表
文章帖子
用户留言
发表动态
发送私信


积分模块：
-----------------
评论积分
连续登录
优质文章
等级提升




文件模块
-----------------
文件上传/下载 及其权限设计控制


推送模块
-----------------
短信
邮件
定时提醒


系统模块
-----------------
关键操作记录：如： 1. 文章保存至后端数据库 2. 用户登录 3. 找回/修改密码
系统运行中的日志聚合处理： 运维工具开发 




最终效果参考
-----------------

[简书](https://www.jianshu.com)

[CSDN](https://www.csdn.net)



[博客百科介绍](https://baike.baidu.com/item/博客/124?fromtitle=blog&fromid=70149&fr=aladdin)

[开发资料](https://github.com/lamymay/zero/tree/master/about)



###目录以及端口说明

`一些文件所在位置`

/com.arc.zero/about/

###端口，
`web 项目向公网暴露（最终由nginx反向代理）`

【开发使用】端口80
【线上使用】端口80

`MySQL数据库为：`

【开发使用】127.0.0.1:3306    MySQL8.0 root@admin

`NoSQL数据库为：Redis `

【开发使用】127.0.0.1:6379    无

`注意环境`

dev
local
test
prod




-----

###编码规范要求

####命名
1、关于ms与数据库交互中的Service层，DAO层的命名

要求：
DAO层        
遵循一定命名规范（@todo 待定！！！）

Service层    
Object get(Long id);// 业务中很多id 是没有意义的情况下，则参数应该是 String code
Object getByXXX(XXX xxx);//是以某个条件来获取一个对象
List<Object> list();//获取一个list
List<Object> listByXXX(XXX xxx);//获取一个list，条件为xxx
List<Object> pageByXXX(XXX xxx);//获取分页数据，条件为xxx

DELETE
delete                 约定不指明的情况下一般都是物理删除，(Physically)
deleteLogical     是逻辑删除，update了某个状态  




2、实体类
例如：
2.1 实体类 XXX                            cn.net.yodoo.gree.common.entities.system.User                      表示是对应一张表 t_sys_User
2.2 传输层实体类 XXXDto           cn.net.yodoo.gree.common.model.dto.system.UserDto           表示 与User相关的 一个传输层实体类
2.3 查询条件实体类 XXXQuery    cn.net.yodoo.gree.common.model.query.system.UserQuery   表示 与User相关的 一个查询条件对象
2.4 返回页面的实体类 XXXVo      cn.net.yodoo.gree.common.model.response.MicroServiceResponse                  表示  




####接口参数校验
要求：参数校验由web层controller接收参数时通过注解校验，aop会自动完成错误返回对象



Bean Validation 中内置的 constraint    
@Null   被注释的元素必须为 null    
@NotNull    被注释的元素必须不为 null    
@AssertTrue     被注释的元素必须为 true    
@AssertFalse    被注释的元素必须为 false    
@Min(value)     被注释的元素必须是一个数字，其值必须大于等于指定的最小值    
@Max(value)     被注释的元素必须是一个数字，其值必须小于等于指定的最大值    
@DecimalMin(value)  被注释的元素必须是一个数字，其值必须大于等于指定的最小值    
@DecimalMax(value)  被注释的元素必须是一个数字，其值必须小于等于指定的最大值    
@Size(max=, min=)   被注释的元素的大小必须在指定的范围内    
@Digits (integer, fraction)     被注释的元素必须是一个数字，其值必须在可接受的范围内    
@Past   被注释的元素必须是一个过去的日期    
@Future     被注释的元素必须是一个将来的日期    
@Pattern(regex=,flag=)  被注释的元素必须符合指定的正则表达式    
    
Hibernate Validator 附加的 constraint    
@NotBlank(message =)   验证字符串非null，且长度必须大于0    
@Email  被注释的元素必须是电子邮箱地址    
@Length(min=,max=)  被注释的字符串的大小必须在指定的范围内    
@NotEmpty   被注释的字符串的必须非空    
@Range(min=,max=,message=)  被注释的元素必须在合适的范围内
  




####接口文档，1、由swagger2自动生成 2、word/excel格式的文档交付前抽时间完成
注意：1项目中需要在主启动类中注解引入 2yml配置中需要配置参数 3项目需要给默认content-path
要求：写相关注解参数

####统一异常处理，抛出由上层统一aop捕获生成固定对象并设置错误信息（code、msg、等）
异常抛出统一使用自定义异常，系统会自动捕捉传递信息，组装对象返回
需要捕捉处理的异常使用BusinessException，自动处理的异常使用BusinessRuntimeException，
如有特殊异常处理需要，可继承以上异常类，并在ExceptionHandle中定义处理逻辑。

微服务层异常抛出处理：
抛出异常应按分层处理，如ms-api抛出ApiRuntimeException(ErrorCode errorCode)，
在ErrorCode中定义异常的具体内部代码及描述，定义应尽量保证复用并遵守定义规则（见类中注释）。
ErrorCode对应ResultCode为返回外部返回码，定义时注意匹配关系。
异常处理会自动组装MicroServiceResponse对象，在web层可依据返回对象接收微服务异常code & msg。

Web层异常应使用WebRuntimeException处理，目前使用自定义异常会统一做UNKNOWN_EXCEPTION("0199", "服务器异常，请稍后重试")来处理。

####状态码管理
工具可以实现按位来管理状态，具体可参考代码中注释
主要包含common.util.StatusUtil和common.enums.StatusDefinition
StatusUtil                          中包含常用方法封装
StatusDefinition               中定义状态管理
StatusUtilTest                   是对应单元测试示例，可以参考












