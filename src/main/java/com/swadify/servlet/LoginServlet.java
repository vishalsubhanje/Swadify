package com.swadify.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.swadify.daoimpl.UserDAOImpl;
import com.swadify.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {


	    String email = request.getParameter("email");

	    String password = request.getParameter("password");


	    UserDAOImpl dao = new UserDAOImpl();


	    User user = dao.getUser(email);



	    if(user != null && user.getPassword().equals(password)){


	        // create session

	        request.getSession().setAttribute("user", user);



	        response.sendRedirect("home");


	    }
	    else{


	        request.setAttribute("error",
	                "Invalid Email or Password");


	        request.getRequestDispatcher("login.jsp")
	        .forward(request, response);

	    }


	}

}
