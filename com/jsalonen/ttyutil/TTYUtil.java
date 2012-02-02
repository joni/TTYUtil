package com.jsalonen.ttyutil;

public class TTYUtil {
    static {
        System.loadLibrary("ttyutil");
    }

    /**
     * Find out if the stdin of the JVM is connected to a TTY.
     * This method is basically a wrapper for the POSIX function <code>isatty</code>.
     *
     * @return true if and only if the stdin of the JVM is connected to a
     * TTY.
     */
    public static native boolean isTTY();

    /**
     * Return the name of the TTY device for the stdin for the JVM
     * process. This method is basically a wrapper for the POSIX function
     * <code>ttyname</code>. If <tt>stdin</tt> is not connected to a
     * terminal returns <code>null</code>.
     *
     * @return The name of the TTY device or <code>null</code>.
     */
    public static native String getTTYName();
}
