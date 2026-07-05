package com.swadify.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.swadify.model.Order;
import com.swadify.model.OrderItem;
import com.swadify.util.DBConnection;

public class OrderDAOImpl {
	// Get All Orders of a User
	
    // Insert Order
    public int addOrder(Order order) {

        int orderId = 0;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO orders "
                    + "(userId, restaurantId, totalAmount, status,paymentMode) "
                    + "VALUES (?, ?, ?, ?, ?)";

            PreparedStatement pstmt =
                    con.prepareStatement(sql,
                            PreparedStatement.RETURN_GENERATED_KEYS);

            pstmt.setInt(1, order.getUserId());
            pstmt.setInt(2, order.getRestaurantId());
            pstmt.setDouble(3, order.getTotalAmount());
            pstmt.setString(4, order.getStatus());
            pstmt.setString(5, order.getPaymentMode());

            pstmt.executeUpdate();

            ResultSet rs = pstmt.getGeneratedKeys();

            if (rs.next()) {
                orderId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderId;
    }

    // Get Single Order
    public Order getOrder(int orderId) {

        Order order = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM orders WHERE orderId = ?";

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                order = new Order();

                order.setOrderId(
                        rs.getInt("orderId"));
                order.setUserId(
                        rs.getInt("userId"));
                order.setRestaurantId(
                        rs.getInt("restaurantId"));
                order.setTotalAmount(
                        rs.getDouble("totalAmount"));
                order.setStatus(
                        rs.getString("status"));
                order.setPaymentMode(rs.getString("paymentMode"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }

    // Get All Orders of a User
    public List<Order> getOrdersByUserId(int userId) {

        List<Order> orders = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM orders WHERE userId = ? ORDER BY orderId DESC";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                Order order = new Order();

                order.setOrderId(rs.getInt("orderId"));
                order.setUserId(rs.getInt("userId"));
                order.setRestaurantId(rs.getInt("restaurantId"));
                order.setTotalAmount(rs.getDouble("totalAmount"));
                order.setStatus(rs.getString("status"));

                // These two lines were missing
                order.setPaymentMode(rs.getString("paymentMode"));
                order.setOrderDate(rs.getTimestamp("orderDate"));

                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    // Update Status
    public void updateOrderStatus(
            int orderId,
            String status) {

        try {
            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "UPDATE orders "
                    + "SET status = ? "
                    + "WHERE orderId = ?";

            PreparedStatement pstmt =
                    con.prepareStatement(sql);

            pstmt.setString(1, status);
            pstmt.setInt(2, orderId);

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addOrderItem(OrderItem item) {

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO order_items (orderId, menuId, itemName, quantity, price) VALUES (?, ?, ?, ?, ?)";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, item.getOrderId());
            pstmt.setInt(2, item.getMenuId());
            pstmt.setString(3, item.getItemName());
            pstmt.setInt(4, item.getQuantity());
            pstmt.setDouble(5, item.getPrice());

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<OrderItem> getOrderItemsByOrderId(int orderId) {

        List<OrderItem> items = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();
            String sql =
            		"SELECT oi.*, m.itemName, m.image " +
            		"FROM order_items oi " +
            		"JOIN menu m ON oi.menuId = m.menuId " +
            		"WHERE oi.orderId=?";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, orderId);

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {

                OrderItem item = new OrderItem();

                item.setOrderItemId(rs.getInt("orderItemId"));
                item.setOrderId(rs.getInt("orderId"));
                item.setMenuId(rs.getInt("menuId"));
                item.setItemName(rs.getString("itemName"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                item.setImage(rs.getString("image"));

                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return items;
    }
}