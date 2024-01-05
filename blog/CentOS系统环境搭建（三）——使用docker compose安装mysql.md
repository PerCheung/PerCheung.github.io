# CentOS系统环境搭建（三）——使用docker compose安装mysql

## MySQL8

### 1.新建文件夹

```bash
mkdir /usr/local/mysql8
```

### 2.创建docker-compose.yaml

```bash
cd /usr/local/mysql8
```

```bash
vim docker-compose.yaml
```

为防止格式错乱可以用粘贴模式粘贴

```bash
:set paste
```

`docker-compose.yaml`内容如下

```yaml
version: '3.8'
services:
  mysql:
    # 使用 MySQL 8.0.28 镜像
    image: mysql:8.0.28
    # 容器名称为 docker_mysql
    container_name: docker_mysql
    # 使用宿主机网络模式
    network_mode: host
    # 容器退出时自动重启
    restart: always
    # 防止被OOM kill, -1000为最低优先级
    oom_score_adj: -1000
    environment:
      # 设置 MySQL root 用户的密码为 root（密码一定记得改复杂，不然很危险）
      MYSQL_ROOT_PASSWORD: root
    volumes:
      # 挂载数据目录
      - ./mysql8/data:/var/lib/mysql
      - ./mysql8/mysql-files:/var/lib/mysql-files
      # 挂载配置文件，并设置为只读模式
      - ./my.cnf:/etc/mysql/my.cnf:ro
    command:
      # 使用指定的配置文件启动
      - --defaults-file=/etc/mysql/my.cnf
```

### 3.创建my.cnf

```bash
cd /usr/local/mysql8
```

```bash
vim my.cnf
```

my.cnf内容如下

```bash
[mysql]
# 默认字符集
default-character-set=utf8mb4
[client]
# 客户端使用的端口号
port=3306
# 客户端连接的 socket 路径
socket=/var/run/mysqld/mysqld.sock
[mysqld]
# 限制 MySQL 服务器只能从 /var/lib/mysql-files 目录读取文件或将文件写入该目录
secure-file-priv=/var/lib/mysql-files
# 使用主机名进行缓存查找，以提高连接性能
skip-host-cache
# 进行权限验证时，会尝试将客户端的主机名解析为 IP 地址
skip-name-resolve
# 服务端使用的端口号
port=3306
# MySQL 运行用户
user=mysql
# 服务器 ID
server-id=1
# 日志时间系统时间
log_timestamps=SYSTEM
# 默认时区东八区
default-time_zone='+8:00'
# 默认使用“mysql_native_password”插件认证
default_authentication_plugin=mysql_native_password
# 服务器连接的 socket 路径
socket=/var/run/mysqld/mysqld.sock
# 数据存放目录
datadir=/var/lib/mysql
# 开启二进制日志功能
log-bin=/var/lib/mysql/mysql-bin
# InnoDB 数据文件存放目录
innodb_data_home_dir=/var/lib/mysql
# InnoDB 日志文件存放目录
innodb_log_group_home_dir=/var/lib/mysql
# MySQL 错误日志文件路径
log-error=/var/lib/mysql/mysql.log
# 存放 MySQL 进程 ID 的文件路径
pid-file=/var/lib/mysql/mysql.pid
# 表名大小写不敏感
lower_case_table_names=1
# 服务端字符集
character-set-server=utf8mb4
# 自动提交所有事务
autocommit=1
# 跳过排它锁定
skip-external-locking
# 键缓存大小
key_buffer_size=64M
# 允许的最大数据包大小
max_allowed_packet=16M
# 表缓存
table_open_cache=6000
# 排序缓存大小
sort_buffer_size=16M
# 网络缓冲区长度
net_buffer_length=32K
# 读取缓冲区大小
read_buffer_size=16M
# 随机读取缓冲区大小
read_rnd_buffer_size=1024K
# MyISAM 排序缓冲区大小
myisam_sort_buffer_size=265M
# 线程缓存大小
thread_cache_size=512
# 临时表大小
tmp_table_size=512M
# 启用显式默认时间戳
explicit_defaults_for_timestamp=ON
# 最大连接数
max_connections=3000
# 连接错误最大数量
max_connect_errors=100
# 打开文件限制
open_files_limit=65535
# 二进制日志格式
binlog_format=mixed
# 二进制日志过期时间（秒）
binlog_expire_logs_seconds=864000
# 创建表时使用的默认存储引擎
default_storage_engine=InnoDB
# InnoDB 数据文件路径设置
innodb_data_file_path=ibdata1:10M:autoextend
# InnoDB 缓冲池大小
innodb_buffer_pool_size=2G
# InnoDB 日志文件大小
innodb_log_file_size=512M
# InnoDB 日志缓冲区大小
innodb_log_buffer_size=16M
# InnoDB 每次提交时刷新日志
innodb_flush_log_at_trx_commit=1
# InnoDB 加锁等待超时时间（秒）
innodb_lock_wait_timeout=60
[mysqldump]
# 快速导出数据
quick
# 允许的最大数据包大小
max_allowed_packet=16M
[myisamchk]
# 键缓存大小
key_buffer_size=64M
# 排序缓冲区大小
sort_buffer_size=16M
# 读取缓冲区大小
read_buffer=8M
# 写入缓冲区大小
write_buffer=8M
[mysqlhotcopy]
# 交互式超时时间
interactive-timeout
```

### 4.mysql容器的启动和关闭

启动

```bash
docker compose up -d
```

关闭（删除）

```bash
docker compose down
```


------
## MySQL5.7
### 1.新建文件夹

```bash
mkdir /usr/local/mysql57
```

### 2.创建docker-compose.yaml

```bash
cd /usr/local/mysql57
```

```bash
vim docker-compose.yaml
```

为防止格式错乱可以用粘贴模式粘贴

```bash
:set paste
```

`docker-compose.yaml`内容如下

```yaml
version: '3.8'
services:
  mysql:
    # 使用 MySQL 5.7.44 镜像
    image: mysql:5.7.44
    # 容器名称为 docker_mysql
    container_name: docker_mysql
    # 使用宿主机网络模式
    network_mode: host
    # 容器退出时自动重启
    restart: always
    # 防止被OOM kill, -1000为最低优先级
    oom_score_adj: -1000
    environment:
      # 设置 MySQL root 用户的密码为 root
      MYSQL_ROOT_PASSWORD: root
    volumes:
      # 挂载数据目录
      - ./mysql57/data:/var/lib/mysql
      - ./mysql57/mysql-files:/var/lib/mysql-files
      # 挂载配置文件，并设置为只读模式
      - ./my.cnf:/etc/mysql/my.cnf:ro
    command:
      # 使用指定的配置文件启动
      - --defaults-file=/etc/mysql/my.cnf
```

### 3.创建my.cnf

```bash
cd /usr/local/mysql57
```

```bash
vim my.cnf
```

my.cnf内容如下

```ini
[mysql]
# 默认字符集
default-character-set=utf8mb4
[client]
# 客户端使用的端口号
port=3306
socket=/var/run/mysqld/mysqld.sock
default-character-set=utf8mb4
[mysqld]
# 限制 MySQL 服务器只能从 /var/lib/mysql-files 目录读取文件或将文件写入该目录
secure-file-priv=/var/lib/mysql-files
# docker mysql 默认配置
datadir=/var/lib/mysql
# 开启二进制日志功能
log-bin=/var/lib/mysql/mysql-bin
# InnoDB 数据文件存放目录
innodb_data_home_dir=/var/lib/mysql
# InnoDB 日志文件存放目录
innodb_log_group_home_dir=/var/lib/mysql
# MySQL 错误日志文件路径
log-error=/var/lib/mysql/mysql.log
# 存放 MySQL 进程 ID 的文件路径
pid-file=/var/lib/mysql/mysql.pid
socket=/var/run/mysqld/mysqld.sock
user=mysql
# 用于控制是否允许 MySQL 服务器使用符号链接
symbolic-links=0
# 使用主机名进行缓存查找，以提高连接性能
skip-host-cache
# 进行权限验证时，会尝试将客户端的主机名解析为 IP 地址
skip-name-resolve
#数据库服务器id，这个id用来在主从服务器中标记唯一mysql服务器
server-id=1
#系统数据库编码设置，排序规则
character_set_server=utf8mb4
collation_server=utf8mb4_bin
# 日志时间系统时间
log_timestamps=SYSTEM
# 默认时区东八区
default-time_zone='+8:00'
# 表名大小写不敏感
lower_case_table_names=1
# 自动提交所有事务
autocommit=1
# 跳过排它锁定
skip-external-locking
# 启用显式默认时间戳
explicit_defaults_for_timestamp=ON
#默认sql模式，严格模式
#sql_mode = ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,
#NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
#ONLY_FULL_GROUP_BY 
#NO_ZERO_IN_DATE 不允许年月为0
#NO_ZERO_DATE 不允许插入年月为0的日期
#ERROR_FOR_DIVISION_BY_ZERO 在INSERT或UPDATE过程中，如果数据被零除，则产生错误而非警告。如 果未给出该模式，那么数据被零除时MySQL返回NULL
#NO_ENGINE_SUBSTITUTION 不使用默认的存储引擎替代
sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
#是MySQL执行排序使用的缓冲大小。如果想要增加ORDER BY的速度，首先看是否可以让MySQL使用索引而不是额外的排序阶段
#如果不能，可以尝试增加sort_buffer_size变量的大小
sort_buffer_size=16M
#应用程序经常会出现一些两表（或多表）Join的操作需求，MySQL在完成某些 Join 需求的时候（all/index join），
#为了减少参与Join的“被驱动表”的读取次数以提高性能，需要使用到 Join Buffer 来协助完成 Join操作。
#当 Join Buffer 太小，MySQL 不会将该 Buffer 存入磁盘文件，而是先将Join Buffer中的结果集与需要 Join 的表进行 Join 操作
#然后清空 Join Buffer 中的数据，继续将剩余的结果集写入此 Buffer 中，
#如此往复。这势必会造成被驱动表需要被多次读取，成倍增加 IO 访问，降低效率。
#若果多表连接需求大，则这个值要设置大一点。
join_buffer_size=16M
#索引块的缓冲区大默认16M
key_buffer_size=64M
# 消息缓冲区会用到该列，该值太小则会在处理大包时产生错误。如果使用大的text,BLOB列，必须增加该值
max_allowed_packet=16M
# 最大连接数
max_connections=3000
# 连接错误最大数量
max_connect_errors=100
#表描述符缓存大小，可减少文件打开/关闭次数,一般max_connections*2。
table_open_cache=6000
#MySQL 缓存 table 句柄的分区的个数,每个cache_instance<=table_open_cache/table_open_cache_instances
table_open_cache_instances=32
#mysql打开最大文件数
open_files_limit=65535
#慢查询，开发调式阶段才需要开启慢日志功能。上线后关闭
slow_query_log=OFF
# 创建表时使用的默认存储引擎
default_storage_engine=InnoDB
# InnoDB 数据文件路径设置
innodb_data_file_path=ibdata1:10M:autoextend
# InnoDB 缓冲池大小
innodb_buffer_pool_size=2G
# InnoDB 日志文件大小
innodb_log_file_size=512M
# InnoDB 日志缓冲区大小
innodb_log_buffer_size=16M
# InnoDB 每次提交时刷新日志
innodb_flush_log_at_trx_commit=1
# InnoDB 加锁等待超时时间（秒）
innodb_lock_wait_timeout=60
# 网络缓冲区长度
net_buffer_length=32K
# 读取缓冲区大小
read_buffer_size=16M
# 随机读取缓冲区大小
read_rnd_buffer_size=1024K
# MyISAM 排序缓冲区大小
myisam_sort_buffer_size=265M
# 线程缓存大小
thread_cache_size=512
# 临时表大小
tmp_table_size=512M
[mysqldump]
# 快速导出数据
quick
# 允许的最大数据包大小
max_allowed_packet=16M
[myisamchk]
# 键缓存大小
key_buffer_size=512M
# 排序缓冲区大小
sort_buffer_size=16M
# 读取缓冲区大小
read_buffer=16M
# 写入缓冲区大小
write_buffer=16M
[mysqlhotcopy]
# 交互式超时时间
interactive-timeout
```

### 4.mysql容器的启动和关闭

启动

```bash
docker compose up -d
```

关闭（删除）

```bash
docker compose down
```