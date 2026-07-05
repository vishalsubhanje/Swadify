package com.swadify.dao;

import com.swadify.model.Order;
import com.swadify.model.OrderItem;

public interface OrderDAO {

    int addOrder(Order order);

    void addOrderItem(OrderItem item);
}
