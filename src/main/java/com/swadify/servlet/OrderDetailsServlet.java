package com.swadify.servlet;
import com.swadify.daoimpl.RestaurantDAOImpl;
import com.swadify.model.Restaurant;
import java.io.IOException;
import java.util.List;

import com.swadify.daoimpl.OrderDAOImpl;
import com.swadify.model.Order;
import com.swadify.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderdetails")
public class OrderDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int orderId = Integer.parseInt(request.getParameter("orderId"));

        OrderDAOImpl dao = new OrderDAOImpl();

        // Fetch Order
        Order order = dao.getOrder(orderId);
        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();

        Restaurant restaurant =
                restaurantDAO.getRestaurant(order.getRestaurantId());

        if(restaurant != null){
            order.setRestaurantName(restaurant.getName());
        }

        // Fetch Order Items
        List<OrderItem> items = dao.getOrderItemsByOrderId(orderId);

        request.setAttribute("order", order);
        request.setAttribute("items", items);

        request.getRequestDispatcher("orderdetails.jsp")
               .forward(request, response);
    }
}