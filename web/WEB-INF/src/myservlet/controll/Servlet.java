package myservlet.controll;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by lei02 on 2019/4/15.
 */
public class Servlet extends HttpServlet{
    @Override
    public void init(ServletConfig config) throws ServletException{
        super.init();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        List<String> userNames = Arrays.asList("AAA", "BBB", "CCC");
        String userName = request.getParameter("userName");
        String result = null;
        if (userNames.contains(userName)) {
            result = "<font color=\"red\">该用户名已经被使用</font>";
        } else {
            result = "<font color=\"green\">该用户名可以使用</font>";
        }

        response.getWriter().print(result);
    }
}
