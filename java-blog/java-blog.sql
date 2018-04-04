------------------------------------------------
-- 系统保留字段大写，属性小写
-- 博客表	blog(id,uid,category,title,content,blogtime,praise)				 	 
-- 用户表	user(id,nickname,name,pwd,email,detail,img,val,state)								
-- 关系表	ship（id,uid,fid,shiptime）								
-- 管理员表	admin(id,nickname,name,pwd,email,detail,state)								
-- 消息表        msg(id,msgf,msgt,msg,msgtime,state)							 		
-- 附件表	file(id,bid,filename,filepath,filevalue,state）								
-- 评论表   	comments(id,bid,uid,pcid,comment,commenttime)								
-- 收藏表	collect(id,uid,bid,collecttime)								

-----------------------------------------------
  -- DROP TABLE   blog;
CREATE  TABLE   blog(
id                  INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
uid                 INT,
category            VARCHAR(50)  COMMENT '博客类别',
title               VARCHAR(100) COMMENT '博客标题',
content             VARCHAR(2000)COMMENT '博客内容',
blogtime            DATETIME     COMMENT '博客时间',
praise              INT          COMMENT '博客点赞数'
)AUTO_INCREMENT = 1,COMMENT='博客表';

CREATE  TABLE   USER(
id                  INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
nickname          VARCHAR(50)  COMMENT '唯一昵称',
NAME              VARCHAR(50)  COMMENT '用户名字',
pwd               VARCHAR(20)  COMMENT '用户密码',
email             VARCHAR(20)  COMMENT '唯一邮箱',
detail            VARCHAR(200) COMMENT '用户描述',
img               VARCHAR(100) COMMENT '头像路径',
val               INT          COMMENT '金币数',
state             VARCHAR(10)  COMMENT '状态'
)AUTO_INCREMENT = 100,COMMENT='用户表';

CREATE  TABLE   ship(
id                  INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
uid                 INT COMMENT '用户id',
fid                 INT COMMENT '好友id',
shiptime            DATETIME     COMMENT '关系时间' 
)AUTO_INCREMENT = 1,COMMENT='关系表';
 
 -- drop table admin ;
CREATE  TABLE   admin(
id                  INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
nickname          VARCHAR(50)  COMMENT '唯一昵称',
NAME              VARCHAR(50)  COMMENT '名字',
pwd               VARCHAR(20)  COMMENT '密码',
email             VARCHAR(20)  COMMENT '邮箱',
detail            VARCHAR(200) COMMENT '描述',
img               VARCHAR(100) COMMENT '头像路径',
state             VARCHAR(10)  COMMENT '状态'
)AUTO_INCREMENT = 1,COMMENT='管理员';

 						 		
 								
							

CREATE  TABLE   msg(
id                  INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
msgf          INT  COMMENT '发送者', 
msgt          INT  COMMENT '接收者', 
msg           VARCHAR(500)  COMMENT '消息', 
msgtime       DATETIME,
state         VARCHAR(10)  
)COMMENT='消息表';

 -- drop table FILE ;
CREATE  TABLE   FILE(
id                  INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,     
bid                INT  COMMENT '博客id',   
filename          VARCHAR(50)  COMMENT '文件名称', 
filepath          VARCHAR(50)  COMMENT '文件路径', 
filevalue         INT  COMMENT '金币值', 
state         VARCHAR(10)
)COMMENT='附件表';
							 
CREATE  TABLE   comments(
id            INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
bid           INT   COMMENT '博客id', 
uid           INT   COMMENT '评论者', 
pcid          INT   COMMENT '前一评论', 
comments       VARCHAR(50)  COMMENT '评论内容', 
commenttime    DATETIME
)COMMENT='评论表';

CREATE  TABLE   collect(
id           INT  PRIMARY KEY NOT NULL AUTO_INCREMENT,       
uid          INT   COMMENT '收藏者', 
bid          INT   COMMENT '博客id', 
collecttime  DATETIME
)COMMENT='收藏表';
 
INSERT   INTO  blog      VALUES(1,101,'test','我的第一个博客','我的第一个博客XXXXXXX我的第一个博客',SYSDATE(),11);
INSERT   INTO  blog      VALUES(2,101,'domo','我的第二个博客','我的第二个博客XXXXXXX我的第二个博客',SYSDATE(),111);
INSERT   INTO  blog      VALUES(3,102,'nice','我的博客','我的博客我的博客我的博客我的博客我的博客',SYSDATE(),100);
 
 
INSERT   INTO  USER      VALUES(NULL,'wz','wz','pwd','email@email','detail','img',100,'new');
INSERT   INTO  USER      VALUES(NULL,'domo','domo','pwd','email@email','detail','img',200,'vip');
 
INSERT   INTO  ship      VALUES(NULL, 101,102,SYSDATE());
INSERT   INTO  admin      VALUES(NULL,'admin','admin','pwd','email@email','detail','img','system');
 
 INSERT   INTO  msg      VALUES(NULL, 101,102,'msg1',SYSDATE(),'new');
  INSERT   INTO  msg      VALUES(NULL, 101,102,'msg2',SYSDATE(),'read');
 INSERT   INTO  FILE      VALUES(NULL,1, 'filename','filepath',100,'new');

 INSERT   INTO  comments      VALUES(NULL, 1,102,0,'mycomments',SYSDATE());
 INSERT   INTO  collect      VALUES(NULL, 101,1,SYSDATE());
 
    SELECT * FROM  blog; 
    SELECT * FROM  USER;
    SELECT * FROM  ship; 
    SELECT * FROM  admin; 
    SELECT * FROM  msg; 
    SELECT * FROM  FILE; 
    SELECT * FROM  comments; 
    SELECT * FROM  collect; 
    
    -- 查询用户的所有博客
    SELECT * FROM USER u,blog b,FILE f
    WHERE  1=1
    AND  u.id  = 101
    AND  u.id  = b.uid 
    AND  f.bid = b.id 
    -- 查询用户的所有好友
       SELECT * FROM USER u,ship s,USER f
    WHERE  1=1
    AND  u.id  = 101
    AND  u.id  = s.uid 
    AND  f.id  = s.fid 
    -- 查询用户的所有收藏
      SELECT * FROM USER u,collect c,blog b
    WHERE  1=1
    AND  u.id  = 101
    AND  u.id  = c.uid 
    AND  b.id  = c.bid 
    
    -- 查询用户的所有消息
    SELECT * FROM USER u,msg m
    WHERE  1=1
    AND  u.id  = 101
    AND  m.state  ='new' 
   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
