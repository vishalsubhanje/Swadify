package com.swadify.servlet;

import java.io.IOException;
import java.util.List;

import com.swadify.model.Cart;
import com.swadify.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class PlaceOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        List<CartItem> items = cart.getItems();

        double total = cart.getTotalPrice();

        System.out.println("ORDER PLACED");
        System.out.println("Name: " + name);
        System.out.println("Address: " + address);
        System.out.println("Phone: " + phone);
        System.out.println("Total: " + total);
        System.out.println("Items: " + items);

        // clear cart after order
        session.removeAttribute("cart");

        // send to success page
        response.sendRedirect("order-success.jsp?total=" + String.valueOf(total));
    }
}