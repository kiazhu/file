����
    Android.mk�ļ����������ϵͳ������α������Դ���롣��ȷ�е�˵�����ļ���ʵ����һ��С�͵�Makefile�����ڸ��ļ��ᱻNDK�ı��빤�߽�����Σ����Ӧ�þ�������Դ����������������Ϊ��Щ�������ܻᱻ��ζ���Ӷ�Ӱ�쵽����Ľ���������ļ����﷨�����Դ������֯��ģ�飬ÿ��ģ��������������֮һ��

    APK����һ���Android���򣬱���������apk�ļ���
    JAVA�⣺java��⣬����������jar���ļ���
    C\C++Ӧ�ó��򣺿�ִ�е�C/C++Ӧ�ó���
    C\C++��̬�⣺��������C/C++��̬�⣬�������.a�ļ���
    C\C++����⣺�������ɹ���⣬�������.so�ļ�������ֻ�й������ܱ���װ/���Ƶ�APK���С�

����
    ����ο�������һ��ͨ�õ����ӣ�����򵥵ġ�Hello World������˵��һ��Android.mk��д������������ļ���
1. sources/test/hello.c
2. sources/test/Android.mk
    ���С�hello.c����һ��JNI����⣬ʵ�ַ��ء�hello world���ַ�����ԭ����������ˣ�Android.mk�ļ��������£�

    LOCAL_PATH := $(call my-dir)
    include $(CLEAR_VARS)
    LOCAL_MODULE := hello
    LOCAL_SRC_FILES := hello.c
    include $(BUILD_SHARED_LIBRARY)

    ����һ���⼸�д��룺
1. LOCAL_PATH := $(call my-dir) �� һ��Android.mk�ļ����ȱ��붨���LOCAL_PATH�����������ڿ������в���Դ�ļ�������������У��꺯��my-dir�ɱ���ϵͳ�ṩ�����ڷ��ص�ǰ·����������Android.mk�ļ���Ŀ¼����
2. include $(CLEAR_VARS)��CLEAR_VARS�ɱ���iϵͳ�ṩ��ָ����GNU MAKEFILE�������LOCAL_PATH����������LOCAL_***���������磺LOCAL_MODULE��LOCAL_SRC_FILES�ȣ������Ƿǳ��б�Ҫ�ģ���Ϊ���еı����ļ�����ͬһ��GUN MKAEִ�л����У����еı�������ȫ�ֱ�������������������������
3. LOCAL_MODULE := hello��LOCAL_MODULE�������붨�壬������ʶ��Android.mk�ļ�������ÿһ��ģ�顣�������Ʊ�����Ψһ�ģ����Ҳ��ܰ����ո񡣱���ϵͳ���Զ��������ʵ�ǰ׺�ͺ�׺������һ��������Ϊhello�Ĺ����ģ�飬��������libhello.so�ļ�������ѿ�����Ϊlibhello������ϵͳ����������κ�libǰ׺��Ҳ������libhello.so�ļ���
4. LOCAL_SRC_FILES := hello.c��LOCAL_SRC_FILES�������������Ҫ��������ģ���е�Դ�����ļ���
5. include $(BUILD_SHARED_LIBRARY)��BUILD_SHARED_LIBRARY�Ǳ���ϵͳ�ṩ�ı�����ָ��һ��GNU Makefile�ű���Ӧ�þ���build/coreĿ¼�µ�shared_library.mk��,�����ռ��Դ��ϴε���include $(CLEAR_VARS)������������LOCAL_***�����е�������Ϣ�����Ҿ�������ʲô�������ȷ��ȥ������������������ɾ�̬�⡣
6. ����һ��Android.mk����������ַ�":="����:=��������c�еĺ꣬���ڶ��崦��ȷչ������ȫ�����ı��滻��


ģ����������
     ����ı���������ϵͳ���������Լ���ģ�飬��Ӧ�ö�����include $(CLEAR_VARS)��include $(BUILD_***)֮�䡣����ǰ�潲����������$(CLEAR_VARS)��һ���ű������������Щ��������������������ʾע����
1. LOCAL_PATH������������ڸ�����ǰ�ļ���·����������Android.mk�Ŀ�ͷ���壬��������ʹ�ã�LOCAL_PATH := $(call my-dir)����������������ᱻ$(CLEAR_VARS)�������Ϊÿ��Android.mkֻ��Ҫ����һ�Σ���ʹһ���ļ��ж����˶��ģ�������£���
2. LOCAL_SRC_FILES����ǰģ�����������Դ�����ļ���
3. LOCAL_MODULE����ǰģ������ƣ��������Ӧ����Ψһ�ģ����Ҳ��ܰ����ո�ģ����������ϵ����ͨ��������������õġ�
4. LOCAL_MODULE_CLASS����ʶ������ģ�������õ�λ�á�ETC��ʾ������/system/etc.Ŀ¼�£�APPS��ʾ������/system/appĿ¼�£�SHARED_LIBRARIES��ʾ������/system/libĿ¼�¡��������ָ����������ģ�鲻��ŵ�����ϵͳ�У�������out��Ӧproduct��objĿ¼�µĶ�ӦĿ¼�С�
5. LOCAL_SRC_FILES������Ҫ�����Դ�����ļ��б�ֻҪ�г�Ҫ���ݸ����������ļ����ɣ�����ϵͳ���Զ�����������ϵ��Դ�����ļ�·�������������LOCAL_PATH�ģ���˿���ʹ�����·������������
6. LOCAL_JAVA_LIBRARIES����ǰģ��������Java����⣬Ҳ��Java��̬�⡣����framework.jar����
7. LOCAL_STATIC_JAVA_LIBRARIES����ǰģ��������Java��̬�⣬��Android������jar�������õĵ��������̶�����Java��̬�⡣
8. LOCAL_STATIC_LIBRARIES����ǰģ��������ʱ�����ľ�̬������ơ�
9. LOCAL_SHARED_LIBRARIES����ǰģ��������ʱ�����Ķ�̬������ơ�
10. LOCAL_C_INCLUDES��c��c++������Ҫ��ͷ�ļ���·����
11. LOCAL_CFLAGS���ṩ��C/C++�������Ķ�����������
12. LOCAL_PACKAGE_NAME����ǰAPKӦ�õ����ơ�
13. LOCAL_CERTIFICATE��ǩ��ǰӦ�õ�֤�����ơ�
14. LOCAL_MODULE_TAGS����ǰģ���������ı�ǩ��һ��ģ����԰��������ǩ����ǩ��ֵ������eng��user��debug��development��optional�����У�optional��Ĭ�ϱ�ǩ��
15. LOCAL_DEX_PREOPT��apk��odex�Ż����أ�Ĭ����false��
16. LOCAL_MODULE_PATH: Ŀ��İ�װ·��
17. LOCAL_MODULE_RELATIVE_PATH:ָ����̬������·��,�Ը��Ա��������õ�Ŀ¼Ϊ�ο�

����֮�⣬Buildϵͳ�л�������һЩ����������Android.mk��ʹ�ã�������
1. $(call my-dir)����ȡ��ǰ�ļ��е�·����
2. $(call all-java-files-under, <src>)����ȡָ��Ŀ¼�µ�����java�ļ���
3. $(call all-c-files-under, <src>)����ȡָ��Ŀ¼�µ�����c�ļ���
4. $(call all-Iaidl-files-under, <src>)����ȡָ��Ŀ¼�µ�����AIDL�ļ���
5. $(call all-makefiles-under, <folder>)����ȡָ��Ŀ¼�µ�����Make�ļ���
6. $(call intermediates-dir-for, <class>, <app_name>, <host or target>, <common?>)����ȡBuild�����Ŀ���ļ���·����






