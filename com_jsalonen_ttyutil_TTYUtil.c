#include <unistd.h>
#include "com_jsalonen_ttyutil_TTYUtil.h"

JNIEXPORT jstring JNICALL Java_com_jsalonen_ttyutil_TTYUtil_getTTYName
  (JNIEnv *env, jclass cls) 
{
    char *name = ttyname(0);
    return (*env)->NewStringUTF(env, name);
}

JNIEXPORT jboolean JNICALL Java_com_jsalonen_ttyutil_TTYUtil_isTTY
  (JNIEnv *env, jclass cls)
{
    if (isatty(0)) {
        return JNI_TRUE;
    } else {
        return JNI_FALSE;
    }
}
