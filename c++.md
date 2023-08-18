# 一、一些概念

## 1. c++版本

### C++11

C++11是一个重要的C++标准版本，于2011年发布。C++11带来了许多重要的改进，包括：

智能指针：引入了shared_ptr和unique_ptr等智能指针，用于更好地管理动态内存分配。
新的循环语句：引入了for循环中的范围语法，以更简洁的方式遍历容器。
初始化列表：允许使用初始化列表来初始化数组和结构体等数据结构。
Lambda表达式：允许在代码中直接创建匿名函数。
多线程：引入了多线程库，用于简化多线程编程。
### C++14
C++14：是C++11的一个小范围修订版本，于2014年发布，主要包括：

增加了对可变参数的支持。
增加了对类型推导的支持。
提高了constexpr函数的限制。
### C++17
C++17：是C++14的一个较大范围修订版本，于2017年发布，其中一些重要的改进包括：

增加了新的文件系统库。
支持了构造函数的默认参数。
支持了结构体包含，简化了结构体的初始化。
增加了对并行编程的支持。
### C++20
C++20：是C++17的一个较大范围修订版本，于2020年发布，其中一些重要的改进包括：

引入了模板参数推导。
引入了协同程序，以简化异步编程。
引入了模板类型推导，以简化模板编程。
支持了关键字import，以简化模块的导入。

## 2. 左值引用和右值引用

- 左值引用：引用一个对象；
- 右值引用：就是必须绑定到右值的引用，C++11中右值引用可以实现“移动语义”，通过 && 获得右值引用。

```cpp
int x = 6; // x是左值，6是右值
int &y = x; // 左值引用，y引用x

int &z1 = x * 6; // 错误，x*6是一个右值
const int &z2 =  x * 6; // 正确，可以将一个const引用绑定到一个右值

int &&z3 = x * 6; // 正确，右值引用
int &&z4 = x; // 错误，x是一个左值
```

右值引用和相关的移动语义是C++11标准中引入的最强大的特性之一，通过std::move()可以避免无谓的复制，提高程序性能。



# 二、Debug

# 1. error

- `conversion from float to _Tp requires a narrowing conversion`

```
The error message you’re seeing, ‘conversion from float to _Tp requires a narrowing conversion’, indicates that you’re trying to assign a floating-point value to an integer type without an explicit cast. This can result in loss of precision, so the compiler generates a warning or error.
Just explicitly cast the expression
```



