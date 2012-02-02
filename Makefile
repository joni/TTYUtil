JNI_INC = /usr/lib/jvm/java-6-openjdk/include
LDFLAGS = -shared -fPIC
JAVA_SOURCES = com/jsalonen/ttyutil/TTYUtil.java
C_SOURCES = com_jsalonen_ttyutil_TTYUtil.c

ALL: libttyname.so TTYName.class

libttyname.so: com_jsalonen_ttyutil_TTYUtil.o
	$(LD) $< -o libttyutil.so $(LDFLAGS)

com_jsalonen_ttyutil_TTYUtil.o: $(C_SOURCES) com_jsalonen_ttyutil_TTYUtil.h
	$(CC) -c com_jsalonen_ttyutil_TTYUtil.c -I$(JNI_INC)

com_jsalonen_ttyutil_TTYUtil.h: com/jsalonen/ttyutil/TTYUtil.class
	javah com.jsalonen.ttyutil.TTYUtil

TTYName.class: $(JAVA_SOURCES)
	javac $<

