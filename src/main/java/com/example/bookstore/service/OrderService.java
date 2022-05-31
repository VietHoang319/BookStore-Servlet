package com.example.bookstore.service;

import com.example.bookstore.model.Order;
import com.example.bookstore.service.GeneralService;

import java.util.List;

public interface OrderService extends GeneralService<Order> {
    List<Order> findByUserId(int userId);
    Order findById(String id);
    List<Order> findUnconfirm();
}
