package com.swadify.servlet;


import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;


@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {


@Override
protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws IOException {


    request.getSession().invalidate();


    response.sendRedirect("login.jsp");


}

}