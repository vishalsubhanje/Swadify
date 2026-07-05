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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response)
	        throws ServletException, IOException {

	    String name =
	            request.getParameter("name");

	    String email =
	            request.getParameter("email");

	    String password =
	            request.getParameter("password");

	    String phone =
	            request.getParameter("phone");

	    String address =
	            request.getParameter("address");

	    User user = new User();

	    user.setName(name);
	    user.setEmail(email);
	    user.setPassword(password);
	    user.setPhone(phone);
	    user.setAddress(address);

	    UserDAOImpl dao =
	            new UserDAOImpl();

	    User existing =
	            dao.getUser(email);


	    if(existing != null){


	    response.getWriter()
	    .println("Email already registered");


	    return;

	    }



	    int status =
	            dao.addUser(user);

	    if (status > 0) {
	        response.sendRedirect("login.jsp");
	    } else {
	        response.getWriter()
	                .println("Registration Failed");
	    }
	}

}
