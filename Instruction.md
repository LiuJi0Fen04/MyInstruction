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

