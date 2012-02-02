import com.jsalonen.ttyutil.TTYUtil;

import java.io.OutputStream;

public class Test {
    public static void main(String[] args) throws Exception {
        if (TTYUtil.isTTY()) {
            System.out.println("TTY: " + TTYUtil.getTTYName());
            Process p = Runtime.getRuntime().exec(new String[] {
                "sh", "-c", "less Test.java >"+TTYUtil.getTTYName()});
            p.waitFor();

            Process q = Runtime.getRuntime().exec(new String[] {
                "sh", "-c", "less >"+TTYUtil.getTTYName()});
            OutputStream qout = q.getOutputStream();
            qout.write("Hello World!".getBytes());
            qout.close();
            q.waitFor();
            
        } else {
            System.out.println("Not a TTY");
        }
    }
}
