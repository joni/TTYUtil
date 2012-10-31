JNI_INC = /usr/lib/jvm/java-7-openjdk-amd64/include
CFLAGS = -fPIC
LDFLAGS = -shared
JAVA_SOURCES = com/jsalonen/ttyutil/TTYUtil.java
C_SOURCES = com_jsalonen_ttyutil_TTYUtil.c

.SUFFIXES: .c .o .java .class

ALL: libttyname.so com/jsalonen/ttyutil/TTYUtil.class

clean:
	rm *.so *.o

libttyname.so: com_jsalonen_ttyutil_TTYUtil.o
	$(LD) $< -o libttyutil.so $(LDFLAGS)

com_jsalonen_ttyutil_TTYUtil.o: $(C_SOURCES) com_jsalonen_ttyutil_TTYUtil.h
	$(CC) $(CFLAGS) -c com_jsalonen_ttyutil_TTYUtil.c -I$(JNI_INC)

com_jsalonen_ttyutil_TTYUtil.h: com/jsalonen/ttyutil/TTYUtil.class
	javah com.jsalonen.ttyutil.TTYUtil

.java.class:
	javac $<
