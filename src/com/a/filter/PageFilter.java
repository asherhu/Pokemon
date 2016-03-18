package com.a.filter;


import com.a.entity.User;
import org.hibernate.Session;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by huhanbo on 16/3/9.
 */
public class PageFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {


        HttpServletRequest httpServletRequest= (HttpServletRequest) servletRequest;
       HttpServletResponse httpServletResponse= (HttpServletResponse) servletResponse;

        HttpSession session=httpServletRequest.getSession();

        String sessionId=session.getId();
        System.out.println("sessionId="+sessionId);
        User user= (User) session.getAttribute("user");

        if(user!=null){
            httpServletRequest.getRequestDispatcher("main.jsp").forward(httpServletRequest, httpServletResponse);
        }else{
            httpServletRequest.getRequestDispatcher("index.jsp").forward(httpServletRequest, httpServletResponse);

        }




//        //Test
//        HttpServletResponse httpServletResponse= (HttpServletResponse) servletResponse;
////        hres.sendRedirect("http://www.baidu.com");
//        String servletPath=httpServletRequest.getServletPath();
//        RequestDispatcher dispatcher=httpServletRequest.getRequestDispatcher("index.jsp");
//        if(user==null){
//            if("/register.jsp".equals(servletPath)){
//                dispatcher=httpServletRequest.getRequestDispatcher("register.jsp");
//            }
//
//            dispatcher.forward(httpServletRequest,servletResponse);
//        }else{
//            httpServletRequest.getRequestDispatcher(servletPath.substring(1)).forward(httpServletRequest, httpServletResponse);
//        }




    }

    @Override
    public void destroy() {

    }
}
