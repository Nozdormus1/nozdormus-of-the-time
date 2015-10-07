package web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Ноздорму on 06.10.2015.
 */
public class MyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String uname = request.getParameter("uname");
        String password = request.getParameter("pass");
        if(uname.equals("Admin") && password.equals("123")){
            session.setAttribute("Message", "you are successful loged in");
        }else{session.setAttribute("Message", "log in failed");}
        request.getRequestDispatcher("greeetings.jsp").forward(request, response);
    }
}
