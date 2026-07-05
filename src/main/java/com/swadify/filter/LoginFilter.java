package com.swadify.filter;


import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@WebFilter("/*")
public class LoginFilter implements Filter {


@Override
public void doFilter(ServletRequest request,
        ServletResponse response,
        FilterChain chain)
        throws IOException, ServletException {



HttpServletRequest req =
        (HttpServletRequest)request;


HttpServletResponse res =
        (HttpServletResponse)response;



String path = req.getRequestURI();



HttpSession session =
        req.getSession(false);



boolean loggedIn =
        (session != null &&
        session.getAttribute("user") != null);




if(path.contains("login.jsp")
        || path.contains("register.jsp")
        || path.contains("login")
        || path.contains("register")
        || path.contains("css")
        || path.contains("images")){


    chain.doFilter(request,response);

    return;

}





if(loggedIn){


    chain.doFilter(request,response);


}

else{


    res.sendRedirect("login.jsp");


}



}

}
