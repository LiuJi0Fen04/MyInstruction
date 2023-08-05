# 一、 compiler

# 1.检查g++支持的c++版本

```shell
g++ -std=c++17 -E - < /dev/null
```

```shell
g++ -std=c++2a -E - < /dev/null
```

其中，`-std=c++11`选项告诉编译器使用C++11标准编译代码。
`-E`选项告诉编译器只进行预处理，而不进行编译和链接步骤。
最后，`- < /dev/null`表示将标准输入重定向到`/dev/null`，以便编译器不必读取任何输入。

# 2. 安装gxx（交叉编译）

1）查看版本和安装

```shell
apt-cache search aarch64
sudo apt-get install gcc-9-aarch64-linux-gnu
sudo apt-get install g++-9-aarch64-linux-gnu
```



2）然后选择可以安装的版本进行安装, 例如选择gcc-9-aarch64-linux-gnu和g++-9-aarch64-linux-gnu

```shell
sudo apt-get install gcc-9-aarch64-linux-gnu
sudo apt-get install g++-9-aarch64-linux-gnu
```

3） 安装依赖

```shell
sudo apt --fix-broken install
```

4）安装一个没有版本号的gcc和g++

```shell
sudo apt-get install gcc-aarch64-linux-gnu 
sudo apt-get install g++-aarch64-linux-gnu
```

5）查看版本

```shell
aarch64-linux-gnu-g++ -v 
aarch64-linux-gnu-gcc -v
```

# 二、Shell[（菜鸟shell）](https://www.runoob.com/linux/linux-shell-passing-arguments.html)

## 1. echo

```shell
# 传值到相应的文件中
echo -e "---log create---" >> $Log
# 获取传入的参数数量，第一个参数，所有参数
echo $# 
echo $0
echo $*
```

# 三、 CMAKE

## 1. 如何正确使用find_package生成自己的库

- use `.cmake.in` to generate the file `.cmake` which contains the information to use the library

- `.cmake.in` at least contains the items that includes ` TableMsg_INCLUDE_DIRS, TableMsg_LIB_DIRS and TableMsg_LIB  ` , alternatively `LINK_DIRECTORIES` giving convenience to include the proper directories

- example

  `TableMsgConfig.cmake.in`

  ```cmake
  set(TableMsg_INCLUDE_DIRS @TableMsg_INCLUDE_DIRS@)
  set(TableMsg_LIB_DIRS @TableMsg_LIB_DIRS@)
  set(TableMsg_VERSION @TableMsg_VERSION@)
  LINK_DIRECTORIES(${TableMsg_LIB_DIRS})
  set(TableMsg_LIB @TableMsg_LIB@)
  
  ```

  `CMakeLists.txt`

  ```cmake
  FILE(GLOB_RECURSE CLASS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
  foreach(item ${CLASS})
      message("cpp: ${item}")
  endforeach()
  add_library(TableMsg SHARED ${CLASS})
  
  target_include_directories(TableMsg PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
  
  set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)
  
  set(TableMsg_INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/include)
  set(TableMsg_LIB_DIRS ${PROJECT_SOURCE_DIR}/lib)
  set(TableMsg_VERSION 1.0)
  LINK_DIRECTORIES(${TableMsg_LIB_DIRS})
  set(TableMsg_LIB TableMsg)
  # config your library
  configure_file(TableMsgConfig.cmake.in ${PROJECT_SOURCE_DIR}/lib/TableMsgConfig.cmake)
  ```

  

## 2. 如何正确使用install

