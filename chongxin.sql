SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  name varchar(20) NOT NULL COMMENT '用户名',
  password varchar(20) NOT NULL COMMENT '密码  MD5加密',
  root int(5) NOT NULL COMMENT '权限 0:游客,1:注册用户,2:vip会员,3:医生,4:商家,5:联盟管理者,6:平台管理者,-1:黑名单',
  nickname varchar(20) COMMENT '昵称',
  head varchar(50) COMMENT '头像(原图)',
  head_max varchar(50) COMMENT '头像(大)',
  head_min varchar(50) COMMENT '头像(小)',
  sex int(5) COMMENT '性别 0:男,1:女',
  city varchar(20) COMMENT '城市',
  phone varchar(20) COMMENT '手机',
  email varchar(20) COMMENT '邮箱',
  info varchar(500) COMMENT '个人介绍',
  longitude double COMMENT '经度',
  latitude double COMMENT '纬度',
  regtime datetime NOT NULL COMMENT '注册时间',
  last_login_time datetime COMMENT '最后一次登陆时间',
  job_title varchar(20) COMMENT '职称',
  job varchar(20) COMMENT '职位',
  edu varchar(20) COMMENT '学历',
  unit varchar(20) COMMENT '单位',
  post_count int(20) COMMENT '发帖数',
  best_post int(20) COMMENT '精华贴',
  sign varchar(100) COMMENT '个性签名',
  exp int(20) COMMENT '经验值',
  user_id varchar(50) COMMENT '百度云推送的用户id',
  channel_id varchar(50) COMMENT '设备id',
  PRIMARY KEY (id));
  
  DROP TABLE IF EXISTS pet;
  CREATE TABLE pet (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '宠物id',
  head varchar(50) COMMENT '头像(原图)',
  head_max varchar(50) COMMENT '头像(大)',
  head_min varchar(50) COMMENT '头像(小)',
  name varchar(20) COMMENT '昵称',
  birthday datetime COMMENT '生日',
  sex int(5) COMMENT '性别',
  species varchar(20) COMMENT '种类',
  breed varchar(20) COMMENT '品种',
  longitude double COMMENT '经度',
  latitude double COMMENT '纬度',
  user_id int(20) NOT NULL COMMENT '主人id',
  PRIMARY KEY (id),
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS pet_photo;
  CREATE TABLE pet_photo (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '宠物萌照id',
  user_id int(20) NOT NULL COMMENT '用户id',
  path varchar(50) COMMENT '萌照路径(原图)',
  path_min varchar(50) COMMENT '萌照路径(小)',
  good int(20) COMMENT '赞',
  bad int(20) COMMENT '鄙视',
  photo_date datetime COMMENT '上传日期',
  des varchar(100) COMMENT '文字描述',
  page_view int(20) COMMENT '浏览量',
  week_champion int(20) COMMENT '周冠军标识',
  month_champion int(20) COMMENT '月冠军标识',
  longitude double COMMENT '经度',
  latitude double COMMENT '纬度',
  PRIMARY KEY (id),
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS information;
  CREATE TABLE information (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '信息id',
  path varchar(50) COMMENT '图片路径(原图)',
  path_min varchar(50) COMMENT '图片路径(小)',
  pic_date datetime COMMENT '上传日期',
  url varchar(50) COMMENT '链接地址',
  is_fail int(5) COMMENT '是否失效 0:失效,1:可以使用',
  PRIMARY KEY (id));
  
  DROP TABLE IF EXISTS operate;
  CREATE TABLE operate (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '操作id',
  user_id int(20) NOT NULL COMMENT '用户id',
  info varchar(20) COMMENT '操作信息',
  time datetime COMMENT '操作时间',
  PRIMARY KEY (id),
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS reg;
  CREATE TABLE reg (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '挂号id',
  phone varchar(20) COMMENT '手机号',
  name varchar(20) COMMENT '姓名',
  sex int(5) COMMENT '性别 0:男,1:女',
  time datetime COMMENT '时间',
  level int(5) COMMENT '挂号级别 0：游客 1：普通用户 2：vip用户',
  longitude double COMMENT '经度',
  latitude double COMMENT '纬度',
  PRIMARY KEY (id));
  
  DROP TABLE IF EXISTS col;
  CREATE TABLE col (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  title varchar(20) COMMENT '标题',
  icon varchar(50) COMMENT '图标',
  icon_max varchar(50) COMMENT '图标(大)',
  icon_min varchar(50) COMMENT '图标(小)',
  last_post_user varchar(20) COMMENT '最后发表作者',
  last_post_time datetime COMMENT '最后发表时间',
  post_count int(20) COMMENT '文章总数',
  today_post_count int(20) COMMENT '今日文章数',
  best_count int(20) COMMENT '精华总数',
  last_post_title varchar(20) COMMENT '最后发帖标题',
  des varchar(100) COMMENT '描述',
  is_reply int(5) COMMENT '是否可回复 0:可回复,1:不可回复',
  PRIMARY KEY (id));
  
  DROP TABLE IF EXISTS post;
  CREATE TABLE post (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子id',
  column_id int(20) NOT NULL COMMENT '栏目id',
  title varchar(20) COMMENT '标题',
  user varchar(20) COMMENT '作者',
  user_id int(20) NOT NULL COMMENT '作者id',
  last_reply_time datetime COMMENT '最后回帖时间',
  reply_count int(20) COMMENT '回帖数',
  click_count int(20) COMMENT '点击数',
  post_time datetime COMMENT '创建时间',
  last_reply_user varchar(20) COMMENT '最后回复人',
  is_top int(5) COMMENT '是否置顶 0:普通,1:置顶',
  post_type varchar(20) COMMENT '帖子类型',
  post_content varchar(500) COMMENT '帖子内容',
  pic varchar(50) COMMENT '图片(原图)',
  pic_min varchar(50) COMMENT '图片(小)',
  category int(5) COMMENT '分类',
  is_best int(5) COMMENT '是否是精华 0:普通,1:精华',
  source varchar(20) COMMENT '来源',
  is_del int(5) COMMENT '是否隐藏 0:显示,1:隐藏',
  channel_id varchar(50) COMMENT '设备id',
  PRIMARY KEY (id),
  FOREIGN KEY(column_id) REFERENCES col(id) ON DELETE CASCADE,
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS reply;
  CREATE TABLE reply (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '回帖id',
  post_id int(20) NOT NULL COMMENT '发帖id',
  reply_content varchar(500) COMMENT '回帖内容',
  pic varchar(50) COMMENT '图片(原图)',
  pic_min varchar(50) COMMENT '图片(小)',
  reply_time datetime COMMENT '回帖时间',
  reply_floor int(20) COMMENT '回帖楼数',
  source varchar(20) COMMENT '来源',
  post_time datetime COMMENT '发表时间',
  user varchar(20) COMMENT '作者',
  user_id int(20) COMMENT '作者id',
  is_del int(5) COMMENT '是否隐藏 ',
  PRIMARY KEY (id),
  FOREIGN KEY(post_id) REFERENCES post(id) ON DELETE CASCADE,
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS shop;
  CREATE TABLE shop (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '商家id',
  user_id int(20) NOT NULL COMMENT '商家用户id',
  root int(5) COMMENT '权限 0:普通商家,1:医院',
  name varchar(50) COMMENT '公司名',
  phone varchar(20) COMMENT '联系电话',
  license varchar(50) COMMENT '营业执照',
  logo varchar(50) COMMENT 'Logo',
  logo_min varchar(50) COMMENT 'Logo(小)',
  info varchar(500) COMMENT '公司简介',
  address varchar(20) COMMENT '公司地址',
  email varchar(20) COMMENT '公司邮箱',
  longitude double COMMENT '经度',
  latitude double COMMENT '纬度',
  last_login_time datetime COMMENT '最后一次登陆时间',
  PRIMARY KEY (id),
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS commodity;
  CREATE TABLE commodity (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  name varchar(20) COMMENT '商品名',
  class varchar(20) COMMENT '分类',
  price double COMMENT '价格',
  pic varchar(50) COMMENT '商品图片',
  pic_min varchar(50) COMMENT '商品图片(小)',
  shop_id int(20) NOT NULL COMMENT '商家id',
  sale int(20) COMMENT '销量',
  PRIMARY KEY (id),
  FOREIGN KEY(shop_id) REFERENCES shop(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS drug;
  CREATE TABLE drug (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '药品id',
  name varchar(20) COMMENT '药品名称',
  pic varchar(50) COMMENT '药品图片',
  pic_min varchar(50) COMMENT '药品图片(小)',
  country varchar(20) COMMENT '原产国',
  chemical_name varchar(20) COMMENT '化学名称',
  base varchar(100) COMMENT '主要成分',
  scope varchar(100) COMMENT '适用范围',
  des varchar(500) COMMENT '使用说明',
  price varchar(10) COMMENT '价格',
  standard varchar(100) COMMENT '规格',
  sort varchar(20) COMMENT '药品类别',
  dosage varchar(100) COMMENT '剂型',
  marker varchar(20) COMMENT '批号',
  notice varchar(500) COMMENT '注意事项',
  address varchar(20) COMMENT '厂商',
  shop_id int(20) COMMENT '商家id',
  PRIMARY KEY (id),
  FOREIGN KEY(shop_id) REFERENCES shop(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS service;
  CREATE TABLE service (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  name varchar(20) COMMENT '服务名称',
  fee double COMMENT '费用',
  shop_id int(20) NOT NULL COMMENT '医院id',
  PRIMARY KEY (id),
  FOREIGN KEY(shop_id) REFERENCES shop(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS pet_card;
  CREATE TABLE pet_card (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '宠物健康卡id',
  pet_id int(20) NOT NULL COMMENT '宠物id',
  user_id int(20) NOT NULL COMMENT '医生id',
  service_id int(20) NOT NULL COMMENT '服务id',
  health_date datetime COMMENT '体检日期',
  fee double COMMENT '费用',
  PRIMARY KEY (id),
  FOREIGN KEY(pet_id) REFERENCES pet(id) ON DELETE CASCADE,
  FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE,
  FOREIGN KEY(service_id) REFERENCES service(id) ON DELETE CASCADE);
  
  DROP TABLE IF EXISTS disease;
  CREATE TABLE disease (
  id int(20) NOT NULL AUTO_INCREMENT COMMENT '服务id',
  name varchar(20) COMMENT '常见病名称',
  sort varchar(20) COMMENT '分类',
  des varchar(500) COMMENT '常见病描述',
  pic varchar(50) COMMENT '图片',
  pic_min varchar(50) COMMENT '图片(小)',
  PRIMARY KEY (id));