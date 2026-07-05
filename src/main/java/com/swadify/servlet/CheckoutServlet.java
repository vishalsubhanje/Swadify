package com.swadify.servlet;

import java.io.IOException;
import java.util.List;

import com.swadify.dao.OrderDAO;
import com.swadify.daoimpl.OrderDAOImpl;
import com.swadify.model.Cart;
import com.swadify.model.CartItem;
import com.swadify.model.Order;
import com.swadify.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String paymentMode = request.getParameter("paymentMode");

        HttpSession session = request.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null || cart.getItems().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        OrderDAOImpl orderDAO = new OrderDAOImpl();
        Order order = new Order();

        // Change these values later after login is implemented
        order.setUserId(1);
        order.setRestaurantId(1);

        order.setTotalAmount(cart.getTotalPrice());
        order.setStatus("PLACED");
        order.setPaymentMode(paymentMode);

        int orderId = orderDAO.addOrder(order);

        List<CartItem> cartItems = cart.getItems();

        for (CartItem c : cartItems) {

            OrderItem item = new OrderItem();

            item.setOrderId(orderId);
            item.setMenuId(c.getMenuId());
            item.setItemName(c.getItemName());
            item.setQuantity(c.getQuantity());
            item.setPrice(c.getPrice());

            orderDAO.addOrderItem(item);
        }

        // Empty the cart after placing order
        session.removeAttribute("cart");

        response.sendRedirect("order-success.jsp");
    }
}