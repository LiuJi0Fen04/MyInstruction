# 一、 compiler

# 1.检查g++支持的c++版本

```shell
g++ -std=c++17 -E - < /dev/null # without input 
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
# 传值到相应的文件中(>> append, > write)
echo -e "---log create---" >> $Log
# 获取传入的参数数量，第一个参数，所有参数
echo $# 
echo $0
echo $*
```



## 2.cat

```shell
# multi-lines
# cat <<EOF
cat <<EOF >> <file> # outputs to a file
multi-line output
the second
$0 # current file name 
EOF
```

## 3.exit

```shell
exit 1
```

## 4.for

```shell
for a in "$@"; do
    # operation
done

```



## 5./dev/null

`/dev/null` is a special file in Unix-like operating systems that discards all data written to it and provides no data to any process that reads from it, yielding EOF immediately. 

It is often used to dispose of unwanted output streams of a process, or as a convenient empty file for input streams. This is usually done by redirection. For example, the command `my_script.sh > /dev/null` would redirect the standard output of the script `my_script.sh` to `/dev/null`, effectively discarding it. Similarly, `my_script.sh < /dev/null` would provide an immediate EOF to any read call from the script, which can be useful to detach a process from a tty.

```shell
#The command `> /dev/null 2> /dev/null` is used to redirect both the standard output and the #standard error streams to `/dev/null`, effectively discarding them. This is often used to suppress #any output from a command. The `>` operator redirects the standard output stream, while `2>` #redirects the standard error stream.
> /dev/null 2> /dev/null
```



## 6. grep

```shell
# 检查输入的a 中是否有--prefix=开头的字符串
echo $a | grep "^--prefix=" > /dev/null 2> /dev/null
```

The `grep` command is a powerful tool for searching text files for lines that match a given pattern. Here are some examples of how to use the `grep` command:

1. **Search for a pattern in a file**: To search for a specific pattern in a file, you can use the `grep` command followed by the pattern and the file name. [For example, to search for the word “example” in a file named “file.txt”, you would use the command `grep example file.txt`](https://www.golinuxcloud.com/grep-command-in-linux/)[1](https://www.golinuxcloud.com/grep-command-in-linux/).

2. **Search multiple files**: You can also use `grep` to search for a pattern in multiple files at once. To do this, simply list the file names after the pattern, separated by spaces. [For example, to search for the word “example” in three files named “file1.txt”, “file2.txt”, and “file3.txt”, you would use the command `grep example file1.txt file2.txt file3.txt`](https://www.golinuxcloud.com/grep-command-in-linux/)[1](https://www.golinuxcloud.com/grep-command-in-linux/).

3. **Perform case-insensitive search**: By default, `grep` is case-sensitive, meaning it will only find matches that have the same capitalization as the pattern. However, you can use the `-i` option to perform a case-insensitive search. [For example, to search for the word “example” in a file named “file.txt” regardless of capitalization, you would use the command `grep -i example file.txt`](https://www.golinuxcloud.com/grep-command-in-linux/)[1](https://www.golinuxcloud.com/grep-command-in-linux/).

4. **Search for whole words only**: If you want to search for whole words only (i.e., not substrings), you can use the `-w` option. [For example, to search for the whole word “example” in a file named “file.txt”, you would use the command `grep -w example file.txt`](https://www.golinuxcloud.com/grep-command-in-linux/)[1](https://www.golinuxcloud.com/grep-command-in-linux/).

5. **Count the number of matching lines**: If you want to count the number of lines that match a given pattern, you can use the `-c` option. [For example, to count the number of lines containing the word “example” in a file named “file.txt”, you would use the command `grep -c example file.txt`](about:blank#)[1](https://www.golinuxcloud.com/grep-command-in-linux/).

   ```shell
   grep -c "^echo" Tutorial-1.0-Darwin.sh # find how many "echo" in the file in a line start 
   grep -c "^echo" Tutorial-1.0-Darwin.sh test.txt # sreach multiple files
   grep -i "echo" Tutorial-1.0-Darwin.sh # ignore case
   grep -w "echo" Tutorial-1.0-Darwin.sh # search the whole word only
   ```

   

## 7.sed

The `sed` command is a powerful stream editor that can be used to perform basic text transformations on an input stream (a file or input from a pipeline). Here are some examples of how to use the `sed` command:

1. **Replacing or substituting string**: The `sed` command is mostly used to replace text in a file. For example, to replace the word “unix” with “linux” in a file named “geekfile.txt”, you would use the command `sed 's/unix/linux/' geekfile.txt`. Here, the `s` specifies the substitution operation, the `/` are delimiters, the `unix` is the search pattern, and the `linux` is the replacement string. [By default, the `sed` command replaces only the first occurrence of the pattern in each line](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)[1](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/).

2. **Replacing the nth occurrence of a pattern in a line**: You can use flags like `/1`, `/2`, etc., to replace the first, second occurrence of a pattern in a line. [For example, to replace the second occurrence of the word “unix” with “linux” in a line in the file “geekfile.txt”, you would use the command `sed 's/unix/linux/2' geekfile.txt`](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/)[1](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/).

3. **Replacing all occurrences of a pattern in a line**: The substitute flag `/g` (global replacement) specifies that the `sed` command should replace all occurrences of the string in the line. [For example, to replace all occurrences of the word “unix” with “linux” in the file “geekfile.txt”, you would use the command `sed 's/unix/linux/g' geekfile.txt`](about:blank#)[1](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/).

4. **Replacing from nth occurrence to all occurrences in a line**: You can use a combination of `/1`, `/2`, etc., and `/g` to replace all patterns from the nth occurrence of a pattern in a line. [For example, to replace the third, fourth, fifth… “unix” word with “linux” word in a line in the file “geekfile.txt”, you would use the command `sed 's/unix/linux/3g' geekfile.txt`](about:blank#)[1](https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/).

   ```shell
   # sed 会将得到的输出流输出
   # the format is: sed 's/<str>/<substitution>/<which-one>'
   sed 's/unix/linux/' geekfile.txt # the first of each line
   sed 's/unix/\/linux/2' geekfile.txt # only the second of the line
   sed 's/unix/\/linux/g' geekfile.txt # gobal
   sed 's/unix/\/linux/1g' geekfile.txt # from nth to all (not work for mac?)
   ```

   

# 三、 CMAKE（cpack)

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

  

## 2. 如何正确使用install和cpack

- 在cmakelist.txt使用install安装相应文件

  ```cmake
  install(FILES <file> DESTINATION <path>)
  install(TARGETS <target> DESTINATION <path>)
  ```

  Then use the command:  `cmake install ..` 

- cpack

  First use install to collect bin, include and lib files which talked above,  next add code snippet below in cmakelists.txt to invoke 'cpack'

  ```cmake
  include(InstallRequiredSystemLibraries)
  set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
  set(CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
  set(CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
  set(CPACK_SOURCE_GENERATOR "TGZ")
  include(CPack)
  ```

  - Run the command 'cpack'

  ​     Then run the command generated by cmake

## 3. Last configuration

Now you still can't find you library cuz you configed the file during compile but not installation where the path could be different  from the path you install it , now  fix it 

- the basic idea is to substitute the '.sh' file  generated by cpack with the 'install.sh' which writen by ourselves
- the 'install.sh' will configure the file '.cmake' when after the extract the package and link the current path to the lib we just installed 
- if nothing goes wrong, you can use the lib now, except from the vscode can't  load the header file correctly. config the C_C++: Edit Configurations(JSON) you can find with the command: ctrl+shift+p, add the current path to the object "includePath"



# 四、cmake



## 1. CMAKE_CXX_FLAGS



```cmake
#-std=c++11: This flag tells the compiler to use the C++11 standard when compiling your code.
#-Wall: This flag enables all warning messages from the compiler.
#-Ofast: This flag tells the compiler to optimize your code for maximum performance, even if it means sacrificing some accuracy or standards compliance.
#-Wfatal-errors: This flag tells the compiler to stop compilation after the first error is encountered.(GCC-competible compiler flag )
#-D_MWAITXINTRIN_H_INCLUDED: This flag defines a preprocessor macro named _MWAITXINTRIN_H_INCLUDED.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Ofast -Wfatal-errors") # linux

#-Wfatal-errors(MSVC is not supported for this feature) 
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall -Ofast") # windows MSVC
```

## 2. windows上使用cmake链接库

- 一个库链接另一个库的时候如果在编译之后进行链接，则使用

  ```cmake
  # windows
  set(module1 ${OUTPUT_PREFIX}/lib/module1.lib)
  target_link_libraries(module2 PUBLIC ${module1}) # 使用PUBLIC时可以指定链接module1
  ```

- 如果在编译的时候进行链接

  

  ```cmake
  # windows
  target_link_libraries(module2 PUBLIC module1) # 好像也是对的
  ```

  

- 最外层的cmakelists包含了头文件之后内部的cmakelists不包含该头文件好像不会出错

  

## 3.  install keywords `ARCHIVE`  and `RUNTIME`

[The `ARCHIVE` keyword is used to specify that the `.lib` file should be installed](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Install.html)[1](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Install.html).

[The `RUNTIME` keyword is used to specify that the DLL file should be installed](https://cmake.org/cmake/help/book/mastering-cmake/chapter/Install.html)

```cmake
# CMakeLists.txt
add_library(mylib SHARED mylib.cpp)
install(TARGETS mylib
        RUNTIME DESTINATION my/destination/dir)

```

```sh
```

## 4. 



# 五、 PLATFORM

## 1. windows

### (1) lib & dll

Yes, there is a difference between LIB and DLL files. [LIB files are static libraries, while DLL files are dynamic libraries](https://stackoverflow.com/questions/913691/dll-and-lib-files-what-and-why)[1](https://stackoverflow.com/questions/913691/dll-and-lib-files-what-and-why). A static library is a collection of object files that are linked with a program during the linking phase of the build process. This means that the code from the library is included in the final executable of the program. [On the other hand, a dynamic library is a collection of compiled code that can be used by multiple programs at runtime](https://stackoverflow.com/questions/1778111/whats-the-differences-between-dll-lib-h-files)[2](https://stackoverflow.com/questions/1778111/whats-the-differences-between-dll-lib-h-files).

One advantage of using dynamic libraries is that they can be shared between multiple programs, which can save memory. [However, this also means that you need to have a copy of the dynamic library installed on every machine where your program runs](https://stackoverflow.com/questions/913691/dll-and-lib-files-what-and-why)[1](https://stackoverflow.com/questions/913691/dll-and-lib-files-what-and-why). [Static libraries, on the other hand, are included in the final executable of your program, so you don’t need to worry about distributing them separately](https://stackoverflow.com/questions/1778111/whats-the-differences-between-dll-lib-h-files)[2](https://stackoverflow.com/questions/1778111/whats-the-differences-between-dll-lib-h-files).

[Another difference between LIB and DLL files is that LIB files can either contain code or just links to a dynamic library, while DLL files always contain code](https://stackoverflow.com/questions/1778111/whats-the-differences-between-dll-lib-h-files)[2](https://stackoverflow.com/questions/1778111/whats-the-differences-between-dll-lib-h-files). [Additionally, LIB files come off as a big large file, but DLL has multiple files](https://askanydifference.com/difference-between-lib-and-dll/)[3](https://askanydifference.com/difference-between-lib-and-dll/). 



### (2) common used macro in sln(solution)

```shell
$(SolutionDir) # the solution directory includes the trailling backslash '\s'
$(Platform) # for example x64
$(Configuration) # for example Debug
$(ProjectName) # the name of project
$(TargetName) # in the example it is the same with $(ProjectName)
$(TargetExt) # the type of the output file, for example '.exe'
```



### (3) the method to create a .dll through Visual Studio

**Use the IDE **

- Use the .def file (Project1.def)

  ```shell
  LIBRARY Project1
  EXPORTS
  	func1 @1 
  # in which 'Project1' is the name of dynamic library that you want to export
  # 'func1' is the name that headers contain
  ```

  This file should be placed in the folder of your projet or you can specify the location with the  built-in Macros

- Use the macro 

  ```c++
  #define YOUR_API __declspec(dllexport) // use the YOUR_API ahead of function or class
  ```

​					**above method  is trivial but cannot be avoided which i don't prefer**

**Use CMakeLists**

- adding the macro **__declspec(dllexport) ** before the compile, and put the library in the path that environment path include 

### (4)  "str" would  be implicitly converted to `const char*`

```c++
// func1
void print(const char* a)
{
    std::cout << "const char: " << a << std::endl;
}
// func2
void print(void* a)
{
    std::cout << "void*: " << a << std::endl;
}
// func3
void print(std::string a)
{
    std::cout << "string: " << a << std::endl;
}
int main()
{
    print("test_str"); // "test_str" in c++ has the type of 'const char[]' 
    return 1;
}
```



String literals in C++ have the type `const char[]`, which can be implicitly converted to a `const char*`, and then to a `void*`. However, the conversion from a `const char*` to a `std::string` is not preferred over the conversion from a `const char*` to a `void*`, so the compiler cannot choose between the first and second `print` functions.

**So the func* perference is: func1 > func2 > func3 in MSVC** 

**When you compile and run the code on Linux using a standard-conforming C++ compiler such as GCC or Clang**, the `print` function that takes a `std::string` argument will be called, and the output will be `"string: test_str"`. This is because, according to the C++ standard, the conversion from a string literal to a `std::string` is preferred over the conversion from a string literal to a `void*`. However, as I mentioned earlier, **MSVC** behaves differently in this regard and treats the conversion to a `void*` as a better match. This behavior is **non-standard** and may not be portable to other compilers.



This has caused a failure in the function "TableLine",  be careful 



















