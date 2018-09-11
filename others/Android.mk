概述
    Android.mk文件用来向编译系统描述如何编译你的源代码。更确切地说，该文件其实就是一个小型的Makefile。由于该文件会被NDK的编译工具解析多次，因此应该尽量减少源码中声明变量，因为这些变量可能会被多次定义从而影响到后面的解析。这个文件的语法允许把源代码组织成模块，每个模块属于下列类型之一：

    APK程序：一般的Android程序，编译打包生成apk文件。
    JAVA库：java类库，编译打包生成jar包文件。
    C\C++应用程序：可执行的C/C++应用程序。
    C\C++静态库：编译生产C/C++静态库，并打包成.a文件。
    C\C++共享库：编译生成共享库，并打包成.so文件，有且只有共享库才能被安装/复制到APK包中。

举例
    这里参考了网上一个通用的例子，编译简单的“Hello World”，来说明一下Android.mk编写。例如下面的文件：
1. sources/test/hello.c
2. sources/test/Android.mk
    其中“hello.c”是一个JNI共享库，实现返回“hello world”字符串的原生方法。因此，Android.mk文件内容如下：

    LOCAL_PATH := $(call my-dir)
    include $(CLEAR_VARS)
    LOCAL_MODULE := hello
    LOCAL_SRC_FILES := hello.c
    include $(BUILD_SHARED_LIBRARY)

    解释一下这几行代码：
1. LOCAL_PATH := $(call my-dir) ： 一个Android.mk文件首先必须定义好LOCAL_PATH变量，用于在开发树中查找源文件。在这个例子中，宏函数my-dir由编译系统提供，用于返回当前路径（即包含Android.mk文件的目录）。
2. include $(CLEAR_VARS)：CLEAR_VARS由编译i系统提供，指定让GNU MAKEFILE清除除了LOCAL_PATH变量外的许多LOCAL_***变量（例如：LOCAL_MODULE、LOCAL_SRC_FILES等）。这是非常有必要的，因为所有的编译文件都在同一个GUN MKAE执行环境中，所有的变量都是全局变量，不清除容易引起解析错误。
3. LOCAL_MODULE := hello：LOCAL_MODULE变量必须定义，用来标识在Android.mk文件描述的每一个模块。而且名称必须是唯一的，并且不能包含空格。编译系统会自动产生合适的前缀和后缀，比如一个被命名为hello的共享库模块，将会生成libhello.so文件。如果把库命名为libhello，编译系统将不会添加任何lib前缀，也会生成libhello.so文件。
4. LOCAL_SRC_FILES := hello.c：LOCAL_SRC_FILES变量必须包含将要编译打包进模块中的源代码文件。
5. include $(BUILD_SHARED_LIBRARY)：BUILD_SHARED_LIBRARY是编译系统提供的变量，指向一个GNU Makefile脚本（应该就是build/core目录下的shared_library.mk）,负责收集自从上次调用include $(CLEAR_VARS)以来，定义在LOCAL_***变量中的所有信息，并且决定编译什么，如何正确地去做，并根据其规则生成静态库。
6. 解释一下Android.mk里变量定义字符":="。“:=”类似于c中的宏，即在定义处明确展开，完全进行文本替换。


模块描述变量
     下面的变量用于向系统描述我们自己的模块，它应该定义在include $(CLEAR_VARS)和include $(BUILD_***)之间。正如前面讲述的那样，$(CLEAR_VARS)是一个脚本，清除所有这些变量，除非在描述中显示注明。
1. LOCAL_PATH：这个变量用于给出当前文件的路径，必须在Android.mk的开头定义，可以这样使用：LOCAL_PATH := $(call my-dir)，这样这个变量不会被$(CLEAR_VARS)清除，因为每个Android.mk只需要定义一次（即使一个文件中定义了多个模块的情况下）。
2. LOCAL_SRC_FILES：当前模块包含的所有源代码文件。
3. LOCAL_MODULE：当前模块的名称，这个名称应当是唯一的，并且不能包含空格。模块间的依赖关系就是通过这个名称来引用的。
4. LOCAL_MODULE_CLASS：标识所编译模块最后放置的位置。ETC表示放置在/system/etc.目录下，APPS表示放置在/system/app目录下，SHARED_LIBRARIES表示放置在/system/lib目录下。如果具体指定，则编译的模块不会放到编译系统中，最后会在out对应product的obj目录下的对应目录中。
5. LOCAL_SRC_FILES：这是要编译的源代码文件列表。只要列出要传递给编译器的文件即可，编译系统会自动计算依赖关系。源代码文件路径都是相相对于LOCAL_PATH的，因此可以使用相对路径进行描述。
6. LOCAL_JAVA_LIBRARIES：当前模块依赖的Java共享库，也叫Java动态库。例如framework.jar包。
7. LOCAL_STATIC_JAVA_LIBRARIES：当前模块依赖的Java静态库，在Android里，导入的jar包和引用的第三方工程都属于Java静态库。
8. LOCAL_STATIC_LIBRARIES：当前模块在运行时依赖的静态库的名称。
9. LOCAL_SHARED_LIBRARIES：当前模块在运行时依赖的动态库的名称。
10. LOCAL_C_INCLUDES：c或c++语言需要的头文件的路径。
11. LOCAL_CFLAGS：提供给C/C++编译器的额外编译参数。
12. LOCAL_PACKAGE_NAME：当前APK应用的名称。
13. LOCAL_CERTIFICATE：签署当前应用的证书名称。
14. LOCAL_MODULE_TAGS：当前模块所包含的标签，一个模块可以包含多个标签。标签的值可能是eng、user、debug、development、optional。其中，optional是默认标签。
15. LOCAL_DEX_PREOPT：apk的odex优化开关，默认是false。
16. LOCAL_MODULE_PATH: 目标的安装路径
17. LOCAL_MODULE_RELATIVE_PATH:指定动态库的相对路径,以各自编译对象放置的目录为参考

除此之外，Build系统中还定义了一些函数方便在Android.mk中使用，包括：
1. $(call my-dir)：获取当前文件夹的路径。
2. $(call all-java-files-under, <src>)：获取指定目录下的所有java文件。
3. $(call all-c-files-under, <src>)：获取指定目录下的所有c文件。
4. $(call all-Iaidl-files-under, <src>)：获取指定目录下的所有AIDL文件。
5. $(call all-makefiles-under, <folder>)：获取指定目录下的所有Make文件。
6. $(call intermediates-dir-for, <class>, <app_name>, <host or target>, <common?>)：获取Build输入的目标文件夹路径。






