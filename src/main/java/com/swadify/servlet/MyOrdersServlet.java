package com.swadify.servlet;

import java.io.IOException;
import java.util.List;

import com.swadify.daoimpl.OrderDAOImpl;
import com.swadify.daoimpl.RestaurantDAOImpl;
import com.swadify.model.Order;
import com.swadify.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/myorders")
public class MyOrdersServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userId = 1; // Later get from session

        OrderDAOImpl orderDAO = new OrderDAOImpl();
        RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();

        List<Order> orders = orderDAO.getOrdersByUserId(userId);
        for (Order order : orders) {
            System.out.println("Order ID: " + order.getOrderId());
            System.out.println("Order Date: " + order.getOrderDate());
            System.out.println("Payment: " + order.getPaymentMode());
        }

        for (Order order : orders) {

            Restaurant restaurant =
                    restaurantDAO.getRestaurant(order.getRestaurantId());

            if (restaurant != null) {
                order.setRestaurantName(restaurant.getName());
            }
        }

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("myorders.jsp")
               .forward(request, response);
    }
}