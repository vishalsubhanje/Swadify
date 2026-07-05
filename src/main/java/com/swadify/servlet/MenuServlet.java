package com.swadify.servlet;

import java.io.IOException;
import java.util.List;

import com.swadify.daoimpl.MenuDAOImpl;
import com.swadify.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

    	String restaurantIdStr =
    	        request.getParameter("restaurantId");

    	if (restaurantIdStr == null) {
    	    response.sendRedirect("menu?restaurantId=1");
    	    return;
    	}

    	int restaurantId =
    	        Integer.parseInt(restaurantIdStr);

        MenuDAOImpl dao = new MenuDAOImpl();

        List<Menu> menus =
                dao.getMenusByRestaurantId(restaurantId);

        System.out.println(menus);

        request.setAttribute("menus", menus);

        request.getRequestDispatcher("menu.jsp")
                .forward(request, response);
    }
}